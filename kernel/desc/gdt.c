#include <sys/gdt.h>
#include <sys/desc_struct.h>
#include "gdt.h"

static struct desc_struct gdt[GDTNUM];
static struct desc_ptr gdt_ptr;
static struct tss_struct tss;

void load_tss(void)
{
	u16 TSSselector = _KERNEL_TSS_;

	/*初始化tss*/
	tss.x86_tss.sp0 = 0x1fffff;
	tss.x86_tss.ss0 = _KERNEL_DS_;
	tss.x86_tss.io_bitmap_base = sizeof(tss);
	tss.io_map_end = 0xff;
	tss.tss_len = (u32)((size_t)&(tss.tss_len) -(size_t)&tss);

	/*加载tss*/
	asm (
			"ltr %%ax\n\t"
			:
			:"a"(TSSselector)
		);
}

void set_tss_esp(u32 esp)
{
	tss.x86_tss.sp0 = esp;
}


void change_gdt(void)
{
	u16 cs = _KERNEL_CS_;
	u16 ds = _KERNEL_DS_;
	u16 gs = _DIS_GS_;

	/*初始化gdt*/
	GDT_ENTRY_INIT(gdt[KCS_LOCAL], 0xc09b, 0, 0xfffff);
	GDT_ENTRY_INIT(gdt[KDS_LOCAL], 0xc093, 0, 0xfffff);
	GDT_ENTRY_INIT(gdt[UCS_LOCAL], 0xc0fa, 0, 0xfffff);
	GDT_ENTRY_INIT(gdt[UDS_LOCAL], 0xc0f2, 0, 0xfffff);
	GDT_ENTRY_INIT(gdt[TSS_LOCAL], 0x0089, (u32)(&tss), tss.tss_len-1);
	GDT_ENTRY_INIT(gdt[DIS_LOCAL], 0x00f3, 0xb8000, 0xffff);

	/*初始化gdt_ptr*/
	gdt_ptr.size = sizeof(gdt) - 1;
	gdt_ptr.address = (unsigned long)&gdt;

	/*加载gdt_ptr*/
	asm("lgdt gdt_ptr\n\t"
		"movw %%bx, %%ds\n\t"
		"movw %%bx, %%es\n\t"
		"movw %%bx, %%fs\n\t"
		"movw %%bx, %%ss\n\t"
		"movw %%cx, %%gs\n\t"
		"ljmp $0x20, $start_kernel\n\t"
		:
		:"a"(cs), "b"(ds), "c"(gs)
		);

	return;
}
