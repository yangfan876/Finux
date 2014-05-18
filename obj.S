
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 88 00 00 00       	call   200093 <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 08             	sub    $0x8,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 25 00 00 00       	call   200044 <load_tss>
  20001f:	e8 bc 03 00 00       	call   2003e0 <disable_irqs>
  200024:	e8 6f 07 00 00       	call   200798 <load_idt>
  200029:	e8 57 08 00 00       	call   200885 <init_timer>
  20002e:	e8 d7 0d 00 00       	call   200e0a <creat_testA>
  200033:	e8 e3 0c 00 00       	call   200d1b <creat_init>
  200038:	ea 00 00 00 00 80 00 	ljmp   $0x80,$0x0
  20003f:	c9                   	leave  
  200040:	c3                   	ret    
  200041:	66 90                	xchg   %ax,%ax
  200043:	90                   	nop

00200044 <load_tss>:
  200044:	55                   	push   %ebp
  200045:	89 e5                	mov    %esp,%ebp
  200047:	83 ec 10             	sub    $0x10,%esp
  20004a:	66 c7 45 fe 40 00    	movw   $0x40,-0x2(%ebp)
  200050:	c7 05 24 41 20 00 ff 	movl   $0x1fffff,0x204124
  200057:	ff 1f 00 
  20005a:	66 c7 05 28 41 20 00 	movw   $0x28,0x204128
  200061:	28 00 
  200063:	66 c7 05 86 41 20 00 	movw   $0x6d,0x204186
  20006a:	6d 00 
  20006c:	c6 05 88 41 20 00 ff 	movb   $0xff,0x204188
  200073:	c7 05 89 41 20 00 69 	movl   $0x69,0x204189
  20007a:	00 00 00 
  20007d:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  200081:	0f 00 d8             	ltr    %ax
  200084:	c9                   	leave  
  200085:	c3                   	ret    

00200086 <set_tss_esp>:
  200086:	55                   	push   %ebp
  200087:	89 e5                	mov    %esp,%ebp
  200089:	8b 45 08             	mov    0x8(%ebp),%eax
  20008c:	a3 24 41 20 00       	mov    %eax,0x204124
  200091:	5d                   	pop    %ebp
  200092:	c3                   	ret    

00200093 <change_gdt>:
  200093:	55                   	push   %ebp
  200094:	89 e5                	mov    %esp,%ebp
  200096:	53                   	push   %ebx
  200097:	83 ec 10             	sub    $0x10,%esp
  20009a:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  2000a0:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  2000a6:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  2000ac:	c7 05 20 40 20 00 ff 	movl   $0xffff,0x204020
  2000b3:	ff 00 00 
  2000b6:	c7 05 24 40 20 00 00 	movl   $0xcf9b00,0x204024
  2000bd:	9b cf 00 
  2000c0:	c7 05 28 40 20 00 ff 	movl   $0xffff,0x204028
  2000c7:	ff 00 00 
  2000ca:	c7 05 2c 40 20 00 00 	movl   $0xcf9300,0x20402c
  2000d1:	93 cf 00 
  2000d4:	c7 05 30 40 20 00 ff 	movl   $0xffff,0x204030
  2000db:	ff 00 00 
  2000de:	c7 05 34 40 20 00 00 	movl   $0xcffa00,0x204034
  2000e5:	fa cf 00 
  2000e8:	c7 05 38 40 20 00 ff 	movl   $0xffff,0x204038
  2000ef:	ff 00 00 
  2000f2:	c7 05 3c 40 20 00 00 	movl   $0xcff200,0x20403c
  2000f9:	f2 cf 00 
  2000fc:	a1 89 41 20 00       	mov    0x204189,%eax
  200101:	83 e8 01             	sub    $0x1,%eax
  200104:	0f b7 c0             	movzwl %ax,%eax
  200107:	ba 20 41 20 00       	mov    $0x204120,%edx
  20010c:	c1 e2 10             	shl    $0x10,%edx
  20010f:	09 d0                	or     %edx,%eax
  200111:	a3 40 40 20 00       	mov    %eax,0x204040
  200116:	a1 89 41 20 00       	mov    0x204189,%eax
  20011b:	83 e8 01             	sub    $0x1,%eax
  20011e:	25 00 00 0f 00       	and    $0xf0000,%eax
  200123:	89 c2                	mov    %eax,%edx
  200125:	b8 20 41 20 00       	mov    $0x204120,%eax
  20012a:	25 00 00 ff 00       	and    $0xff0000,%eax
  20012f:	c1 e8 10             	shr    $0x10,%eax
  200132:	80 cc 89             	or     $0x89,%ah
  200135:	89 c1                	mov    %eax,%ecx
  200137:	b8 20 41 20 00       	mov    $0x204120,%eax
  20013c:	25 00 00 00 ff       	and    $0xff000000,%eax
  200141:	09 c8                	or     %ecx,%eax
  200143:	09 d0                	or     %edx,%eax
  200145:	a3 44 40 20 00       	mov    %eax,0x204044
  20014a:	c7 05 48 40 20 00 ff 	movl   $0x8000ffff,0x204048
  200151:	ff 00 80 
  200154:	c7 05 4c 40 20 00 0b 	movl   $0xf30b,0x20404c
  20015b:	f3 00 00 
  20015e:	66 c7 05 00 41 20 00 	movw   $0xff,0x204100
  200165:	ff 00 
  200167:	b8 00 40 20 00       	mov    $0x204000,%eax
  20016c:	a3 02 41 20 00       	mov    %eax,0x204102
  200171:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  200175:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  200179:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  20017d:	89 d3                	mov    %edx,%ebx
  20017f:	0f 01 15 00 41 20 00 	lgdtl  0x204100
  200186:	8e db                	mov    %ebx,%ds
  200188:	8e c3                	mov    %ebx,%es
  20018a:	8e e3                	mov    %ebx,%fs
  20018c:	8e d3                	mov    %ebx,%ss
  20018e:	8e e9                	mov    %ecx,%gs
  200190:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  200197:	90                   	nop
  200198:	83 c4 10             	add    $0x10,%esp
  20019b:	5b                   	pop    %ebx
  20019c:	5d                   	pop    %ebp
  20019d:	c3                   	ret    
  20019e:	66 90                	xchg   %ax,%ax

002001a0 <cli>:
  2001a0:	55                   	push   %ebp
  2001a1:	89 e5                	mov    %esp,%ebp
  2001a3:	fa                   	cli    
  2001a4:	5d                   	pop    %ebp
  2001a5:	c3                   	ret    

002001a6 <sti>:
  2001a6:	55                   	push   %ebp
  2001a7:	89 e5                	mov    %esp,%ebp
  2001a9:	fb                   	sti    
  2001aa:	5d                   	pop    %ebp
  2001ab:	c3                   	ret    

002001ac <outb>:
  2001ac:	55                   	push   %ebp
  2001ad:	89 e5                	mov    %esp,%ebp
  2001af:	83 ec 08             	sub    $0x8,%esp
  2001b2:	8b 55 08             	mov    0x8(%ebp),%edx
  2001b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001b8:	88 55 fc             	mov    %dl,-0x4(%ebp)
  2001bb:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  2001bf:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2001c3:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2001c7:	ee                   	out    %al,(%dx)
  2001c8:	c9                   	leave  
  2001c9:	c3                   	ret    

