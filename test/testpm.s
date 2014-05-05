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

	movw $0x0, %ax
	movw $0x0, %bx
	xorl %ecx, %ecx
	movw NoLoaderStrLen, %cx
	movl $NoLoaderStr, %esi
	xorl %edi, %edi
	call print_real

	jmp .

//用于在实模式下显示字符串
print_real:		/*cx: strlen	si: straddr*/

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
NoLoaderStr:
	.asciz "can't find loader.bin file in all floppy."
//提示字符串长度
NoLoaderStrLen:
	.short .-NoLoaderStr

.org 510
.word 0xaa55
