
.global switch_to
.global yield

.extern current_thread

switch_to:
	movl %eax, %esp
	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal
	lret

yield:
	subl $0x4, %esp			/*开辟空间存放cs*/
	pushl %eax				/*将eax压栈，后面要用eax*/
	movl 0x8(%esp), %eax	/*将ret address放入eax中*/
	movl %eax, 0x4(%esp)	/*将eax中返回地址放入栈中，向上偏移4个字节*/
	movl $0x20, 0x8(%esp)	/*将cs放入原ret address的空间*/
	popl %eax

	pushal
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs

	movl (current_thread), %eax
	movl %esp, (%eax)

	call yield_thread

	movl (current_thread), %eax
	movl (%eax), %esp

	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal
	sti
	lret

jump_out_yield:
	ret