002001ca <inb>:
  2001ca:	55                   	push   %ebp
  2001cb:	89 e5                	mov    %esp,%ebp
  2001cd:	83 ec 14             	sub    $0x14,%esp
  2001d0:	8b 45 08             	mov    0x8(%ebp),%eax
  2001d3:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  2001d7:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  2001db:	89 c2                	mov    %eax,%edx
  2001dd:	ec                   	in     (%dx),%al
  2001de:	88 45 ff             	mov    %al,-0x1(%ebp)
  2001e1:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2001e5:	c9                   	leave  
  2001e6:	c3                   	ret    

002001e7 <io_delay>:
  2001e7:	55                   	push   %ebp
  2001e8:	89 e5                	mov    %esp,%ebp
  2001ea:	83 ec 10             	sub    $0x10,%esp
  2001ed:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  2001f3:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  2001f7:	89 c2                	mov    %eax,%edx
  2001f9:	ee                   	out    %al,(%dx)
  2001fa:	c9                   	leave  
  2001fb:	c3                   	ret    

002001fc <outb_pic>:
  2001fc:	55                   	push   %ebp
  2001fd:	89 e5                	mov    %esp,%ebp
  2001ff:	83 ec 0c             	sub    $0xc,%esp
  200202:	8b 45 08             	mov    0x8(%ebp),%eax
  200205:	88 45 fc             	mov    %al,-0x4(%ebp)
  200208:	8b 45 0c             	mov    0xc(%ebp),%eax
  20020b:	0f b7 d0             	movzwl %ax,%edx
  20020e:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  200212:	89 54 24 04          	mov    %edx,0x4(%esp)
  200216:	89 04 24             	mov    %eax,(%esp)
  200219:	e8 8e ff ff ff       	call   2001ac <outb>
  20021e:	e8 c4 ff ff ff       	call   2001e7 <io_delay>
  200223:	c9                   	leave  
  200224:	c3                   	ret    

00200225 <inb_pic>:
  200225:	55                   	push   %ebp
  200226:	89 e5                	mov    %esp,%ebp
  200228:	83 ec 14             	sub    $0x14,%esp
  20022b:	8b 45 08             	mov    0x8(%ebp),%eax
  20022e:	0f b7 c0             	movzwl %ax,%eax
  200231:	89 04 24             	mov    %eax,(%esp)
  200234:	e8 91 ff ff ff       	call   2001ca <inb>
  200239:	88 45 ff             	mov    %al,-0x1(%ebp)
  20023c:	e8 a6 ff ff ff       	call   2001e7 <io_delay>
  200241:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200245:	c9                   	leave  
  200246:	c3                   	ret    

00200247 <Init_8259A>:
  200247:	55                   	push   %ebp
  200248:	89 e5                	mov    %esp,%ebp
  20024a:	83 ec 08             	sub    $0x8,%esp
  20024d:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200254:	00 
  200255:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  20025c:	e8 9b ff ff ff       	call   2001fc <outb_pic>
  200261:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200268:	00 
  200269:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200270:	e8 87 ff ff ff       	call   2001fc <outb_pic>
  200275:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20027c:	00 
  20027d:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  200284:	e8 73 ff ff ff       	call   2001fc <outb_pic>
  200289:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200290:	00 
  200291:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  200298:	e8 5f ff ff ff       	call   2001fc <outb_pic>
  20029d:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002a4:	00 
  2002a5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2002ac:	e8 4b ff ff ff       	call   2001fc <outb_pic>
  2002b1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002b8:	00 
  2002b9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2002c0:	e8 37 ff ff ff       	call   2001fc <outb_pic>
  2002c5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002cc:	00 
  2002cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002d4:	e8 23 ff ff ff       	call   2001fc <outb_pic>
  2002d9:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002e0:	00 
  2002e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002e8:	e8 0f ff ff ff       	call   2001fc <outb_pic>
  2002ed:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002f4:	00 
  2002f5:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  2002fc:	e8 fb fe ff ff       	call   2001fc <outb_pic>
  200301:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200308:	00 
  200309:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200310:	e8 e7 fe ff ff       	call   2001fc <outb_pic>
  200315:	90                   	nop
  200316:	c9                   	leave  
  200317:	c3                   	ret    

00200318 <enable_irq>:
  200318:	55                   	push   %ebp
  200319:	89 e5                	mov    %esp,%ebp
  20031b:	83 ec 18             	sub    $0x18,%esp
  20031e:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  200322:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  200326:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  20032d:	e8 f3 fe ff ff       	call   200225 <inb_pic>
  200332:	88 45 fd             	mov    %al,-0x3(%ebp)
  200335:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  20033c:	e8 e4 fe ff ff       	call   200225 <inb_pic>
  200341:	88 45 fc             	mov    %al,-0x4(%ebp)
  200344:	fa                   	cli    
  200345:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  200349:	7f 35                	jg     200380 <enable_irq+0x68>
  20034b:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  20034f:	74 2f                	je     200380 <enable_irq+0x68>
  200351:	8b 45 08             	mov    0x8(%ebp),%eax
  200354:	ba 01 00 00 00       	mov    $0x1,%edx
  200359:	89 c1                	mov    %eax,%ecx
  20035b:	d3 e2                	shl    %cl,%edx
  20035d:	89 d0                	mov    %edx,%eax
  20035f:	f7 d0                	not    %eax
  200361:	89 c2                	mov    %eax,%edx
  200363:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  200367:	21 d0                	and    %edx,%eax
  200369:	88 45 ff             	mov    %al,-0x1(%ebp)
  20036c:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200370:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200377:	00 
  200378:	89 04 24             	mov    %eax,(%esp)
  20037b:	e8 7c fe ff ff       	call   2001fc <outb_pic>
  200380:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  200384:	7e 56                	jle    2003dc <enable_irq+0xc4>
  200386:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  20038a:	7f 50                	jg     2003dc <enable_irq+0xc4>
  20038c:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  200390:	83 e0 fb             	and    $0xfffffffb,%eax
  200393:	88 45 ff             	mov    %al,-0x1(%ebp)
  200396:	8b 45 08             	mov    0x8(%ebp),%eax
  200399:	83 e8 08             	sub    $0x8,%eax
  20039c:	ba 01 00 00 00       	mov    $0x1,%edx
  2003a1:	89 c1                	mov    %eax,%ecx
  2003a3:	d3 e2                	shl    %cl,%edx
  2003a5:	89 d0                	mov    %edx,%eax
  2003a7:	f7 d0                	not    %eax
  2003a9:	89 c2                	mov    %eax,%edx
  2003ab:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2003af:	21 d0                	and    %edx,%eax
  2003b1:	88 45 fe             	mov    %al,-0x2(%ebp)
  2003b4:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2003b8:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2003bf:	00 
  2003c0:	89 04 24             	mov    %eax,(%esp)
  2003c3:	e8 34 fe ff ff       	call   2001fc <outb_pic>
  2003c8:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  2003cc:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2003d3:	00 
  2003d4:	89 04 24             	mov    %eax,(%esp)
  2003d7:	e8 20 fe ff ff       	call   2001fc <outb_pic>
  2003dc:	fb                   	sti    
  2003dd:	90                   	nop
  2003de:	c9                   	leave  
  2003df:	c3                   	ret    

