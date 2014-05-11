#include <type.h>

/*函数声明*/
void get_part_information(void);
int make_fs(void);
void init_Finuxfs(void);
void loader_kernel(void);
void get_super_block(void);
void get_inode_array(void);
void get_root_area(void);

/*分区表中用到的一些宏*/
#define PART_TABLE_OFFSET 0x1be		//分区表在扇区中的偏移
#define PART_TABLE_END 0x200		//分区表结束位置偏移

#define PRIMARY_MAX_CNT 4			//主分区最大个数
#define LOGIC_MAX_CNT 10			//逻辑分区最大个数

#define PART_EMPTY	0				//若分区表system_id为0，则该分区表为空
#define PART_EXTENDED 5				//逻辑分区


/*分区表结构*/
struct part_table
{
	u8 status;						//分区状态
	u8 first_head_num;				//起始磁头号
	u8 first_sector_num;			//起始扇区号
	u8 first_cylinder_low;			//起始柱面号低8位
	u8 system_id;					//分区类型
	u8 end_head_num;				//结束磁头号
	u8 end_sector_num;				//结束扇区号
	u8 end_cylinder_low;			//结束柱面号的低8位
	u32 first_LBA;					//起始扇区的LBA
	u32 sector_cnt;					//扇区数
}__attribute__((packed));

/*文件系统中用到的宏*/
#define SECTOR_SIZE 512				//扇区大小
#define MAX_INODE_CNT 100			//最大文件数
#define MAX_INODE_SECTORS ((MAX_INODE_CNT*sizeof(struct inode) + 511)/512)		//inode array sectors
#define INODES_IN_SECTOR (512/sizeof(struct inode))								//一个sector中有多少个inode
#define MAX_FILENAME_LEN 12			//文件名最大字符数
#define FINUX_MAGIC	563855			//FINUX fs magic num
#define FINUX_SYSID	0xd				//分区表system id

#define USED	1					//位图表示已用
#define NOTUSE	0					//未用

/*Finux filesystem superblock*/
struct super_block
{
	u32	magic;
	u32 inode_cnt;
	u32 sector_cnt;
	u32 inode_map_sectors;
	u32 inode_map_start;
	u32 sector_map_sectors;
	u32 sector_map_start;
	u32 inode_array_start;
	u32 first_data_sector;
	u32 inode_sectors;
	u32 root_start;
	u32 root_inode;
	u32 root_sectors;
	u32 inode_size;
	u32 dir_ent_size;
};

/*当前文件状态*/
#define CLOSED	0
#define READ_ONLY 1
#define READ_WRITE 2

/*Finux filesystem inode*/
struct inode
{
	u32 mode;
	u32 file_size;
	u32 file_start_sect;
	u32	file_sector_cnt;
};

/*Finux filesystem dir entry*/
struct dir_entry
{
	u32 inode_num;
	char name[MAX_FILENAME_LEN];
};


#define KERNEL_LOAD_ADDRESS 0x100000		/*kernel将被加载到1M地址处*/
