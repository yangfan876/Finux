
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 80 00 00 00       	call   20008b <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 08             	sub    $0x8,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 1d 00 00 00       	call   20003c <load_tss>
  20001f:	e8 b4 03 00 00       	call   2003d8 <disable_irqs>
  200024:	e8 67 07 00 00       	call   200790 <load_idt>
  200029:	e8 23 08 00 00       	call   200851 <init_timer>
  20002e:	e8 bb 0c 00 00       	call   200cee <creat_init>
  200033:	ea 00 00 00 00 80 00 	ljmp   $0x80,$0x0
  20003a:	c9                   	leave  
  20003b:	c3                   	ret    

0020003c <load_tss>:
  20003c:	55                   	push   %ebp
  20003d:	89 e5                	mov    %esp,%ebp
  20003f:	83 ec 10             	sub    $0x10,%esp
  200042:	66 c7 45 fe 40 00    	movw   $0x40,-0x2(%ebp)
  200048:	c7 05 24 41 20 00 ff 	movl   $0x1fffff,0x204124
  20004f:	ff 1f 00 
  200052:	66 c7 05 28 41 20 00 	movw   $0x28,0x204128
  200059:	28 00 
  20005b:	66 c7 05 86 41 20 00 	movw   $0x6d,0x204186
  200062:	6d 00 
  200064:	c6 05 88 41 20 00 ff 	movb   $0xff,0x204188
  20006b:	c7 05 89 41 20 00 69 	movl   $0x69,0x204189
  200072:	00 00 00 
  200075:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  200079:	0f 00 d8             	ltr    %ax
  20007c:	c9                   	leave  
  20007d:	c3                   	ret    

0020007e <set_tss_esp>:
  20007e:	55                   	push   %ebp
  20007f:	89 e5                	mov    %esp,%ebp
  200081:	8b 45 08             	mov    0x8(%ebp),%eax
  200084:	a3 24 41 20 00       	mov    %eax,0x204124
  200089:	5d                   	pop    %ebp
  20008a:	c3                   	ret    

0020008b <change_gdt>:
  20008b:	55                   	push   %ebp
  20008c:	89 e5                	mov    %esp,%ebp
  20008e:	53                   	push   %ebx
  20008f:	83 ec 10             	sub    $0x10,%esp
  200092:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  200098:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  20009e:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  2000a4:	c7 05 20 40 20 00 ff 	movl   $0xffff,0x204020
  2000ab:	ff 00 00 
  2000ae:	c7 05 24 40 20 00 00 	movl   $0xcf9b00,0x204024
  2000b5:	9b cf 00 
  2000b8:	c7 05 28 40 20 00 ff 	movl   $0xffff,0x204028
  2000bf:	ff 00 00 
  2000c2:	c7 05 2c 40 20 00 00 	movl   $0xcf9300,0x20402c
  2000c9:	93 cf 00 
  2000cc:	c7 05 30 40 20 00 ff 	movl   $0xffff,0x204030
  2000d3:	ff 00 00 
  2000d6:	c7 05 34 40 20 00 00 	movl   $0xcffa00,0x204034
  2000dd:	fa cf 00 
  2000e0:	c7 05 38 40 20 00 ff 	movl   $0xffff,0x204038
  2000e7:	ff 00 00 
  2000ea:	c7 05 3c 40 20 00 00 	movl   $0xcff200,0x20403c
  2000f1:	f2 cf 00 
  2000f4:	a1 89 41 20 00       	mov    0x204189,%eax
  2000f9:	83 e8 01             	sub    $0x1,%eax
  2000fc:	0f b7 c0             	movzwl %ax,%eax
  2000ff:	ba 20 41 20 00       	mov    $0x204120,%edx
  200104:	c1 e2 10             	shl    $0x10,%edx
  200107:	09 d0                	or     %edx,%eax
  200109:	a3 40 40 20 00       	mov    %eax,0x204040
  20010e:	a1 89 41 20 00       	mov    0x204189,%eax
  200113:	83 e8 01             	sub    $0x1,%eax
  200116:	25 00 00 0f 00       	and    $0xf0000,%eax
  20011b:	89 c2                	mov    %eax,%edx
  20011d:	b8 20 41 20 00       	mov    $0x204120,%eax
  200122:	25 00 00 ff 00       	and    $0xff0000,%eax
  200127:	c1 e8 10             	shr    $0x10,%eax
  20012a:	80 cc 89             	or     $0x89,%ah
  20012d:	89 c1                	mov    %eax,%ecx
  20012f:	b8 20 41 20 00       	mov    $0x204120,%eax
  200134:	25 00 00 00 ff       	and    $0xff000000,%eax
  200139:	09 c8                	or     %ecx,%eax
  20013b:	09 d0                	or     %edx,%eax
  20013d:	a3 44 40 20 00       	mov    %eax,0x204044
  200142:	c7 05 48 40 20 00 ff 	movl   $0x8000ffff,0x204048
  200149:	ff 00 80 
  20014c:	c7 05 4c 40 20 00 0b 	movl   $0xf30b,0x20404c
  200153:	f3 00 00 
  200156:	66 c7 05 00 41 20 00 	movw   $0xff,0x204100
  20015d:	ff 00 
  20015f:	b8 00 40 20 00       	mov    $0x204000,%eax
  200164:	a3 02 41 20 00       	mov    %eax,0x204102
  200169:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  20016d:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  200171:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  200175:	89 d3                	mov    %edx,%ebx
  200177:	0f 01 15 00 41 20 00 	lgdtl  0x204100
  20017e:	8e db                	mov    %ebx,%ds
  200180:	8e c3                	mov    %ebx,%es
  200182:	8e e3                	mov    %ebx,%fs
  200184:	8e d3                	mov    %ebx,%ss
  200186:	8e e9                	mov    %ecx,%gs
  200188:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  20018f:	90                   	nop
  200190:	83 c4 10             	add    $0x10,%esp
  200193:	5b                   	pop    %ebx
  200194:	5d                   	pop    %ebp
  200195:	c3                   	ret    
  200196:	66 90                	xchg   %ax,%ax

00200198 <cli>:
  200198:	55                   	push   %ebp
  200199:	89 e5                	mov    %esp,%ebp
  20019b:	fa                   	cli    
  20019c:	5d                   	pop    %ebp
  20019d:	c3                   	ret    

0020019e <sti>:
  20019e:	55                   	push   %ebp
  20019f:	89 e5                	mov    %esp,%ebp
  2001a1:	fb                   	sti    
  2001a2:	5d                   	pop    %ebp
  2001a3:	c3                   	ret    

