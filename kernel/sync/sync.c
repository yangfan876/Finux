#include "../thread/init.h"
#include "../thread/thread.h"
#include "sync.h"

extern struct list_head *READY_LIST;
extern struct thread *READY_THREAD;
extern struct thread *current_thread;

void get_lock(struct lock *lock)
{
	lock->value = 0;
	INIT_LIST_HEAD(&lock->list);
	return;
}

void lock_acquire(struct lock *lock)
{
	while(lock->value < 0)
	{
		asm("cli");
		list_add_tail(&current_thread->elem, lock->list.prev);
		asm("sti");
		thread_yield();
	}

	lock->value--;

	return;
}

void lock_realse(struct lock *lock)
{
	lock->value++;
	if(lock->value >= 0)
	{
		struct list_head *tmp;
		tmp = lock->list.next;
		list_del(tmp);
		list_add_tail(tmp, READY_LIST->prev);
	}
	return;
}

void get_sema(struct sema *lock, u32 value)
{
	lock->value = value;
	INIT_LIST_HEAD(&lock->list);
	return;
}

void sema_acquire(struct sema *lock)
{
	while(lock->value < 0)
	{
		asm("cli");
		list_add_tail(&current_thread->elem, lock->list.prev);
		thread_yield();
	}

	lock->value--;

	return;
}

void sema_realse(struct sema *lock)
{
	lock->value++;
	if(lock->value >= 0)
	{
		struct list_head *tmp;
		tmp = lock->list.next;
		list_del(tmp);
		list_add_tail(tmp, READY_LIST->prev);
	}
	return;
}
