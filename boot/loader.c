#include "8259a.h"
#include "hd.h"
#include "display.h"
#include "timer.h"
#include "fs.h"
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
		dis_str("make Finuxfs compelet, please loader the kernel in the root dir.", 0xc, 4, 0);
	}

	for(;;);
}