002003e0 <disable_irqs>:
  2003e0:	55                   	push   %ebp
  2003e1:	89 e5                	mov    %esp,%ebp
  2003e3:	b0 ff                	mov    $0xff,%al
  2003e5:	e6 21                	out    %al,$0x21
  2003e7:	e6 a1                	out    %al,$0xa1
  2003e9:	5d                   	pop    %ebp
  2003ea:	c3                   	ret    

002003eb <EOI_master>:
  2003eb:	55                   	push   %ebp
  2003ec:	89 e5                	mov    %esp,%ebp
  2003ee:	83 ec 08             	sub    $0x8,%esp
  2003f1:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  2003f8:	00 
  2003f9:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200400:	e8 f7 fd ff ff       	call   2001fc <outb_pic>
  200405:	fb                   	sti    
  200406:	c9                   	leave  
  200407:	c3                   	ret    

00200408 <EOI_slave>:
  200408:	55                   	push   %ebp
  200409:	89 e5                	mov    %esp,%ebp
  20040b:	83 ec 08             	sub    $0x8,%esp
  20040e:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200415:	00 
  200416:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  20041d:	e8 da fd ff ff       	call   2001fc <outb_pic>
  200422:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200429:	00 
  20042a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200431:	e8 c6 fd ff ff       	call   2001fc <outb_pic>
  200436:	fb                   	sti    
  200437:	c9                   	leave  
  200438:	c3                   	ret    
  200439:	66 90                	xchg   %ax,%ax
  20043b:	90                   	nop

0020043c <set_gate>:
  20043c:	55                   	push   %ebp
  20043d:	89 e5                	mov    %esp,%ebp
  20043f:	8b 45 18             	mov    0x18(%ebp),%eax
  200442:	c1 e0 10             	shl    $0x10,%eax
  200445:	89 c2                	mov    %eax,%edx
  200447:	8b 45 10             	mov    0x10(%ebp),%eax
  20044a:	0f b7 c0             	movzwl %ax,%eax
  20044d:	09 c2                	or     %eax,%edx
  20044f:	8b 45 08             	mov    0x8(%ebp),%eax
  200452:	89 10                	mov    %edx,(%eax)
  200454:	8b 45 10             	mov    0x10(%ebp),%eax
  200457:	66 b8 00 00          	mov    $0x0,%ax
  20045b:	89 c2                	mov    %eax,%edx
  20045d:	8b 45 14             	mov    0x14(%ebp),%eax
  200460:	c1 e0 05             	shl    $0x5,%eax
  200463:	0b 45 0c             	or     0xc(%ebp),%eax
  200466:	0f b6 c0             	movzbl %al,%eax
  200469:	0c 80                	or     $0x80,%al
  20046b:	c1 e0 08             	shl    $0x8,%eax
  20046e:	09 c2                	or     %eax,%edx
  200470:	8b 45 08             	mov    0x8(%ebp),%eax
  200473:	89 50 04             	mov    %edx,0x4(%eax)
  200476:	5d                   	pop    %ebp
  200477:	c3                   	ret    

