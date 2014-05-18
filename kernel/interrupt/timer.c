#include <type.h>
#include <sys/idt.h>
#include "../8259a/8259a.h"
#include "timer.h"
#include "interrupt.h"
#include "../thread/thread.h"

/*static char ticks = 'A';

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
*/

extern struct thread init_struct;
extern struct thread_union init_stack;
extern struct thread testA_struct;
extern struct thread_union testA_stack;

extern struct thread *current_thread;

static u32 ticks = 1;

void timer_handler(void)
{
	ticks++;

	if (ticks % 20 == 0)
	{
		if (current_thread == &testA_struct)
		  current_thread = &init_struct;
		else
		  current_thread = &testA_struct;
	}

	return;
}


void init_timer(void)
{
	interrupt[0] = (u32 *)timer_handler;
	set_intr_gate(0, (u32 *)irq00_handler);
	enable_irq(IRQ_TIMER);
}
