
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 29 00 00 00       	call   200034 <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 08             	sub    $0x8,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 25 03 00 00       	call   200344 <disable_irqs>
  20001f:	e8 d8 06 00 00       	call   2006fc <load_idt>
  200024:	e8 60 0b 00 00       	call   200b89 <init_timer>
  200029:	ea 00 00 00 00 80 00 	ljmp   $0x80,$0x0
  200030:	eb fe                	jmp    200030 <start_kernel+0x23>
  200032:	66 90                	xchg   %ax,%ax

00200034 <change_gdt>:
  200034:	55                   	push   %ebp
  200035:	89 e5                	mov    %esp,%ebp
  200037:	53                   	push   %ebx
  200038:	83 ec 10             	sub    $0x10,%esp
  20003b:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  200041:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  200047:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  20004d:	c7 05 40 30 20 00 ff 	movl   $0xffff,0x203040
  200054:	ff 00 00 
  200057:	c7 05 44 30 20 00 00 	movl   $0xcf9b00,0x203044
  20005e:	9b cf 00 
  200061:	c7 05 48 30 20 00 ff 	movl   $0xffff,0x203048
  200068:	ff 00 00 
  20006b:	c7 05 4c 30 20 00 00 	movl   $0xcf9300,0x20304c
  200072:	93 cf 00 
  200075:	c7 05 50 30 20 00 ff 	movl   $0xffff,0x203050
  20007c:	ff 00 00 
  20007f:	c7 05 54 30 20 00 00 	movl   $0xcffa00,0x203054
  200086:	fa cf 00 
  200089:	c7 05 58 30 20 00 ff 	movl   $0xffff,0x203058
  200090:	ff 00 00 
  200093:	c7 05 5c 30 20 00 00 	movl   $0xcff200,0x20305c
  20009a:	f2 cf 00 
  20009d:	c7 05 60 30 20 00 00 	movl   $0x0,0x203060
  2000a4:	00 00 00 
  2000a7:	c7 05 64 30 20 00 00 	movl   $0x9200,0x203064
  2000ae:	92 00 00 
  2000b1:	c7 05 68 30 20 00 ff 	movl   $0x8000ffff,0x203068
  2000b8:	ff 00 80 
  2000bb:	c7 05 6c 30 20 00 0b 	movl   $0x930b,0x20306c
  2000c2:	93 00 00 
  2000c5:	66 c7 05 20 31 20 00 	movw   $0xff,0x203120
  2000cc:	ff 00 
  2000ce:	b8 20 30 20 00       	mov    $0x203020,%eax
  2000d3:	a3 22 31 20 00       	mov    %eax,0x203122
  2000d8:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  2000dc:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2000e0:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  2000e4:	89 d3                	mov    %edx,%ebx
  2000e6:	0f 01 15 20 31 20 00 	lgdtl  0x203120
  2000ed:	8e db                	mov    %ebx,%ds
  2000ef:	8e c3                	mov    %ebx,%es
  2000f1:	8e e3                	mov    %ebx,%fs
  2000f3:	8e e9                	mov    %ecx,%gs
  2000f5:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  2000fc:	90                   	nop
  2000fd:	83 c4 10             	add    $0x10,%esp
  200100:	5b                   	pop    %ebx
  200101:	5d                   	pop    %ebp
  200102:	c3                   	ret    
  200103:	90                   	nop

00200104 <cli>:
  200104:	55                   	push   %ebp
  200105:	89 e5                	mov    %esp,%ebp
  200107:	fa                   	cli    
  200108:	5d                   	pop    %ebp
  200109:	c3                   	ret    

0020010a <sti>:
  20010a:	55                   	push   %ebp
  20010b:	89 e5                	mov    %esp,%ebp
  20010d:	fb                   	sti    
  20010e:	5d                   	pop    %ebp
  20010f:	c3                   	ret    

00200110 <outb>:
  200110:	55                   	push   %ebp
  200111:	89 e5                	mov    %esp,%ebp
  200113:	83 ec 08             	sub    $0x8,%esp
  200116:	8b 55 08             	mov    0x8(%ebp),%edx
  200119:	8b 45 0c             	mov    0xc(%ebp),%eax
  20011c:	88 55 fc             	mov    %dl,-0x4(%ebp)
  20011f:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  200123:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  200127:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  20012b:	ee                   	out    %al,(%dx)
  20012c:	c9                   	leave  
  20012d:	c3                   	ret    

0020012e <inb>:
  20012e:	55                   	push   %ebp
  20012f:	89 e5                	mov    %esp,%ebp
  200131:	83 ec 14             	sub    $0x14,%esp
  200134:	8b 45 08             	mov    0x8(%ebp),%eax
  200137:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  20013b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  20013f:	89 c2                	mov    %eax,%edx
  200141:	ec                   	in     (%dx),%al
  200142:	88 45 ff             	mov    %al,-0x1(%ebp)
  200145:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200149:	c9                   	leave  
  20014a:	c3                   	ret    

0020014b <io_delay>:
  20014b:	55                   	push   %ebp
  20014c:	89 e5                	mov    %esp,%ebp
  20014e:	83 ec 10             	sub    $0x10,%esp
  200151:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  200157:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  20015b:	89 c2                	mov    %eax,%edx
  20015d:	ee                   	out    %al,(%dx)
  20015e:	c9                   	leave  
  20015f:	c3                   	ret    

00200160 <outb_pic>:
  200160:	55                   	push   %ebp
  200161:	89 e5                	mov    %esp,%ebp
  200163:	83 ec 0c             	sub    $0xc,%esp
  200166:	8b 45 08             	mov    0x8(%ebp),%eax
  200169:	88 45 fc             	mov    %al,-0x4(%ebp)
  20016c:	8b 45 0c             	mov    0xc(%ebp),%eax
  20016f:	0f b7 d0             	movzwl %ax,%edx
  200172:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  200176:	89 54 24 04          	mov    %edx,0x4(%esp)
  20017a:	89 04 24             	mov    %eax,(%esp)
  20017d:	e8 8e ff ff ff       	call   200110 <outb>
  200182:	e8 c4 ff ff ff       	call   20014b <io_delay>
  200187:	c9                   	leave  
  200188:	c3                   	ret    

00200189 <inb_pic>:
  200189:	55                   	push   %ebp
  20018a:	89 e5                	mov    %esp,%ebp
  20018c:	83 ec 14             	sub    $0x14,%esp
  20018f:	8b 45 08             	mov    0x8(%ebp),%eax
  200192:	0f b7 c0             	movzwl %ax,%eax
  200195:	89 04 24             	mov    %eax,(%esp)
  200198:	e8 91 ff ff ff       	call   20012e <inb>
  20019d:	88 45 ff             	mov    %al,-0x1(%ebp)
  2001a0:	e8 a6 ff ff ff       	call   20014b <io_delay>
  2001a5:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2001a9:	c9                   	leave  
  2001aa:	c3                   	ret    

002001ab <Init_8259A>:
  2001ab:	55                   	push   %ebp
  2001ac:	89 e5                	mov    %esp,%ebp
  2001ae:	83 ec 08             	sub    $0x8,%esp
  2001b1:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  2001b8:	00 
  2001b9:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  2001c0:	e8 9b ff ff ff       	call   200160 <outb_pic>
  2001c5:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  2001cc:	00 
  2001cd:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  2001d4:	e8 87 ff ff ff       	call   200160 <outb_pic>
  2001d9:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2001e0:	00 
  2001e1:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  2001e8:	e8 73 ff ff ff       	call   200160 <outb_pic>
  2001ed:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2001f4:	00 
  2001f5:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  2001fc:	e8 5f ff ff ff       	call   200160 <outb_pic>
  200201:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200208:	00 
  200209:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  200210:	e8 4b ff ff ff       	call   200160 <outb_pic>
  200215:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  20021c:	00 
  20021d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  200224:	e8 37 ff ff ff       	call   200160 <outb_pic>
  200229:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200230:	00 
  200231:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200238:	e8 23 ff ff ff       	call   200160 <outb_pic>
  20023d:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200244:	00 
  200245:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  20024c:	e8 0f ff ff ff       	call   200160 <outb_pic>
  200251:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200258:	00 
  200259:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200260:	e8 fb fe ff ff       	call   200160 <outb_pic>
  200265:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  20026c:	00 
  20026d:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200274:	e8 e7 fe ff ff       	call   200160 <outb_pic>
  200279:	90                   	nop
  20027a:	c9                   	leave  
  20027b:	c3                   	ret    

