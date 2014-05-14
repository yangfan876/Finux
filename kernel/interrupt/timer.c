#include <type.h>
#include <sys/idt.h>
#include "../8259a/8259a.h"
#include "timer.h"
#include "interrupt.h"

static char ticks = 'A';

static void timer_handler(void)
{
	if (ticks == 'z')
		ticks = 'A';

	asm(
		"movb $0xc, %ah\n\t"
		"movb ticks, %al\n\t"
		"movw %ax, %gs:(24*160)\n\t"
		"movb $0x20, %al\n\t"
		"outb %al, $0x20\n\t"
		);
	ticks ++;
	return;

}

extern u32 *interrupt[16];

void init_timer(void)
{
	interrupt[0] = (u32 *)timer_handler;
	set_intr_gate(0, (u32 *)irq00_handler);
	enable_irq(IRQ_TIMER);
}
