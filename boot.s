.code16								//这里要编译成16位代码，因为在执行这段代码的时候cpu处于实模式。
.text

.globl _start

_start:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %es
	call DispStr
	
	jmp .

DispStr:
	movw $BootMessage, %ax
	movw %ax, %bp
	movw MessageLenth, %cx
	movw $0x1301, %ax
	movw $0x000c, %bx
	movb $0x0, %dl
	int $0x10					//bios 0x10中断，大家可以查相关资料。
	ret

BootMessage:
	.string	"I love you"

MessageLenth:
	.word . - BootMessage

.org 510
boot_end:
	.word 0xaa55
