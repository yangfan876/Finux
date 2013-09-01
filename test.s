.text
.data
.code16
.globl start
start:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %ss
	
	lgdt GDTPTR

	cli

	inb $0x92, %al
	orb $0x2, %al
	outb %al, $0x92

	movl %cr0, %eax
	xorl $0x1, %eax
	movl %eax, %cr0

	xorl %eax, %eax
	movb $0x8, %al

	ljmp $0x8,$LABEL32_BEGIN

.code32

LABEL32_BEGIN:
	movw $0x10, %ax
	movw %ax, %gs

	movl $((80*11+79)*2), %edi
	movb $0x0c, %ah
	movb $'P', %al
	movl %eax, %gs:(%edi)

	jmp .

GDT:
	.quad 0x0000000000000000
	.quad 0x00c39a000000ffff
	.quad 0x0000920b8000ffff


GDTPTR:
	.word (8*3-1)
	.long GDT


.org 510
.word 0xaa55
