#include <string.h>
#include "../echo/display.h"
#include "../schedule.h"
#include "thread.h"
#include "../mm/page.h"
#include "../sync/sync.h"

static u32 max_pid = 0;

/*ready list*/
struct list_head *READY_LIST;
/*ready thread*/
struct thread *READY_THREAD;
/*current running thread*/
struct thread *current_thread;

/*init thread struct*/
struct thread init_struct;
/*init thread stack*/
struct thread_union init_stack;



/*系统调用测试*/
/*static void testA(void)
{
	dis_str("in the testA thread", 0xb, 1, 0);

	asm(
		"movl $0x1, %eax\n\t"
		"movl $0x2, %ebx\n\t"
		"movl $0x3, %ecx\n\t"
		"movl $0x4, %edx\n\t"
		"movl $0x5, %esi\n\t"
		"movl $0x6, %edi\n\t"
		"int $0x80\n\t"
		);

	for (;;)
	  asm("incb %gs:(160+40)");
}
*/

/*锁测试*/
struct lock test_lock;

static void test_lock1(void)
{
	int i;
	dis_str("in the test_lock1 thread", 0xb, 1, 0);

	lock_acquire(&test_lock);
	for (i = 0; i < 21474800/2; i++)
	  asm("incb %gs:(160+40)");
	lock_realse(&test_lock);
	for(;;)
	  asm("incb %gs:(160+50)");
}

static void test_lock2(void)
{
	dis_str("in the test_lock2 thread", 0xb, 2, 0);

	lock_acquire(&test_lock);
	for (;;)
	  asm("incb %gs:(160+160+40)");

}
static void init_thread(void)
{
	struct thread *testA_thread;
	struct thread *test_LOCK1, *test_LOCK2;
	dis_str("Init thread running.", 0xb, 0, 0);

	/*创建testA_thread*/
//	testA_thread = thread_creat("testA", (u32 *)testA);

	/*下面两个线程用于测试锁机制*/
	/*创建test_LOCK*/
	test_LOCK1 = thread_creat("test_LOCK1", (u32 *)test_lock1);
	test_LOCK2 = thread_creat("test_LOCK2", (u32 *)test_lock2);

	get_lock(&test_lock);

	asm("cli");
	/*init READY_LIST*/
//	READY_LIST = (struct list_head *)&testA_thread->elem;

	READY_LIST = (struct list_head *)&test_LOCK1->elem;
	list_add_tail(&test_LOCK2->elem, READY_LIST->prev);
	/*init current_thread*/
	current_thread = &init_struct;
	/*init READY_THREAD*/
	READY_THREAD = (struct thread *) list_entry(READY_LIST, struct thread, elem);
	asm("sti");

	for (;;)
	  asm("incb %gs:(40)");
}

void creat_init(void)
{
	/*初始化其他信息*/
	init_struct.pid = 0;	//init线程pid初始化为0
	memcpy(init_struct.thread_name, "init_thread", 11);
	init_struct.function = (u32)init_thread;
	init_struct.esp = (u32)&(init_stack.regs);
	init_struct.stack = (u32 *)&(init_stack.thread_stack);

	INIT_LIST_HEAD(&init_struct.elem);

	/*初始化寄存器*/
	init_stack.regs.ds = KDS;
	init_stack.regs.cs = KCS;
	init_stack.regs.es = KDS;
	init_stack.regs.fs = KDS;
	init_stack.regs.ss = KDS;
	init_stack.regs.gs = GS;
	init_stack.regs.eip = (u32)init_thread;
	init_stack.regs.esp = (u32)init_struct.stack;
	init_stack.regs.eflags = 0x1202;
	init_stack.thread_struct = &init_struct;
	current_thread = &init_struct;

	/*调度init_thread开始执行*/
	schedule(&init_struct);
}

static u32 get_pid(void)
{
	u32 pid = max_pid;
	max_pid = pid++;
	return pid;
}

struct thread *thread_creat(char *name, u32 *function)
{
	struct thread *thread_struct = (struct thread *)get_pages(1);
	struct thread_union *stack_union = (struct thread_union *)get_pages(3);

	INIT_LIST_HEAD(&thread_struct->elem);

	thread_struct->pid = get_pid();
	memcpy(thread_struct->thread_name, name, strlen(name));
	thread_struct->function = (u32)function;
	thread_struct->esp = (u32)&stack_union->regs;
	thread_struct->stack = (u32 *)&(stack_union->thread_stack);

	stack_union->regs.ds = KDS;
	stack_union->regs.cs = KCS;
	stack_union->regs.es = KDS;
	stack_union->regs.fs = KDS;
	stack_union->regs.ss = KDS;
	stack_union->regs.gs = GS;
	stack_union->regs.eip = (u32)function;
	stack_union->regs.esp = (u32)thread_struct->stack;
	stack_union->regs.eflags = 0x1202;
	stack_union->thread_struct = &init_struct;
	current_thread = &init_struct;

	return thread_struct;
}

void thread_yield(void)
{
	asm("movl $1, %eax\n\t"
		"int $0x80\n\t");
	return;
}