0020027c <enable_irq>:
  20027c:	55                   	push   %ebp
  20027d:	89 e5                	mov    %esp,%ebp
  20027f:	83 ec 18             	sub    $0x18,%esp
  200282:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  200286:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  20028a:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  200291:	e8 f3 fe ff ff       	call   200189 <inb_pic>
  200296:	88 45 fd             	mov    %al,-0x3(%ebp)
  200299:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  2002a0:	e8 e4 fe ff ff       	call   200189 <inb_pic>
  2002a5:	88 45 fc             	mov    %al,-0x4(%ebp)
  2002a8:	fa                   	cli    
  2002a9:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  2002ad:	7f 35                	jg     2002e4 <enable_irq+0x68>
  2002af:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  2002b3:	74 2f                	je     2002e4 <enable_irq+0x68>
  2002b5:	8b 45 08             	mov    0x8(%ebp),%eax
  2002b8:	ba 01 00 00 00       	mov    $0x1,%edx
  2002bd:	89 c1                	mov    %eax,%ecx
  2002bf:	d3 e2                	shl    %cl,%edx
  2002c1:	89 d0                	mov    %edx,%eax
  2002c3:	f7 d0                	not    %eax
  2002c5:	89 c2                	mov    %eax,%edx
  2002c7:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  2002cb:	21 d0                	and    %edx,%eax
  2002cd:	88 45 ff             	mov    %al,-0x1(%ebp)
  2002d0:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2002d4:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002db:	00 
  2002dc:	89 04 24             	mov    %eax,(%esp)
  2002df:	e8 7c fe ff ff       	call   200160 <outb_pic>
  2002e4:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  2002e8:	7e 56                	jle    200340 <enable_irq+0xc4>
  2002ea:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  2002ee:	7f 50                	jg     200340 <enable_irq+0xc4>
  2002f0:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  2002f4:	83 e0 fb             	and    $0xfffffffb,%eax
  2002f7:	88 45 ff             	mov    %al,-0x1(%ebp)
  2002fa:	8b 45 08             	mov    0x8(%ebp),%eax
  2002fd:	83 e8 08             	sub    $0x8,%eax
  200300:	ba 01 00 00 00       	mov    $0x1,%edx
  200305:	89 c1                	mov    %eax,%ecx
  200307:	d3 e2                	shl    %cl,%edx
  200309:	89 d0                	mov    %edx,%eax
  20030b:	f7 d0                	not    %eax
  20030d:	89 c2                	mov    %eax,%edx
  20030f:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  200313:	21 d0                	and    %edx,%eax
  200315:	88 45 fe             	mov    %al,-0x2(%ebp)
  200318:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  20031c:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200323:	00 
  200324:	89 04 24             	mov    %eax,(%esp)
  200327:	e8 34 fe ff ff       	call   200160 <outb_pic>
  20032c:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  200330:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200337:	00 
  200338:	89 04 24             	mov    %eax,(%esp)
  20033b:	e8 20 fe ff ff       	call   200160 <outb_pic>
  200340:	fb                   	sti    
  200341:	90                   	nop
  200342:	c9                   	leave  
  200343:	c3                   	ret    

00200344 <disable_irqs>:
  200344:	55                   	push   %ebp
  200345:	89 e5                	mov    %esp,%ebp
  200347:	b0 ff                	mov    $0xff,%al
  200349:	e6 21                	out    %al,$0x21
  20034b:	e6 a1                	out    %al,$0xa1
  20034d:	5d                   	pop    %ebp
  20034e:	c3                   	ret    

0020034f <EOI_master>:
  20034f:	55                   	push   %ebp
  200350:	89 e5                	mov    %esp,%ebp
  200352:	83 ec 08             	sub    $0x8,%esp
  200355:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20035c:	00 
  20035d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200364:	e8 f7 fd ff ff       	call   200160 <outb_pic>
  200369:	fb                   	sti    
  20036a:	c9                   	leave  
  20036b:	c3                   	ret    

0020036c <EOI_slave>:
  20036c:	55                   	push   %ebp
  20036d:	89 e5                	mov    %esp,%ebp
  20036f:	83 ec 08             	sub    $0x8,%esp
  200372:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200379:	00 
  20037a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200381:	e8 da fd ff ff       	call   200160 <outb_pic>
  200386:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  20038d:	00 
  20038e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200395:	e8 c6 fd ff ff       	call   200160 <outb_pic>
  20039a:	fb                   	sti    
  20039b:	c9                   	leave  
  20039c:	c3                   	ret    
  20039d:	66 90                	xchg   %ax,%ax
  20039f:	90                   	nop

002003a0 <set_gate>:
  2003a0:	55                   	push   %ebp
  2003a1:	89 e5                	mov    %esp,%ebp
  2003a3:	8b 45 18             	mov    0x18(%ebp),%eax
  2003a6:	c1 e0 10             	shl    $0x10,%eax
  2003a9:	89 c2                	mov    %eax,%edx
  2003ab:	8b 45 10             	mov    0x10(%ebp),%eax
  2003ae:	0f b7 c0             	movzwl %ax,%eax
  2003b1:	09 c2                	or     %eax,%edx
  2003b3:	8b 45 08             	mov    0x8(%ebp),%eax
  2003b6:	89 10                	mov    %edx,(%eax)
  2003b8:	8b 45 10             	mov    0x10(%ebp),%eax
  2003bb:	66 b8 00 00          	mov    $0x0,%ax
  2003bf:	89 c2                	mov    %eax,%edx
  2003c1:	8b 45 14             	mov    0x14(%ebp),%eax
  2003c4:	c1 e0 05             	shl    $0x5,%eax
  2003c7:	0b 45 0c             	or     0xc(%ebp),%eax
  2003ca:	0f b6 c0             	movzbl %al,%eax
  2003cd:	0c 80                	or     $0x80,%al
  2003cf:	c1 e0 08             	shl    $0x8,%eax
  2003d2:	09 c2                	or     %eax,%edx
  2003d4:	8b 45 08             	mov    0x8(%ebp),%eax
  2003d7:	89 50 04             	mov    %edx,0x4(%eax)
  2003da:	5d                   	pop    %ebp
  2003db:	c3                   	ret    