002001a4 <outb>:
  2001a4:	55                   	push   %ebp
  2001a5:	89 e5                	mov    %esp,%ebp
  2001a7:	83 ec 08             	sub    $0x8,%esp
  2001aa:	8b 55 08             	mov    0x8(%ebp),%edx
  2001ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001b0:	88 55 fc             	mov    %dl,-0x4(%ebp)
  2001b3:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  2001b7:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2001bb:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2001bf:	ee                   	out    %al,(%dx)
  2001c0:	c9                   	leave  
  2001c1:	c3                   	ret    

002001c2 <inb>:
  2001c2:	55                   	push   %ebp
  2001c3:	89 e5                	mov    %esp,%ebp
  2001c5:	83 ec 14             	sub    $0x14,%esp
  2001c8:	8b 45 08             	mov    0x8(%ebp),%eax
  2001cb:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  2001cf:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  2001d3:	89 c2                	mov    %eax,%edx
  2001d5:	ec                   	in     (%dx),%al
  2001d6:	88 45 ff             	mov    %al,-0x1(%ebp)
  2001d9:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2001dd:	c9                   	leave  
  2001de:	c3                   	ret    

002001df <io_delay>:
  2001df:	55                   	push   %ebp
  2001e0:	89 e5                	mov    %esp,%ebp
  2001e2:	83 ec 10             	sub    $0x10,%esp
  2001e5:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  2001eb:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  2001ef:	89 c2                	mov    %eax,%edx
  2001f1:	ee                   	out    %al,(%dx)
  2001f2:	c9                   	leave  
  2001f3:	c3                   	ret    

002001f4 <outb_pic>:
  2001f4:	55                   	push   %ebp
  2001f5:	89 e5                	mov    %esp,%ebp
  2001f7:	83 ec 0c             	sub    $0xc,%esp
  2001fa:	8b 45 08             	mov    0x8(%ebp),%eax
  2001fd:	88 45 fc             	mov    %al,-0x4(%ebp)
  200200:	8b 45 0c             	mov    0xc(%ebp),%eax
  200203:	0f b7 d0             	movzwl %ax,%edx
  200206:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20020a:	89 54 24 04          	mov    %edx,0x4(%esp)
  20020e:	89 04 24             	mov    %eax,(%esp)
  200211:	e8 8e ff ff ff       	call   2001a4 <outb>
  200216:	e8 c4 ff ff ff       	call   2001df <io_delay>
  20021b:	c9                   	leave  
  20021c:	c3                   	ret    

0020021d <inb_pic>:
  20021d:	55                   	push   %ebp
  20021e:	89 e5                	mov    %esp,%ebp
  200220:	83 ec 14             	sub    $0x14,%esp
  200223:	8b 45 08             	mov    0x8(%ebp),%eax
  200226:	0f b7 c0             	movzwl %ax,%eax
  200229:	89 04 24             	mov    %eax,(%esp)
  20022c:	e8 91 ff ff ff       	call   2001c2 <inb>
  200231:	88 45 ff             	mov    %al,-0x1(%ebp)
  200234:	e8 a6 ff ff ff       	call   2001df <io_delay>
  200239:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  20023d:	c9                   	leave  
  20023e:	c3                   	ret    

0020023f <Init_8259A>:
  20023f:	55                   	push   %ebp
  200240:	89 e5                	mov    %esp,%ebp
  200242:	83 ec 08             	sub    $0x8,%esp
  200245:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20024c:	00 
  20024d:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200254:	e8 9b ff ff ff       	call   2001f4 <outb_pic>
  200259:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200260:	00 
  200261:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200268:	e8 87 ff ff ff       	call   2001f4 <outb_pic>
  20026d:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200274:	00 
  200275:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  20027c:	e8 73 ff ff ff       	call   2001f4 <outb_pic>
  200281:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200288:	00 
  200289:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  200290:	e8 5f ff ff ff       	call   2001f4 <outb_pic>
  200295:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20029c:	00 
  20029d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2002a4:	e8 4b ff ff ff       	call   2001f4 <outb_pic>
  2002a9:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002b0:	00 
  2002b1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2002b8:	e8 37 ff ff ff       	call   2001f4 <outb_pic>
  2002bd:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002c4:	00 
  2002c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002cc:	e8 23 ff ff ff       	call   2001f4 <outb_pic>
  2002d1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002d8:	00 
  2002d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002e0:	e8 0f ff ff ff       	call   2001f4 <outb_pic>
  2002e5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002ec:	00 
  2002ed:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  2002f4:	e8 fb fe ff ff       	call   2001f4 <outb_pic>
  2002f9:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200300:	00 
  200301:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200308:	e8 e7 fe ff ff       	call   2001f4 <outb_pic>
  20030d:	90                   	nop
  20030e:	c9                   	leave  
  20030f:	c3                   	ret    

00200310 <enable_irq>:
  200310:	55                   	push   %ebp
  200311:	89 e5                	mov    %esp,%ebp
  200313:	83 ec 18             	sub    $0x18,%esp
  200316:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  20031a:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  20031e:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  200325:	e8 f3 fe ff ff       	call   20021d <inb_pic>
  20032a:	88 45 fd             	mov    %al,-0x3(%ebp)
  20032d:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  200334:	e8 e4 fe ff ff       	call   20021d <inb_pic>
  200339:	88 45 fc             	mov    %al,-0x4(%ebp)
  20033c:	fa                   	cli    
  20033d:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  200341:	7f 35                	jg     200378 <enable_irq+0x68>
  200343:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  200347:	74 2f                	je     200378 <enable_irq+0x68>
  200349:	8b 45 08             	mov    0x8(%ebp),%eax
  20034c:	ba 01 00 00 00       	mov    $0x1,%edx
  200351:	89 c1                	mov    %eax,%ecx
  200353:	d3 e2                	shl    %cl,%edx
  200355:	89 d0                	mov    %edx,%eax
  200357:	f7 d0                	not    %eax
  200359:	89 c2                	mov    %eax,%edx
  20035b:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  20035f:	21 d0                	and    %edx,%eax
  200361:	88 45 ff             	mov    %al,-0x1(%ebp)
  200364:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200368:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20036f:	00 
  200370:	89 04 24             	mov    %eax,(%esp)
  200373:	e8 7c fe ff ff       	call   2001f4 <outb_pic>
  200378:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  20037c:	7e 56                	jle    2003d4 <enable_irq+0xc4>
  20037e:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  200382:	7f 50                	jg     2003d4 <enable_irq+0xc4>
  200384:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  200388:	83 e0 fb             	and    $0xfffffffb,%eax
  20038b:	88 45 ff             	mov    %al,-0x1(%ebp)
  20038e:	8b 45 08             	mov    0x8(%ebp),%eax
  200391:	83 e8 08             	sub    $0x8,%eax
  200394:	ba 01 00 00 00       	mov    $0x1,%edx
  200399:	89 c1                	mov    %eax,%ecx
  20039b:	d3 e2                	shl    %cl,%edx
  20039d:	89 d0                	mov    %edx,%eax
  20039f:	f7 d0                	not    %eax
  2003a1:	89 c2                	mov    %eax,%edx
  2003a3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2003a7:	21 d0                	and    %edx,%eax
  2003a9:	88 45 fe             	mov    %al,-0x2(%ebp)
  2003ac:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2003b0:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2003b7:	00 
  2003b8:	89 04 24             	mov    %eax,(%esp)
  2003bb:	e8 34 fe ff ff       	call   2001f4 <outb_pic>
  2003c0:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  2003c4:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2003cb:	00 
  2003cc:	89 04 24             	mov    %eax,(%esp)
  2003cf:	e8 20 fe ff ff       	call   2001f4 <outb_pic>
  2003d4:	fb                   	sti    
  2003d5:	90                   	nop
  2003d6:	c9                   	leave  
  2003d7:	c3                   	ret    

