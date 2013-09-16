/*
 *get the memory map.
 */

.code16

.globl _start
_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %ss
	
	xorl %eax, %eax
	movw $buffer, %di
	xorl %ebx, %ebx

Mem_e820:
	movw $0xe820, %ax
	movl $20, %ecx
#	movl $0x534D4150, %edx
	movl SMAP, %edx
	int $0x15

Check_e820:
	jc Fail_e820
	cmpl $0, %ebx
	je End_e820

Again_e820:
	movw %di, %ax
	addw $20, %ax
	movw %ax, %di
	incl num
	jmp Mem_e820

Fail_e820:
	jmp .

End_e820:
	jmp .

buffer:
	.fill 400
num:
	.int 0
SMAP:
	.ascii "PAMS"

.org 510
	.word 0xaa55
