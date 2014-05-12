
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 f5 00 00 00       	call   200100 <cli>
  20000b:	e8 0c 00 00 00       	call   20001c <change_gdt>
  200010:	e8 f1 00 00 00       	call   200106 <sti>
  200015:	eb fe                	jmp    200015 <kernel_start+0x15>

00200017 <start_kernel>:
  200017:	55                   	push   %ebp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	eb fe                	jmp    20001a <start_kernel+0x3>

0020001c <change_gdt>:
  20001c:	55                   	push   %ebp
  20001d:	89 e5                	mov    %esp,%ebp
  20001f:	53                   	push   %ebx
  200020:	83 ec 10             	sub    $0x10,%esp
  200023:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  200029:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  20002f:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  200035:	c7 05 00 20 20 00 00 	movl   $0x0,0x202000
  20003c:	00 00 00 
  20003f:	c7 05 04 20 20 00 00 	movl   $0x0,0x202004
  200046:	00 00 00 
  200049:	c7 05 20 20 20 00 ff 	movl   $0xffff,0x202020
  200050:	ff 00 00 
  200053:	c7 05 24 20 20 00 00 	movl   $0xcffb00,0x202024
  20005a:	fb cf 00 
  20005d:	c7 05 28 20 20 00 ff 	movl   $0xffff,0x202028
  200064:	ff 00 00 
  200067:	c7 05 2c 20 20 00 00 	movl   $0xcf9300,0x20202c
  20006e:	93 cf 00 
  200071:	c7 05 30 20 20 00 ff 	movl   $0xffff,0x202030
  200078:	ff 00 00 
  20007b:	c7 05 34 20 20 00 00 	movl   $0xcffa00,0x202034
  200082:	fa cf 00 
  200085:	c7 05 38 20 20 00 ff 	movl   $0xffff,0x202038
  20008c:	ff 00 00 
  20008f:	c7 05 3c 20 20 00 00 	movl   $0xcff200,0x20203c
  200096:	f2 cf 00 
  200099:	c7 05 40 20 20 00 00 	movl   $0x0,0x202040
  2000a0:	00 00 00 
  2000a3:	c7 05 44 20 20 00 00 	movl   $0x9200,0x202044
  2000aa:	92 00 00 
  2000ad:	c7 05 48 20 20 00 ff 	movl   $0x8000ffff,0x202048
  2000b4:	ff 00 80 
  2000b7:	c7 05 4c 20 20 00 0b 	movl   $0x930b,0x20204c
  2000be:	93 00 00 
  2000c1:	66 c7 05 00 21 20 00 	movw   $0xff,0x202100
  2000c8:	ff 00 
  2000ca:	b8 00 20 20 00       	mov    $0x202000,%eax
  2000cf:	a3 02 21 20 00       	mov    %eax,0x202102
  2000d4:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  2000d8:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2000dc:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  2000e0:	89 d3                	mov    %edx,%ebx
  2000e2:	0f 01 15 00 21 20 00 	lgdtl  0x202100
  2000e9:	8e db                	mov    %ebx,%ds
  2000eb:	8e c3                	mov    %ebx,%es
  2000ed:	8e e3                	mov    %ebx,%fs
  2000ef:	8e e9                	mov    %ecx,%gs
  2000f1:	ea 17 00 20 00 20 00 	ljmp   $0x20,$0x200017
  2000f8:	90                   	nop
  2000f9:	83 c4 10             	add    $0x10,%esp
  2000fc:	5b                   	pop    %ebx
  2000fd:	5d                   	pop    %ebp
  2000fe:	c3                   	ret    
  2000ff:	90                   	nop

00200100 <cli>:
  200100:	55                   	push   %ebp
  200101:	89 e5                	mov    %esp,%ebp
  200103:	fa                   	cli    
  200104:	5d                   	pop    %ebp
  200105:	c3                   	ret    

00200106 <sti>:
  200106:	55                   	push   %ebp
  200107:	89 e5                	mov    %esp,%ebp
  200109:	fb                   	sti    
  20010a:	5d                   	pop    %ebp
  20010b:	c3                   	ret    
