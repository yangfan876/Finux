#include <type.h>
#include "8259a.h"

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


void irq00_handler(void)
{
	interrupt_master(0);
}

void irq14_handler (void)
{
	interrupt_master(14);
}


