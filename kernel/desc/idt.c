#include <sys/idt.h>
#include <sys/gdt.h>
#include "../8259a/8259a.h"
#include "../interrupt/exception.h"

static _idt_ idt[IDTNUM];
static _idt_ptr_ idt_ptr ={.size = (IDTNUM * 8 -1),
					.address = (unsigned long)idt};


static void set_exception_gate(void)
{
	set_gate (&idt[EXC_DIVIDE], GATE_EXCEPTION, (u32 *)divide_error, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_SINGLE_STEP], GATE_EXCEPTION, (u32 *)single_step_exception, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_NMI], GATE_EXCEPTION, (u32 *)nmi, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_BREAKPOINT], GATE_EXCEPTION, (u32 *)breakpoint_exception, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_OVERFLOW], GATE_EXCEPTION, (u32 *)overflow, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_BOUNDS_CHECK], GATE_EXCEPTION, (u32 *)bounds_check, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_INVAL_OPCODE], GATE_EXCEPTION, (u32 *)inval_opcode, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_COPR_NOT_AVAILABLE], GATE_EXCEPTION, (u32 *)copr_not_available, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_DOUBLE_FAULT], GATE_EXCEPTION, (u32 *)double_fault, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_COPR_SEG_OVERRUN], GATE_EXCEPTION, (u32 *)copr_seg_overrun, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_INVAL_TSS], GATE_EXCEPTION, (u32 *)inval_tss, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_SEGMENT_NOT_PRESENT], GATE_EXCEPTION, (u32 *)segment_not_present, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_STACK], GATE_EXCEPTION, (u32 *)stack_exception, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_GENERAL_PROTECTION], GATE_EXCEPTION, (u32 *)general_protection, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_PAGE_FAULT], GATE_EXCEPTION, (u32 *)page_fault, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_COPR_ERROR], GATE_EXCEPTION, (u32 *)copr_error, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_FLOAT_ERROR], GATE_EXCEPTION, (u32 *)float_error, 0x0, KCS_LOCAL << 3);
	set_gate (&idt[EXC_ALIGNMENT_CHECK], GATE_EXCEPTION, (u32 *)alignment_check, 0x0, KCS_LOCAL << 3);
}

void load_idt(void)
{
	asm	(
			"cli\n\t"
			"lidt idt_ptr\n\t"
			"nop\n\t"
			"sti\n\t"
		);

	set_exception_gate();
	return;

}

inline void set_intr_gate(int IRQ, u32 *handler)
{
	int irq = IRQ + IRQ_VECTOR;
	set_gate (&idt[irq], GATE_INTERRUPT, handler, 0x0, KCS_LOCAL << 3);
	enable_irq(IRQ);
}
