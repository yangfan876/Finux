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

/*	movl (%esp), %eax
	movl 0x4(%esp), %ebx
	movl 0x8(%esp), %ecx
	movl %eax, 0x4(%esp)
	movl %ebx, 0x8(%esp)
	movl %ecx, (%esp)

	popf
*/
	lret
