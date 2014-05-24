#include "../thread/init.h"
#include "../echo/display.h"
#include "sys_call.h"

extern struct list_head *READY_LIST;
extern struct thread *current_thread;
extern struct thread *READY_THREAD;

void yield_thread(void)
{
	READY_THREAD = list_entry(READY_LIST, struct thread, elem);
	READY_LIST = READY_LIST->next;
	list_del(&READY_THREAD->elem);
	current_thread = READY_THREAD;
	return;
}

void syscall_handler(u32 syscall_num, u32 para1,\
			u32 para2, u32 para3, u32 para4, u32 para5)
{
	dis_str("In the syscall_handler function.", 0xc, 0, 0);
	switch(syscall_num)
	{
		case THREAD_YIELD:	yield();
							break;
		default: break;
	}
	return;
}
