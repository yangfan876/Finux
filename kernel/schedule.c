#include "schedule.h"

void schedule(struct thread *thread_ready)
{
	asm("movl %%eax, %%esp\n\t"
		"jmp switch_to"
		:
		:"a" (thread_ready->esp)
		);
}