002003dc <set_exception_gate>:
  2003dc:	55                   	push   %ebp
  2003dd:	89 e5                	mov    %esp,%ebp
  2003df:	83 ec 14             	sub    $0x14,%esp
  2003e2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2003e9:	00 
  2003ea:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2003f1:	00 
  2003f2:	c7 44 24 08 0b 0c 20 	movl   $0x200c0b,0x8(%esp)
  2003f9:	00 
  2003fa:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200401:	00 
  200402:	c7 04 24 40 31 20 00 	movl   $0x203140,(%esp)
  200409:	e8 92 ff ff ff       	call   2003a0 <set_gate>
  20040e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200415:	00 
  200416:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20041d:	00 
  20041e:	c7 44 24 08 27 0c 20 	movl   $0x200c27,0x8(%esp)
  200425:	00 
  200426:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20042d:	00 
  20042e:	c7 04 24 48 31 20 00 	movl   $0x203148,(%esp)
  200435:	e8 66 ff ff ff       	call   2003a0 <set_gate>
  20043a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200441:	00 
  200442:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200449:	00 
  20044a:	c7 44 24 08 43 0c 20 	movl   $0x200c43,0x8(%esp)
  200451:	00 
  200452:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200459:	00 
  20045a:	c7 04 24 50 31 20 00 	movl   $0x203150,(%esp)
  200461:	e8 3a ff ff ff       	call   2003a0 <set_gate>
  200466:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20046d:	00 
  20046e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200475:	00 
  200476:	c7 44 24 08 5f 0c 20 	movl   $0x200c5f,0x8(%esp)
  20047d:	00 
  20047e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200485:	00 
  200486:	c7 04 24 58 31 20 00 	movl   $0x203158,(%esp)
  20048d:	e8 0e ff ff ff       	call   2003a0 <set_gate>
  200492:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200499:	00 
  20049a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004a1:	00 
  2004a2:	c7 44 24 08 7b 0c 20 	movl   $0x200c7b,0x8(%esp)
  2004a9:	00 
  2004aa:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004b1:	00 
  2004b2:	c7 04 24 60 31 20 00 	movl   $0x203160,(%esp)
  2004b9:	e8 e2 fe ff ff       	call   2003a0 <set_gate>
  2004be:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004c5:	00 
  2004c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004cd:	00 
  2004ce:	c7 44 24 08 97 0c 20 	movl   $0x200c97,0x8(%esp)
  2004d5:	00 
  2004d6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004dd:	00 
  2004de:	c7 04 24 68 31 20 00 	movl   $0x203168,(%esp)
  2004e5:	e8 b6 fe ff ff       	call   2003a0 <set_gate>
  2004ea:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004f1:	00 
  2004f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004f9:	00 
  2004fa:	c7 44 24 08 b3 0c 20 	movl   $0x200cb3,0x8(%esp)
  200501:	00 
  200502:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200509:	00 
  20050a:	c7 04 24 70 31 20 00 	movl   $0x203170,(%esp)
  200511:	e8 8a fe ff ff       	call   2003a0 <set_gate>
  200516:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20051d:	00 
  20051e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200525:	00 
  200526:	c7 44 24 08 cf 0c 20 	movl   $0x200ccf,0x8(%esp)
  20052d:	00 
  20052e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200535:	00 
  200536:	c7 04 24 78 31 20 00 	movl   $0x203178,(%esp)
  20053d:	e8 5e fe ff ff       	call   2003a0 <set_gate>
  200542:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200549:	00 
  20054a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200551:	00 
  200552:	c7 44 24 08 eb 0c 20 	movl   $0x200ceb,0x8(%esp)
  200559:	00 
  20055a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200561:	00 
  200562:	c7 04 24 80 31 20 00 	movl   $0x203180,(%esp)
  200569:	e8 32 fe ff ff       	call   2003a0 <set_gate>
  20056e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200575:	00 
  200576:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20057d:	00 
  20057e:	c7 44 24 08 07 0d 20 	movl   $0x200d07,0x8(%esp)
  200585:	00 
  200586:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20058d:	00 
  20058e:	c7 04 24 88 31 20 00 	movl   $0x203188,(%esp)
  200595:	e8 06 fe ff ff       	call   2003a0 <set_gate>
  20059a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005a1:	00 
  2005a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005a9:	00 
  2005aa:	c7 44 24 08 23 0d 20 	movl   $0x200d23,0x8(%esp)
  2005b1:	00 
  2005b2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005b9:	00 
  2005ba:	c7 04 24 90 31 20 00 	movl   $0x203190,(%esp)
  2005c1:	e8 da fd ff ff       	call   2003a0 <set_gate>
  2005c6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005cd:	00 
  2005ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005d5:	00 
  2005d6:	c7 44 24 08 3f 0d 20 	movl   $0x200d3f,0x8(%esp)
  2005dd:	00 
  2005de:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005e5:	00 
  2005e6:	c7 04 24 98 31 20 00 	movl   $0x203198,(%esp)
  2005ed:	e8 ae fd ff ff       	call   2003a0 <set_gate>
  2005f2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005f9:	00 
  2005fa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200601:	00 
  200602:	c7 44 24 08 5b 0d 20 	movl   $0x200d5b,0x8(%esp)
  200609:	00 
  20060a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200611:	00 
  200612:	c7 04 24 a0 31 20 00 	movl   $0x2031a0,(%esp)
  200619:	e8 82 fd ff ff       	call   2003a0 <set_gate>
  20061e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200625:	00 
  200626:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20062d:	00 
  20062e:	c7 44 24 08 77 0d 20 	movl   $0x200d77,0x8(%esp)
  200635:	00 
  200636:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20063d:	00 
  20063e:	c7 04 24 a8 31 20 00 	movl   $0x2031a8,(%esp)
  200645:	e8 56 fd ff ff       	call   2003a0 <set_gate>
  20064a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200651:	00 
  200652:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200659:	00 
  20065a:	c7 44 24 08 93 0d 20 	movl   $0x200d93,0x8(%esp)
  200661:	00 
  200662:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200669:	00 
  20066a:	c7 04 24 b0 31 20 00 	movl   $0x2031b0,(%esp)
  200671:	e8 2a fd ff ff       	call   2003a0 <set_gate>
  200676:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20067d:	00 
  20067e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200685:	00 
  200686:	c7 44 24 08 af 0d 20 	movl   $0x200daf,0x8(%esp)
  20068d:	00 
  20068e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200695:	00 
  200696:	c7 04 24 b8 31 20 00 	movl   $0x2031b8,(%esp)
  20069d:	e8 fe fc ff ff       	call   2003a0 <set_gate>
  2006a2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006a9:	00 
  2006aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006b1:	00 
  2006b2:	c7 44 24 08 cb 0d 20 	movl   $0x200dcb,0x8(%esp)
  2006b9:	00 
  2006ba:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006c1:	00 
  2006c2:	c7 04 24 c0 31 20 00 	movl   $0x2031c0,(%esp)
  2006c9:	e8 d2 fc ff ff       	call   2003a0 <set_gate>
  2006ce:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006d5:	00 
  2006d6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006dd:	00 
  2006de:	c7 44 24 08 e7 0d 20 	movl   $0x200de7,0x8(%esp)
  2006e5:	00 
  2006e6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006ed:	00 
  2006ee:	c7 04 24 c8 31 20 00 	movl   $0x2031c8,(%esp)
  2006f5:	e8 a6 fc ff ff       	call   2003a0 <set_gate>
  2006fa:	c9                   	leave  
  2006fb:	c3                   	ret    

002006fc <load_idt>:
  2006fc:	55                   	push   %ebp
  2006fd:	89 e5                	mov    %esp,%ebp
  2006ff:	fa                   	cli    
  200700:	0f 01 1d 00 30 20 00 	lidtl  0x203000
  200707:	90                   	nop
  200708:	fb                   	sti    
  200709:	e8 ce fc ff ff       	call   2003dc <set_exception_gate>
  20070e:	90                   	nop
  20070f:	5d                   	pop    %ebp
  200710:	c3                   	ret    

00200711 <set_intr_gate>:
  200711:	55                   	push   %ebp
  200712:	89 e5                	mov    %esp,%ebp
  200714:	83 ec 38             	sub    $0x38,%esp
  200717:	8b 45 08             	mov    0x8(%ebp),%eax
  20071a:	83 c0 30             	add    $0x30,%eax
  20071d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200720:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200723:	c1 e0 03             	shl    $0x3,%eax
  200726:	8d 90 40 31 20 00    	lea    0x203140(%eax),%edx
  20072c:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200733:	00 
  200734:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20073b:	00 
  20073c:	8b 45 0c             	mov    0xc(%ebp),%eax
  20073f:	89 44 24 08          	mov    %eax,0x8(%esp)
  200743:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  20074a:	00 
  20074b:	89 14 24             	mov    %edx,(%esp)
  20074e:	e8 4d fc ff ff       	call   2003a0 <set_gate>
  200753:	8b 45 08             	mov    0x8(%ebp),%eax
  200756:	89 04 24             	mov    %eax,(%esp)
  200759:	e8 1e fb ff ff       	call   20027c <enable_irq>
  20075e:	c9                   	leave  
  20075f:	c3                   	ret    

00200760 <irq00_handler>:
  200760:	55                   	push   %ebp
  200761:	89 e5                	mov    %esp,%ebp
  200763:	53                   	push   %ebx
  200764:	50                   	push   %eax
  200765:	53                   	push   %ebx
  200766:	b8 01 00 00 00       	mov    $0x1,%eax
  20076b:	89 c3                	mov    %eax,%ebx
  20076d:	e4 21                	in     $0x21,%al
  20076f:	08 d8                	or     %bl,%al
  200771:	e6 21                	out    %al,$0x21
  200773:	b0 20                	mov    $0x20,%al
  200775:	e6 20                	out    %al,$0x20
  200777:	fb                   	sti    
  200778:	a1 40 39 20 00       	mov    0x203940,%eax
  20077d:	ba 00 00 00 00       	mov    $0x0,%edx
  200782:	89 d3                	mov    %edx,%ebx
  200784:	53                   	push   %ebx
  200785:	ff d0                	call   *%eax
  200787:	5b                   	pop    %ebx
  200788:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  20078d:	89 c3                	mov    %eax,%ebx
  20078f:	fa                   	cli    
  200790:	e4 21                	in     $0x21,%al
  200792:	20 d8                	and    %bl,%al
  200794:	e6 21                	out    %al,$0x21
  200796:	5b                   	pop    %ebx
  200797:	58                   	pop    %eax
  200798:	5b                   	pop    %ebx
  200799:	5d                   	pop    %ebp
  20079a:	fb                   	sti    
  20079b:	cf                   	iret   
  20079c:	5b                   	pop    %ebx
  20079d:	5d                   	pop    %ebp
  20079e:	c3                   	ret    

0020079f <irq01_handler>:
  20079f:	55                   	push   %ebp
  2007a0:	89 e5                	mov    %esp,%ebp
  2007a2:	53                   	push   %ebx
  2007a3:	50                   	push   %eax
  2007a4:	53                   	push   %ebx
  2007a5:	b8 02 00 00 00       	mov    $0x2,%eax
  2007aa:	89 c3                	mov    %eax,%ebx
  2007ac:	e4 21                	in     $0x21,%al
  2007ae:	08 d8                	or     %bl,%al
  2007b0:	e6 21                	out    %al,$0x21
  2007b2:	b0 20                	mov    $0x20,%al
  2007b4:	e6 20                	out    %al,$0x20
  2007b6:	fb                   	sti    
  2007b7:	a1 44 39 20 00       	mov    0x203944,%eax
  2007bc:	ba 01 00 00 00       	mov    $0x1,%edx
  2007c1:	89 d3                	mov    %edx,%ebx
  2007c3:	53                   	push   %ebx
  2007c4:	ff d0                	call   *%eax
  2007c6:	5b                   	pop    %ebx
  2007c7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  2007cc:	89 c3                	mov    %eax,%ebx
  2007ce:	fa                   	cli    
  2007cf:	e4 21                	in     $0x21,%al
  2007d1:	20 d8                	and    %bl,%al
  2007d3:	e6 21                	out    %al,$0x21
  2007d5:	5b                   	pop    %ebx
  2007d6:	58                   	pop    %eax
  2007d7:	5b                   	pop    %ebx
  2007d8:	5d                   	pop    %ebp
  2007d9:	fb                   	sti    
  2007da:	cf                   	iret   
  2007db:	5b                   	pop    %ebx
  2007dc:	5d                   	pop    %ebp
  2007dd:	c3                   	ret    

