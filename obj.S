
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 e5 00 00 00       	call   2000f0 <cli>
  20000b:	e8 10 00 00 00       	call   200020 <change_gdt>
  200010:	eb fe                	jmp    200010 <kernel_start+0x10>

00200012 <start_kernel>:
  200012:	55                   	push   %ebp
  200013:	89 e5                	mov    %esp,%ebp
  200015:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  20001a:	89 e5                	mov    %esp,%ebp
  20001c:	eb fe                	jmp    20001c <start_kernel+0xa>
  20001e:	66 90                	xchg   %ax,%ax

00200020 <change_gdt>:
  200020:	55                   	push   %ebp
  200021:	89 e5                	mov    %esp,%ebp
  200023:	53                   	push   %ebx
  200024:	83 ec 10             	sub    $0x10,%esp
  200027:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  20002d:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  200033:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  200039:	c7 05 20 20 20 00 ff 	movl   $0xffff,0x202020
  200040:	ff 00 00 
  200043:	c7 05 24 20 20 00 00 	movl   $0xcf9b00,0x202024
  20004a:	9b cf 00 
  20004d:	c7 05 28 20 20 00 ff 	movl   $0xffff,0x202028
  200054:	ff 00 00 
  200057:	c7 05 2c 20 20 00 00 	movl   $0xcf9300,0x20202c
  20005e:	93 cf 00 
  200061:	c7 05 30 20 20 00 ff 	movl   $0xffff,0x202030
  200068:	ff 00 00 
  20006b:	c7 05 34 20 20 00 00 	movl   $0xcffa00,0x202034
  200072:	fa cf 00 
  200075:	c7 05 38 20 20 00 ff 	movl   $0xffff,0x202038
  20007c:	ff 00 00 
  20007f:	c7 05 3c 20 20 00 00 	movl   $0xcff200,0x20203c
  200086:	f2 cf 00 
  200089:	c7 05 40 20 20 00 00 	movl   $0x0,0x202040
  200090:	00 00 00 
  200093:	c7 05 44 20 20 00 00 	movl   $0x9200,0x202044
  20009a:	92 00 00 
  20009d:	c7 05 48 20 20 00 ff 	movl   $0x8000ffff,0x202048
  2000a4:	ff 00 80 
  2000a7:	c7 05 4c 20 20 00 0b 	movl   $0x930b,0x20204c
  2000ae:	93 00 00 
  2000b1:	66 c7 05 00 21 20 00 	movw   $0xff,0x202100
  2000b8:	ff 00 
  2000ba:	b8 00 20 20 00       	mov    $0x202000,%eax
  2000bf:	a3 02 21 20 00       	mov    %eax,0x202102
  2000c4:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  2000c8:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2000cc:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  2000d0:	89 d3                	mov    %edx,%ebx
  2000d2:	0f 01 15 00 21 20 00 	lgdtl  0x202100
  2000d9:	8e db                	mov    %ebx,%ds
  2000db:	8e c3                	mov    %ebx,%es
  2000dd:	8e e3                	mov    %ebx,%fs
  2000df:	8e e9                	mov    %ecx,%gs
  2000e1:	ea 12 00 20 00 20 00 	ljmp   $0x20,$0x200012
  2000e8:	90                   	nop
  2000e9:	83 c4 10             	add    $0x10,%esp
  2000ec:	5b                   	pop    %ebx
  2000ed:	5d                   	pop    %ebp
  2000ee:	c3                   	ret    
  2000ef:	90                   	nop

002000f0 <cli>:
  2000f0:	55                   	push   %ebp
  2000f1:	89 e5                	mov    %esp,%ebp
  2000f3:	fa                   	cli    
  2000f4:	5d                   	pop    %ebp
  2000f5:	c3                   	ret    

002000f6 <sti>:
  2000f6:	55                   	push   %ebp
  2000f7:	89 e5                	mov    %esp,%ebp
  2000f9:	fb                   	sti    
  2000fa:	5d                   	pop    %ebp
  2000fb:	c3                   	ret    
