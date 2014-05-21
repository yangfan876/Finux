#include "echo/display.h"

#define PANIC(str)				\
{								\
	dis_str("PANIC:", 0x9,0,0);	\
	dis_str(str, 0xa, 0, 0);	\
	for(;;);					\
}