002003d8 <disable_irqs>:
  2003d8:	55                   	push   %ebp
  2003d9:	89 e5                	mov    %esp,%ebp
  2003db:	b0 ff                	mov    $0xff,%al
  2003dd:	e6 21                	out    %al,$0x21
  2003df:	e6 a1                	out    %al,$0xa1
  2003e1:	5d                   	pop    %ebp
  2003e2:	c3                   	ret    

002003e3 <EOI_master>:
  2003e3:	55                   	push   %ebp
  2003e4:	89 e5                	mov    %esp,%ebp
  2003e6:	83 ec 08             	sub    $0x8,%esp
  2003e9:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  2003f0:	00 
  2003f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  2003f8:	e8 f7 fd ff ff       	call   2001f4 <outb_pic>
  2003fd:	fb                   	sti    
  2003fe:	c9                   	leave  
  2003ff:	c3                   	ret    

00200400 <EOI_slave>:
  200400:	55                   	push   %ebp
  200401:	89 e5                	mov    %esp,%ebp
  200403:	83 ec 08             	sub    $0x8,%esp
  200406:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20040d:	00 
  20040e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200415:	e8 da fd ff ff       	call   2001f4 <outb_pic>
  20041a:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200421:	00 
  200422:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200429:	e8 c6 fd ff ff       	call   2001f4 <outb_pic>
  20042e:	fb                   	sti    
  20042f:	c9                   	leave  
  200430:	c3                   	ret    
  200431:	66 90                	xchg   %ax,%ax
  200433:	90                   	nop

00200434 <set_gate>:
  200434:	55                   	push   %ebp
  200435:	89 e5                	mov    %esp,%ebp
  200437:	8b 45 18             	mov    0x18(%ebp),%eax
  20043a:	c1 e0 10             	shl    $0x10,%eax
  20043d:	89 c2                	mov    %eax,%edx
  20043f:	8b 45 10             	mov    0x10(%ebp),%eax
  200442:	0f b7 c0             	movzwl %ax,%eax
  200445:	09 c2                	or     %eax,%edx
  200447:	8b 45 08             	mov    0x8(%ebp),%eax
  20044a:	89 10                	mov    %edx,(%eax)
  20044c:	8b 45 10             	mov    0x10(%ebp),%eax
  20044f:	66 b8 00 00          	mov    $0x0,%ax
  200453:	89 c2                	mov    %eax,%edx
  200455:	8b 45 14             	mov    0x14(%ebp),%eax
  200458:	c1 e0 05             	shl    $0x5,%eax
  20045b:	0b 45 0c             	or     0xc(%ebp),%eax
  20045e:	0f b6 c0             	movzbl %al,%eax
  200461:	0c 80                	or     $0x80,%al
  200463:	c1 e0 08             	shl    $0x8,%eax
  200466:	09 c2                	or     %eax,%edx
  200468:	8b 45 08             	mov    0x8(%ebp),%eax
  20046b:	89 50 04             	mov    %edx,0x4(%eax)
  20046e:	5d                   	pop    %ebp
  20046f:	c3                   	ret    