00200478 <set_exception_gate>:
  200478:	55                   	push   %ebp
  200479:	89 e5                	mov    %esp,%ebp
  20047b:	83 ec 14             	sub    $0x14,%esp
  20047e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200485:	00 
  200486:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20048d:	00 
  20048e:	c7 44 24 08 07 09 20 	movl   $0x200907,0x8(%esp)
  200495:	00 
  200496:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20049d:	00 
  20049e:	c7 04 24 a0 41 20 00 	movl   $0x2041a0,(%esp)
  2004a5:	e8 92 ff ff ff       	call   20043c <set_gate>
  2004aa:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004b1:	00 
  2004b2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004b9:	00 
  2004ba:	c7 44 24 08 23 09 20 	movl   $0x200923,0x8(%esp)
  2004c1:	00 
  2004c2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004c9:	00 
  2004ca:	c7 04 24 a8 41 20 00 	movl   $0x2041a8,(%esp)
  2004d1:	e8 66 ff ff ff       	call   20043c <set_gate>
  2004d6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004dd:	00 
  2004de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004e5:	00 
  2004e6:	c7 44 24 08 3f 09 20 	movl   $0x20093f,0x8(%esp)
  2004ed:	00 
  2004ee:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004f5:	00 
  2004f6:	c7 04 24 b0 41 20 00 	movl   $0x2041b0,(%esp)
  2004fd:	e8 3a ff ff ff       	call   20043c <set_gate>
  200502:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200509:	00 
  20050a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200511:	00 
  200512:	c7 44 24 08 5b 09 20 	movl   $0x20095b,0x8(%esp)
  200519:	00 
  20051a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200521:	00 
  200522:	c7 04 24 b8 41 20 00 	movl   $0x2041b8,(%esp)
  200529:	e8 0e ff ff ff       	call   20043c <set_gate>
  20052e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200535:	00 
  200536:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20053d:	00 
  20053e:	c7 44 24 08 77 09 20 	movl   $0x200977,0x8(%esp)
  200545:	00 
  200546:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20054d:	00 
  20054e:	c7 04 24 c0 41 20 00 	movl   $0x2041c0,(%esp)
  200555:	e8 e2 fe ff ff       	call   20043c <set_gate>
  20055a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200561:	00 
  200562:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200569:	00 
  20056a:	c7 44 24 08 93 09 20 	movl   $0x200993,0x8(%esp)
  200571:	00 
  200572:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200579:	00 
  20057a:	c7 04 24 c8 41 20 00 	movl   $0x2041c8,(%esp)
  200581:	e8 b6 fe ff ff       	call   20043c <set_gate>
  200586:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20058d:	00 
  20058e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200595:	00 
  200596:	c7 44 24 08 af 09 20 	movl   $0x2009af,0x8(%esp)
  20059d:	00 
  20059e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005a5:	00 
  2005a6:	c7 04 24 d0 41 20 00 	movl   $0x2041d0,(%esp)
  2005ad:	e8 8a fe ff ff       	call   20043c <set_gate>
  2005b2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005b9:	00 
  2005ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005c1:	00 
  2005c2:	c7 44 24 08 cb 09 20 	movl   $0x2009cb,0x8(%esp)
  2005c9:	00 
  2005ca:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005d1:	00 
  2005d2:	c7 04 24 d8 41 20 00 	movl   $0x2041d8,(%esp)
  2005d9:	e8 5e fe ff ff       	call   20043c <set_gate>
  2005de:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005e5:	00 
  2005e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005ed:	00 
  2005ee:	c7 44 24 08 e7 09 20 	movl   $0x2009e7,0x8(%esp)
  2005f5:	00 
  2005f6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005fd:	00 
  2005fe:	c7 04 24 e0 41 20 00 	movl   $0x2041e0,(%esp)
  200605:	e8 32 fe ff ff       	call   20043c <set_gate>
  20060a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200611:	00 
  200612:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200619:	00 
  20061a:	c7 44 24 08 03 0a 20 	movl   $0x200a03,0x8(%esp)
  200621:	00 
  200622:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200629:	00 
  20062a:	c7 04 24 e8 41 20 00 	movl   $0x2041e8,(%esp)
  200631:	e8 06 fe ff ff       	call   20043c <set_gate>
  200636:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20063d:	00 
  20063e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200645:	00 
  200646:	c7 44 24 08 1f 0a 20 	movl   $0x200a1f,0x8(%esp)
  20064d:	00 
  20064e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200655:	00 
  200656:	c7 04 24 f0 41 20 00 	movl   $0x2041f0,(%esp)
  20065d:	e8 da fd ff ff       	call   20043c <set_gate>
  200662:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200669:	00 
  20066a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200671:	00 
  200672:	c7 44 24 08 3b 0a 20 	movl   $0x200a3b,0x8(%esp)
  200679:	00 
  20067a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200681:	00 
  200682:	c7 04 24 f8 41 20 00 	movl   $0x2041f8,(%esp)
  200689:	e8 ae fd ff ff       	call   20043c <set_gate>
  20068e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200695:	00 
  200696:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20069d:	00 
  20069e:	c7 44 24 08 57 0a 20 	movl   $0x200a57,0x8(%esp)
  2006a5:	00 
  2006a6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006ad:	00 
  2006ae:	c7 04 24 00 42 20 00 	movl   $0x204200,(%esp)
  2006b5:	e8 82 fd ff ff       	call   20043c <set_gate>
  2006ba:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006c1:	00 
  2006c2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006c9:	00 
  2006ca:	c7 44 24 08 73 0a 20 	movl   $0x200a73,0x8(%esp)
  2006d1:	00 
  2006d2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006d9:	00 
  2006da:	c7 04 24 08 42 20 00 	movl   $0x204208,(%esp)
  2006e1:	e8 56 fd ff ff       	call   20043c <set_gate>
  2006e6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006ed:	00 
  2006ee:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006f5:	00 
  2006f6:	c7 44 24 08 8f 0a 20 	movl   $0x200a8f,0x8(%esp)
  2006fd:	00 
  2006fe:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200705:	00 
  200706:	c7 04 24 10 42 20 00 	movl   $0x204210,(%esp)
  20070d:	e8 2a fd ff ff       	call   20043c <set_gate>
  200712:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200719:	00 
  20071a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200721:	00 
  200722:	c7 44 24 08 ab 0a 20 	movl   $0x200aab,0x8(%esp)
  200729:	00 
  20072a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200731:	00 
  200732:	c7 04 24 18 42 20 00 	movl   $0x204218,(%esp)
  200739:	e8 fe fc ff ff       	call   20043c <set_gate>
  20073e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200745:	00 
  200746:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20074d:	00 
  20074e:	c7 44 24 08 c7 0a 20 	movl   $0x200ac7,0x8(%esp)
  200755:	00 
  200756:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20075d:	00 
  20075e:	c7 04 24 20 42 20 00 	movl   $0x204220,(%esp)
  200765:	e8 d2 fc ff ff       	call   20043c <set_gate>
  20076a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200771:	00 
  200772:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200779:	00 
  20077a:	c7 44 24 08 e3 0a 20 	movl   $0x200ae3,0x8(%esp)
  200781:	00 
  200782:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200789:	00 
  20078a:	c7 04 24 28 42 20 00 	movl   $0x204228,(%esp)
  200791:	e8 a6 fc ff ff       	call   20043c <set_gate>
  200796:	c9                   	leave  
  200797:	c3                   	ret    

00200798 <load_idt>:
  200798:	55                   	push   %ebp
  200799:	89 e5                	mov    %esp,%ebp
  20079b:	fa                   	cli    
  20079c:	0f 01 1d 00 30 20 00 	lidtl  0x203000
  2007a3:	90                   	nop
  2007a4:	fb                   	sti    
  2007a5:	e8 ce fc ff ff       	call   200478 <set_exception_gate>
  2007aa:	90                   	nop
  2007ab:	5d                   	pop    %ebp
  2007ac:	c3                   	ret    

002007ad <set_intr_gate>:
  2007ad:	55                   	push   %ebp
  2007ae:	89 e5                	mov    %esp,%ebp
  2007b0:	83 ec 38             	sub    $0x38,%esp
  2007b3:	8b 45 08             	mov    0x8(%ebp),%eax
  2007b6:	83 c0 30             	add    $0x30,%eax
  2007b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2007bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007bf:	c1 e0 03             	shl    $0x3,%eax
  2007c2:	8d 90 a0 41 20 00    	lea    0x2041a0(%eax),%edx
  2007c8:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007cf:	00 
  2007d0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2007d7:	00 
  2007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  2007db:	89 44 24 08          	mov    %eax,0x8(%esp)
  2007df:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  2007e6:	00 
  2007e7:	89 14 24             	mov    %edx,(%esp)
  2007ea:	e8 4d fc ff ff       	call   20043c <set_gate>
  2007ef:	8b 45 08             	mov    0x8(%ebp),%eax
  2007f2:	89 04 24             	mov    %eax,(%esp)
  2007f5:	e8 1e fb ff ff       	call   200318 <enable_irq>
  2007fa:	c9                   	leave  
  2007fb:	c3                   	ret    

002007fc <irq00_handler>:
  2007fc:	60                   	pusha  
  2007fd:	1e                   	push   %ds
  2007fe:	06                   	push   %es
  2007ff:	0f a0                	push   %fs
  200801:	0f a8                	push   %gs
  200803:	a1 00 80 21 00       	mov    0x218000,%eax
  200808:	89 20                	mov    %esp,(%eax)
  20080a:	65 fe 05 00 0f 00 00 	incb   %gs:0xf00
  200811:	e8 d5 fb ff ff       	call   2003eb <EOI_master>
  200816:	e8 11 00 00 00       	call   20082c <timer_handler>
  20081b:	a1 00 80 21 00       	mov    0x218000,%eax
  200820:	8b 20                	mov    (%eax),%esp
  200822:	0f a9                	pop    %gs
  200824:	0f a1                	pop    %fs
  200826:	07                   	pop    %es
  200827:	1f                   	pop    %ds
  200828:	61                   	popa   
  200829:	cb                   	lret   
  20082a:	66 90                	xchg   %ax,%ax