002007de <irq02_handler>:
  2007de:	55                   	push   %ebp
  2007df:	89 e5                	mov    %esp,%ebp
  2007e1:	53                   	push   %ebx
  2007e2:	50                   	push   %eax
  2007e3:	53                   	push   %ebx
  2007e4:	b8 04 00 00 00       	mov    $0x4,%eax
  2007e9:	89 c3                	mov    %eax,%ebx
  2007eb:	e4 21                	in     $0x21,%al
  2007ed:	08 d8                	or     %bl,%al
  2007ef:	e6 21                	out    %al,$0x21
  2007f1:	b0 20                	mov    $0x20,%al
  2007f3:	e6 20                	out    %al,$0x20
  2007f5:	fb                   	sti    
  2007f6:	a1 48 39 20 00       	mov    0x203948,%eax
  2007fb:	ba 02 00 00 00       	mov    $0x2,%edx
  200800:	89 d3                	mov    %edx,%ebx
  200802:	53                   	push   %ebx
  200803:	ff d0                	call   *%eax
  200805:	5b                   	pop    %ebx
  200806:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
  20080b:	89 c3                	mov    %eax,%ebx
  20080d:	fa                   	cli    
  20080e:	e4 21                	in     $0x21,%al
  200810:	20 d8                	and    %bl,%al
  200812:	e6 21                	out    %al,$0x21
  200814:	5b                   	pop    %ebx
  200815:	58                   	pop    %eax
  200816:	5b                   	pop    %ebx
  200817:	5d                   	pop    %ebp
  200818:	fb                   	sti    
  200819:	cf                   	iret   
  20081a:	5b                   	pop    %ebx
  20081b:	5d                   	pop    %ebp
  20081c:	c3                   	ret    

0020081d <irq03_handler>:
  20081d:	55                   	push   %ebp
  20081e:	89 e5                	mov    %esp,%ebp
  200820:	53                   	push   %ebx
  200821:	50                   	push   %eax
  200822:	53                   	push   %ebx
  200823:	b8 08 00 00 00       	mov    $0x8,%eax
  200828:	89 c3                	mov    %eax,%ebx
  20082a:	e4 21                	in     $0x21,%al
  20082c:	08 d8                	or     %bl,%al
  20082e:	e6 21                	out    %al,$0x21
  200830:	b0 20                	mov    $0x20,%al
  200832:	e6 20                	out    %al,$0x20
  200834:	fb                   	sti    
  200835:	a1 4c 39 20 00       	mov    0x20394c,%eax
  20083a:	ba 03 00 00 00       	mov    $0x3,%edx
  20083f:	89 d3                	mov    %edx,%ebx
  200841:	53                   	push   %ebx
  200842:	ff d0                	call   *%eax
  200844:	5b                   	pop    %ebx
  200845:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  20084a:	89 c3                	mov    %eax,%ebx
  20084c:	fa                   	cli    
  20084d:	e4 21                	in     $0x21,%al
  20084f:	20 d8                	and    %bl,%al
  200851:	e6 21                	out    %al,$0x21
  200853:	5b                   	pop    %ebx
  200854:	58                   	pop    %eax
  200855:	5b                   	pop    %ebx
  200856:	5d                   	pop    %ebp
  200857:	fb                   	sti    
  200858:	cf                   	iret   
  200859:	5b                   	pop    %ebx
  20085a:	5d                   	pop    %ebp
  20085b:	c3                   	ret    

0020085c <irq04_handler>:
  20085c:	55                   	push   %ebp
  20085d:	89 e5                	mov    %esp,%ebp
  20085f:	53                   	push   %ebx
  200860:	50                   	push   %eax
  200861:	53                   	push   %ebx
  200862:	b8 10 00 00 00       	mov    $0x10,%eax
  200867:	89 c3                	mov    %eax,%ebx
  200869:	e4 21                	in     $0x21,%al
  20086b:	08 d8                	or     %bl,%al
  20086d:	e6 21                	out    %al,$0x21
  20086f:	b0 20                	mov    $0x20,%al
  200871:	e6 20                	out    %al,$0x20
  200873:	fb                   	sti    
  200874:	a1 50 39 20 00       	mov    0x203950,%eax
  200879:	ba 04 00 00 00       	mov    $0x4,%edx
  20087e:	89 d3                	mov    %edx,%ebx
  200880:	53                   	push   %ebx
  200881:	ff d0                	call   *%eax
  200883:	5b                   	pop    %ebx
  200884:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
  200889:	89 c3                	mov    %eax,%ebx
  20088b:	fa                   	cli    
  20088c:	e4 21                	in     $0x21,%al
  20088e:	20 d8                	and    %bl,%al
  200890:	e6 21                	out    %al,$0x21
  200892:	5b                   	pop    %ebx
  200893:	58                   	pop    %eax
  200894:	5b                   	pop    %ebx
  200895:	5d                   	pop    %ebp
  200896:	fb                   	sti    
  200897:	cf                   	iret   
  200898:	5b                   	pop    %ebx
  200899:	5d                   	pop    %ebp
  20089a:	c3                   	ret    

0020089b <irq05_handler>:
  20089b:	55                   	push   %ebp
  20089c:	89 e5                	mov    %esp,%ebp
  20089e:	53                   	push   %ebx
  20089f:	50                   	push   %eax
  2008a0:	53                   	push   %ebx
  2008a1:	b8 20 00 00 00       	mov    $0x20,%eax
  2008a6:	89 c3                	mov    %eax,%ebx
  2008a8:	e4 21                	in     $0x21,%al
  2008aa:	08 d8                	or     %bl,%al
  2008ac:	e6 21                	out    %al,$0x21
  2008ae:	b0 20                	mov    $0x20,%al
  2008b0:	e6 20                	out    %al,$0x20
  2008b2:	fb                   	sti    
  2008b3:	a1 54 39 20 00       	mov    0x203954,%eax
  2008b8:	ba 05 00 00 00       	mov    $0x5,%edx
  2008bd:	89 d3                	mov    %edx,%ebx
  2008bf:	53                   	push   %ebx
  2008c0:	ff d0                	call   *%eax
  2008c2:	5b                   	pop    %ebx
  2008c3:	b8 df ff ff ff       	mov    $0xffffffdf,%eax
  2008c8:	89 c3                	mov    %eax,%ebx
  2008ca:	fa                   	cli    
  2008cb:	e4 21                	in     $0x21,%al
  2008cd:	20 d8                	and    %bl,%al
  2008cf:	e6 21                	out    %al,$0x21
  2008d1:	5b                   	pop    %ebx
  2008d2:	58                   	pop    %eax
  2008d3:	5b                   	pop    %ebx
  2008d4:	5d                   	pop    %ebp
  2008d5:	fb                   	sti    
  2008d6:	cf                   	iret   
  2008d7:	5b                   	pop    %ebx
  2008d8:	5d                   	pop    %ebp
  2008d9:	c3                   	ret    

002008da <irq06_handler>:
  2008da:	55                   	push   %ebp
  2008db:	89 e5                	mov    %esp,%ebp
  2008dd:	53                   	push   %ebx
  2008de:	50                   	push   %eax
  2008df:	53                   	push   %ebx
  2008e0:	b8 40 00 00 00       	mov    $0x40,%eax
  2008e5:	89 c3                	mov    %eax,%ebx
  2008e7:	e4 21                	in     $0x21,%al
  2008e9:	08 d8                	or     %bl,%al
  2008eb:	e6 21                	out    %al,$0x21
  2008ed:	b0 20                	mov    $0x20,%al
  2008ef:	e6 20                	out    %al,$0x20
  2008f1:	fb                   	sti    
  2008f2:	a1 58 39 20 00       	mov    0x203958,%eax
  2008f7:	ba 06 00 00 00       	mov    $0x6,%edx
  2008fc:	89 d3                	mov    %edx,%ebx
  2008fe:	53                   	push   %ebx
  2008ff:	ff d0                	call   *%eax
  200901:	5b                   	pop    %ebx
  200902:	b8 bf ff ff ff       	mov    $0xffffffbf,%eax
  200907:	89 c3                	mov    %eax,%ebx
  200909:	fa                   	cli    
  20090a:	e4 21                	in     $0x21,%al
  20090c:	20 d8                	and    %bl,%al
  20090e:	e6 21                	out    %al,$0x21
  200910:	5b                   	pop    %ebx
  200911:	58                   	pop    %eax
  200912:	5b                   	pop    %ebx
  200913:	5d                   	pop    %ebp
  200914:	fb                   	sti    
  200915:	cf                   	iret   
  200916:	5b                   	pop    %ebx
  200917:	5d                   	pop    %ebp
  200918:	c3                   	ret    