00200470 <set_exception_gate>:
  200470:	55                   	push   %ebp
  200471:	89 e5                	mov    %esp,%ebp
  200473:	83 ec 14             	sub    $0x14,%esp
  200476:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20047d:	00 
  20047e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200485:	00 
  200486:	c7 44 24 08 d3 08 20 	movl   $0x2008d3,0x8(%esp)
  20048d:	00 
  20048e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200495:	00 
  200496:	c7 04 24 a0 41 20 00 	movl   $0x2041a0,(%esp)
  20049d:	e8 92 ff ff ff       	call   200434 <set_gate>
  2004a2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004a9:	00 
  2004aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004b1:	00 
  2004b2:	c7 44 24 08 ef 08 20 	movl   $0x2008ef,0x8(%esp)
  2004b9:	00 
  2004ba:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004c1:	00 
  2004c2:	c7 04 24 a8 41 20 00 	movl   $0x2041a8,(%esp)
  2004c9:	e8 66 ff ff ff       	call   200434 <set_gate>
  2004ce:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004d5:	00 
  2004d6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004dd:	00 
  2004de:	c7 44 24 08 0b 09 20 	movl   $0x20090b,0x8(%esp)
  2004e5:	00 
  2004e6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004ed:	00 
  2004ee:	c7 04 24 b0 41 20 00 	movl   $0x2041b0,(%esp)
  2004f5:	e8 3a ff ff ff       	call   200434 <set_gate>
  2004fa:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200501:	00 
  200502:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200509:	00 
  20050a:	c7 44 24 08 27 09 20 	movl   $0x200927,0x8(%esp)
  200511:	00 
  200512:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200519:	00 
  20051a:	c7 04 24 b8 41 20 00 	movl   $0x2041b8,(%esp)
  200521:	e8 0e ff ff ff       	call   200434 <set_gate>
  200526:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20052d:	00 
  20052e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200535:	00 
  200536:	c7 44 24 08 43 09 20 	movl   $0x200943,0x8(%esp)
  20053d:	00 
  20053e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200545:	00 
  200546:	c7 04 24 c0 41 20 00 	movl   $0x2041c0,(%esp)
  20054d:	e8 e2 fe ff ff       	call   200434 <set_gate>
  200552:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200559:	00 
  20055a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200561:	00 
  200562:	c7 44 24 08 5f 09 20 	movl   $0x20095f,0x8(%esp)
  200569:	00 
  20056a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200571:	00 
  200572:	c7 04 24 c8 41 20 00 	movl   $0x2041c8,(%esp)
  200579:	e8 b6 fe ff ff       	call   200434 <set_gate>
  20057e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200585:	00 
  200586:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20058d:	00 
  20058e:	c7 44 24 08 7b 09 20 	movl   $0x20097b,0x8(%esp)
  200595:	00 
  200596:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20059d:	00 
  20059e:	c7 04 24 d0 41 20 00 	movl   $0x2041d0,(%esp)
  2005a5:	e8 8a fe ff ff       	call   200434 <set_gate>
  2005aa:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005b1:	00 
  2005b2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005b9:	00 
  2005ba:	c7 44 24 08 97 09 20 	movl   $0x200997,0x8(%esp)
  2005c1:	00 
  2005c2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005c9:	00 
  2005ca:	c7 04 24 d8 41 20 00 	movl   $0x2041d8,(%esp)
  2005d1:	e8 5e fe ff ff       	call   200434 <set_gate>
  2005d6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005dd:	00 
  2005de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005e5:	00 
  2005e6:	c7 44 24 08 b3 09 20 	movl   $0x2009b3,0x8(%esp)
  2005ed:	00 
  2005ee:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005f5:	00 
  2005f6:	c7 04 24 e0 41 20 00 	movl   $0x2041e0,(%esp)
  2005fd:	e8 32 fe ff ff       	call   200434 <set_gate>
  200602:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200609:	00 
  20060a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200611:	00 
  200612:	c7 44 24 08 cf 09 20 	movl   $0x2009cf,0x8(%esp)
  200619:	00 
  20061a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200621:	00 
  200622:	c7 04 24 e8 41 20 00 	movl   $0x2041e8,(%esp)
  200629:	e8 06 fe ff ff       	call   200434 <set_gate>
  20062e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200635:	00 
  200636:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20063d:	00 
  20063e:	c7 44 24 08 eb 09 20 	movl   $0x2009eb,0x8(%esp)
  200645:	00 
  200646:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20064d:	00 
  20064e:	c7 04 24 f0 41 20 00 	movl   $0x2041f0,(%esp)
  200655:	e8 da fd ff ff       	call   200434 <set_gate>
  20065a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200661:	00 
  200662:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200669:	00 
  20066a:	c7 44 24 08 07 0a 20 	movl   $0x200a07,0x8(%esp)
  200671:	00 
  200672:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200679:	00 
  20067a:	c7 04 24 f8 41 20 00 	movl   $0x2041f8,(%esp)
  200681:	e8 ae fd ff ff       	call   200434 <set_gate>
  200686:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20068d:	00 
  20068e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200695:	00 
  200696:	c7 44 24 08 23 0a 20 	movl   $0x200a23,0x8(%esp)
  20069d:	00 
  20069e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006a5:	00 
  2006a6:	c7 04 24 00 42 20 00 	movl   $0x204200,(%esp)
  2006ad:	e8 82 fd ff ff       	call   200434 <set_gate>
  2006b2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006b9:	00 
  2006ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006c1:	00 
  2006c2:	c7 44 24 08 3f 0a 20 	movl   $0x200a3f,0x8(%esp)
  2006c9:	00 
  2006ca:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006d1:	00 
  2006d2:	c7 04 24 08 42 20 00 	movl   $0x204208,(%esp)
  2006d9:	e8 56 fd ff ff       	call   200434 <set_gate>
  2006de:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006e5:	00 
  2006e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006ed:	00 
  2006ee:	c7 44 24 08 5b 0a 20 	movl   $0x200a5b,0x8(%esp)
  2006f5:	00 
  2006f6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006fd:	00 
  2006fe:	c7 04 24 10 42 20 00 	movl   $0x204210,(%esp)
  200705:	e8 2a fd ff ff       	call   200434 <set_gate>
  20070a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200711:	00 
  200712:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200719:	00 
  20071a:	c7 44 24 08 77 0a 20 	movl   $0x200a77,0x8(%esp)
  200721:	00 
  200722:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200729:	00 
  20072a:	c7 04 24 18 42 20 00 	movl   $0x204218,(%esp)
  200731:	e8 fe fc ff ff       	call   200434 <set_gate>
  200736:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20073d:	00 
  20073e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200745:	00 
  200746:	c7 44 24 08 93 0a 20 	movl   $0x200a93,0x8(%esp)
  20074d:	00 
  20074e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200755:	00 
  200756:	c7 04 24 20 42 20 00 	movl   $0x204220,(%esp)
  20075d:	e8 d2 fc ff ff       	call   200434 <set_gate>
  200762:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200769:	00 
  20076a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200771:	00 
  200772:	c7 44 24 08 af 0a 20 	movl   $0x200aaf,0x8(%esp)
  200779:	00 
  20077a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200781:	00 
  200782:	c7 04 24 28 42 20 00 	movl   $0x204228,(%esp)
  200789:	e8 a6 fc ff ff       	call   200434 <set_gate>
  20078e:	c9                   	leave  
  20078f:	c3                   	ret    

00200790 <load_idt>:
  200790:	55                   	push   %ebp
  200791:	89 e5                	mov    %esp,%ebp
  200793:	fa                   	cli    
  200794:	0f 01 1d 00 30 20 00 	lidtl  0x203000
  20079b:	90                   	nop
  20079c:	fb                   	sti    
  20079d:	e8 ce fc ff ff       	call   200470 <set_exception_gate>
  2007a2:	90                   	nop
  2007a3:	5d                   	pop    %ebp
  2007a4:	c3                   	ret    

002007a5 <set_intr_gate>:
  2007a5:	55                   	push   %ebp
  2007a6:	89 e5                	mov    %esp,%ebp
  2007a8:	83 ec 38             	sub    $0x38,%esp
  2007ab:	8b 45 08             	mov    0x8(%ebp),%eax
  2007ae:	83 c0 30             	add    $0x30,%eax
  2007b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2007b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007b7:	c1 e0 03             	shl    $0x3,%eax
  2007ba:	8d 90 a0 41 20 00    	lea    0x2041a0(%eax),%edx
  2007c0:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007c7:	00 
  2007c8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2007cf:	00 
  2007d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  2007d3:	89 44 24 08          	mov    %eax,0x8(%esp)
  2007d7:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  2007de:	00 
  2007df:	89 14 24             	mov    %edx,(%esp)
  2007e2:	e8 4d fc ff ff       	call   200434 <set_gate>
  2007e7:	8b 45 08             	mov    0x8(%ebp),%eax
  2007ea:	89 04 24             	mov    %eax,(%esp)
  2007ed:	e8 1e fb ff ff       	call   200310 <enable_irq>
  2007f2:	c9                   	leave  
  2007f3:	c3                   	ret    

