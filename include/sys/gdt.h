
#define GDT_ENTRY_INIT(desc, flags, base, limit)  { \
		desc.a = ((limit) & 0xffff) | (((base) & 0xffff) << 16); \
		desc.b = (((base) & 0xff0000) >> 16) | (((flags) & 0xf0ff) << 8) | \
			((limit) & 0xf0000) | ((base) & 0xff000000); \
	}



/*用于初始化GDT的宏函数*/
/*#define GDT_ENTRY_INIT(flags, base, limit) { { { \
		.a = ((limit) & 0xffff) | (((base) & 0xffff) << 16), \
		.b = (((base) & 0xff0000) >> 16) | (((flags) & 0xf0ff) << 8) | \
			((limit) & 0xf0000) | ((base) & 0xff000000), \
	} } }
*/


/*GDT条目总数*/
#define GDTNUM 32

/*GDTentry在GDT表中的位置*/
#define CALL_GATE_LOCAL 3
#define KCS_LOCAL 4
#define KDS_LOCAL 5
#define UCS_LOCAL 6
#define UDS_LOCAL 7
#define TSS_LOCAL 8
#define DIS_LOCAL 9

/*kernel代码段选择子*/
#define KCS_SELEC (KCS_LOCAL << 3)

/*段寄存器数值*/
#define _KERNEL_CS_ KCS_SELEC
#define _KERNEL_DS_ (KDS_LOCAL << 3)
#define _USER_CS_ ((UCS_LOCAL << 3) | 0x3)
#define _USER_DS_ ((UDS_LOCAL << 3) | 0x3)
#define _KERNEL_TSS_ (TSS_LOCAL << 3)
#define _DIS_GS_ (DIS_LOCAL << 3)

/*启动时代码段选择子*/
#define KCS_BOOT_SELEC (1<<3)

/*启动时段寄存器数值*/
#define _KERNEL_BOOT_CS_ KCS_BOOT_SELEC
#define _KERNEL_BOOT_DS_ (2<<3)
#define _DIS_BOOT_GS_ (3<<3)

/*内核态代码段数据段以及用户态代码段数据段描述符定义

#define KERNEL_CODE_SEG 0x00cf9a000000ffff
#define KERNEL_DATE_SEG 0x00cf92000000ffff
#define USER_CODE_SEG	0x00cffa000000ffff
#define USER_DATE_SEG   0x00cff2000000ffff
#define DIS_SEG			0x0000930b8000ffff
*/


/*
#define KERNEL_CODE_SEG_UPPER  0x00cf9a00
#define KERNEL_CODE_SEG_BOTTOM 0x0000ffff
#define KERNEL_DATE_SEG_UPPER  0x00cf9200
#define KERNEL_DATE_SEG_BOTTOM 0x0000ffff
#define USER_CODE_SEG_UPPER	   0x00cffa00
#define USER_CODE_SEG_BOTTOM   0x0000ffff
#define USER_DATE_SEG_UPPER    0x00cff200
#define USER_DATE_SEG_BOTTOM   0x0000ffff
#define DIS_SEG_UPPER		   0x0000930b
#define DIS_SEG_BOTTOM		   0x8000ffff
*/
