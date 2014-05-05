#include <string.h>

void *memcpy(void *dst, const void *src, size_t len)
{
	char *tmp = dst;
	const char *s = src;

	while(len--)
	{
		*tmp++ = *s++;
	}
	return dst;
}

int strlen(const char *str)
{
	int i = 0;
	char *tmp = (char *)str;
	while(*tmp != '\0')
	{
		tmp++;
		i++;
	}
	return i;
}

void *memset(void *str, int ch, size_t n)
{
	int i;
	char *tmp = (char *)str;
	for (i = 0; i < n; i++)
	{
		*tmp++ = ch;
	}

	return str;
}
