#include <sys/gdt.h>
#include <sys/desc_struct.h>
#include "gdt.h"

static struct desc_struct gdt[GDTNUM];
static struct desc_ptr gdt_ptr;

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
	GDT_ENTRY_INIT(gdt[TSS_LOCAL], 0x0092, 0, 0);
	GDT_ENTRY_INIT(gdt[DIS_LOCAL], 0x0093, 0xb8000, 0xffff);

	/*初始化gdt_ptr*/
	gdt_ptr.size = sizeof(gdt) - 1;
	gdt_ptr.address = (unsigned long)&gdt;

	/*加载gdt_ptr*/
	asm("lgdt gdt_ptr\n\t"
		"movw %%bx, %%ds\n\t"
		"movw %%bx, %%es\n\t"
		"movw %%bx, %%fs\n\t"
		"movw %%cx, %%gs\n\t"
		"ljmp $0x20, $start_kernel\n\t"
		:
		:"a"(cs), "b"(ds), "c"(gs));

	return;
}
