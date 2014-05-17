#include "8259a.h"
#include "hd.h"
#include "display.h"
#include "timer.h"
#include "fs.h"
#include "debug.h"
#include <sys/idt.h>

void Cstart(void)
{
	dis_str("Initing the 8259A...", 0xc, 0, 0);
	/*初始化8259A中断控制器*/
	Init_8259A();
	dis_str("Initing the idt...", 0xc, 1, 0);
	/*初始化idt*/
	init_idt();
	dis_str("Initing the timer...", 0xc, 2, 0);
	/*初始化时钟中断*/
	init_timer();
	dis_str("Initing AT disk...", 0xc, 3, 0);
	/*初始化AT硬盘*/
	init_hd();
	/*获取硬盘信息，但FINUX未保存*/
	hd_identify();
	/*获取分区表信息*/
	get_part_information();

	/*检测，如果没有Finux分区则PANIC，如果有检测该分区是否有Finuxfs,如果有文件系统则返回0，没有则创建Finuxfs文件系统*/
	if (make_fs())
	{
		PANIC("make Finuxfs compelet, please loader the kernel in the root dir.")
	}

	/*初始化文件系统*/
	dis_str("Get super block...", 0xc, 4, 0);
	get_super_block();
	dis_str("Get inode array...", 0xc, 5, 0);
	get_inode_array();
	dis_str("Get root area...", 0xc, 6, 0);
	get_root_area();

	/*将内核加载到内存中*/
	dis_str("Loading kernle...", 0xc, 8, 0);
	loader_kernel();

	/*关中断，必须关....*/
	asm("cli");

	/*跳入内核代码*/
	asm("jmp %%eax"::"a"(KERNEL_LOAD_ADDRESS));
}
