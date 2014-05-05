/*
 * mbr 中用到的宏
 *
 */

//初始状态栈底地址
.equ BottomOfStack, 0x7bff
//从软盘读取数据放入内存基址
.equ BaseOfReadSector, 0x0
//从软盘读取数据放入内存偏移
.equ OffsetOfReadSector, 0x7e00

//Loader去掉ELF头部信息后被加载内存基址
//.equ BaseOfLoader,	0x3000

//Loader去掉ELF头部信息时被加载的内存地址
.equ LoaderBase, 0x9000

//Loader被加载内存偏移
//.equ OffsetOfLoader, 0x0

//根目录起始扇区号
.equ RootDirFirstSectorNum, 19
//根目录所占扇区数,BPB_RootEntCnt(0xE0) * 32 / 512 = 14
.equ SectorNumOfRootDir, 14
//数据区起始位置之前的扇区数,本应该是19+14=33，但是由于数据区的扇区号从2开始，所以用19+14-2=31.
.equ RealDataSectorNum, 31
//FAT1的扇区号
.equ SectorNumOfFAT1, 1
