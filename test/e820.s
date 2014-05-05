/*
 *get the memory map.
 */

.code16

.globl _start
_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %ss
	movw %ax, %es

	xorl %eax, %eax
	movw $buffer, %di
	xorl %ebx, %ebx

Mem_e820:
	movw $0xe820, %ax
	movl $20, %ecx
	movl SMAP, %edx
	int $0x15

Check_e820:
	jc Fail_e820
	cmpl $0, %ebx
	je End_e820

Again_e820:
	movw %di, %ax
	addw $20, %di
	movw %ax, %di
	incl num
	jmp Mem_e820

Fail_e820:
	movw $FailStr, %si
	movw FailStrLen, %cx
	xorl %edi, %edi
	call print_real
	jmp .

End_e820:
	jmp .

print_real:
	xorw %ax, %ax
	movw $0xb800, %ax
	movw %ax, %gs
	movb $0x0c, %ah

loop1:
	movb (%si), %al
	movw %ax, %gs:(%edi)

	inc %esi
	addl $2, %edi

	loop loop1

	ret


FailStr:
	.asciz "Get memory map failed."
FailStrLen:
	.int .-FailStr
num:
	.int 0
SMAP:
	.ascii "PAMS"
buffer:
	.fill 300

.org 510
	.word 0xaa55