0020082c <timer_handler>:
  20082c:	55                   	push   %ebp
  20082d:	89 e5                	mov    %esp,%ebp
  20082f:	a1 08 30 20 00       	mov    0x203008,%eax
  200834:	83 c0 01             	add    $0x1,%eax
  200837:	a3 08 30 20 00       	mov    %eax,0x203008
  20083c:	8b 0d 08 30 20 00    	mov    0x203008,%ecx
  200842:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  200847:	89 c8                	mov    %ecx,%eax
  200849:	f7 e2                	mul    %edx
  20084b:	c1 ea 04             	shr    $0x4,%edx
  20084e:	89 d0                	mov    %edx,%eax
  200850:	c1 e0 02             	shl    $0x2,%eax
  200853:	01 d0                	add    %edx,%eax
  200855:	c1 e0 02             	shl    $0x2,%eax
  200858:	29 c1                	sub    %eax,%ecx
  20085a:	89 ca                	mov    %ecx,%edx
  20085c:	85 d2                	test   %edx,%edx
  20085e:	75 22                	jne    200882 <timer_handler+0x56>
  200860:	a1 00 80 21 00       	mov    0x218000,%eax
  200865:	3d 00 70 21 00       	cmp    $0x217000,%eax
  20086a:	75 0c                	jne    200878 <timer_handler+0x4c>
  20086c:	c7 05 00 80 21 00 00 	movl   $0x205000,0x218000
  200873:	50 20 00 
  200876:	eb 0a                	jmp    200882 <timer_handler+0x56>
  200878:	c7 05 00 80 21 00 00 	movl   $0x217000,0x218000
  20087f:	70 21 00 
  200882:	90                   	nop
  200883:	5d                   	pop    %ebp
  200884:	c3                   	ret    

00200885 <init_timer>:
  200885:	55                   	push   %ebp
  200886:	89 e5                	mov    %esp,%ebp
  200888:	83 ec 18             	sub    $0x18,%esp
  20088b:	c7 05 a0 49 20 00 2c 	movl   $0x20082c,0x2049a0
  200892:	08 20 00 
  200895:	c7 44 24 04 fc 07 20 	movl   $0x2007fc,0x4(%esp)
  20089c:	00 
  20089d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008a4:	e8 04 ff ff ff       	call   2007ad <set_intr_gate>
  2008a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008b0:	e8 63 fa ff ff       	call   200318 <enable_irq>
  2008b5:	c9                   	leave  
  2008b6:	c3                   	ret    
  2008b7:	90                   	nop

002008b8 <exception_handler>:
  2008b8:	55                   	push   %ebp
  2008b9:	89 e5                	mov    %esp,%ebp
  2008bb:	83 ec 18             	sub    $0x18,%esp
  2008be:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2008c5:	00 
  2008c6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2008cd:	00 
  2008ce:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2008d5:	00 
  2008d6:	c7 04 24 ce 0e 20 00 	movl   $0x200ece,(%esp)
  2008dd:	e8 1e 02 00 00       	call   200b00 <dis_str>
  2008e2:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  2008e9:	00 
  2008ea:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2008f1:	00 
  2008f2:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2008f9:	00 
  2008fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  2008fd:	89 04 24             	mov    %eax,(%esp)
  200900:	e8 fb 01 00 00       	call   200b00 <dis_str>
  200905:	eb fe                	jmp    200905 <exception_handler+0x4d>

00200907 <divide_error>:
  200907:	55                   	push   %ebp
  200908:	89 e5                	mov    %esp,%ebp
  20090a:	83 ec 18             	sub    $0x18,%esp
  20090d:	c7 44 24 04 d9 0e 20 	movl   $0x200ed9,0x4(%esp)
  200914:	00 
  200915:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  20091c:	e8 97 ff ff ff       	call   2008b8 <exception_handler>
  200921:	c9                   	leave  
  200922:	c3                   	ret    

00200923 <single_step_exception>:
  200923:	55                   	push   %ebp
  200924:	89 e5                	mov    %esp,%ebp
  200926:	83 ec 18             	sub    $0x18,%esp
  200929:	c7 44 24 04 e6 0e 20 	movl   $0x200ee6,0x4(%esp)
  200930:	00 
  200931:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200938:	e8 7b ff ff ff       	call   2008b8 <exception_handler>
  20093d:	c9                   	leave  
  20093e:	c3                   	ret    

0020093f <nmi>:
  20093f:	55                   	push   %ebp
  200940:	89 e5                	mov    %esp,%ebp
  200942:	83 ec 18             	sub    $0x18,%esp
  200945:	c7 44 24 04 fc 0e 20 	movl   $0x200efc,0x4(%esp)
  20094c:	00 
  20094d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  200954:	e8 5f ff ff ff       	call   2008b8 <exception_handler>
  200959:	c9                   	leave  
  20095a:	c3                   	ret    

0020095b <breakpoint_exception>:
  20095b:	55                   	push   %ebp
  20095c:	89 e5                	mov    %esp,%ebp
  20095e:	83 ec 18             	sub    $0x18,%esp
  200961:	c7 44 24 04 00 0f 20 	movl   $0x200f00,0x4(%esp)
  200968:	00 
  200969:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200970:	e8 43 ff ff ff       	call   2008b8 <exception_handler>
  200975:	c9                   	leave  
  200976:	c3                   	ret    

00200977 <overflow>:
  200977:	55                   	push   %ebp
  200978:	89 e5                	mov    %esp,%ebp
  20097a:	83 ec 18             	sub    $0x18,%esp
  20097d:	c7 44 24 04 15 0f 20 	movl   $0x200f15,0x4(%esp)
  200984:	00 
  200985:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  20098c:	e8 27 ff ff ff       	call   2008b8 <exception_handler>
  200991:	c9                   	leave  
  200992:	c3                   	ret    

00200993 <bounds_check>:
  200993:	55                   	push   %ebp
  200994:	89 e5                	mov    %esp,%ebp
  200996:	83 ec 18             	sub    $0x18,%esp
  200999:	c7 44 24 04 1e 0f 20 	movl   $0x200f1e,0x4(%esp)
  2009a0:	00 
  2009a1:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  2009a8:	e8 0b ff ff ff       	call   2008b8 <exception_handler>
  2009ad:	c9                   	leave  
  2009ae:	c3                   	ret    

002009af <inval_opcode>:
  2009af:	55                   	push   %ebp
  2009b0:	89 e5                	mov    %esp,%ebp
  2009b2:	83 ec 18             	sub    $0x18,%esp
  2009b5:	c7 44 24 04 2b 0f 20 	movl   $0x200f2b,0x4(%esp)
  2009bc:	00 
  2009bd:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  2009c4:	e8 ef fe ff ff       	call   2008b8 <exception_handler>
  2009c9:	c9                   	leave  
  2009ca:	c3                   	ret    

002009cb <copr_not_available>:
  2009cb:	55                   	push   %ebp
  2009cc:	89 e5                	mov    %esp,%ebp
  2009ce:	83 ec 18             	sub    $0x18,%esp
  2009d1:	c7 44 24 04 38 0f 20 	movl   $0x200f38,0x4(%esp)
  2009d8:	00 
  2009d9:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  2009e0:	e8 d3 fe ff ff       	call   2008b8 <exception_handler>
  2009e5:	c9                   	leave  
  2009e6:	c3                   	ret    

