#include <string.h>
#include "../echo/display.h"
#include "../schedule.h"

static struct thread init_struct;
static struct thread_union init_stack;

static void init_thread(void)
{
	int i = 0, j = 1;
	dis_str("in the init thread", 0xb, 0, 0);
	/*for (i = 0; i < 80; i++)
	{
		if (i % 20 == 0)
		  j++;
		dis_str("^", 0xb, j, i%20);
	}
*/
	while (1);
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

	/*调度init_thread开始执行*/
	schedule(&init_struct);
}
