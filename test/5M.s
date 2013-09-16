/*
 *print "Hello World" in the protect modle.
 */

.code16

.globl _start
_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %bx, %ss

	lgdt GDTPTR

	cli

	inb	$0x92, %al
	orb $0x2, %al
	outb %al, $0x92

	movl %cr0, %eax
	xorl $0x1, %eax
	movl %eax, %cr0

	ljmp $0x8, $CODE32_START

.code32

CODE32_START:
	
	xorl %eax, %eax
	movw $0x10, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %gs
	
	movl $Hello, %esi
	movl $0x500000, %edi
	movl HelloLen, %ecx

	cld

	rep movsb

	movl $0xb8000, %edi
	movl $0x500000, %esi
	movl HelloLen, %ecx

	movb $0x0c, %ah
	
loop1:
	movb (%esi), %al
	movw %ax, %gs:(%edi)
	
	inc %esi
	addl $2, %edi

	loop loop1

	jmp .

Hello:
	.ascii "Hello World."
HelloLen:
	.int .-Hello

GDT:
	.quad 0x0000000000000000
	.quad 0x00cf9a000000ffff
	.quad 0x00cf92000000ffff
GDTPTR:
	.word (8*3-1)
	.long GDT

.org 510
.word 0xaa55
