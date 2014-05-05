#include <sys/idt.h>
#include <sys/gdt.h>
#include "8259a.h"

static _idt_ IDT[IDTNUM];
static _idt_ptr_ IDT_PTR ={.size = (IDTNUM * 8 -1),
					.address = (unsigned long)IDT};

void init_idt(void)
{
	asm	(
			"cli\n\t"
			"lidt IDT_PTR\n\t"
			"nop\n\t"
			"sti\n\t"
		);
	return;
}

inline void set_intr_gate(int IRQ, u32 *handler)
{
	int irq = IRQ + IRQ_VECTOR;
	set_gate (&IDT[irq], GATE_INTERRUPT, handler, 0x0, KCS_BOOT_SELEC);
	enable_irq(IRQ);
}
