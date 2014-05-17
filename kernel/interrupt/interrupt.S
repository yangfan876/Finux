#include "interrupt.h"

.global irq00_handler

irq00_handler:
	pushal
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs

	incb %gs:(0)

	call EOI_master
	push %esp
	call set_tss_esp
	addl $0x4, %esp

	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal

	lret
