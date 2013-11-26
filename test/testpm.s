/*
 *print "Hello World" in the real modle
 */

.code16

.globl _start
_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %ss

	xorw %ax, %ax
	movw $0xb800, %ax
	movw %ax, %gs
	movb $'A', %bl
	movb $0x0c, %bh
	movw %bx, %ds:(0x0)

	movw $0x0, %ax
	movw $0x0, %bx
	xorl %ecx, %ecx
	movw HelloLen, %cx
	movl $Hello, %esi
	xorl %edi, %edi
	call print_real

	jmp .

print_real:

	movb $0x0c, %ah

loop1:
	movb (%si), %al
	movw %ax, %gs:(%edi)

	inc %esi
	addl $2, %edi

	loop loop1

	ret

Hello:
	.asciz "Hello World."
HelloLen:
	.short .-Hello

.org 510
.word 0xaa55
