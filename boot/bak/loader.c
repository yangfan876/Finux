#include <desc_struct.h>
#include <gdt.h>
#include "loader.h"
#include <string.h>
#include "hd.h"

/*GDT,全局描述符表*/
struct desc_struct GDT[GDTNUM];
struct desc_ptr GDTR;

/*TSS*/
struct tss_struct TSS;

/*函数声明*/
void Call_Gate(void);
void GDT_Changed(void);
void Call_Gate_Test(void);
void Call_Gate(void);
void Jump_To_Ring3(void);
void Ring3(void);
int dis_str(const char *straddr, u32 strlen, u8 color, u32 local);
void Set_Page(void);
int get_pdeT_num(int ptet_num);
int get_pteT_num(int page_num);
int get_page_num(int ARDSCount, struct e820_ARDS *AddrStart);
void Init_8259A(void);
static inline void outb_pic(unsigned char value, unsigned int port);
static inline void io_delay(void);
void init_idt();

/*全局变量定义*/
unsigned short _kernel_cs_ = _KERNEL_CS_;
unsigned short _kernel_ds_ = _KERNEL_DS_;
unsigned short _user_cs_ = _USER_CS_;
unsigned short _user_ds_ = _USER_DS_;
unsigned short _dis_gs_ = _DIS_GS_;

/*分页信息定义*/

struct page_dir *PageDir = (struct page_dir *)0x500000;				//这里使用5M地址，是因为目前程序还没有发展到这里。
struct page_table *PageTable = (struct page_table *)0x501000;		//因为之间里一张PDT，所以Page Table在其之后4K处。

/*
 * 当进入保护模式后C代码的开始位置，Cstart()函数创建GDT全剧描述符表，
 * 方便后续对GDT的管理，同时切换代码段和数据段。
 * */

void Cstart(void)
{
	GDT[0].a = 0;
	GDT[0].b = 0;
	GDT[KCS_LOCAL].a = (u32)(KERNEL_CODE_SEG_BOTTOM);
	GDT[KCS_LOCAL].b = (u32)(KERNEL_CODE_SEG_UPPER);
	GDT[KDS_LOCAL].a = (u32)(KERNEL_DATE_SEG_BOTTOM);
	GDT[KDS_LOCAL].b = (u32)(KERNEL_DATE_SEG_UPPER);
	GDT[UCS_LOCAL].a = (u32)(USER_CODE_SEG_BOTTOM);
	GDT[UCS_LOCAL].b = (u32)(USER_CODE_SEG_UPPER);
	GDT[UDS_LOCAL].a = (u32)(USER_DATE_SEG_BOTTOM);
	GDT[UDS_LOCAL].b = (u32)(USER_DATE_SEG_UPPER);

	/*初始化显示段*/
	GDT_ENTRY_INIT(GDT[DIS_LOCAL], 0x92, 0xb8000, 0xffff);


	GDTR.size = (u16)(GDTNUM*8-1);
	GDTR.address = (unsigned long)(&GDT);

	__asm__(
				"lgdt GDTR\n\t"
				"movw $0x28, %ax\n\t"		/*将_KERNEL_DS_放入DS寄存器中*/
				"movw %ax, %ds\n\t"
				"movw $0x48, %ax\n\t"		//显示段选择子
				"movw %ax, %gs\n\t"
				"ljmp $0x20, $GDT_Changed\n\t");	/*内核代码段选择子_KERNEL_CS_*/


	for(;;);	/*代码不会执行到这里*/
}

/*
 * 切换GDT后的收尾工作在Change_GDT()函数中进行
 * */

