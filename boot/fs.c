#include <string.h>
#include "debug.h"
#include "hd.h"
#include "fs.h"

/*主分区表和逻辑分区表分别存在primary和logical两个分区表数组中*/
struct part_table primary[PRIMARY_MAX_CNT], logical[LOGIC_MAX_CNT];


/*获取分区表，Finux只支持最多10个拓展分区*/
void get_part_information(void)
{
	char buf[512];
	int tab_local = PART_TABLE_OFFSET;
	struct part_table *table;
	int prim = 0, logic = 0;

	hd_read(0x0, 1, buf);

	table = (struct part_table *)(&buf[tab_local]);

	/*获取主分区表*/
	while(table->system_id != PART_EMPTY && tab_local < PART_TABLE_END)
	{
		if (table->system_id == PART_EXTENDED)
		{
			memcpy((void *)&logical[logic], (void *)table, \
						sizeof(struct part_table));
			logic++;
		}

		memcpy((void *)&primary[prim], (void *)table, \
					sizeof(struct part_table));
		prim++;

		tab_local += sizeof(struct part_table);
		table = (struct part_table *)(&buf[tab_local]);

	}

	table = (struct part_table *)&logical[0];
	hd_read(table->first_LBA, 1, buf);
	table = (struct part_table *)(&buf[PART_TABLE_OFFSET]);

	/*获取拓展分区的分区表*/
	while (table->system_id != PART_EMPTY)
	{
		table = (struct part_table *)(&buf[PART_TABLE_OFFSET]);
		memcpy((void *)&logical[logic], (void *)table, \
					sizeof(struct part_table));
		logic++;

		table = (struct part_table *)(&buf[PART_TABLE_OFFSET + 0x10]);

		if (table->system_id != PART_EMPTY)
		{
			memcpy((void *)&logical[logic], (void *)table, \
					sizeof(struct part_table));
			logic++;
		}
		else
		{
			break;
		}

		hd_read(table->first_LBA + logical[0].first_LBA, 1, buf);
		table = (struct part_table *)(&buf[PART_TABLE_OFFSET]);
	}
}

/*将sector map对应位图置位*/
static int set_sector_map(int local, u8 *buf, int zo)
{
	int off_in_sector = 0, u8_num = 0, off_in_u8 = 0;

	off_in_sector = local % 512;
	u8_num = off_in_sector / 8;
	off_in_u8 = off_in_sector % 8;

	if ((buf[u8_num] & (1 << off_in_u8)) == zo)
		return 0;
	else if (zo == 0)
		buf[u8_num] &= ~(1<<((8-1)-off_in_u8));
	else if (zo == 1)
		buf[u8_num] |= (1<<((8-1)-off_in_u8));
	else
		PANIC("In the set_sector_map 'ZO' error.");
	return 1;
}


int make_fs(void)
{
	char buf[512];
	struct super_block *tmp, superblock;
	struct part_table *Finux_part;
	int part, local;
	struct inode root_inode;
	u32 base_sector;
	int i;

	/*在主分区寻找FINUX分区*/
	for(part = 0; part < PRIMARY_MAX_CNT; part++)
	{
		if (primary[part].system_id == FINUX_SYSID)
		{
			Finux_part = &primary[part];
			break;
		}
	}

	base_sector = logical[0].first_LBA;

	/*如果主分区没有则在逻辑分区寻找*/
	if (part >= PRIMARY_MAX_CNT && logical[0].system_id != 0)
	{
		for(part = 0; part < LOGIC_MAX_CNT; part++)
		{
			if (logical[part].system_id == FINUX_SYSID)
			{
				Finux_part = &logical[part];
				if ((logical[part-1].system_id == logical[0].system_id) && (part-1 != 0))
				{
					base_sector += logical[part-1].first_LBA;
				}
				break;
			}
		}
	}

	/*如果没有找到Finux分区则PANIC*/
	if (part >= LOGIC_MAX_CNT)
	{
		PANIC("there is no partation for Finux filesystem.");
	}

	/*如果找到Finux分区，则读该分区的superblock扇区*/

	base_sector = Finux_part->first_LBA + base_sector;

	hd_read(base_sector + 1, 1, buf);

	tmp = (struct super_block *)buf;

	/*这里如果发现魔术和Finux fs的魔术相同，则认为有文件系统*/
	if (tmp->magic == FINUX_MAGIC)
	{
		return 0;
	}

	/*找到FINUX分区，但是没有文件系统则初始化superblock*/

	superblock.magic = FINUX_MAGIC;
	superblock.inode_cnt = MAX_INODE_CNT;
	superblock.sector_cnt = Finux_part->sector_cnt;
	superblock.inode_map_sectors = 1;
	superblock.inode_map_start = base_sector + 2;
	superblock.sector_map_sectors = Finux_part->sector_cnt/512/8;
	superblock.sector_map_start = superblock.inode_map_start + 1;
	superblock.inode_array_start = superblock.sector_map_start + \
								   superblock.sector_map_sectors;
	superblock.inode_sectors = (MAX_INODE_CNT*sizeof(struct inode)) / 512;

	if ((MAX_INODE_CNT*sizeof(struct inode)) %512)
	{
		superblock.inode_sectors++;
	}

	superblock.inode_size = sizeof(struct inode);
	superblock.root_inode = 0;
	superblock.root_start = superblock.inode_array_start + superblock.inode_sectors;
	superblock.root_sectors = (sizeof(root_inode)*MAX_INODE_CNT) / 512;
	if ((sizeof(root_inode)*MAX_INODE_CNT) % 512)
	{
		superblock.root_sectors++;
	}

	superblock.first_data_sector = superblock.root_start + superblock.root_sectors;

	superblock.dir_ent_size = sizeof(struct dir_entry);

	/*建立 super block*/
	memset((void *)buf, 0, sizeof(buf));
	memcpy((void *)buf, (void *)&superblock, sizeof(superblock));
	hd_write(base_sector+1, 1, (char *)&superblock);

	memset((void *)buf, 0, sizeof(buf));

	/*初始化所有inode为0*/
	for (i = 1; i < MAX_INODE_SECTORS; i++)
	{
		hd_write(superblock.inode_array_start + i, 1, buf);
	}

	/*初始化root inode*/
	root_inode.mode = READ_WRITE;
	root_inode.file_size = superblock.root_sectors * 512;
	root_inode.file_start_sect = superblock.root_start;
	root_inode.file_sector_cnt = superblock.root_sectors;

	hd_write(superblock.inode_array_start, 1, (char *)&root_inode);


	/*初始化inode map*/
	buf[superblock.root_inode] = 1;
	hd_write(superblock.inode_map_start, 1, buf);

	/*初始化sector map*/
	buf[superblock.root_inode] = 0;
	for (i = 0; i < superblock.sector_map_sectors; i++)
	{
		hd_write(superblock.sector_map_start + i, 1, buf);
	}

	for (local = base_sector; local < superblock.first_data_sector; local++)
	{
		set_sector_map(local, (u8 *)buf, 1);
	}

	hd_write(superblock.sector_map_start, 1, buf);

	return 1;
}
