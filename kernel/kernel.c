#include "desc/gdt.h"
#include "asm.h"

void kernel_start(void)
{
	/*切换gdt*/
	cli();
	change_gdt();
	sti();
	/*切换堆栈*/

	for(;;);
}

void start_kernel(void)
{
	for(;;);
}


