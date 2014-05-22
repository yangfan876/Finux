#include <list.h>

static inline void INIT_LIST_HEAD(struct list_head *list)
{
	list->prev = list;
	list->next = list;
}

static inline void __list_add(struct list_head *new,
					struct list_head *prev,
					struct list_head *next)
{
	next->prev = new;
	new->next = next;
	new->prev = prev;
	prev->next = new;
}

inline void list_add(struct list_head *new, struct list_head *head)
{
	__list_add(new, head, head->next);
}

inline void list_add_tail(struct list_head *new, struct list_head *tail)
{
	__list_add(new, tail->prev, tail);
}

static inline void  __list_del(struct list_head *prev, struct list_head *next)
{
	prev->next = next;
	next->prev = prev;
}

inline void list_del(struct list_head *entry)
{
	__list_del(entry->prev, entry->next);
	entry->prev = (struct list_head *)0x0;
	entry->next = (struct list_head *)0x0;
}

inline void list_replace(struct list_head *new, struct list_head *old)
{
	new->next = old->next;
	new->next->prev = new;
	new->prev = old->prev;
	new->prev->next = new;
	old->next = (struct list_head *)0x0;
	old->prev = (struct list_head *)0x0;
}
