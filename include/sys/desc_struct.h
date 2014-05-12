#include <type.h>

/*描述符结构体，GDT，LDT，以及后面用到的调用门等描述符都以此为基础*/

struct desc_struct {
	union {
		struct {
			unsigned int a;
			unsigned int b;
		};
		struct {
			u16 limit0;
			u16 base0;
			unsigned base1: 8, type: 4, s: 1, dpl: 2, p: 1;
			unsigned limit: 4, avl: 1, l: 1, d: 1, g: 1, base2: 8;
		};
	};
} __attribute__((packed));


static inline void set_gate(struct desc_struct *desc, unsigned type, u32 *base, unsigned dpl, unsigned seg)
{
	desc->a = (seg << 16) | ((unsigned int)base & 0xffff);
	desc->b = ((unsigned int)base & 0xffff0000) | \
			  (((0x80 | type | (dpl << 5)) & 0xff) << 8);
}

/*GDTR寄存器所要加载的地址*/
struct desc_ptr {
	unsigned short size;
	unsigned long address;
} __attribute__((packed));

/*tss段描述符*/
struct x86_hw_tss {
	unsigned short		back_link, __blh;
	unsigned long		sp0;
	unsigned short		ss0, __ss0h;
	unsigned long		sp1;
	unsigned short		ss1, __ss1h;
	unsigned long		sp2;
	unsigned short		ss2, __ss2h;
	unsigned long		__cr3;
	unsigned long		ip;
	unsigned long		flags;
	unsigned long		ax;
	unsigned long		cx;
	unsigned long		dx;
	unsigned long		bx;
	unsigned long		sp;
	unsigned long		bp;
	unsigned long		si;
	unsigned long		di;
	unsigned short		es, __esh;
	unsigned short		cs, __csh;
	unsigned short		ss, __ssh;
	unsigned short		ds, __dsh;
	unsigned short		fs, __fsh;
	unsigned short		gs, __gsh;
	unsigned short		ldt, __ldth;
	unsigned short		trace;
	unsigned short		io_bitmap_base;

} __attribute__((packed));

struct tss_struct {
	/*
	 * The hardware state:
	 */
	struct x86_hw_tss	x86_tss;
	u8 io_map_end;
	u32 tss_len;

	/*
	 * The extra 1 is there because the CPU will access an
	 * additional byte beyond the end of the IO permission
	 * bitmap. The extra byte must be all 1 bits, and must
	 * be within the limit.
	 */
//	unsigned long		io_bitmap[IO_BITMAP_LONGS + 1];

	/*
	 * .. and then another 0x100 bytes for the emergency kernel stack:
	 */
//	unsigned long		stack[64];

} __attribute__((packed));

