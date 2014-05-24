#include <asm/io.h>
#include "8253.h"

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

#define COUNTER0 0x40
#define COUNTER1 0x41
#define COUNTER2 0x42
#define MODE_CONTROL_REG 0x43

#define COUNTER_SELECT (0x0 << 6)
#define READ_WRITE_LOCK (0x3 << 4)
#define COUNTER_MODE (0x2 << 1)

#define TIMER_FREQ 1193182L
#define HZ 100

void init_8253(void)
{
	outb_pic((COUNTER_SELECT | READ_WRITE_LOCK | COUNTER_MODE), MODE_CONTROL_REG);
	outb_pic((u8)(TIMER_FREQ/HZ), COUNTER0);
	outb_pic((u8)(TIMER_FREQ/HZ >> 8), COUNTER0);
	return;
}