002007f4 <irq00_handler>:
  2007f4:	60                   	pusha  
  2007f5:	1e                   	push   %ds
  2007f6:	06                   	push   %es
  2007f7:	0f a0                	push   %fs
  2007f9:	0f a8                	push   %gs
  2007fb:	65 fe 05 00 00 00 00 	incb   %gs:0x0
  200802:	e8 dc fb ff ff       	call   2003e3 <EOI_master>
  200807:	54                   	push   %esp
  200808:	e8 71 f8 ff ff       	call   20007e <set_tss_esp>
  20080d:	83 c4 04             	add    $0x4,%esp
  200810:	0f a9                	pop    %gs
  200812:	0f a1                	pop    %fs
  200814:	07                   	pop    %es
  200815:	1f                   	pop    %ds
  200816:	61                   	popa   
  200817:	cb                   	lret   

00200818 <timer_handler>:
  200818:	55                   	push   %ebp
  200819:	89 e5                	mov    %esp,%ebp
  20081b:	0f b6 05 08 30 20 00 	movzbl 0x203008,%eax
  200822:	3c 7a                	cmp    $0x7a,%al
  200824:	75 07                	jne    20082d <timer_handler+0x15>
  200826:	c6 05 08 30 20 00 41 	movb   $0x41,0x203008
  20082d:	b4 0c                	mov    $0xc,%ah
  20082f:	a0 08 30 20 00       	mov    0x203008,%al
  200834:	65 66 a3 00 0f 00 00 	mov    %ax,%gs:0xf00
  20083b:	b0 20                	mov    $0x20,%al
  20083d:	e6 20                	out    %al,$0x20
  20083f:	0f b6 05 08 30 20 00 	movzbl 0x203008,%eax
  200846:	83 c0 01             	add    $0x1,%eax
  200849:	a2 08 30 20 00       	mov    %al,0x203008
  20084e:	90                   	nop
  20084f:	5d                   	pop    %ebp
  200850:	c3                   	ret    

00200851 <init_timer>:
  200851:	55                   	push   %ebp
  200852:	89 e5                	mov    %esp,%ebp
  200854:	83 ec 18             	sub    $0x18,%esp
  200857:	c7 05 60 e0 20 00 18 	movl   $0x200818,0x20e060
  20085e:	08 20 00 
  200861:	c7 44 24 04 f4 07 20 	movl   $0x2007f4,0x4(%esp)
  200868:	00 
  200869:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200870:	e8 30 ff ff ff       	call   2007a5 <set_intr_gate>
  200875:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  20087c:	e8 8f fa ff ff       	call   200310 <enable_irq>
  200881:	c9                   	leave  
  200882:	c3                   	ret    
  200883:	90                   	nop

00200884 <exception_handler>:
  200884:	55                   	push   %ebp
  200885:	89 e5                	mov    %esp,%ebp
  200887:	83 ec 18             	sub    $0x18,%esp
  20088a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200891:	00 
  200892:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200899:	00 
  20089a:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2008a1:	00 
  2008a2:	c7 04 24 be 0d 20 00 	movl   $0x200dbe,(%esp)
  2008a9:	e8 1e 02 00 00       	call   200acc <dis_str>
  2008ae:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  2008b5:	00 
  2008b6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2008bd:	00 
  2008be:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2008c5:	00 
  2008c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  2008c9:	89 04 24             	mov    %eax,(%esp)
  2008cc:	e8 fb 01 00 00       	call   200acc <dis_str>
  2008d1:	eb fe                	jmp    2008d1 <exception_handler+0x4d>

002008d3 <divide_error>:
  2008d3:	55                   	push   %ebp
  2008d4:	89 e5                	mov    %esp,%ebp
  2008d6:	83 ec 18             	sub    $0x18,%esp
  2008d9:	c7 44 24 04 c9 0d 20 	movl   $0x200dc9,0x4(%esp)
  2008e0:	00 
  2008e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008e8:	e8 97 ff ff ff       	call   200884 <exception_handler>
  2008ed:	c9                   	leave  
  2008ee:	c3                   	ret    

002008ef <single_step_exception>:
  2008ef:	55                   	push   %ebp
  2008f0:	89 e5                	mov    %esp,%ebp
  2008f2:	83 ec 18             	sub    $0x18,%esp
  2008f5:	c7 44 24 04 d6 0d 20 	movl   $0x200dd6,0x4(%esp)
  2008fc:	00 
  2008fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200904:	e8 7b ff ff ff       	call   200884 <exception_handler>
  200909:	c9                   	leave  
  20090a:	c3                   	ret    

0020090b <nmi>:
  20090b:	55                   	push   %ebp
  20090c:	89 e5                	mov    %esp,%ebp
  20090e:	83 ec 18             	sub    $0x18,%esp
  200911:	c7 44 24 04 ec 0d 20 	movl   $0x200dec,0x4(%esp)
  200918:	00 
  200919:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  200920:	e8 5f ff ff ff       	call   200884 <exception_handler>
  200925:	c9                   	leave  
  200926:	c3                   	ret    

00200927 <breakpoint_exception>:
  200927:	55                   	push   %ebp
  200928:	89 e5                	mov    %esp,%ebp
  20092a:	83 ec 18             	sub    $0x18,%esp
  20092d:	c7 44 24 04 f0 0d 20 	movl   $0x200df0,0x4(%esp)
  200934:	00 
  200935:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  20093c:	e8 43 ff ff ff       	call   200884 <exception_handler>
  200941:	c9                   	leave  
  200942:	c3                   	ret    

00200943 <overflow>:
  200943:	55                   	push   %ebp
  200944:	89 e5                	mov    %esp,%ebp
  200946:	83 ec 18             	sub    $0x18,%esp
  200949:	c7 44 24 04 05 0e 20 	movl   $0x200e05,0x4(%esp)
  200950:	00 
  200951:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  200958:	e8 27 ff ff ff       	call   200884 <exception_handler>
  20095d:	c9                   	leave  
  20095e:	c3                   	ret    

