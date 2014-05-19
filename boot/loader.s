.code16

.globl loader_start
.globl DetectCount

loader_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %es

	call Init_e820

	lgdt GDTPTR
	inb	$0x92, %al
	orb $0x2, %al
	outb %al, $0x92
	movl %cr0, %eax
	xorl $0x1, %eax
	movl %eax, %cr0

	ljmp $0x8, $CODE32_START

REAL_MODE:
	movw %cs, %ax
	movw %ax, %es
	inb $0x92, %al
	andb $0xfd, %al
	outb %al, $0x92
	jmp .

Init_e820:
	xorl %eax, %eax
	movw $buffer, %di
	xorl %ebx, %ebx

Mem_e820:

	movl $0xe820, %eax
	movl $20, %ecx
	movl SMAP, %edx
	int $0x15

Check_e820:
	jc Fail_e820
	cmpl $0, %ebx
	je End_e820

Again_e820:
	addw $20, %di
	incl DetectCount
	jmp Mem_e820

Fail_e820:
	movw $FailStr, %si
	movw FailStrLen, %cx
	xorl %edi, %edi
	call print_real
	jmp .

End_e820:
	ret

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
DetectCount:
	.int 0
SMAP:
	.ascii "PAMS"

.equ buffer, 0x8000			/*e820内存探测结果放入0x8000处*/




.code32
CODE32_START:
	movw $0x10, %ax
	movw %ax, %ds		/*设置段寄存器*/
	movw %ax, %ss
	movw %ax, %es
	movw %ax, %fs
	movw $0x18, %ax
	movw %ax, %gs
	movl $0x7bff, %esp	/*和boot.s中一样，这里将栈基址设为0x7bff,*/
						/*我们的栈空间大概有不到30Kb，所以要省着点用阿....*/

	jmp Cstart


JMP_TO_REAL:			/*这里的代码是执行不到的...理论上*/
	xorw %ax, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %fs
	movw %ax, %gs

	movl %cr0, %eax
	andb $0xfe, %al
	movl %eax, %cr0

	ljmp $0, $REAL_MODE


GDT:
	.quad 0x0000000000000000
	.quad 0x00cf9a000000ffff		/*boot kernel code seg*/
	.quad 0x00cf92000000ffff		/*boot kernel data seg*/
	.quad 0x0000930b8000ffff		/*boot dis seg*/


GDTPTR:
	.word (8*4-1)
	.long GDT
