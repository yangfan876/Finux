#include "../echo/display.h"

void syscall_handler(u32 syscall_num, u32 para1,\
			u32 para2, u32 para3, u32 para4, u32 para5)
{
	dis_str("In the syscall_handler function.", 0xc, 0, 0);
	return;
}