0020095f <bounds_check>:
  20095f:	55                   	push   %ebp
  200960:	89 e5                	mov    %esp,%ebp
  200962:	83 ec 18             	sub    $0x18,%esp
  200965:	c7 44 24 04 0e 0e 20 	movl   $0x200e0e,0x4(%esp)
  20096c:	00 
  20096d:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  200974:	e8 0b ff ff ff       	call   200884 <exception_handler>
  200979:	c9                   	leave  
  20097a:	c3                   	ret    

0020097b <inval_opcode>:
  20097b:	55                   	push   %ebp
  20097c:	89 e5                	mov    %esp,%ebp
  20097e:	83 ec 18             	sub    $0x18,%esp
  200981:	c7 44 24 04 1b 0e 20 	movl   $0x200e1b,0x4(%esp)
  200988:	00 
  200989:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  200990:	e8 ef fe ff ff       	call   200884 <exception_handler>
  200995:	c9                   	leave  
  200996:	c3                   	ret    

00200997 <copr_not_available>:
  200997:	55                   	push   %ebp
  200998:	89 e5                	mov    %esp,%ebp
  20099a:	83 ec 18             	sub    $0x18,%esp
  20099d:	c7 44 24 04 28 0e 20 	movl   $0x200e28,0x4(%esp)
  2009a4:	00 
  2009a5:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  2009ac:	e8 d3 fe ff ff       	call   200884 <exception_handler>
  2009b1:	c9                   	leave  
  2009b2:	c3                   	ret    

002009b3 <double_fault>:
  2009b3:	55                   	push   %ebp
  2009b4:	89 e5                	mov    %esp,%ebp
  2009b6:	83 ec 18             	sub    $0x18,%esp
  2009b9:	c7 44 24 04 3b 0e 20 	movl   $0x200e3b,0x4(%esp)
  2009c0:	00 
  2009c1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  2009c8:	e8 b7 fe ff ff       	call   200884 <exception_handler>
  2009cd:	c9                   	leave  
  2009ce:	c3                   	ret    

002009cf <copr_seg_overrun>:
  2009cf:	55                   	push   %ebp
  2009d0:	89 e5                	mov    %esp,%ebp
  2009d2:	83 ec 18             	sub    $0x18,%esp
  2009d5:	c7 44 24 04 48 0e 20 	movl   $0x200e48,0x4(%esp)
  2009dc:	00 
  2009dd:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  2009e4:	e8 9b fe ff ff       	call   200884 <exception_handler>
  2009e9:	c9                   	leave  
  2009ea:	c3                   	ret    

002009eb <inval_tss>:
  2009eb:	55                   	push   %ebp
  2009ec:	89 e5                	mov    %esp,%ebp
  2009ee:	83 ec 18             	sub    $0x18,%esp
  2009f1:	c7 44 24 04 59 0e 20 	movl   $0x200e59,0x4(%esp)
  2009f8:	00 
  2009f9:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200a00:	e8 7f fe ff ff       	call   200884 <exception_handler>
  200a05:	c9                   	leave  
  200a06:	c3                   	ret    

00200a07 <segment_not_present>:
  200a07:	55                   	push   %ebp
  200a08:	89 e5                	mov    %esp,%ebp
  200a0a:	83 ec 18             	sub    $0x18,%esp
  200a0d:	c7 44 24 04 63 0e 20 	movl   $0x200e63,0x4(%esp)
  200a14:	00 
  200a15:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200a1c:	e8 63 fe ff ff       	call   200884 <exception_handler>
  200a21:	c9                   	leave  
  200a22:	c3                   	ret    

00200a23 <stack_exception>:
  200a23:	55                   	push   %ebp
  200a24:	89 e5                	mov    %esp,%ebp
  200a26:	83 ec 18             	sub    $0x18,%esp
  200a29:	c7 44 24 04 77 0e 20 	movl   $0x200e77,0x4(%esp)
  200a30:	00 
  200a31:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200a38:	e8 47 fe ff ff       	call   200884 <exception_handler>
  200a3d:	c9                   	leave  
  200a3e:	c3                   	ret    

00200a3f <general_protection>:
  200a3f:	55                   	push   %ebp
  200a40:	89 e5                	mov    %esp,%ebp
  200a42:	83 ec 18             	sub    $0x18,%esp
  200a45:	c7 44 24 04 87 0e 20 	movl   $0x200e87,0x4(%esp)
  200a4c:	00 
  200a4d:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200a54:	e8 2b fe ff ff       	call   200884 <exception_handler>
  200a59:	c9                   	leave  
  200a5a:	c3                   	ret    

00200a5b <page_fault>:
  200a5b:	55                   	push   %ebp
  200a5c:	89 e5                	mov    %esp,%ebp
  200a5e:	83 ec 18             	sub    $0x18,%esp
  200a61:	c7 44 24 04 9a 0e 20 	movl   $0x200e9a,0x4(%esp)
  200a68:	00 
  200a69:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200a70:	e8 0f fe ff ff       	call   200884 <exception_handler>
  200a75:	c9                   	leave  
  200a76:	c3                   	ret    

00200a77 <copr_error>:
  200a77:	55                   	push   %ebp
  200a78:	89 e5                	mov    %esp,%ebp
  200a7a:	83 ec 18             	sub    $0x18,%esp
  200a7d:	c7 44 24 04 a5 0e 20 	movl   $0x200ea5,0x4(%esp)
  200a84:	00 
  200a85:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200a8c:	e8 f3 fd ff ff       	call   200884 <exception_handler>
  200a91:	c9                   	leave  
  200a92:	c3                   	ret    

00200a93 <float_error>:
  200a93:	55                   	push   %ebp
  200a94:	89 e5                	mov    %esp,%ebp
  200a96:	83 ec 18             	sub    $0x18,%esp
  200a99:	c7 44 24 04 b0 0e 20 	movl   $0x200eb0,0x4(%esp)
  200aa0:	00 
  200aa1:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200aa8:	e8 d7 fd ff ff       	call   200884 <exception_handler>
  200aad:	c9                   	leave  
  200aae:	c3                   	ret    

00200aaf <alignment_check>:
  200aaf:	55                   	push   %ebp
  200ab0:	89 e5                	mov    %esp,%ebp
  200ab2:	83 ec 18             	sub    $0x18,%esp
  200ab5:	c7 44 24 04 bc 0e 20 	movl   $0x200ebc,0x4(%esp)
  200abc:	00 
  200abd:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200ac4:	e8 bb fd ff ff       	call   200884 <exception_handler>
  200ac9:	c9                   	leave  
  200aca:	c3                   	ret    
  200acb:	90                   	nop

