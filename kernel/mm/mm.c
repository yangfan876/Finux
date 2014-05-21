#include <string.h>
#include "mm.h"

struct kernel_info kernel_info;
struct e820_ARDS memory_map[5];

void get_memory_info(void)
{
	int i = 0;
	memcpy((void *)&kernel_info, (void *)KERNEL_INFO_ADDRESS, sizeof(kernel_info));

	for (i = 0; i < 5; i++)
		memcpy((void *)&memory_map[i], (void *)(MEMORY_MAP_ADDR + sizeof(struct e820_ARDS) * i), sizeof(struct e820_ARDS));
	return;
}
