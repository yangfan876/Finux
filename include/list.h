#include <type.h>

#define list_entry(ptr, type, member)	({\
	(type *)(((char *)ptr) - (char *)&(((type *)0)->member));})

struct list_head
{
	struct list_head *next, *prev;
};

inline void list_add(struct list_head *new, struct list_head *head);
inline void list_add_tail(struct list_head *new, struct list_head *tail);
inline void list_del(struct list_head *entry);
inline void list_replace(struct list_head *new, struct list_head *old);
inline void INIT_LIST_HEAD(struct list_head *list);
