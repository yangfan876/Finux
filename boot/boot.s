#include <boot.h>
.code16

.globl _start

_start:

	jmp code_start
	nop

	BS_OEMName:		.ascii "XY_FINUX"		/* OEM String, 必须 8 个字节*/
	BPB_BytsPerSec:	.short 512				/* 每扇区字节数*/
	BPB_SecPerClus:	.byte 1					/* 每簇多少扇区*/
	PB_RsvdSecCnt:	.short 1				/* Boot 记录占用多少扇区*/
	BPB_NumFATs	:	.byte 2					/* 共有多少 FAT 表*/
	BPB_RootEntCnt:	.short 224				/* 根目录文件数最大值*/
	BPB_TotSec16:	.short 2880				/* 逻辑扇区总数*/
	BPB_Media:		.byte 0xF0				/* 媒体描述符*/
	BPB_FATSz16:	.short 9				/* 每FAT扇区数*/
	BPB_SecPerTrk:	.short 18				/* 每磁道扇区数*/
	BPB_NumHeads:	.short 2				/* 磁头数(面数)*/
	BPB_HiddSec:	.int 0					/* 隐藏扇区数*/
	BPB_TotSec32:	.int 0					/* wTotalSectorCount为0时这个值记录扇区数*/
	BS_DrvNum:		.byte 0					/* 中断 13 的驱动器号*/
	BS_Reserved1:	.byte 0					/* 未使用*/
	BS_BootSig:		.byte 0x29				/* 扩展引导标记 (29h)*/
	BS_VolID:		.int 0					/* 卷序列号*/
	BS_VolLab:		.ascii "XYFINUX_FAT"	/* 卷标, 必须 11 个字节*/
	BS_FileSysType:	.ascii "FAT12   "		/* 文件系统类型, 必须 8个字节*/

.include "boot.h"

//根目录中扇区号
FLNumOfSector:
	.short 0
//根目录剩余中扇区号
FLSectorNum:
	.short 0
//loader.bin文件名
LoaderFileName:
	.asciz "LOADER  BIN"
//用于提示软盘中没有loader.bin文件
NoLoaderStr:
	.asciz "can't find loader.bin file in all floppy."
//提示字符串长度
NoLoaderStrLen:
	.short .-NoLoaderStr



code_start:
	movw %cs, %ax
	movw %ax, %ds								/*段寄存器都将被初始化为0x0*/
	movw %ax, %es
	movw %ax, %ss
	movw $BottomOfStack, %sp					/*BottomOfStack 中是初始状态的栈底地址0x7c00*/

reset_floppy:									/*复位软驱*/
	xorw %ax, %ax
	xorb %dl, %dl
	int $0x13

	movw $SectorNumOfRootDir, (FLSectorNum)		/*FLsectorNum变量中存放根目录中包含多少个扇区*/
	movw $RootDirFirstSectorNum, (FLNumOfSector)/*FLnumOfSector变量中存放要读入的扇区号*/

search_loader_in_root_dir:						/*在根目录中寻找loader.bin*/
	cmpw $0, FLSectorNum						/*判断根目录中扇区号是否已经检查完*/
	jz no_loader_in_root_dir					/*如果检查完了却没发现loader.bin则跳到no_loader_in_root_dir*/
	decw FLSectorNum							/*扇区号自减*/
	movw $BaseOfReadSector, %ax					/*读如扇区放入内存的基址*/
	movw %ax, %es
	movw $OffsetOfReadSector, %bx				/*放入内存的偏移*/
	movw FLNumOfSector, %ax						/*要读入的扇区号*/
	movb $1, %cl								/*要读入1个扇区*/
	call read_sector							/*调用读扇区函数*/

	movw $LoaderFileName, %si					/*loader.bin的文件名地址赋值给si*/
	movw $OffsetOfReadSector, %di				/*读入扇区放置内存的偏移赋值给di*/

	cld

	movw $0x10, %dx								/*要检测整个扇区（512byte）中所有的文件（32byte），所以512/32=16个文件*/

search_loader_in_sector:						/*对比文件名的函数*/
	cmpw $0x0, %dx								/*该扇区所有文件是否已经遍历完*/
	jz serch_next_sector
	decw %dx
	movw $0xb, %cx								/*每个文件名11byte*/

cmp_file_name:
	cmp $0x0, %cx								/*是否每个byte都对比完成*/
	jz find_loader_file
	decw %cx
	lodsb										/*每个byte都与loader.bin进行对比*/
	cmpb %es:(%di), %al
	jz same_letter_go_on						/*如果所对比的字节相同则继续对比下一个字节*/
	jmp different_letter						/*如果不同则说明不是loader.bin文件*/

same_letter_go_on:								/*如果字母相同则继续进行下一个字母的比较*/
	incw %di
	jmp cmp_file_name

different_letter:								/*如果字母不同*/
	andw $0xffe0, %di							/*将di跳回到目录项的首地址*/
	addw $0x20, %di								/*设置为下一个目录项的地址*/
	movw $LoaderFileName, %si					/*将si重新设置为loader.bin的文件名地址*/
	jmp search_loader_in_sector					/*继续将新的文件和loader.bin进行比较*/

serch_next_sector:								/*如果都整个扇区都找不到，则在下一个扇区继续寻找*/
	addw $0x1, FLNumOfSector
	jmp search_loader_in_root_dir

no_loader_in_root_dir:							/*如果整个根目录中都没有找到loader.bin文件则打印提示语句*/
	movw $0xb800, %ax
	movw %ax, %gs
	xorw %ax, %ax
	movw $NoLoaderStr, %si
	movw NoLoaderStrLen, %cx
	xorl %edi, %edi
	call print_real

	jmp .

