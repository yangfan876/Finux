#include <type.h>
#include "../8259a/8259a.h"

/*中断函数入口地址数组*/
u32 *interrupt[16];

#define interrupt_master(irq)			\
{										\
		asm("pushl %eax\n\t"				\
			"pushl %ebx\n\t");			\
										\
		asm("inb $0x21\n\t"				\
			"orb %%bl, %%al\n\t"		\
			"outb %%al, $0x21\n\t"		\
			"movb $0x20, %%al\n\t"		\
			"outb %%al, $0x20\n\t"		\
			"sti\n\t"					\
			:							\
			:"b"(1<<irq));				\
										\
		asm("pushl %%ebx\n\t"			\
			"call *%%eax\n\t"			\
			"popl %%ebx\n\t"			\
		:								\
		:"b"(irq), "a"(interrupt[irq]));	\
										\
		asm("cli\n\t"					\
			"inb $0x21\n\t"				\
			"andb %%bl, %%al\n\t"		\
			"outb %%al, $0x21\n\t"		\
			:							\
			:"b"(~(1<<irq)));				\
		asm("popl %ebx\n\t"				\
			"popl %eax\n\t"				\
			"popl %ebx\n\t"				\
			"popl %ebp\n\t"				\
			"sti\n\t"					\
			"iret\n\t");				\
}

/*中断处理函数*/
void irq00_handler(void)
{
	interrupt_master(0);
}

void irq01_handler(void)
{
	interrupt_master(1);
}

void irq02_handler(void)
{
	interrupt_master(2);
}

void irq03_handler(void)
{
	interrupt_master(3);
}

void irq04_handler(void)
{
	interrupt_master(4);
}

void irq05_handler(void)
{
	interrupt_master(5);
}

void irq06_handler(void)
{
	interrupt_master(6);
}

void irq07_handler(void)
{
	interrupt_master(7);
}

void irq08_handler(void)
{
	interrupt_master(8);
}

void irq09_handler(void)
{
	interrupt_master(9);
}

void irq10_handler(void)
{
	interrupt_master(10);
}

void irq11_handler(void)
{
	interrupt_master(11);
}

void irq12_handler(void)
{
	interrupt_master(12);
}

void irq13_handler(void)
{
	interrupt_master(13);
}

void irq14_handler(void)
{
	interrupt_master(14);
}

void irq15_handler(void)
{
	interrupt_master(15);
}
