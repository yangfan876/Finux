#include <type.h>
#include "page.h"
#include "mm.h"

extern struct kernel_info kernel_info;
extern struct e820_ARDS memory_map[5];

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

//	PAGE_DIR_LOCAL = (struct page_dir *)(((kernel_info.start + kernel_info.size) +\
					 PAGE_SIZE - 1) & (~(PAGE_SIZE - 1)));

//	PAGE_TABLE_LOCAL = (struct page_table *)(((u32)PAGE_DIR_LOCAL + \
					(u32)(PAGE_SIZE * PDET_cnt) + PAGE_SIZE - 1) & (~(PAGE_SIZE - 1)));

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

	return;
}
