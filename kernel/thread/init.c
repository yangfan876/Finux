#include <string.h>
#include "../echo/display.h"
#include "../schedule.h"

struct thread init_struct;
struct thread_union init_stack;

struct thread testA_struct;
struct thread_union testA_stack;

struct thread *current_thread;

static void init_thread(void)
{
	dis_str("in the init thread", 0xb, 0, 0);

	for (;;)
	  asm("incb %gs:(40)");
}



void creat_init(void)
{
	/*初始化其他信息*/
	init_struct.pid = 0;	//init线程pid初始化为0
	memcpy(init_struct.thread_name, "init_thread", 11);
	init_struct.function = (u32)init_thread;
//	init_struct.stack = (u32 *)&init_stack.regs;
	init_struct.esp = (u32)&(init_stack.regs);

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

static void testA(void)
{
	dis_str("in the testA thread", 0xb, 1, 0);

	for (;;)
	  asm("incb %gs:(160+40)");
}

void creat_testA()
{
	/*初始化其他信息*/
	testA_struct.pid = 0;	//init线程pid初始化为0
	memcpy(testA_struct.thread_name, "testA", 11);
	testA_struct.function = (u32)testA;
//	init_struct.stack = (u32 *)&init_stack.regs;
	testA_struct.esp = (u32)&(testA_stack.regs);

	/*初始化寄存器*/
	testA_stack.regs.ds = KDS;
	testA_stack.regs.cs = KCS;
	testA_stack.regs.es = KDS;
	testA_stack.regs.fs = KDS;
	testA_stack.regs.ss = KDS;
	testA_stack.regs.gs = GS;
	testA_stack.regs.eip = (u32)testA;
	testA_stack.regs.esp = (u32)testA_struct.stack;
	testA_stack.regs.eflags = 0x1202;
	testA_stack.thread_struct = &testA_struct;
}
