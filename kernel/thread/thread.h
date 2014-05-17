#include <type.h>
#include <sys/gdt.h>
#include <sys/page.h>

/*线程段寄存器值*/
#define KCS _KERNEL_CS_;
#define KDS _KERNEL_DS_;
#define UCS _USER_CS_;
#define UDS	_USER_DS_;
#define GS _DIS_GS_;

/*内核栈大小*/
#define KERNEL_STACK_SIZE 0x8000

/*寄存器栈*/
struct registers
{
	u32 gs;
	u32 fs;
	u32 es;
	u32 ds;
	u32 edi;
	u32 esi;
	u32 ebp;
	u32 kernel_esp;
	u32 ebx;
	u32 edx;
	u32 ecx;
	u32 eax;
//	u32 retaddr;
	u32 eip;
	u32 cs;
	u32 esp;
	u32 ss;
	u32 eflags;
};

struct offset_stack
{
	u8 nouse[KERNEL_STACK_SIZE-sizeof(struct registers)];
	struct registers regs;
};

/*union thread_union
{
	struct offset_stack off_stack;
	u8 thread_stack[KERNEL_STACK_SIZE];
};*/

struct thread_union
{
	u8 thread_stack[KERNEL_STACK_SIZE];
	struct registers regs;
	struct thread *thread_struct;
};

/*线程结构体*/
struct thread
{
	u32 pid;
	u32 function;
	char thread_name[16];
	u32 *stack;
	u32 esp;
}__attribute__((aligned(PAGE_SIZE)));