00200acc <dis_str>:
  200acc:	55                   	push   %ebp
  200acd:	89 e5                	mov    %esp,%ebp
  200acf:	57                   	push   %edi
  200ad0:	53                   	push   %ebx
  200ad1:	83 ec 30             	sub    $0x30,%esp
  200ad4:	8b 45 0c             	mov    0xc(%ebp),%eax
  200ad7:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200ada:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200ae1:	8b 55 10             	mov    0x10(%ebp),%edx
  200ae4:	89 d0                	mov    %edx,%eax
  200ae6:	c1 e0 02             	shl    $0x2,%eax
  200ae9:	01 d0                	add    %edx,%eax
  200aeb:	c1 e0 04             	shl    $0x4,%eax
  200aee:	89 c2                	mov    %eax,%edx
  200af0:	8b 45 14             	mov    0x14(%ebp),%eax
  200af3:	01 d0                	add    %edx,%eax
  200af5:	01 c0                	add    %eax,%eax
  200af7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200afa:	8b 45 08             	mov    0x8(%ebp),%eax
  200afd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200b00:	8b 45 08             	mov    0x8(%ebp),%eax
  200b03:	89 04 24             	mov    %eax,(%esp)
  200b06:	e8 02 01 00 00       	call   200c0d <strlen>
  200b0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200b0e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200b15:	eb 2e                	jmp    200b45 <dis_str+0x79>
  200b17:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200b1a:	8d 50 01             	lea    0x1(%eax),%edx
  200b1d:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200b20:	0f b6 00             	movzbl (%eax),%eax
  200b23:	88 45 e7             	mov    %al,-0x19(%ebp)
  200b26:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200b2a:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200b2e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200b31:	89 d3                	mov    %edx,%ebx
  200b33:	89 cf                	mov    %ecx,%edi
  200b35:	88 c4                	mov    %al,%ah
  200b37:	88 d8                	mov    %bl,%al
  200b39:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200b3d:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200b41:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b48:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200b4b:	7c ca                	jl     200b17 <dis_str+0x4b>
  200b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b50:	83 c4 30             	add    $0x30,%esp
  200b53:	5b                   	pop    %ebx
  200b54:	5f                   	pop    %edi
  200b55:	5d                   	pop    %ebp
  200b56:	c3                   	ret    

00200b57 <dis_nchar>:
  200b57:	55                   	push   %ebp
  200b58:	89 e5                	mov    %esp,%ebp
  200b5a:	57                   	push   %edi
  200b5b:	53                   	push   %ebx
  200b5c:	83 ec 14             	sub    $0x14,%esp
  200b5f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b62:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200b65:	8b 55 14             	mov    0x14(%ebp),%edx
  200b68:	89 d0                	mov    %edx,%eax
  200b6a:	c1 e0 02             	shl    $0x2,%eax
  200b6d:	01 d0                	add    %edx,%eax
  200b6f:	c1 e0 04             	shl    $0x4,%eax
  200b72:	89 c2                	mov    %eax,%edx
  200b74:	8b 45 18             	mov    0x18(%ebp),%eax
  200b77:	01 d0                	add    %edx,%eax
  200b79:	01 c0                	add    %eax,%eax
  200b7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  200b81:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200b84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200b8b:	eb 2e                	jmp    200bbb <dis_nchar+0x64>
  200b8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200b90:	8d 50 01             	lea    0x1(%eax),%edx
  200b93:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200b96:	0f b6 00             	movzbl (%eax),%eax
  200b99:	88 45 eb             	mov    %al,-0x15(%ebp)
  200b9c:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200ba0:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200ba4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200ba7:	89 d3                	mov    %edx,%ebx
  200ba9:	89 cf                	mov    %ecx,%edi
  200bab:	88 c4                	mov    %al,%ah
  200bad:	88 d8                	mov    %bl,%al
  200baf:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200bb3:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200bb7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bbe:	3b 45 10             	cmp    0x10(%ebp),%eax
  200bc1:	7c ca                	jl     200b8d <dis_nchar+0x36>
  200bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bc6:	83 c4 14             	add    $0x14,%esp
  200bc9:	5b                   	pop    %ebx
  200bca:	5f                   	pop    %edi
  200bcb:	5d                   	pop    %ebp
  200bcc:	c3                   	ret    
  200bcd:	66 90                	xchg   %ax,%ax
  200bcf:	90                   	nop

00200bd0 <memcpy>:
  200bd0:	55                   	push   %ebp
  200bd1:	89 e5                	mov    %esp,%ebp
  200bd3:	83 ec 10             	sub    $0x10,%esp
  200bd6:	8b 45 08             	mov    0x8(%ebp),%eax
  200bd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  200bdf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200be2:	eb 17                	jmp    200bfb <memcpy+0x2b>
  200be4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200be7:	8d 50 01             	lea    0x1(%eax),%edx
  200bea:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200bed:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200bf0:	8d 4a 01             	lea    0x1(%edx),%ecx
  200bf3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200bf6:	0f b6 12             	movzbl (%edx),%edx
  200bf9:	88 10                	mov    %dl,(%eax)
  200bfb:	8b 45 10             	mov    0x10(%ebp),%eax
  200bfe:	8d 50 ff             	lea    -0x1(%eax),%edx
  200c01:	89 55 10             	mov    %edx,0x10(%ebp)
  200c04:	85 c0                	test   %eax,%eax
  200c06:	75 dc                	jne    200be4 <memcpy+0x14>
  200c08:	8b 45 08             	mov    0x8(%ebp),%eax
  200c0b:	c9                   	leave  
  200c0c:	c3                   	ret    

00200c0d <strlen>:
  200c0d:	55                   	push   %ebp
  200c0e:	89 e5                	mov    %esp,%ebp
  200c10:	83 ec 10             	sub    $0x10,%esp
  200c13:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200c1a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c1d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c20:	eb 08                	jmp    200c2a <strlen+0x1d>
  200c22:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200c26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200c2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200c2d:	0f b6 00             	movzbl (%eax),%eax
  200c30:	84 c0                	test   %al,%al
  200c32:	75 ee                	jne    200c22 <strlen+0x15>
  200c34:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c37:	c9                   	leave  
  200c38:	c3                   	ret    