00200919 <irq07_handler>:
  200919:	55                   	push   %ebp
  20091a:	89 e5                	mov    %esp,%ebp
  20091c:	53                   	push   %ebx
  20091d:	50                   	push   %eax
  20091e:	53                   	push   %ebx
  20091f:	b8 80 00 00 00       	mov    $0x80,%eax
  200924:	89 c3                	mov    %eax,%ebx
  200926:	e4 21                	in     $0x21,%al
  200928:	08 d8                	or     %bl,%al
  20092a:	e6 21                	out    %al,$0x21
  20092c:	b0 20                	mov    $0x20,%al
  20092e:	e6 20                	out    %al,$0x20
  200930:	fb                   	sti    
  200931:	a1 5c 39 20 00       	mov    0x20395c,%eax
  200936:	ba 07 00 00 00       	mov    $0x7,%edx
  20093b:	89 d3                	mov    %edx,%ebx
  20093d:	53                   	push   %ebx
  20093e:	ff d0                	call   *%eax
  200940:	5b                   	pop    %ebx
  200941:	b8 7f ff ff ff       	mov    $0xffffff7f,%eax
  200946:	89 c3                	mov    %eax,%ebx
  200948:	fa                   	cli    
  200949:	e4 21                	in     $0x21,%al
  20094b:	20 d8                	and    %bl,%al
  20094d:	e6 21                	out    %al,$0x21
  20094f:	5b                   	pop    %ebx
  200950:	58                   	pop    %eax
  200951:	5b                   	pop    %ebx
  200952:	5d                   	pop    %ebp
  200953:	fb                   	sti    
  200954:	cf                   	iret   
  200955:	5b                   	pop    %ebx
  200956:	5d                   	pop    %ebp
  200957:	c3                   	ret    

00200958 <irq08_handler>:
  200958:	55                   	push   %ebp
  200959:	89 e5                	mov    %esp,%ebp
  20095b:	53                   	push   %ebx
  20095c:	50                   	push   %eax
  20095d:	53                   	push   %ebx
  20095e:	b8 00 01 00 00       	mov    $0x100,%eax
  200963:	89 c3                	mov    %eax,%ebx
  200965:	e4 21                	in     $0x21,%al
  200967:	08 d8                	or     %bl,%al
  200969:	e6 21                	out    %al,$0x21
  20096b:	b0 20                	mov    $0x20,%al
  20096d:	e6 20                	out    %al,$0x20
  20096f:	fb                   	sti    
  200970:	a1 60 39 20 00       	mov    0x203960,%eax
  200975:	ba 08 00 00 00       	mov    $0x8,%edx
  20097a:	89 d3                	mov    %edx,%ebx
  20097c:	53                   	push   %ebx
  20097d:	ff d0                	call   *%eax
  20097f:	5b                   	pop    %ebx
  200980:	b8 ff fe ff ff       	mov    $0xfffffeff,%eax
  200985:	89 c3                	mov    %eax,%ebx
  200987:	fa                   	cli    
  200988:	e4 21                	in     $0x21,%al
  20098a:	20 d8                	and    %bl,%al
  20098c:	e6 21                	out    %al,$0x21
  20098e:	5b                   	pop    %ebx
  20098f:	58                   	pop    %eax
  200990:	5b                   	pop    %ebx
  200991:	5d                   	pop    %ebp
  200992:	fb                   	sti    
  200993:	cf                   	iret   
  200994:	5b                   	pop    %ebx
  200995:	5d                   	pop    %ebp
  200996:	c3                   	ret    

00200997 <irq09_handler>:
  200997:	55                   	push   %ebp
  200998:	89 e5                	mov    %esp,%ebp
  20099a:	53                   	push   %ebx
  20099b:	50                   	push   %eax
  20099c:	53                   	push   %ebx
  20099d:	b8 00 02 00 00       	mov    $0x200,%eax
  2009a2:	89 c3                	mov    %eax,%ebx
  2009a4:	e4 21                	in     $0x21,%al
  2009a6:	08 d8                	or     %bl,%al
  2009a8:	e6 21                	out    %al,$0x21
  2009aa:	b0 20                	mov    $0x20,%al
  2009ac:	e6 20                	out    %al,$0x20
  2009ae:	fb                   	sti    
  2009af:	a1 64 39 20 00       	mov    0x203964,%eax
  2009b4:	ba 09 00 00 00       	mov    $0x9,%edx
  2009b9:	89 d3                	mov    %edx,%ebx
  2009bb:	53                   	push   %ebx
  2009bc:	ff d0                	call   *%eax
  2009be:	5b                   	pop    %ebx
  2009bf:	b8 ff fd ff ff       	mov    $0xfffffdff,%eax
  2009c4:	89 c3                	mov    %eax,%ebx
  2009c6:	fa                   	cli    
  2009c7:	e4 21                	in     $0x21,%al
  2009c9:	20 d8                	and    %bl,%al
  2009cb:	e6 21                	out    %al,$0x21
  2009cd:	5b                   	pop    %ebx
  2009ce:	58                   	pop    %eax
  2009cf:	5b                   	pop    %ebx
  2009d0:	5d                   	pop    %ebp
  2009d1:	fb                   	sti    
  2009d2:	cf                   	iret   
  2009d3:	5b                   	pop    %ebx
  2009d4:	5d                   	pop    %ebp
  2009d5:	c3                   	ret    

002009d6 <irq10_handler>:
  2009d6:	55                   	push   %ebp
  2009d7:	89 e5                	mov    %esp,%ebp
  2009d9:	53                   	push   %ebx
  2009da:	50                   	push   %eax
  2009db:	53                   	push   %ebx
  2009dc:	b8 00 04 00 00       	mov    $0x400,%eax
  2009e1:	89 c3                	mov    %eax,%ebx
  2009e3:	e4 21                	in     $0x21,%al
  2009e5:	08 d8                	or     %bl,%al
  2009e7:	e6 21                	out    %al,$0x21
  2009e9:	b0 20                	mov    $0x20,%al
  2009eb:	e6 20                	out    %al,$0x20
  2009ed:	fb                   	sti    
  2009ee:	a1 68 39 20 00       	mov    0x203968,%eax
  2009f3:	ba 0a 00 00 00       	mov    $0xa,%edx
  2009f8:	89 d3                	mov    %edx,%ebx
  2009fa:	53                   	push   %ebx
  2009fb:	ff d0                	call   *%eax
  2009fd:	5b                   	pop    %ebx
  2009fe:	b8 ff fb ff ff       	mov    $0xfffffbff,%eax
  200a03:	89 c3                	mov    %eax,%ebx
  200a05:	fa                   	cli    
  200a06:	e4 21                	in     $0x21,%al
  200a08:	20 d8                	and    %bl,%al
  200a0a:	e6 21                	out    %al,$0x21
  200a0c:	5b                   	pop    %ebx
  200a0d:	58                   	pop    %eax
  200a0e:	5b                   	pop    %ebx
  200a0f:	5d                   	pop    %ebp
  200a10:	fb                   	sti    
  200a11:	cf                   	iret   
  200a12:	5b                   	pop    %ebx
  200a13:	5d                   	pop    %ebp
  200a14:	c3                   	ret    

00200a15 <irq11_handler>:
  200a15:	55                   	push   %ebp
  200a16:	89 e5                	mov    %esp,%ebp
  200a18:	53                   	push   %ebx
  200a19:	50                   	push   %eax
  200a1a:	53                   	push   %ebx
  200a1b:	b8 00 08 00 00       	mov    $0x800,%eax
  200a20:	89 c3                	mov    %eax,%ebx
  200a22:	e4 21                	in     $0x21,%al
  200a24:	08 d8                	or     %bl,%al
  200a26:	e6 21                	out    %al,$0x21
  200a28:	b0 20                	mov    $0x20,%al
  200a2a:	e6 20                	out    %al,$0x20
  200a2c:	fb                   	sti    
  200a2d:	a1 6c 39 20 00       	mov    0x20396c,%eax
  200a32:	ba 0b 00 00 00       	mov    $0xb,%edx
  200a37:	89 d3                	mov    %edx,%ebx
  200a39:	53                   	push   %ebx
  200a3a:	ff d0                	call   *%eax
  200a3c:	5b                   	pop    %ebx
  200a3d:	b8 ff f7 ff ff       	mov    $0xfffff7ff,%eax
  200a42:	89 c3                	mov    %eax,%ebx
  200a44:	fa                   	cli    
  200a45:	e4 21                	in     $0x21,%al
  200a47:	20 d8                	and    %bl,%al
  200a49:	e6 21                	out    %al,$0x21
  200a4b:	5b                   	pop    %ebx
  200a4c:	58                   	pop    %eax
  200a4d:	5b                   	pop    %ebx
  200a4e:	5d                   	pop    %ebp
  200a4f:	fb                   	sti    
  200a50:	cf                   	iret   
  200a51:	5b                   	pop    %ebx
  200a52:	5d                   	pop    %ebp
  200a53:	c3                   	ret    

00200a54 <irq12_handler>:
  200a54:	55                   	push   %ebp
  200a55:	89 e5                	mov    %esp,%ebp
  200a57:	53                   	push   %ebx
  200a58:	50                   	push   %eax
  200a59:	53                   	push   %ebx
  200a5a:	b8 00 10 00 00       	mov    $0x1000,%eax
  200a5f:	89 c3                	mov    %eax,%ebx
  200a61:	e4 21                	in     $0x21,%al
  200a63:	08 d8                	or     %bl,%al
  200a65:	e6 21                	out    %al,$0x21
  200a67:	b0 20                	mov    $0x20,%al
  200a69:	e6 20                	out    %al,$0x20
  200a6b:	fb                   	sti    
  200a6c:	a1 70 39 20 00       	mov    0x203970,%eax
  200a71:	ba 0c 00 00 00       	mov    $0xc,%edx
  200a76:	89 d3                	mov    %edx,%ebx
  200a78:	53                   	push   %ebx
  200a79:	ff d0                	call   *%eax
  200a7b:	5b                   	pop    %ebx
  200a7c:	b8 ff ef ff ff       	mov    $0xffffefff,%eax
  200a81:	89 c3                	mov    %eax,%ebx
  200a83:	fa                   	cli    
  200a84:	e4 21                	in     $0x21,%al
  200a86:	20 d8                	and    %bl,%al
  200a88:	e6 21                	out    %al,$0x21
  200a8a:	5b                   	pop    %ebx
  200a8b:	58                   	pop    %eax
  200a8c:	5b                   	pop    %ebx
  200a8d:	5d                   	pop    %ebp
  200a8e:	fb                   	sti    
  200a8f:	cf                   	iret   
  200a90:	5b                   	pop    %ebx
  200a91:	5d                   	pop    %ebp
  200a92:	c3                   	ret    

