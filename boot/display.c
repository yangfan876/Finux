#include <string.h>
#include "display.h"

/*Ring0打印字符串，传入参数情况如下：
 *
 * straddr:所要导引字符串首地址
 * color:字符串颜色
 * row:屏幕中的第几行
 * col:屏幕中的第几列
 * */

int dis_str(const char *straddr, u8 color, u32 row, u32 col)
{

	int i;
	int	len = 0;
	int local = row * 160 + col * 2;
	u8 *tmp = (u8 *)straddr;

	len = strlen(straddr);

	for (i = 0; i < len; i++)
	{
		char word = *tmp++;

		asm (
				"movb %%al, %%ah\n\t"
				"movb %%bl, %%al\n\t"
				"movw %%ax, %%gs:(%%edi)\n\t"
				:
				:"a"(color), "b"(word), "D"(local)
			);
		local += 2;
	}
	return i;
}

int dis_nchar(const char *straddr, u8 color, int strlen, u32 row, u32 col)
{

	int i;
	int local = row * 160 + col * 2;
	u8 *tmp = (u8 *)straddr;

	for (i = 0; i < strlen; i++)
	{
		char word = *tmp++;

		asm (
				"movb %%al, %%ah\n\t"
				"movb %%bl, %%al\n\t"
				"movw %%ax, %%gs:(%%edi)\n\t"
				:
				:"a"(color), "b"(word), "D"(local)
			);
		local += 2;
	}
	return i;
}


