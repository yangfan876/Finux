#include <type.h>
#include <sys/idt.h>
#include "../8259a/8259a.h"
#include "timer.h"
#include "interrupt.h"
#include "../thread/thread.h"
#include "../thread/init.h"

extern struct list_head *READY_LIST;
extern struct thread *current_thread;
extern struct thread *READY_THREAD;

static u32 ticks = 1;

void timer_handler(void)
{
	ticks++;

	if (ticks % 20 == 0 && READY_LIST != 0x0)
	{
		list_add_tail(&current_thread->elem, READY_LIST->prev);

		READY_THREAD = list_entry(READY_LIST, struct thread, elem);

		READY_LIST = READY_LIST->next;

		list_del (&READY_THREAD->elem);

		current_thread = READY_THREAD;
	}

	return;
}

void init_timer(void)
{
	interrupt[0] = (u32 *)timer_handler;
	set_intr_gate(0, (u32 *)irq00_handler);
	enable_irq(IRQ_TIMER);
}
