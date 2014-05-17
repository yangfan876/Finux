
.global switch_to

switch_to:
	movl %eax, %esp
	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal
	lret
