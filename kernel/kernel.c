#include "desc/gdt.h"
#include "asm.h"
#include "8259a/8259a.h"

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

	/*屏蔽所有外部中断*/
	disable_irqs();
	sti();
	for(;;);
}
