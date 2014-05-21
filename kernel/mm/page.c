#include <type.h>
#include "page.h"
#include "mm.h"
#include "../debug.h"

extern struct kernel_info kernel_info;
extern struct e820_ARDS memory_map[5];

//页表位图所在地址5M处
static u8 *page_bit_map = (u8 *)0x500000;
static u32 page_cnt;
static u32 page_bit_map_cnt;

/*页表位图初始化*/
static void init_page_bit_map(void)
{
	int i;
	u8 *bit_map = page_bit_map;
	u32 lenth = 0;

	for (i = 0; i < kernel_info.memory_map_cnt; i++)
	{
		if (memory_map[i].type == 0x1 && \
					lenth < memory_map[i].lenthlow)
		{
			lenth = memory_map[i].lenthlow;
		}
	}

	lenth -= (u32)page_bit_map;
	page_cnt = (lenth + PAGE_SIZE - 1) / PAGE_SIZE;
	page_bit_map_cnt = (page_cnt + 8 - 1) / 8;

	/*将5M以后的页位图值为0*/
	for (i = 0; i < page_bit_map_cnt; i++)
	{
		*bit_map = 0;
		bit_map++;
	}

	/*页位图所在页*/
	*page_bit_map = 1 << 7;

	return;
}

void *get_pages(u32 page_cnt)
{
	int i, bytein;
	u8 *tmp_map = page_bit_map;
	u8 select = 0;

	if (page_cnt > 8)
	{
		PANIC("In the get_pages func: page_cnt > 8.");
	}

	for (i = 0; i < page_cnt; i++)
	{
		select = (select << 1) | 1;
	}

	for (i = 0; i < page_bit_map_cnt; i++)
	{
		for (bytein = 0; (bytein + page_cnt)< 8; bytein++)
		{
			if (!(*tmp_map & select))
			{
				*tmp_map |= select;
				return page_bit_map + ((i * 8) + (8 - bytein - page_cnt)) * PAGE_SIZE;
			}
			else
				select = select << 1;
		}
	}
	return (void *)0x0;
}

/*根据探测的内存信息获取所需页数目*/
static int get_page_cnt(void)
{
	int i;
	struct e820_ARDS *tmp_map = &memory_map[0];
	u32 end_address;

	for (i = 0; i < kernel_info.memory_map_cnt; i ++)
		if (memory_map[i].type == 0x1)
			tmp_map = &memory_map[i];

	end_address = tmp_map->baselow + tmp_map->lenthlow;

	/*不足一页算作一页*/
	return (end_address + PAGE_SIZE - 1) / PAGE_SIZE;
}

/*根据页数目获得页表数目*/
static int get_ptet_cnt(u32 page_cnt)
{
	return (page_cnt + 1023) / 1024;
}


/*设置分页，开启分页机制*/
void set_page(void)
{
	int PAGE_cnt = 0, PTET_cnt = 0,  PDET_cnt = 0;
	int PD = 0, PT = 0, PG = 0;
	struct page_dir *tmpdir, *pagedir;
	struct page_table *tmptable;

	u32 pagebase = PAGE_SIZE * 0;

	PAGE_cnt = get_page_cnt();
	PTET_cnt = get_ptet_cnt(PAGE_cnt);
	PDET_cnt = get_ptet_cnt(PTET_cnt);

	tmpdir = (struct page_dir *)PAGE_DIR_LOCAL;
	pagedir = tmpdir;
	tmptable = (struct page_table *)PAGE_TABLE_LOCAL;

	for (PD = 0; PD < PDET_cnt; PD++)
	{
		for (PT = 0; PT < PTET_cnt; PT++)
		{
			tmpdir->PDE[PT] = (u32)(((u32)tmptable & (~(PAGE_SIZE-1))) | 0x7);
			for (PG = 0; PG < PAGE_ENTRYS; PG++)
			{
				tmptable->PTE[PG] = (u32)(pagebase | 0x7);
				pagebase += PAGE_SIZE;
			}
			tmptable++;
		}
		tmpdir++;
	}

	asm (
			"movl %%eax, %%cr3\n\t"
			"movl %%cr0, %%eax\n\t"
			"orl $0x80000000, %%eax\n\t"
			"movl %%eax, %%cr0\n\t"
			:
			:"a"(pagedir)
		);
	/*初始化页表位图*/
	init_page_bit_map();

	return;
}


