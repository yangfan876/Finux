#include <sys/idt.h>
#include <string.h>
#include "interrupt.h"
#include "hd.h"
#include "8259a.h"


static struct hd_status HD={ATA_none, (u32 *)0, 0, 0, 0, 0, {0}};

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

static inline void io_delay(void)
{
	const u16 DELAY_PORT = 0x80;
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
}

static inline unsigned char inb_pic(unsigned int port)
{
	unsigned char value = inb(port);
	io_delay();
	return value;
}

static inline void outb_pic(unsigned char value, unsigned int port)
{
	outb(value, port);
	io_delay();
}



static inline void port_read(char *buf, u16 port, int size)
{

	asm volatile("cld\n\t"
		"shr $1, %%ecx\n\t"
		"rep insw\n\t"
		:
		:"d"(port),"D"(buf),"c"(size)
		);
}

static inline void port_write(char *buf, u16 port, int size)
{
	asm volatile("cld\n\t"
		"shr $1, %%ecx\n\t"
		"rep outsw\n\t"
		:
		:"d"(port),"S"(buf),"c"(size)
		);
}

static inline void hd_cmd_out(struct hd_cmd *cmd)
{
	while(inb_pic(0x1f7) >= 0x80);
	outb_pic(0, CTR_DEV_Control);
	outb_pic(cmd->features, COM_Features);
	outb_pic(cmd->sector_count, COM_Sector_Count);
	outb_pic(cmd->LBA_low, COM_LBA_L);
	outb_pic(cmd->LBA_mid, COM_LBA_M);
	outb_pic(cmd->LBA_hig, COM_LBA_H);
	outb_pic(cmd->device, COM_Device);
	outb_pic(cmd->command, COM_Command);
}

static void hd_handler(void)
{
	switch(HD.cmdnow)
	{
		case ATA_identify:
		case ATA_read:
			port_read(HD.hdbuf, HD.port, HD.bufsize);
			break;
		case ATA_write:
			break;
	}

	HD.cmdnow = ATA_none;
	EOI_slave();
	return;
}

void hd_identify(void)
{
	char buf[512];
	struct hd_cmd cmd;
	cmd.device = REG_Drive(1,0,0);
	cmd.command = ATA_identify;
	HD.buf = buf;
	HD.cmdnow = cmd.command;
	HD.handler = (u32 *)port_read;
	HD.bufsize = 512;
	HD.port = COM_Data;
	HD.sectorcnt = 1;
	hd_cmd_out(&cmd);
	while (HD.cmdnow == cmd.command);
	memcpy(buf, HD.hdbuf, HD.bufsize);
	return;
}

void hd_read(u32 LBA, int sectorcnt, char *buf)
{
	struct hd_cmd cmd;
	cmd.features = 0;
	cmd.sector_count = sectorcnt;
	cmd.LBA_low = LBA & 0xff;
	cmd.LBA_mid = (LBA >> 8) & 0xff;
	cmd.LBA_hig = (LBA >> 16) & 0xff;
	cmd.device = REG_Drive(1, 0, (LBA >> 24) & 0xf);
	cmd.command = ATA_read;
	HD.buf = buf;
	HD.cmdnow = cmd.command;
	HD.handler = (u32 *)port_read;
	HD.sectorcnt = sectorcnt;
	HD.port = COM_Data;
	HD.bufsize = sectorcnt * 512;
	hd_cmd_out(&cmd);
	while (HD.cmdnow == cmd.command);
	memcpy(buf, HD.hdbuf, HD.bufsize);
	return;

}
void hd_write(u32 LBA, int sectorcnt, char *buf)
{
	struct hd_cmd cmd;
	cmd.features = 0;
	cmd.sector_count = sectorcnt;
	cmd.LBA_low = LBA & 0xff;
	cmd.LBA_mid = (LBA >> 8) & 0xff;
	cmd.LBA_hig = (LBA >> 16) & 0xff;
	cmd.device = REG_Drive(1, 0, (LBA >> 24) & 0xf);
	cmd.command = ATA_write;
	HD.buf = buf;
	HD.cmdnow = cmd.command;
	HD.handler = (u32 *)port_write;
	HD.port = COM_Data;
	HD.bufsize = sectorcnt * 512;
	hd_cmd_out(&cmd);
	while(!(inb_pic(COM_Status) & 0x8));

	port_write(HD.buf, HD.port, HD.bufsize);

	while (HD.cmdnow == cmd.command);
	return;
}

extern u32 *interrupt[16];

void init_hd(void)
{
	interrupt[14] = (u32 *)hd_handler;
	set_intr_gate(IRQ_AT_HD, (u32 *)irq14_handler);
	enable_irq(IRQ_AT_HD);
}
