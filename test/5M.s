.code16

.globl _start
_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %bx, %ss

	cli
	inb