002009e7 <double_fault>:
  2009e7:	55                   	push   %ebp
  2009e8:	89 e5                	mov    %esp,%ebp
  2009ea:	83 ec 18             	sub    $0x18,%esp
  2009ed:	c7 44 24 04 4b 0f 20 	movl   $0x200f4b,0x4(%esp)
  2009f4:	00 
  2009f5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  2009fc:	e8 b7 fe ff ff       	call   2008b8 <exception_handler>
  200a01:	c9                   	leave  
  200a02:	c3                   	ret    

00200a03 <copr_seg_overrun>:
  200a03:	55                   	push   %ebp
  200a04:	89 e5                	mov    %esp,%ebp
  200a06:	83 ec 18             	sub    $0x18,%esp
  200a09:	c7 44 24 04 58 0f 20 	movl   $0x200f58,0x4(%esp)
  200a10:	00 
  200a11:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200a18:	e8 9b fe ff ff       	call   2008b8 <exception_handler>
  200a1d:	c9                   	leave  
  200a1e:	c3                   	ret    

00200a1f <inval_tss>:
  200a1f:	55                   	push   %ebp
  200a20:	89 e5                	mov    %esp,%ebp
  200a22:	83 ec 18             	sub    $0x18,%esp
  200a25:	c7 44 24 04 69 0f 20 	movl   $0x200f69,0x4(%esp)
  200a2c:	00 
  200a2d:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200a34:	e8 7f fe ff ff       	call   2008b8 <exception_handler>
  200a39:	c9                   	leave  
  200a3a:	c3                   	ret    

00200a3b <segment_not_present>:
  200a3b:	55                   	push   %ebp
  200a3c:	89 e5                	mov    %esp,%ebp
  200a3e:	83 ec 18             	sub    $0x18,%esp
  200a41:	c7 44 24 04 73 0f 20 	movl   $0x200f73,0x4(%esp)
  200a48:	00 
  200a49:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200a50:	e8 63 fe ff ff       	call   2008b8 <exception_handler>
  200a55:	c9                   	leave  
  200a56:	c3                   	ret    

00200a57 <stack_exception>:
  200a57:	55                   	push   %ebp
  200a58:	89 e5                	mov    %esp,%ebp
  200a5a:	83 ec 18             	sub    $0x18,%esp
  200a5d:	c7 44 24 04 87 0f 20 	movl   $0x200f87,0x4(%esp)
  200a64:	00 
  200a65:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200a6c:	e8 47 fe ff ff       	call   2008b8 <exception_handler>
  200a71:	c9                   	leave  
  200a72:	c3                   	ret    

00200a73 <general_protection>:
  200a73:	55                   	push   %ebp
  200a74:	89 e5                	mov    %esp,%ebp
  200a76:	83 ec 18             	sub    $0x18,%esp
  200a79:	c7 44 24 04 97 0f 20 	movl   $0x200f97,0x4(%esp)
  200a80:	00 
  200a81:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200a88:	e8 2b fe ff ff       	call   2008b8 <exception_handler>
  200a8d:	c9                   	leave  
  200a8e:	c3                   	ret    

00200a8f <page_fault>:
  200a8f:	55                   	push   %ebp
  200a90:	89 e5                	mov    %esp,%ebp
  200a92:	83 ec 18             	sub    $0x18,%esp
  200a95:	c7 44 24 04 aa 0f 20 	movl   $0x200faa,0x4(%esp)
  200a9c:	00 
  200a9d:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200aa4:	e8 0f fe ff ff       	call   2008b8 <exception_handler>
  200aa9:	c9                   	leave  
  200aaa:	c3                   	ret    

00200aab <copr_error>:
  200aab:	55                   	push   %ebp
  200aac:	89 e5                	mov    %esp,%ebp
  200aae:	83 ec 18             	sub    $0x18,%esp
  200ab1:	c7 44 24 04 b5 0f 20 	movl   $0x200fb5,0x4(%esp)
  200ab8:	00 
  200ab9:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200ac0:	e8 f3 fd ff ff       	call   2008b8 <exception_handler>
  200ac5:	c9                   	leave  
  200ac6:	c3                   	ret    

00200ac7 <float_error>:
  200ac7:	55                   	push   %ebp
  200ac8:	89 e5                	mov    %esp,%ebp
  200aca:	83 ec 18             	sub    $0x18,%esp
  200acd:	c7 44 24 04 c0 0f 20 	movl   $0x200fc0,0x4(%esp)
  200ad4:	00 
  200ad5:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200adc:	e8 d7 fd ff ff       	call   2008b8 <exception_handler>
  200ae1:	c9                   	leave  
  200ae2:	c3                   	ret    

00200ae3 <alignment_check>:
  200ae3:	55                   	push   %ebp
  200ae4:	89 e5                	mov    %esp,%ebp
  200ae6:	83 ec 18             	sub    $0x18,%esp
  200ae9:	c7 44 24 04 cc 0f 20 	movl   $0x200fcc,0x4(%esp)
  200af0:	00 
  200af1:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200af8:	e8 bb fd ff ff       	call   2008b8 <exception_handler>
  200afd:	c9                   	leave  
  200afe:	c3                   	ret    
  200aff:	90                   	nop

00200b00 <dis_str>:
  200b00:	55                   	push   %ebp
  200b01:	89 e5                	mov    %esp,%ebp
  200b03:	57                   	push   %edi
  200b04:	53                   	push   %ebx
  200b05:	83 ec 30             	sub    $0x30,%esp
  200b08:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b0b:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200b0e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200b15:	8b 55 10             	mov    0x10(%ebp),%edx
  200b18:	89 d0                	mov    %edx,%eax
  200b1a:	c1 e0 02             	shl    $0x2,%eax
  200b1d:	01 d0                	add    %edx,%eax
  200b1f:	c1 e0 04             	shl    $0x4,%eax
  200b22:	89 c2                	mov    %eax,%edx
  200b24:	8b 45 14             	mov    0x14(%ebp),%eax
  200b27:	01 d0                	add    %edx,%eax
  200b29:	01 c0                	add    %eax,%eax
  200b2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200b2e:	8b 45 08             	mov    0x8(%ebp),%eax
  200b31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200b34:	8b 45 08             	mov    0x8(%ebp),%eax
  200b37:	89 04 24             	mov    %eax,(%esp)
  200b3a:	e8 02 01 00 00       	call   200c41 <strlen>
  200b3f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200b42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200b49:	eb 2e                	jmp    200b79 <dis_str+0x79>
  200b4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200b4e:	8d 50 01             	lea    0x1(%eax),%edx
  200b51:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200b54:	0f b6 00             	movzbl (%eax),%eax
  200b57:	88 45 e7             	mov    %al,-0x19(%ebp)
  200b5a:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200b5e:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200b62:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200b65:	89 d3                	mov    %edx,%ebx
  200b67:	89 cf                	mov    %ecx,%edi
  200b69:	88 c4                	mov    %al,%ah
  200b6b:	88 d8                	mov    %bl,%al
  200b6d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200b71:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200b75:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b7c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200b7f:	7c ca                	jl     200b4b <dis_str+0x4b>
  200b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b84:	83 c4 30             	add    $0x30,%esp
  200b87:	5b                   	pop    %ebx
  200b88:	5f                   	pop    %edi
  200b89:	5d                   	pop    %ebp
  200b8a:	c3                   	ret    