void GDT_Changed(void)
{
	char *str;
	u16 TSSselector = _KERNEL_TSS_;
	/*初始化堆栈段寄存器*/
	__asm__(
				"movw %ds, %ax\n\t"
				"movw %ax, %ss\n\t"
				"movl $0x7bff, %esp\n\t"
			);

	/*初始化TSS,并放入GDT中*/
	TSS.x86_tss.sp0 = 0x7bff;
	TSS.x86_tss.ss0 = _KERNEL_DS_;
//	TSS.x86_tss.io_bitmap_base = (u16)(((size_t)&(TSS.x86_tss.io_bitmap_base) - (size_t)&TSS) + 2);
	TSS.x86_tss.io_bitmap_base = sizeof(TSS);
	TSS.io_map_end = 0xff;
	TSS.tss_len = (u32)((size_t)&(TSS.tss_len) -(size_t)&TSS);

	GDT_ENTRY_INIT(GDT[TSS_LOCAL], 0x89, (u32)(&TSS), TSS.tss_len-1);

	/*加载TSS*/
	asm (
			"ltr %%ax\n\t"
			:
			:"a"(TSSselector)
		);

	dis_str("get detect memory map ok.", 25, 0xc, 0x0);

/*开启分页机制*/
	Set_Page();
	dis_str("set page ok.", 12, 0xc, 80);
/*init idt*/
	Init_8259A();
	dis_str("init the 8259A ok.", 18, 0xc, 160);

	init_idt();
/*测试控制硬盘*/
	hd_identify();
	for(;;);
/*下面的函数是为了测试从Ring0跳转到Ring3的代码*/

	Jump_To_Ring3();

}
/*测试通过调用门进行代码访问*/
void Call_Gate(void)
{
	struct desc_struct Gate;
	unsigned int upper = 0, bottom = 0;
	unsigned int offset = (unsigned int)Call_Gate_Test;

//	upper = (unsigned int)((offset & 0xffff0000) | 0x8c00);			//call gate DPL=0;
	upper = (unsigned int)((offset & 0xffff0000) | 0xec00);				//call gate DPL=3, test different prev***;
	bottom = (unsigned int)((KCS_SELECTOR << 16) | (offset & 0x0000ffff));

	Gate.a = bottom;
	Gate.b = upper;
	GDT[3].a = Gate.a;
	GDT[3].b = Gate.b;
/*	__asm__(
			"call $0x18, $0x0\n\t"				//相同特权及下调用门示例
			);*/
	__asm__(
			"call $0x1b, $0x0\n\t"				//有特权级转换的调用门示例
				);

	for(;;);
}

/*测试跳入Ring3*/
void Jump_To_Ring3(void)
{
	unsigned int funcadd = (unsigned int)Ring3;
	asm (
			"pushl _user_ds_\n\t"
			"pushl %%esp\n\t"
			"pushl _user_cs_\n\t"
			"pushl %%eax\n\t"
			"lret\n\t"				/*跳入用户态代码段*/
			:
			:"a"(funcadd)
		);
	for(;;);
}

/*调用门测试代码*/
void Call_Gate_Test(void)
{
	int i = 0;

	while (i < 99)
	{
		i++;
	}

	return;
}
/*Ring3测试代码*/
void Ring3(void)
{
	int i = 0;

	__asm__(
				"movw %ss, %ax\n\t"
				"movw %ax, %ds\n\t"
		);
	while (i<10)
	{
		i++;
	}

	asm("int $0x81\n\t");
//	Call_Gate();
}

/*开启分页机制*/
void Set_Page(void)
{
	/*内存描述符个数，从0x8000开始*/
	extern int DetectCount;
	struct e820_ARDS *ARDS = (struct e820_ARDS *)memory_map_addr;
	int PageNum = 0, PTETNum = 0, PDETNum = 0;
	int PD, PT, PE;
	u32 pagebase = 1024;
	struct page_dir *tmpPDR = PageDir;
	struct page_table *tmpTAB = PageTable;

	/*获取页表个数*/
	PageNum = get_page_num(DetectCount, ARDS);

	PTETNum = get_pteT_num(PageNum);
	PDETNum = get_pdeT_num(PTETNum);

	for (PD = 0; PD < PDETNum; PD++)
	{

		for (PT = 0; PT < PTETNum; PT++)
		{
			tmpPDR->PDE[PT] = ((u32)(&tmpTAB->PTE[PT]) | (u32)0x7); /*页目录基址和属性即页存在，可读可写，用户级*/

			for (PE = 0; PE < 1024; PE++)
			{
				tmpTAB->PTE[PE] = (pagebase | (u32)0x7);	/*页表基址和属性，同上*/
				pagebase += 4096;
			}

			tmpTAB++;

		}
		tmpPDR++;
	}

	asm (
			"movl PageDir, %eax\n\t"
			"movl %eax, %cr3\n\t"
			"movl %cr0, %eax\n\t"
			"orl $0x80000000, %eax\n\t"
			"movl %eax, %cr0\n\t"
		);

	return;
}
/*根据页PTE表个数计算PDE表个数*/
int get_pdeT_num(int ptet_num)
{
	int count = 0;
	count = ptet_num / 1024;
	if ((((ptet_num & 0x3ff) << 10) / 1024) > 0)
	{
		count += 1;
	}
	return count;
}

