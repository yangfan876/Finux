#include <asm/io.h>
#include "8259a.h"

/* Basic port I/O */
/*对端口操作的代码来自linux kernel /path/arch/x86/boot/boot.h*/
static inline void outb(u8 v, u16 port)
{
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
}

static inline u8 inb(u16 port)
{
	u8 v;
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
	return v;
}

static inline void outw(u16 v, u16 port)
{
	asm volatile("outw %0,%1" : : "a" (v), "dN" (port));
}
static inline u16 inw(u16 port)
{
	u16 v;
	asm volatile("inw %1,%0" : "=a" (v) : "dN" (port));
	return v;
}

static inline void outl(u32 v, u16 port)
{
	asm volatile("outl %0,%1" : : "a" (v), "dN" (port));
}
static inline u32 inl(u32 port)
{
	u32 v;
	asm volatile("inl %1,%0" : "=a" (v) : "dN" (port));
	return v;
}

/*Approximately 1 us*/
static inline void io_delay(void)
{
	const u16 DELAY_PORT = 0x80;
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
}


static inline void outb_pic(unsigned char value, unsigned int port)
{
	outb(value, port);
	io_delay();
}

static inline unsigned char inb_pic(unsigned int port)
{
	unsigned char value = inb(port);
	io_delay();
	return value;
}

/*
 *初始化8259A中断控制器
 *8259A的初始化介绍可参见博客:
 *http://blog.163.com/yangfan876@126/blog/static/806124562012102141140636/
 *在loader阶段，目前值开启硬盘中断，其他屏蔽。
 * */

void Init_8259A(void)
{
	outb_pic(0x11, MASTER_8259A_CMD);		//master icw1
	outb_pic(0x11, SLAVE_8259A_CMD);		//slave icw1

	outb_pic(0x30, MASTER_8259A_IMR);		//master icw2, IRQ0-->0x30
	outb_pic(0x38, SLAVE_8259A_IMR);		//slave icw2, IRQ8-->0x38

	outb_pic(0x4, MASTER_8259A_IMR);		//master IRQ2-->slave
	outb_pic(0x2, SLAVE_8259A_IMR);			//slave IRQ2<--master

	outb_pic(0x1, MASTER_8259A_IMR);		//master icw4
	outb_pic(0x1, SLAVE_8259A_IMR);			//slave icw4

	outb_pic(0xff, MASTER_8259A_IMR);		//mask master IRQ
	outb_pic(0xff, SLAVE_8259A_IMR);		//mask slave IRQ

	return;
}

void enable_irq(int irq)
{
	u8 ocw_master = 0;
	u8 ocw_slave = 0;
	u8 master_now = inb_pic(MASTER_8259A_IMR);
	u8 slave_now = inb_pic(SLAVE_8259A_IMR);

	asm("cli\n\t");

	if (irq < 8 && irq != 2)
	{
		ocw_master = (~(1 << irq)) & master_now;

		outb_pic(ocw_master, MASTER_8259A_IMR);
	}
	if (irq > 8 && irq < 16)
	{
		ocw_master = (~(1 << 2)) & master_now;
		ocw_slave = (~(1 << (irq - 8))) & slave_now;
		outb_pic(ocw_master, MASTER_8259A_IMR);
		outb_pic(ocw_slave, SLAVE_8259A_IMR);
	}

	asm("sti\n\t");

	return;
}

/*在loader阶段，这里只有开启了一个中断，也就是硬盘控制器中断，
 * 所以这里的EOI并不追求效率。*/
inline void EOI_master(void)
{
	outb_pic(0x20, MASTER_8259A_CMD);
	asm("sti");
}

inline void EOI_slave(void)
{
	outb_pic(0x20, MASTER_8259A_CMD);
	outb_pic(0x20, SLAVE_8259A_CMD);
	asm("sti");
}
