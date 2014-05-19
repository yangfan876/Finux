#include <type.h>

void get_memory_info(void);

#define KERNEL_LOAD_ADDRESS 0x200000		/*kernel将被加载到2M地址处*/
#define KERNEL_INFO_ADDRESS 0x100000		/*kernel信息将被加载到1M地址处*/
struct kernel_info
{
	u32 size;
	u32 start;
	u32 memory_map_cnt;
};

#define MEMORY_MAP_ADDR 0x8000				/*内存探测信息所放置的地址*/

/*内存探测信息结构体*/
struct e820_ARDS
{
	u32	baselow;
	u32 basehigh;
	u32 lenthlow;
	u32 lenthhigh;
	u32 type;
} __attribute__((packed));