00200a93 <irq13_handler>:
  200a93:	55                   	push   %ebp
  200a94:	89 e5                	mov    %esp,%ebp
  200a96:	53                   	push   %ebx
  200a97:	50                   	push   %eax
  200a98:	53                   	push   %ebx
  200a99:	b8 00 20 00 00       	mov    $0x2000,%eax
  200a9e:	89 c3                	mov    %eax,%ebx
  200aa0:	e4 21                	in     $0x21,%al
  200aa2:	08 d8                	or     %bl,%al
  200aa4:	e6 21                	out    %al,$0x21
  200aa6:	b0 20                	mov    $0x20,%al
  200aa8:	e6 20                	out    %al,$0x20
  200aaa:	fb                   	sti    
  200aab:	a1 74 39 20 00       	mov    0x203974,%eax
  200ab0:	ba 0d 00 00 00       	mov    $0xd,%edx
  200ab5:	89 d3                	mov    %edx,%ebx
  200ab7:	53                   	push   %ebx
  200ab8:	ff d0                	call   *%eax
  200aba:	5b                   	pop    %ebx
  200abb:	b8 ff df ff ff       	mov    $0xffffdfff,%eax
  200ac0:	89 c3                	mov    %eax,%ebx
  200ac2:	fa                   	cli    
  200ac3:	e4 21                	in     $0x21,%al
  200ac5:	20 d8                	and    %bl,%al
  200ac7:	e6 21                	out    %al,$0x21
  200ac9:	5b                   	pop    %ebx
  200aca:	58                   	pop    %eax
  200acb:	5b                   	pop    %ebx
  200acc:	5d                   	pop    %ebp
  200acd:	fb                   	sti    
  200ace:	cf                   	iret   
  200acf:	5b                   	pop    %ebx
  200ad0:	5d                   	pop    %ebp
  200ad1:	c3                   	ret    

00200ad2 <irq14_handler>:
  200ad2:	55                   	push   %ebp
  200ad3:	89 e5                	mov    %esp,%ebp
  200ad5:	53                   	push   %ebx
  200ad6:	50                   	push   %eax
  200ad7:	53                   	push   %ebx
  200ad8:	b8 00 40 00 00       	mov    $0x4000,%eax
  200add:	89 c3                	mov    %eax,%ebx
  200adf:	e4 21                	in     $0x21,%al
  200ae1:	08 d8                	or     %bl,%al
  200ae3:	e6 21                	out    %al,$0x21
  200ae5:	b0 20                	mov    $0x20,%al
  200ae7:	e6 20                	out    %al,$0x20
  200ae9:	fb                   	sti    
  200aea:	a1 78 39 20 00       	mov    0x203978,%eax
  200aef:	ba 0e 00 00 00       	mov    $0xe,%edx
  200af4:	89 d3                	mov    %edx,%ebx
  200af6:	53                   	push   %ebx
  200af7:	ff d0                	call   *%eax
  200af9:	5b                   	pop    %ebx
  200afa:	b8 ff bf ff ff       	mov    $0xffffbfff,%eax
  200aff:	89 c3                	mov    %eax,%ebx
  200b01:	fa                   	cli    
  200b02:	e4 21                	in     $0x21,%al
  200b04:	20 d8                	and    %bl,%al
  200b06:	e6 21                	out    %al,$0x21
  200b08:	5b                   	pop    %ebx
  200b09:	58                   	pop    %eax
  200b0a:	5b                   	pop    %ebx
  200b0b:	5d                   	pop    %ebp
  200b0c:	fb                   	sti    
  200b0d:	cf                   	iret   
  200b0e:	5b                   	pop    %ebx
  200b0f:	5d                   	pop    %ebp
  200b10:	c3                   	ret    

00200b11 <irq15_handler>:
  200b11:	55                   	push   %ebp
  200b12:	89 e5                	mov    %esp,%ebp
  200b14:	53                   	push   %ebx
  200b15:	50                   	push   %eax
  200b16:	53                   	push   %ebx
  200b17:	b8 00 80 00 00       	mov    $0x8000,%eax
  200b1c:	89 c3                	mov    %eax,%ebx
  200b1e:	e4 21                	in     $0x21,%al
  200b20:	08 d8                	or     %bl,%al
  200b22:	e6 21                	out    %al,$0x21
  200b24:	b0 20                	mov    $0x20,%al
  200b26:	e6 20                	out    %al,$0x20
  200b28:	fb                   	sti    
  200b29:	a1 7c 39 20 00       	mov    0x20397c,%eax
  200b2e:	ba 0f 00 00 00       	mov    $0xf,%edx
  200b33:	89 d3                	mov    %edx,%ebx
  200b35:	53                   	push   %ebx
  200b36:	ff d0                	call   *%eax
  200b38:	5b                   	pop    %ebx
  200b39:	b8 ff 7f ff ff       	mov    $0xffff7fff,%eax
  200b3e:	89 c3                	mov    %eax,%ebx
  200b40:	fa                   	cli    
  200b41:	e4 21                	in     $0x21,%al
  200b43:	20 d8                	and    %bl,%al
  200b45:	e6 21                	out    %al,$0x21
  200b47:	5b                   	pop    %ebx
  200b48:	58                   	pop    %eax
  200b49:	5b                   	pop    %ebx
  200b4a:	5d                   	pop    %ebp
  200b4b:	fb                   	sti    
  200b4c:	cf                   	iret   
  200b4d:	5b                   	pop    %ebx
  200b4e:	5d                   	pop    %ebp
  200b4f:	c3                   	ret    

00200b50 <timer_handler>:
  200b50:	55                   	push   %ebp
  200b51:	89 e5                	mov    %esp,%ebp
  200b53:	0f b6 05 08 30 20 00 	movzbl 0x203008,%eax
  200b5a:	3c 7a                	cmp    $0x7a,%al
  200b5c:	75 07                	jne    200b65 <timer_handler+0x15>
  200b5e:	c6 05 08 30 20 00 41 	movb   $0x41,0x203008
  200b65:	b4 0c                	mov    $0xc,%ah
  200b67:	a0 08 30 20 00       	mov    0x203008,%al
  200b6c:	65 66 a3 00 0f 00 00 	mov    %ax,%gs:0xf00
  200b73:	b0 20                	mov    $0x20,%al
  200b75:	e6 20                	out    %al,$0x20
  200b77:	0f b6 05 08 30 20 00 	movzbl 0x203008,%eax
  200b7e:	83 c0 01             	add    $0x1,%eax
  200b81:	a2 08 30 20 00       	mov    %al,0x203008
  200b86:	90                   	nop
  200b87:	5d                   	pop    %ebp
  200b88:	c3                   	ret    

00200b89 <init_timer>:
  200b89:	55                   	push   %ebp
  200b8a:	89 e5                	mov    %esp,%ebp
  200b8c:	83 ec 18             	sub    $0x18,%esp
  200b8f:	c7 05 40 39 20 00 50 	movl   $0x200b50,0x203940
  200b96:	0b 20 00 
  200b99:	c7 44 24 04 60 07 20 	movl   $0x200760,0x4(%esp)
  200ba0:	00 
  200ba1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200ba8:	e8 64 fb ff ff       	call   200711 <set_intr_gate>
  200bad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200bb4:	e8 c3 f6 ff ff       	call   20027c <enable_irq>
  200bb9:	c9                   	leave  
  200bba:	c3                   	ret    
  200bbb:	90                   	nop

00200bbc <exception_handler>:
  200bbc:	55                   	push   %ebp
  200bbd:	89 e5                	mov    %esp,%ebp
  200bbf:	83 ec 18             	sub    $0x18,%esp
  200bc2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200bc9:	00 
  200bca:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200bd1:	00 
  200bd2:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200bd9:	00 
  200bda:	c7 04 24 ea 0f 20 00 	movl   $0x200fea,(%esp)
  200be1:	e8 1e 02 00 00       	call   200e04 <dis_str>
  200be6:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  200bed:	00 
  200bee:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200bf5:	00 
  200bf6:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200bfd:	00 
  200bfe:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c01:	89 04 24             	mov    %eax,(%esp)
  200c04:	e8 fb 01 00 00       	call   200e04 <dis_str>
  200c09:	eb fe                	jmp    200c09 <exception_handler+0x4d>