/*根据页表个数计算PTE表的个数*/
int get_pteT_num(int page_num)
{
	int count = 0;
	count = page_num / 1024;
	if ((((page_num & 0x3ff) << 10) / 1024) > 0)
	{
		count += 1;
	}
	return count;
}
/*根据ARDS中的数据获取物理内存大小，并返回所需也表数量*/
int get_page_num(int ARDSCount, struct e820_ARDS *AddrStart)
{
	int i;
	struct e820_ARDS *tmp = AddrStart;
	u32 Start = 0, Lenth = 0, End = 0;
	int count = 0;

	for (i = 0; i <= ARDSCount; i++)
	{
		if (tmp->type == 1 && tmp->baselow > Start)
		{
			Start = tmp->baselow;
			Lenth = tmp->lenthlow;
		}
		tmp++;
	}

	End = Start + Lenth;
	count = End / PageSize;

	/*计算余数*/
	if ((((End & 0xfff)<<12) / PageSize) > 0)
	{
		count += 1;
	}

	return count;
}

/*Ring0打印字符串，传入参数情况如下：
 *
 * straddr:所要导引字符串首地址
 * strlen:字符串长度
 * color:字符串颜色
 * local:所在屏幕中的位置
 * */

int dis_str(const char *straddr, u32 strlen, u8 color, u32 local)
{

	int i;
	u8 *tmp = (u8 *)straddr;


	for (i = 0; i < strlen; i++)
	{
		char word = *tmp++;

		asm (
				"movb %%al, %%ah\n\t"
				"movb %%bl, %%al\n\t"
				"movw %%ax, %%gs:(%%ecx)\n\t"
				:
				:"a"(color), "b"(word), "c"(local)
			);
		local += 2;
	}
	return i;
}


/* Basic port I/O */
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

static inline void io_delay(void)
{
	asm volatile("nop\n\t"
				"nop\n\t"
				"nop\n\t"
				"nop\n\t");
	return;
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


#define MASTER_8259A_IMR 0x21
#define SLAVE_8259A_IMR 0xa1
#define MASTER_8259A_CMD 0x20
#define SLAVE_8259A_CMD 0xa0


/*init 8259a*/
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

	outb_pic(0xfb, MASTER_8259A_IMR);		//mask master IRQ
	outb_pic(0xbf, SLAVE_8259A_IMR);		//mask slave IRQ

	return;
}

#define IDT_ENTERIES 256
struct desc_struct idt[IDT_ENTERIES];
struct desc_ptr idt_ptr;

port_read(char *buf, u16 port, int size)
{

	asm("cld\n\t"
		"shr $1, %%ecx\n\t"
		"rep insw\n\t"
		:
		:"d"(port),"D"(buf),"c"(size)
		);
/*	for (i = 0; i < size; i++)
	{
		buf[i] = inb_pic(port);
	}
*/
}

void test_call_hd()
{
	u8 buf[512];

	port_read(buf, 0x1f0, 512);
}

void idt_test()
{
	u8 buf[512] = {0};
	asm ("movw $0x48, %ax\n\t"		//显示段选择子
		"movw %ax, %gs\n\t"
		);
	dis_str("in the idt_test function.",26, 0xc, 0x0);
	port_read(buf, 0x1f0, 512);
	for(;;);
}
void init_idt()
{
	int i;
	for (i = 0; i < IDT_ENTERIES; i++)
	{
		idt[i].a = ((KCS_SELECTOR << 16) | ((u32)idt_test & 0xffff));
		idt[i].b = (((u32)idt_test & 0xffff0000) | 0xee00);
	}
	idt[0x3e].a = ((KCS_SELECTOR << 16) | ((u32)test_call_hd & 0xffff));
	idt[0x3e].b = (((u32)test_call_hd& 0xffff0000) | 0xee00);
	idt_ptr.size = (IDT_ENTERIES * 8 - 1);
	idt_ptr.address = (unsigned long)idt;

	asm ("cli\n\t"
		"lidt idt_ptr\n\t"
		"nop\n\t"
		"sti\n\t"
		);
	return;
}


hd_cmd_out(struct hd_cmd *cmd)
{
	int i;
	u8 status = 1;

	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(0, CTR_DEV_Control);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->features, COM_Features);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->sector_count, COM_Sector_Count);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->LBA_low, COM_LBA_L);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->LBA_mid, COM_LBA_M);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->LBA_hig, COM_LBA_H);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->device, COM_Device);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
	outb_pic(cmd->command, COM_Command);
	while(inb_pic(0x1f7) >= 0x80)
	{
		status = 1;
	}
}



hd_identify()
{
	char buf[512]={0};
	struct hd_cmd cmd;
	cmd.device = REG_Drive(0,0,0);
	cmd.command = ATA_identify;
	hd_cmd_out(&cmd);
//	port_read(buf, 0x1f0, 512);

}


