
.global sys_entry


sys_entry:

	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs

	/*进入内核级之后系统会自动关中断，
	 *保存栈信息后就可以打开中断，但是
	 这里打开中断可能会出现一些不可预料
	 的情况。*/

	sti

	/*压入所要传入给系统调用处理函数的参数*/

	pushl %edi
	pushl %esi
	pushl %edx
	pushl %ecx
	pushl %ebx
	pushl %eax

	call syscall_handler

	addl $0x18, %esp

	popl %gs
	popl %fs
	popl %es
	popl %ds

	movl (%esp), %eax
	movl 0x4(%esp), %ebx
	movl 0x8(%esp), %ecx
	movl %eax, 0x4(%esp)
	movl %ebx, 0x8(%esp)
	movl %ecx, (%esp)

	popf

	lret

