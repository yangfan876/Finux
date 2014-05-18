#include "interrupt.h"

.global irq00_handler

.extern current_thread

irq00_handler:
	pushal
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs

	movl (current_thread), %eax

	movl %esp, (%eax)

	incb %gs:(24*160)

	call EOI_master
	call timer_handler

	movl (current_thread), %eax
	movl (%eax), %esp

	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal

	lret