00200b8b <dis_nchar>:
  200b8b:	55                   	push   %ebp
  200b8c:	89 e5                	mov    %esp,%ebp
  200b8e:	57                   	push   %edi
  200b8f:	53                   	push   %ebx
  200b90:	83 ec 14             	sub    $0x14,%esp
  200b93:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b96:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200b99:	8b 55 14             	mov    0x14(%ebp),%edx
  200b9c:	89 d0                	mov    %edx,%eax
  200b9e:	c1 e0 02             	shl    $0x2,%eax
  200ba1:	01 d0                	add    %edx,%eax
  200ba3:	c1 e0 04             	shl    $0x4,%eax
  200ba6:	89 c2                	mov    %eax,%edx
  200ba8:	8b 45 18             	mov    0x18(%ebp),%eax
  200bab:	01 d0                	add    %edx,%eax
  200bad:	01 c0                	add    %eax,%eax
  200baf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  200bb5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200bb8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200bbf:	eb 2e                	jmp    200bef <dis_nchar+0x64>
  200bc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200bc4:	8d 50 01             	lea    0x1(%eax),%edx
  200bc7:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200bca:	0f b6 00             	movzbl (%eax),%eax
  200bcd:	88 45 eb             	mov    %al,-0x15(%ebp)
  200bd0:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200bd4:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200bd8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200bdb:	89 d3                	mov    %edx,%ebx
  200bdd:	89 cf                	mov    %ecx,%edi
  200bdf:	88 c4                	mov    %al,%ah
  200be1:	88 d8                	mov    %bl,%al
  200be3:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200be7:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200beb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bf2:	3b 45 10             	cmp    0x10(%ebp),%eax
  200bf5:	7c ca                	jl     200bc1 <dis_nchar+0x36>
  200bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bfa:	83 c4 14             	add    $0x14,%esp
  200bfd:	5b                   	pop    %ebx
  200bfe:	5f                   	pop    %edi
  200bff:	5d                   	pop    %ebp
  200c00:	c3                   	ret    
  200c01:	66 90                	xchg   %ax,%ax
  200c03:	90                   	nop

00200c04 <memcpy>:
  200c04:	55                   	push   %ebp
  200c05:	89 e5                	mov    %esp,%ebp
  200c07:	83 ec 10             	sub    $0x10,%esp
  200c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c0d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200c10:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c13:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c16:	eb 17                	jmp    200c2f <memcpy+0x2b>
  200c18:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c1b:	8d 50 01             	lea    0x1(%eax),%edx
  200c1e:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200c21:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200c24:	8d 4a 01             	lea    0x1(%edx),%ecx
  200c27:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200c2a:	0f b6 12             	movzbl (%edx),%edx
  200c2d:	88 10                	mov    %dl,(%eax)
  200c2f:	8b 45 10             	mov    0x10(%ebp),%eax
  200c32:	8d 50 ff             	lea    -0x1(%eax),%edx
  200c35:	89 55 10             	mov    %edx,0x10(%ebp)
  200c38:	85 c0                	test   %eax,%eax
  200c3a:	75 dc                	jne    200c18 <memcpy+0x14>
  200c3c:	8b 45 08             	mov    0x8(%ebp),%eax
  200c3f:	c9                   	leave  
  200c40:	c3                   	ret    

00200c41 <strlen>:
  200c41:	55                   	push   %ebp
  200c42:	89 e5                	mov    %esp,%ebp
  200c44:	83 ec 10             	sub    $0x10,%esp
  200c47:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200c4e:	8b 45 08             	mov    0x8(%ebp),%eax
  200c51:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c54:	eb 08                	jmp    200c5e <strlen+0x1d>
  200c56:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200c5a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200c5e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200c61:	0f b6 00             	movzbl (%eax),%eax
  200c64:	84 c0                	test   %al,%al
  200c66:	75 ee                	jne    200c56 <strlen+0x15>
  200c68:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c6b:	c9                   	leave  
  200c6c:	c3                   	ret    

00200c6d <strcmp>:
  200c6d:	55                   	push   %ebp
  200c6e:	89 e5                	mov    %esp,%ebp
  200c70:	eb 0c                	jmp    200c7e <strcmp+0x11>
  200c72:	8b 45 08             	mov    0x8(%ebp),%eax
  200c75:	0f b6 00             	movzbl (%eax),%eax
  200c78:	84 c0                	test   %al,%al
  200c7a:	75 02                	jne    200c7e <strcmp+0x11>
  200c7c:	eb 1c                	jmp    200c9a <strcmp+0x2d>
  200c7e:	8b 45 08             	mov    0x8(%ebp),%eax
  200c81:	8d 50 01             	lea    0x1(%eax),%edx
  200c84:	89 55 08             	mov    %edx,0x8(%ebp)
  200c87:	0f b6 08             	movzbl (%eax),%ecx
  200c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c8d:	8d 50 01             	lea    0x1(%eax),%edx
  200c90:	89 55 0c             	mov    %edx,0xc(%ebp)
  200c93:	0f b6 00             	movzbl (%eax),%eax
  200c96:	38 c1                	cmp    %al,%cl
  200c98:	74 d8                	je     200c72 <strcmp+0x5>
  200c9a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c9d:	0f b6 00             	movzbl (%eax),%eax
  200ca0:	0f be d0             	movsbl %al,%edx
  200ca3:	8b 45 0c             	mov    0xc(%ebp),%eax
  200ca6:	0f b6 00             	movzbl (%eax),%eax
  200ca9:	0f be c0             	movsbl %al,%eax
  200cac:	29 c2                	sub    %eax,%edx
  200cae:	89 d0                	mov    %edx,%eax
  200cb0:	5d                   	pop    %ebp
  200cb1:	c3                   	ret    

00200cb2 <memset>:
  200cb2:	55                   	push   %ebp
  200cb3:	89 e5                	mov    %esp,%ebp
  200cb5:	83 ec 10             	sub    $0x10,%esp
  200cb8:	8b 45 08             	mov    0x8(%ebp),%eax
  200cbb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200cbe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200cc5:	eb 12                	jmp    200cd9 <memset+0x27>
  200cc7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200cca:	8d 50 01             	lea    0x1(%eax),%edx
  200ccd:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200cd0:	8b 55 0c             	mov    0xc(%ebp),%edx
  200cd3:	88 10                	mov    %dl,(%eax)
  200cd5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200cd9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200cdc:	3b 45 10             	cmp    0x10(%ebp),%eax
  200cdf:	72 e6                	jb     200cc7 <memset+0x15>
  200ce1:	8b 45 08             	mov    0x8(%ebp),%eax
  200ce4:	c9                   	leave  
  200ce5:	c3                   	ret    
  200ce6:	66 90                	xchg   %ax,%ax

