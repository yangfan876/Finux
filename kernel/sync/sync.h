#include <type.h>

struct sema
{
	int value;
	struct list_head list;
};

struct lock
{
	int value;
	struct list_head list;
};

void get_lock(struct lock *lock);
void lock_acquire(struct lock *lock);
void lock_realse(struct lock *lock);
void get_sema(struct sema *lock, u32 value);
void sema_acquire(struct sema *lock);
void sema_realse(struct sema *lock);
