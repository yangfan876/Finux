#include <type.h>
#define memory_map_addr 0x8000

struct e820_ARDS
{
	u32	baselow;
	u32 basehigh;
	u32 lenthlow;
	u32 lenthhigh;
	u32 type;
} __attribute__((packed));

/*一个页大小*/
#define PageSize 4096

struct page_dir{
	u32 PDE[4096];
}__attribute__ ((aligned (4096)));

struct page_table{
	u32 PTE[4096];
}__attribute__ ((aligned (4096)));