00200c0b <divide_error>:
  200c0b:	55                   	push   %ebp
  200c0c:	89 e5                	mov    %esp,%ebp
  200c0e:	83 ec 18             	sub    $0x18,%esp
  200c11:	c7 44 24 04 f5 0f 20 	movl   $0x200ff5,0x4(%esp)
  200c18:	00 
  200c19:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200c20:	e8 97 ff ff ff       	call   200bbc <exception_handler>
  200c25:	c9                   	leave  
  200c26:	c3                   	ret    

00200c27 <single_step_exception>:
  200c27:	55                   	push   %ebp
  200c28:	89 e5                	mov    %esp,%ebp
  200c2a:	83 ec 18             	sub    $0x18,%esp
  200c2d:	c7 44 24 04 02 10 20 	movl   $0x201002,0x4(%esp)
  200c34:	00 
  200c35:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200c3c:	e8 7b ff ff ff       	call   200bbc <exception_handler>
  200c41:	c9                   	leave  
  200c42:	c3                   	ret    

00200c43 <nmi>:
  200c43:	55                   	push   %ebp
  200c44:	89 e5                	mov    %esp,%ebp
  200c46:	83 ec 18             	sub    $0x18,%esp
  200c49:	c7 44 24 04 18 10 20 	movl   $0x201018,0x4(%esp)
  200c50:	00 
  200c51:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  200c58:	e8 5f ff ff ff       	call   200bbc <exception_handler>
  200c5d:	c9                   	leave  
  200c5e:	c3                   	ret    

00200c5f <breakpoint_exception>:
  200c5f:	55                   	push   %ebp
  200c60:	89 e5                	mov    %esp,%ebp
  200c62:	83 ec 18             	sub    $0x18,%esp
  200c65:	c7 44 24 04 1c 10 20 	movl   $0x20101c,0x4(%esp)
  200c6c:	00 
  200c6d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200c74:	e8 43 ff ff ff       	call   200bbc <exception_handler>
  200c79:	c9                   	leave  
  200c7a:	c3                   	ret    

00200c7b <overflow>:
  200c7b:	55                   	push   %ebp
  200c7c:	89 e5                	mov    %esp,%ebp
  200c7e:	83 ec 18             	sub    $0x18,%esp
  200c81:	c7 44 24 04 31 10 20 	movl   $0x201031,0x4(%esp)
  200c88:	00 
  200c89:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  200c90:	e8 27 ff ff ff       	call   200bbc <exception_handler>
  200c95:	c9                   	leave  
  200c96:	c3                   	ret    

00200c97 <bounds_check>:
  200c97:	55                   	push   %ebp
  200c98:	89 e5                	mov    %esp,%ebp
  200c9a:	83 ec 18             	sub    $0x18,%esp
  200c9d:	c7 44 24 04 3a 10 20 	movl   $0x20103a,0x4(%esp)
  200ca4:	00 
  200ca5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  200cac:	e8 0b ff ff ff       	call   200bbc <exception_handler>
  200cb1:	c9                   	leave  
  200cb2:	c3                   	ret    

00200cb3 <inval_opcode>:
  200cb3:	55                   	push   %ebp
  200cb4:	89 e5                	mov    %esp,%ebp
  200cb6:	83 ec 18             	sub    $0x18,%esp
  200cb9:	c7 44 24 04 47 10 20 	movl   $0x201047,0x4(%esp)
  200cc0:	00 
  200cc1:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  200cc8:	e8 ef fe ff ff       	call   200bbc <exception_handler>
  200ccd:	c9                   	leave  
  200cce:	c3                   	ret    

00200ccf <copr_not_available>:
  200ccf:	55                   	push   %ebp
  200cd0:	89 e5                	mov    %esp,%ebp
  200cd2:	83 ec 18             	sub    $0x18,%esp
  200cd5:	c7 44 24 04 54 10 20 	movl   $0x201054,0x4(%esp)
  200cdc:	00 
  200cdd:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  200ce4:	e8 d3 fe ff ff       	call   200bbc <exception_handler>
  200ce9:	c9                   	leave  
  200cea:	c3                   	ret    

00200ceb <double_fault>:
  200ceb:	55                   	push   %ebp
  200cec:	89 e5                	mov    %esp,%ebp
  200cee:	83 ec 18             	sub    $0x18,%esp
  200cf1:	c7 44 24 04 67 10 20 	movl   $0x201067,0x4(%esp)
  200cf8:	00 
  200cf9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  200d00:	e8 b7 fe ff ff       	call   200bbc <exception_handler>
  200d05:	c9                   	leave  
  200d06:	c3                   	ret    

00200d07 <copr_seg_overrun>:
  200d07:	55                   	push   %ebp
  200d08:	89 e5                	mov    %esp,%ebp
  200d0a:	83 ec 18             	sub    $0x18,%esp
  200d0d:	c7 44 24 04 74 10 20 	movl   $0x201074,0x4(%esp)
  200d14:	00 
  200d15:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200d1c:	e8 9b fe ff ff       	call   200bbc <exception_handler>
  200d21:	c9                   	leave  
  200d22:	c3                   	ret    

00200d23 <inval_tss>:
  200d23:	55                   	push   %ebp
  200d24:	89 e5                	mov    %esp,%ebp
  200d26:	83 ec 18             	sub    $0x18,%esp
  200d29:	c7 44 24 04 85 10 20 	movl   $0x201085,0x4(%esp)
  200d30:	00 
  200d31:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200d38:	e8 7f fe ff ff       	call   200bbc <exception_handler>
  200d3d:	c9                   	leave  
  200d3e:	c3                   	ret    

00200d3f <segment_not_present>:
  200d3f:	55                   	push   %ebp
  200d40:	89 e5                	mov    %esp,%ebp
  200d42:	83 ec 18             	sub    $0x18,%esp
  200d45:	c7 44 24 04 8f 10 20 	movl   $0x20108f,0x4(%esp)
  200d4c:	00 
  200d4d:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200d54:	e8 63 fe ff ff       	call   200bbc <exception_handler>
  200d59:	c9                   	leave  
  200d5a:	c3                   	ret    

00200d5b <stack_exception>:
  200d5b:	55                   	push   %ebp
  200d5c:	89 e5                	mov    %esp,%ebp
  200d5e:	83 ec 18             	sub    $0x18,%esp
  200d61:	c7 44 24 04 a3 10 20 	movl   $0x2010a3,0x4(%esp)
  200d68:	00 
  200d69:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200d70:	e8 47 fe ff ff       	call   200bbc <exception_handler>
  200d75:	c9                   	leave  
  200d76:	c3                   	ret    

00200d77 <general_protection>:
  200d77:	55                   	push   %ebp
  200d78:	89 e5                	mov    %esp,%ebp
  200d7a:	83 ec 18             	sub    $0x18,%esp
  200d7d:	c7 44 24 04 b3 10 20 	movl   $0x2010b3,0x4(%esp)
  200d84:	00 
  200d85:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200d8c:	e8 2b fe ff ff       	call   200bbc <exception_handler>
  200d91:	c9                   	leave  
  200d92:	c3                   	ret    

00200d93 <page_fault>:
  200d93:	55                   	push   %ebp
  200d94:	89 e5                	mov    %esp,%ebp
  200d96:	83 ec 18             	sub    $0x18,%esp
  200d99:	c7 44 24 04 c6 10 20 	movl   $0x2010c6,0x4(%esp)
  200da0:	00 
  200da1:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200da8:	e8 0f fe ff ff       	call   200bbc <exception_handler>
  200dad:	c9                   	leave  
  200dae:	c3                   	ret    

00200daf <copr_error>:
  200daf:	55                   	push   %ebp
  200db0:	89 e5                	mov    %esp,%ebp
  200db2:	83 ec 18             	sub    $0x18,%esp
  200db5:	c7 44 24 04 d1 10 20 	movl   $0x2010d1,0x4(%esp)
  200dbc:	00 
  200dbd:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200dc4:	e8 f3 fd ff ff       	call   200bbc <exception_handler>
  200dc9:	c9                   	leave  
  200dca:	c3                   	ret    

00200dcb <float_error>:
  200dcb:	55                   	push   %ebp
  200dcc:	89 e5                	mov    %esp,%ebp
  200dce:	83 ec 18             	sub    $0x18,%esp
  200dd1:	c7 44 24 04 dc 10 20 	movl   $0x2010dc,0x4(%esp)
  200dd8:	00 
  200dd9:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200de0:	e8 d7 fd ff ff       	call   200bbc <exception_handler>
  200de5:	c9                   	leave  
  200de6:	c3                   	ret    

00200de7 <alignment_check>:
  200de7:	55                   	push   %ebp
  200de8:	89 e5                	mov    %esp,%ebp
  200dea:	83 ec 18             	sub    $0x18,%esp
  200ded:	c7 44 24 04 e8 10 20 	movl   $0x2010e8,0x4(%esp)
  200df4:	00 
  200df5:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200dfc:	e8 bb fd ff ff       	call   200bbc <exception_handler>
  200e01:	c9                   	leave  
  200e02:	c3                   	ret    
  200e03:	90                   	nop

