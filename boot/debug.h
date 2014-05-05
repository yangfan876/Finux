#include "display.h"

#define PANIC(str)				\
{								\
	dis_str(str, 0xa, 0, 0);	\
	for(;;);					\
}