00200ce8 <init_thread>:
  200ce8:	55                   	push   %ebp
  200ce9:	89 e5                	mov    %esp,%ebp
  200ceb:	83 ec 18             	sub    $0x18,%esp
  200cee:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200cf5:	00 
  200cf6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200cfd:	00 
  200cfe:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200d05:	00 
  200d06:	c7 04 24 dc 0f 20 00 	movl   $0x200fdc,(%esp)
  200d0d:	e8 ee fd ff ff       	call   200b00 <dis_str>
  200d12:	65 fe 05 28 00 00 00 	incb   %gs:0x28
  200d19:	eb f7                	jmp    200d12 <init_thread+0x2a>

00200d1b <creat_init>:
  200d1b:	55                   	push   %ebp
  200d1c:	89 e5                	mov    %esp,%ebp
  200d1e:	83 ec 18             	sub    $0x18,%esp
  200d21:	c7 05 04 50 20 00 00 	movl   $0x0,0x205004
  200d28:	00 00 00 
  200d2b:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200d32:	00 
  200d33:	c7 44 24 04 ef 0f 20 	movl   $0x200fef,0x4(%esp)
  200d3a:	00 
  200d3b:	c7 04 24 0c 50 20 00 	movl   $0x20500c,(%esp)
  200d42:	e8 bd fe ff ff       	call   200c04 <memcpy>
  200d47:	b8 e8 0c 20 00       	mov    $0x200ce8,%eax
  200d4c:	a3 08 50 20 00       	mov    %eax,0x205008
  200d51:	b8 00 e0 20 00       	mov    $0x20e000,%eax
  200d56:	a3 00 50 20 00       	mov    %eax,0x205000
  200d5b:	c7 05 0c e0 20 00 28 	movl   $0x28,0x20e00c
  200d62:	00 00 00 
  200d65:	c7 05 34 e0 20 00 20 	movl   $0x20,0x20e034
  200d6c:	00 00 00 
  200d6f:	c7 05 08 e0 20 00 28 	movl   $0x28,0x20e008
  200d76:	00 00 00 
  200d79:	c7 05 04 e0 20 00 28 	movl   $0x28,0x20e004
  200d80:	00 00 00 
  200d83:	c7 05 3c e0 20 00 28 	movl   $0x28,0x20e03c
  200d8a:	00 00 00 
  200d8d:	c7 05 00 e0 20 00 48 	movl   $0x48,0x20e000
  200d94:	00 00 00 
  200d97:	b8 e8 0c 20 00       	mov    $0x200ce8,%eax
  200d9c:	a3 30 e0 20 00       	mov    %eax,0x20e030
  200da1:	a1 1c 50 20 00       	mov    0x20501c,%eax
  200da6:	a3 38 e0 20 00       	mov    %eax,0x20e038
  200dab:	c7 05 40 e0 20 00 02 	movl   $0x1202,0x20e040
  200db2:	12 00 00 
  200db5:	c7 05 44 e0 20 00 00 	movl   $0x205000,0x20e044
  200dbc:	50 20 00 
  200dbf:	c7 05 00 80 21 00 00 	movl   $0x205000,0x218000
  200dc6:	50 20 00 
  200dc9:	c7 04 24 00 50 20 00 	movl   $0x205000,(%esp)
  200dd0:	e8 db 00 00 00       	call   200eb0 <schedule>
  200dd5:	c9                   	leave  
  200dd6:	c3                   	ret    

00200dd7 <testA>:
  200dd7:	55                   	push   %ebp
  200dd8:	89 e5                	mov    %esp,%ebp
  200dda:	83 ec 18             	sub    $0x18,%esp
  200ddd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200de4:	00 
  200de5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  200dec:	00 
  200ded:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200df4:	00 
  200df5:	c7 04 24 fb 0f 20 00 	movl   $0x200ffb,(%esp)
  200dfc:	e8 ff fc ff ff       	call   200b00 <dis_str>
  200e01:	65 fe 05 c8 00 00 00 	incb   %gs:0xc8
  200e08:	eb f7                	jmp    200e01 <testA+0x2a>

00200e0a <creat_testA>:
  200e0a:	55                   	push   %ebp
  200e0b:	89 e5                	mov    %esp,%ebp
  200e0d:	83 ec 18             	sub    $0x18,%esp
  200e10:	c7 05 04 70 21 00 00 	movl   $0x0,0x217004
  200e17:	00 00 00 
  200e1a:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200e21:	00 
  200e22:	c7 44 24 04 0f 10 20 	movl   $0x20100f,0x4(%esp)
  200e29:	00 
  200e2a:	c7 04 24 0c 70 21 00 	movl   $0x21700c,(%esp)
  200e31:	e8 ce fd ff ff       	call   200c04 <memcpy>
  200e36:	b8 d7 0d 20 00       	mov    $0x200dd7,%eax
  200e3b:	a3 08 70 21 00       	mov    %eax,0x217008
  200e40:	b8 60 60 21 00       	mov    $0x216060,%eax
  200e45:	a3 00 70 21 00       	mov    %eax,0x217000
  200e4a:	c7 05 6c 60 21 00 28 	movl   $0x28,0x21606c
  200e51:	00 00 00 
  200e54:	c7 05 94 60 21 00 20 	movl   $0x20,0x216094
  200e5b:	00 00 00 
  200e5e:	c7 05 68 60 21 00 28 	movl   $0x28,0x216068
  200e65:	00 00 00 
  200e68:	c7 05 64 60 21 00 28 	movl   $0x28,0x216064
  200e6f:	00 00 00 
  200e72:	c7 05 9c 60 21 00 28 	movl   $0x28,0x21609c
  200e79:	00 00 00 
  200e7c:	c7 05 60 60 21 00 48 	movl   $0x48,0x216060
  200e83:	00 00 00 
  200e86:	b8 d7 0d 20 00       	mov    $0x200dd7,%eax
  200e8b:	a3 90 60 21 00       	mov    %eax,0x216090
  200e90:	a1 1c 70 21 00       	mov    0x21701c,%eax
  200e95:	a3 98 60 21 00       	mov    %eax,0x216098
  200e9a:	c7 05 a0 60 21 00 02 	movl   $0x1202,0x2160a0
  200ea1:	12 00 00 
  200ea4:	c7 05 a4 60 21 00 00 	movl   $0x217000,0x2160a4
  200eab:	70 21 00 
  200eae:	c9                   	leave  
  200eaf:	c3                   	ret    

00200eb0 <schedule>:
  200eb0:	55                   	push   %ebp
  200eb1:	89 e5                	mov    %esp,%ebp
  200eb3:	8b 45 08             	mov    0x8(%ebp),%eax
  200eb6:	8b 00                	mov    (%eax),%eax
  200eb8:	89 c4                	mov    %eax,%esp
  200eba:	e9 05 00 00 00       	jmp    200ec4 <switch_to>
  200ebf:	5d                   	pop    %ebp
  200ec0:	c3                   	ret    
  200ec1:	66 90                	xchg   %ax,%ax
  200ec3:	90                   	nop

00200ec4 <switch_to>:
  200ec4:	89 c4                	mov    %eax,%esp
  200ec6:	0f a9                	pop    %gs
  200ec8:	0f a1                	pop    %fs
  200eca:	07                   	pop    %es
  200ecb:	1f                   	pop    %ds
  200ecc:	61                   	popa   
  200ecd:	cb                   	lret   