00200e04 <dis_str>:
  200e04:	55                   	push   %ebp
  200e05:	89 e5                	mov    %esp,%ebp
  200e07:	57                   	push   %edi
  200e08:	53                   	push   %ebx
  200e09:	83 ec 30             	sub    $0x30,%esp
  200e0c:	8b 45 0c             	mov    0xc(%ebp),%eax
  200e0f:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200e12:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200e19:	8b 55 10             	mov    0x10(%ebp),%edx
  200e1c:	89 d0                	mov    %edx,%eax
  200e1e:	c1 e0 02             	shl    $0x2,%eax
  200e21:	01 d0                	add    %edx,%eax
  200e23:	c1 e0 04             	shl    $0x4,%eax
  200e26:	89 c2                	mov    %eax,%edx
  200e28:	8b 45 14             	mov    0x14(%ebp),%eax
  200e2b:	01 d0                	add    %edx,%eax
  200e2d:	01 c0                	add    %eax,%eax
  200e2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200e32:	8b 45 08             	mov    0x8(%ebp),%eax
  200e35:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200e38:	8b 45 08             	mov    0x8(%ebp),%eax
  200e3b:	89 04 24             	mov    %eax,(%esp)
  200e3e:	e8 02 01 00 00       	call   200f45 <strlen>
  200e43:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200e46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200e4d:	eb 2e                	jmp    200e7d <dis_str+0x79>
  200e4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200e52:	8d 50 01             	lea    0x1(%eax),%edx
  200e55:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200e58:	0f b6 00             	movzbl (%eax),%eax
  200e5b:	88 45 e7             	mov    %al,-0x19(%ebp)
  200e5e:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200e62:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200e66:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200e69:	89 d3                	mov    %edx,%ebx
  200e6b:	89 cf                	mov    %ecx,%edi
  200e6d:	88 c4                	mov    %al,%ah
  200e6f:	88 d8                	mov    %bl,%al
  200e71:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200e75:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200e79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200e7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200e80:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200e83:	7c ca                	jl     200e4f <dis_str+0x4b>
  200e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200e88:	83 c4 30             	add    $0x30,%esp
  200e8b:	5b                   	pop    %ebx
  200e8c:	5f                   	pop    %edi
  200e8d:	5d                   	pop    %ebp
  200e8e:	c3                   	ret    

00200e8f <dis_nchar>:
  200e8f:	55                   	push   %ebp
  200e90:	89 e5                	mov    %esp,%ebp
  200e92:	57                   	push   %edi
  200e93:	53                   	push   %ebx
  200e94:	83 ec 14             	sub    $0x14,%esp
  200e97:	8b 45 0c             	mov    0xc(%ebp),%eax
  200e9a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200e9d:	8b 55 14             	mov    0x14(%ebp),%edx
  200ea0:	89 d0                	mov    %edx,%eax
  200ea2:	c1 e0 02             	shl    $0x2,%eax
  200ea5:	01 d0                	add    %edx,%eax
  200ea7:	c1 e0 04             	shl    $0x4,%eax
  200eaa:	89 c2                	mov    %eax,%edx
  200eac:	8b 45 18             	mov    0x18(%ebp),%eax
  200eaf:	01 d0                	add    %edx,%eax
  200eb1:	01 c0                	add    %eax,%eax
  200eb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200eb6:	8b 45 08             	mov    0x8(%ebp),%eax
  200eb9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200ebc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200ec3:	eb 2e                	jmp    200ef3 <dis_nchar+0x64>
  200ec5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200ec8:	8d 50 01             	lea    0x1(%eax),%edx
  200ecb:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200ece:	0f b6 00             	movzbl (%eax),%eax
  200ed1:	88 45 eb             	mov    %al,-0x15(%ebp)
  200ed4:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200ed8:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200edc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200edf:	89 d3                	mov    %edx,%ebx
  200ee1:	89 cf                	mov    %ecx,%edi
  200ee3:	88 c4                	mov    %al,%ah
  200ee5:	88 d8                	mov    %bl,%al
  200ee7:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200eeb:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200eef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200ef6:	3b 45 10             	cmp    0x10(%ebp),%eax
  200ef9:	7c ca                	jl     200ec5 <dis_nchar+0x36>
  200efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200efe:	83 c4 14             	add    $0x14,%esp
  200f01:	5b                   	pop    %ebx
  200f02:	5f                   	pop    %edi
  200f03:	5d                   	pop    %ebp
  200f04:	c3                   	ret    
  200f05:	66 90                	xchg   %ax,%ax
  200f07:	90                   	nop

00200f08 <memcpy>:
  200f08:	55                   	push   %ebp
  200f09:	89 e5                	mov    %esp,%ebp
  200f0b:	83 ec 10             	sub    $0x10,%esp
  200f0e:	8b 45 08             	mov    0x8(%ebp),%eax
  200f11:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200f14:	8b 45 0c             	mov    0xc(%ebp),%eax
  200f17:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200f1a:	eb 17                	jmp    200f33 <memcpy+0x2b>
  200f1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200f1f:	8d 50 01             	lea    0x1(%eax),%edx
  200f22:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200f25:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200f28:	8d 4a 01             	lea    0x1(%edx),%ecx
  200f2b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200f2e:	0f b6 12             	movzbl (%edx),%edx
  200f31:	88 10                	mov    %dl,(%eax)
  200f33:	8b 45 10             	mov    0x10(%ebp),%eax
  200f36:	8d 50 ff             	lea    -0x1(%eax),%edx
  200f39:	89 55 10             	mov    %edx,0x10(%ebp)
  200f3c:	85 c0                	test   %eax,%eax
  200f3e:	75 dc                	jne    200f1c <memcpy+0x14>
  200f40:	8b 45 08             	mov    0x8(%ebp),%eax
  200f43:	c9                   	leave  
  200f44:	c3                   	ret    

00200f45 <strlen>:
  200f45:	55                   	push   %ebp
  200f46:	89 e5                	mov    %esp,%ebp
  200f48:	83 ec 10             	sub    $0x10,%esp
  200f4b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200f52:	8b 45 08             	mov    0x8(%ebp),%eax
  200f55:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200f58:	eb 08                	jmp    200f62 <strlen+0x1d>
  200f5a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200f5e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200f62:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200f65:	0f b6 00             	movzbl (%eax),%eax
  200f68:	84 c0                	test   %al,%al
  200f6a:	75 ee                	jne    200f5a <strlen+0x15>
  200f6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200f6f:	c9                   	leave  
  200f70:	c3                   	ret    

00200f71 <strcmp>:
  200f71:	55                   	push   %ebp
  200f72:	89 e5                	mov    %esp,%ebp
  200f74:	eb 0c                	jmp    200f82 <strcmp+0x11>
  200f76:	8b 45 08             	mov    0x8(%ebp),%eax
  200f79:	0f b6 00             	movzbl (%eax),%eax
  200f7c:	84 c0                	test   %al,%al
  200f7e:	75 02                	jne    200f82 <strcmp+0x11>
  200f80:	eb 1c                	jmp    200f9e <strcmp+0x2d>
  200f82:	8b 45 08             	mov    0x8(%ebp),%eax
  200f85:	8d 50 01             	lea    0x1(%eax),%edx
  200f88:	89 55 08             	mov    %edx,0x8(%ebp)
  200f8b:	0f b6 08             	movzbl (%eax),%ecx
  200f8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  200f91:	8d 50 01             	lea    0x1(%eax),%edx
  200f94:	89 55 0c             	mov    %edx,0xc(%ebp)
  200f97:	0f b6 00             	movzbl (%eax),%eax
  200f9a:	38 c1                	cmp    %al,%cl
  200f9c:	74 d8                	je     200f76 <strcmp+0x5>
  200f9e:	8b 45 08             	mov    0x8(%ebp),%eax
  200fa1:	0f b6 00             	movzbl (%eax),%eax
  200fa4:	0f be d0             	movsbl %al,%edx
  200fa7:	8b 45 0c             	mov    0xc(%ebp),%eax
  200faa:	0f b6 00             	movzbl (%eax),%eax
  200fad:	0f be c0             	movsbl %al,%eax
  200fb0:	29 c2                	sub    %eax,%edx
  200fb2:	89 d0                	mov    %edx,%eax
  200fb4:	5d                   	pop    %ebp
  200fb5:	c3                   	ret    

00200fb6 <memset>:
  200fb6:	55                   	push   %ebp
  200fb7:	89 e5                	mov    %esp,%ebp
  200fb9:	83 ec 10             	sub    $0x10,%esp
  200fbc:	8b 45 08             	mov    0x8(%ebp),%eax
  200fbf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200fc2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200fc9:	eb 12                	jmp    200fdd <memset+0x27>
  200fcb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200fce:	8d 50 01             	lea    0x1(%eax),%edx
  200fd1:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200fd4:	8b 55 0c             	mov    0xc(%ebp),%edx
  200fd7:	88 10                	mov    %dl,(%eax)
  200fd9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200fdd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200fe0:	3b 45 10             	cmp    0x10(%ebp),%eax
  200fe3:	72 e6                	jb     200fcb <memset+0x15>
  200fe5:	8b 45 08             	mov    0x8(%ebp),%eax
  200fe8:	c9                   	leave  
  200fe9:	c3                   	ret    