find_loader_file:								/*如果找到了loader.bin文件*/

	andw $0xffe0, %di							/*将di置为sector的首地址*/
	addw $0x1a, %di								/*将di置为sector中记录数据首扇区号的地址*/
	movw %es:(%di), %ax							/*将首扇区号存入ax中*/
	pushw %ax									/*保存该扇区号*/

	addw $RealDataSectorNum, %ax				/*计算loader.bin文件从第一扇区开始的首扇区号*/
	movw $LoaderBase, %bx						/*设置加载loader.bin文件的内存基址*/

keep_load_the_loader:
/*
	pushw %ax
	pushw %bx
	movb $0xe, %ah
	movb '.', %al
	movb $0xf, %bl
	int $0x10
	popw %bx
	popw %ax
*/
	movb $0x1, %cl								/*读取一个扇区*/
	call read_sector
	popw %ax									/*将刚才保存的扇区号取出*/
	call get_next_sector_in_FAT					/*根据这个扇区号在FAT中寻找下一个扇区号*/
	cmpw $0xfff, %ax							/*如果是0xfff则表示到文件末尾*/
	jz load_loader_compelet						/*到文件末尾则调转到load_loader_compelet*/
	pushw %ax									/*保存扇区号*/
	addw $RealDataSectorNum, %ax				/*计算loader.bin文件从第一扇区开始的首扇区号*/
	addw BPB_BytsPerSec, %bx					/*将loader.bin的偏移地址向后移动一个扇区*/
	jmp keep_load_the_loader

load_loader_compelet:							/*loader.bin文件加载完成*/

	ljmp $0x0, $LoaderBase						/*这里移交控制权给loader*/

/*----------------------------------------------------------*/

/*get_next_sector_in_FAT函数局部变量*/

//用于记录是奇数还是偶数
bOdd:
	.byte 0

//关于这个函数的详细介绍请看这里:http://blog.163.com/yangfan876@126

get_next_sector_in_FAT:			/*该函数根据ax中的扇区号来寻找FAT表中下一个扇区的编号，返回之在ax中*/
	pushw %es					/*保存信息*/
	pushw %bx
	pushw %ax
	movw $BaseOfReadSector, %ax	/*设置FAT表读入基址*/
	movw %ax, %es
	popw %ax					/*恢复ax，值为loader.bin文件从数据区开始的扇区号*/
	movb $0x0, bOdd				/*该变量用于奇偶判断*/
	movw $0x3, %bx				/*这部分用于计算在FAT表项中的偏移，偏移字节数保存在ax中*/
	mulw %bx
	movw $2, %bx
	divw %bx
	cmpw $0x0, %dx				/*bx中如果余数为0则为偶数，否则为奇数，用于后面的判断*/
	jz label_even
	movb $0x1, bOdd				/*如果是奇数*/

label_even:
	xorw %dx, %dx
	movw BPB_BytsPerSec, %bx	/*计算该FAT项向对于FAT表偏移了多少扇区，结果保存在ax中*/
	div %bx

	pushw %dx					/*同时dx中的余数表示该FAT项相对于该扇区偏移了多少字节*/
	movw $OffsetOfReadSector, %bx
	addw $SectorNumOfFAT1, %ax	/*这里要加上FAT表之前的一个扇区才能的出要加载的扇区号*/
	movb $0x2, %cl				/*读入两个扇区是为了防止一个FAT项跨越两个扇区*/
	call read_sector
	popw %dx					/*还记得刚才保存FAT项的相对于该扇区的偏移字节数吗？*/
	addw %dx, %bx				/*将偏移字节数和该扇区首地址相加就是所要求的FAT项*/
	movw %es:(%bx), %ax			/*将该项值保存在ax中*/
	cmpb $0x1, bOdd				/*还记得前面判断该项的奇偶情况吗？就是用在这里*/
	jnz label_even2				/*如果是偶则直接跳到label_even2处*/
	shrw $0x4, %ax				/*因为FAT项占用的是12bit这样所得到的就是ax中的16位数据后4位不是该FAT项中的，所以要右移*/

label_even2:
	andw $0xfff, %ax			/*只取ax中的后12位*/

	popw %bx
	popw %es
	ret

/******************************************************************/

print_real:		/*用于在实模式下显示字符串cx: strlen	si: straddr*/

	movb $0x0c, %ah

loop1:
	movb (%si), %al
	movw %ax, %gs:(%edi)

	inc %esi
	addl $2, %edi

	loop loop1

	ret


/************************************************************/

read_sector:					/*读扇区	ax：扇区号	bx：偏移地址	cl：要读的扇区数*/
	pushw %bp					/*bp寄存器压栈*/
	movw %sp, %bp				/*开辟两字节用于存储所读的的扇区数*/
	sub $2, %sp
	movb %cl, -2(%bp)
	pushw %bx					/*保存bx寄存器中的值*/
	movb BPB_SecPerTrk, %bl		/*每磁道扇区数作为除数*/
	divb %bl					/*被除数是ax中所存的扇区号*/
	incb %ah					/*计算起始扇区号存放到cl中*/
	movb %ah, %cl
	movb %al, %ch				/*ch中是柱面号*/
	shrb $0x1, %ch
	movb %al, %dh
	andb $0x1, %dh				/*dh中是此头号*/
	popw %bx
	movb BS_DrvNum, %dl			/*磁头号，软盘参数中有*/

keep_reading:
	movb $2, %ah
	movb -2(%bp), %al			/*刚才保存在栈中所要读的扇区数*/
	int $0x13
	jc keep_reading				/*如果读入出错则一直读下去*/

	addw $2, %sp
	popw %bp

	ret

.org 510
.word 0xaa55