00200c39 <strcmp>:
  200c39:	55                   	push   %ebp
  200c3a:	89 e5                	mov    %esp,%ebp
  200c3c:	eb 0c                	jmp    200c4a <strcmp+0x11>
  200c3e:	8b 45 08             	mov    0x8(%ebp),%eax
  200c41:	0f b6 00             	movzbl (%eax),%eax
  200c44:	84 c0                	test   %al,%al
  200c46:	75 02                	jne    200c4a <strcmp+0x11>
  200c48:	eb 1c                	jmp    200c66 <strcmp+0x2d>
  200c4a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c4d:	8d 50 01             	lea    0x1(%eax),%edx
  200c50:	89 55 08             	mov    %edx,0x8(%ebp)
  200c53:	0f b6 08             	movzbl (%eax),%ecx
  200c56:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c59:	8d 50 01             	lea    0x1(%eax),%edx
  200c5c:	89 55 0c             	mov    %edx,0xc(%ebp)
  200c5f:	0f b6 00             	movzbl (%eax),%eax
  200c62:	38 c1                	cmp    %al,%cl
  200c64:	74 d8                	je     200c3e <strcmp+0x5>
  200c66:	8b 45 08             	mov    0x8(%ebp),%eax
  200c69:	0f b6 00             	movzbl (%eax),%eax
  200c6c:	0f be d0             	movsbl %al,%edx
  200c6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c72:	0f b6 00             	movzbl (%eax),%eax
  200c75:	0f be c0             	movsbl %al,%eax
  200c78:	29 c2                	sub    %eax,%edx
  200c7a:	89 d0                	mov    %edx,%eax
  200c7c:	5d                   	pop    %ebp
  200c7d:	c3                   	ret    

00200c7e <memset>:
  200c7e:	55                   	push   %ebp
  200c7f:	89 e5                	mov    %esp,%ebp
  200c81:	83 ec 10             	sub    $0x10,%esp
  200c84:	8b 45 08             	mov    0x8(%ebp),%eax
  200c87:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c8a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200c91:	eb 12                	jmp    200ca5 <memset+0x27>
  200c93:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200c96:	8d 50 01             	lea    0x1(%eax),%edx
  200c99:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200c9c:	8b 55 0c             	mov    0xc(%ebp),%edx
  200c9f:	88 10                	mov    %dl,(%eax)
  200ca1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200ca5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200ca8:	3b 45 10             	cmp    0x10(%ebp),%eax
  200cab:	72 e6                	jb     200c93 <memset+0x15>
  200cad:	8b 45 08             	mov    0x8(%ebp),%eax
  200cb0:	c9                   	leave  
  200cb1:	c3                   	ret    
  200cb2:	66 90                	xchg   %ax,%ax

00200cb4 <init_thread>:
  200cb4:	55                   	push   %ebp
  200cb5:	89 e5                	mov    %esp,%ebp
  200cb7:	83 ec 28             	sub    $0x28,%esp
  200cba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200cc1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  200cc8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200ccf:	00 
  200cd0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200cd7:	00 
  200cd8:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200cdf:	00 
  200ce0:	c7 04 24 cc 0e 20 00 	movl   $0x200ecc,(%esp)
  200ce7:	e8 e0 fd ff ff       	call   200acc <dis_str>
  200cec:	eb fe                	jmp    200cec <init_thread+0x38>

00200cee <creat_init>:
  200cee:	55                   	push   %ebp
  200cef:	89 e5                	mov    %esp,%ebp
  200cf1:	83 ec 18             	sub    $0x18,%esp
  200cf4:	c7 05 00 50 20 00 00 	movl   $0x0,0x205000
  200cfb:	00 00 00 
  200cfe:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200d05:	00 
  200d06:	c7 44 24 04 df 0e 20 	movl   $0x200edf,0x4(%esp)
  200d0d:	00 
  200d0e:	c7 04 24 08 50 20 00 	movl   $0x205008,(%esp)
  200d15:	e8 b6 fe ff ff       	call   200bd0 <memcpy>
  200d1a:	b8 b4 0c 20 00       	mov    $0x200cb4,%eax
  200d1f:	a3 04 50 20 00       	mov    %eax,0x205004
  200d24:	b8 00 e0 20 00       	mov    $0x20e000,%eax
  200d29:	a3 1c 50 20 00       	mov    %eax,0x20501c
  200d2e:	c7 05 0c e0 20 00 28 	movl   $0x28,0x20e00c
  200d35:	00 00 00 
  200d38:	c7 05 34 e0 20 00 20 	movl   $0x20,0x20e034
  200d3f:	00 00 00 
  200d42:	c7 05 08 e0 20 00 28 	movl   $0x28,0x20e008
  200d49:	00 00 00 
  200d4c:	c7 05 04 e0 20 00 28 	movl   $0x28,0x20e004
  200d53:	00 00 00 
  200d56:	c7 05 3c e0 20 00 28 	movl   $0x28,0x20e03c
  200d5d:	00 00 00 
  200d60:	c7 05 00 e0 20 00 48 	movl   $0x48,0x20e000
  200d67:	00 00 00 
  200d6a:	b8 b4 0c 20 00       	mov    $0x200cb4,%eax
  200d6f:	a3 30 e0 20 00       	mov    %eax,0x20e030
  200d74:	a1 18 50 20 00       	mov    0x205018,%eax
  200d79:	a3 38 e0 20 00       	mov    %eax,0x20e038
  200d7e:	c7 05 40 e0 20 00 02 	movl   $0x1202,0x20e040
  200d85:	12 00 00 
  200d88:	c7 05 44 e0 20 00 00 	movl   $0x205000,0x20e044
  200d8f:	50 20 00 
  200d92:	c7 04 24 00 50 20 00 	movl   $0x205000,(%esp)
  200d99:	e8 02 00 00 00       	call   200da0 <schedule>
  200d9e:	c9                   	leave  
  200d9f:	c3                   	ret    

00200da0 <schedule>:
  200da0:	55                   	push   %ebp
  200da1:	89 e5                	mov    %esp,%ebp
  200da3:	8b 45 08             	mov    0x8(%ebp),%eax
  200da6:	8b 40 1c             	mov    0x1c(%eax),%eax
  200da9:	89 c4                	mov    %eax,%esp
  200dab:	e9 04 00 00 00       	jmp    200db4 <switch_to>
  200db0:	5d                   	pop    %ebp
  200db1:	c3                   	ret    
  200db2:	66 90                	xchg   %ax,%ax

00200db4 <switch_to>:
  200db4:	89 c4                	mov    %eax,%esp
  200db6:	0f a9                	pop    %gs
  200db8:	0f a1                	pop    %fs
  200dba:	07                   	pop    %es
  200dbb:	1f                   	pop    %ds
  200dbc:	61                   	popa   
  200dbd:	cb                   	lret   
