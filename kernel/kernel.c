#include <sys/idt.h>
#include "desc/gdt.h"
#include "asm.h"
#include "8259a/8259a.h"
#include "interrupt/timer.h"
#include "thread/init.h"
#include "mm/mm.h"
#include "mm/page.h"

void kernel_start(void)
{
	/*切换gdt*/
	change_gdt();
	/*代码在切换完gdt之后就跳入start_kernel中，理论上不会执行到这里*/
	for(;;);
}

void start_kernel(void)
{
	/*切换堆栈*/
	asm("movl $0x1fffff, %esp\n\t"
		"movl %esp, %ebp\n\t");

	/*加载TSS*/
	load_tss();

	/*获取loader探测的内存信息，以及kernel信息*/
	get_memory_info();
	/*设置页表，并开启分页机制*/
	set_page();
	/*屏蔽所有外部中断*/
	disable_irqs();

	/*加载idt*/
	load_idt();

	/*初始化时钟中断*/
	init_timer();

	/*初始化init线程，并跳转执行*/
	creat_testA();
	creat_init();
	/*初始化完init线程将不会在执行到这里，如果执行下面的指令，
	 * 将跳转到一个不存在的段，产生一个通用异常。*/
	asm("jmp $0x80, $0x0\n\t");
}
