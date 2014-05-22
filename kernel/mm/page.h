void set_page(void);
void *get_pages(u32 page_cnt);
void free_pages(void *address, u32 page_cnt);

/*一个页大小*/
#define PAGE_SIZE 0x1000

#define PAGE_ENTRYS PAGE_SIZE / sizeof(long)

#define PAGE_DIR_LOCAL 0x100000			//页目录表地址，按照页对齐，1M地址处
#define PAGE_TABLE_LOCAL 0x101000		//页表地址，按照页对齐


struct page_dir{
	u32 PDE[PAGE_ENTRYS];
}__attribute__ ((aligned (PAGE_SIZE)));

struct page_table{
	u32 PTE[PAGE_ENTRYS];
}__attribute__ ((aligned (PAGE_SIZE)));
