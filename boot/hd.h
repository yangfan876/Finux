#include <type.h>

#define COM_Data 0x1f0
#define COM_Features 0x1f1
#define COM_Error COM_Features
#define COM_Sector_Count 0x1f2
#define COM_LBA_L 0x1f3
#define COM_LBA_M 0x1f4
#define COM_LBA_H 0x1f5
#define COM_Device 0x1f6
#define COM_Status 0x1f7
#define COM_Command COM_Status

#define CTR_DEV_Control 0x3f6
#define CTR_ALT_Status CTR_DEV_Control

#define REG_Drive(lba, drv, lba_H) (((lba<<6) | (drv<<4) | (lba_H & 0xf)) | 0xa0)

/*硬盘操作命令cmd->command*/
#define ATA_identify 0xec
#define ATA_read 0x20
#define ATA_write 0x30
#define ATA_none 0x0

/*硬盘操作命令*/
struct hd_cmd
{
	u8 features;
	u8 sector_count;
	u8 LBA_low;
	u8 LBA_mid;
	u8 LBA_hig;
	u8 device;
	u8 command;
};

/*硬盘状态*/
struct hd_status
{
	u32 cmdnow;
	u32 *handler;
	char *buf;
	int bufsize;
	int port;
	int sectorcnt;
	char hdbuf[1024];
};

/*struct hd_info
{
	u16 Function;
	u
}
*/
/*函数声明*/
void init_hd(void);
void hd_identify(void);
void get_part_information(void);
void hd_read(u32 LBA, int sectorcnt, char *buf);
void hd_write(u32 LBA, int sectorcnt, char *buf);
