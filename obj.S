
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 90 00 00 00       	call   20009b <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 08             	sub    $0x8,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 2d 00 00 00       	call   20004c <load_tss>
  20001f:	e8 1c 10 00 00       	call   201040 <get_memory_info>
  200024:	e8 89 13 00 00       	call   2013b2 <set_page>
  200029:	e8 ba 03 00 00       	call   2003e8 <disable_irqs>
  20002e:	e8 99 07 00 00       	call   2007cc <load_idt>
  200033:	e8 bb 08 00 00       	call   2008f3 <init_timer>
  200038:	e8 3f 16 00 00       	call   20167c <init_8253>
  20003d:	e8 d5 0d 00 00       	call   200e17 <creat_init>
  200042:	ea 00 00 00 00 80 00 	ljmp   $0x80,$0x0
  200049:	c9                   	leave  
  20004a:	c3                   	ret    
  20004b:	90                   	nop

0020004c <load_tss>:
  20004c:	55                   	push   %ebp
  20004d:	89 e5                	mov    %esp,%ebp
  20004f:	83 ec 10             	sub    $0x10,%esp
  200052:	66 c7 45 fe 40 00    	movw   $0x40,-0x2(%ebp)
  200058:	c7 05 24 81 20 00 ff 	movl   $0x1fffff,0x208124
  20005f:	ff 1f 00 
  200062:	66 c7 05 28 81 20 00 	movw   $0x28,0x208128
  200069:	28 00 
  20006b:	66 c7 05 86 81 20 00 	movw   $0x6d,0x208186
  200072:	6d 00 
  200074:	c6 05 88 81 20 00 ff 	movb   $0xff,0x208188
  20007b:	c7 05 89 81 20 00 69 	movl   $0x69,0x208189
  200082:	00 00 00 
  200085:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  200089:	0f 00 d8             	ltr    %ax
  20008c:	c9                   	leave  
  20008d:	c3                   	ret    

0020008e <set_tss_esp>:
  20008e:	55                   	push   %ebp
  20008f:	89 e5                	mov    %esp,%ebp
  200091:	8b 45 08             	mov    0x8(%ebp),%eax
  200094:	a3 24 81 20 00       	mov    %eax,0x208124
  200099:	5d                   	pop    %ebp
  20009a:	c3                   	ret    

0020009b <change_gdt>:
  20009b:	55                   	push   %ebp
  20009c:	89 e5                	mov    %esp,%ebp
  20009e:	53                   	push   %ebx
  20009f:	83 ec 10             	sub    $0x10,%esp
  2000a2:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  2000a8:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  2000ae:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  2000b4:	c7 05 20 80 20 00 ff 	movl   $0xffff,0x208020
  2000bb:	ff 00 00 
  2000be:	c7 05 24 80 20 00 00 	movl   $0xcf9b00,0x208024
  2000c5:	9b cf 00 
  2000c8:	c7 05 28 80 20 00 ff 	movl   $0xffff,0x208028
  2000cf:	ff 00 00 
  2000d2:	c7 05 2c 80 20 00 00 	movl   $0xcf9300,0x20802c
  2000d9:	93 cf 00 
  2000dc:	c7 05 30 80 20 00 ff 	movl   $0xffff,0x208030
  2000e3:	ff 00 00 
  2000e6:	c7 05 34 80 20 00 00 	movl   $0xcffa00,0x208034
  2000ed:	fa cf 00 
  2000f0:	c7 05 38 80 20 00 ff 	movl   $0xffff,0x208038
  2000f7:	ff 00 00 
  2000fa:	c7 05 3c 80 20 00 00 	movl   $0xcff200,0x20803c
  200101:	f2 cf 00 
  200104:	a1 89 81 20 00       	mov    0x208189,%eax
  200109:	83 e8 01             	sub    $0x1,%eax
  20010c:	0f b7 c0             	movzwl %ax,%eax
  20010f:	ba 20 81 20 00       	mov    $0x208120,%edx
  200114:	c1 e2 10             	shl    $0x10,%edx
  200117:	09 d0                	or     %edx,%eax
  200119:	a3 40 80 20 00       	mov    %eax,0x208040
  20011e:	a1 89 81 20 00       	mov    0x208189,%eax
  200123:	83 e8 01             	sub    $0x1,%eax
  200126:	25 00 00 0f 00       	and    $0xf0000,%eax
  20012b:	89 c2                	mov    %eax,%edx
  20012d:	b8 20 81 20 00       	mov    $0x208120,%eax
  200132:	25 00 00 ff 00       	and    $0xff0000,%eax
  200137:	c1 e8 10             	shr    $0x10,%eax
  20013a:	80 cc 89             	or     $0x89,%ah
  20013d:	89 c1                	mov    %eax,%ecx
  20013f:	b8 20 81 20 00       	mov    $0x208120,%eax
  200144:	25 00 00 00 ff       	and    $0xff000000,%eax
  200149:	09 c8                	or     %ecx,%eax
  20014b:	09 d0                	or     %edx,%eax
  20014d:	a3 44 80 20 00       	mov    %eax,0x208044
  200152:	c7 05 48 80 20 00 ff 	movl   $0x8000ffff,0x208048
  200159:	ff 00 80 
  20015c:	c7 05 4c 80 20 00 0b 	movl   $0xf30b,0x20804c
  200163:	f3 00 00 
  200166:	66 c7 05 00 81 20 00 	movw   $0xff,0x208100
  20016d:	ff 00 
  20016f:	b8 00 80 20 00       	mov    $0x208000,%eax
  200174:	a3 02 81 20 00       	mov    %eax,0x208102
  200179:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  20017d:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  200181:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  200185:	89 d3                	mov    %edx,%ebx
  200187:	0f 01 15 00 81 20 00 	lgdtl  0x208100
  20018e:	8e db                	mov    %ebx,%ds
  200190:	8e c3                	mov    %ebx,%es
  200192:	8e e3                	mov    %ebx,%fs
  200194:	8e d3                	mov    %ebx,%ss
  200196:	8e e9                	mov    %ecx,%gs
  200198:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  20019f:	90                   	nop
  2001a0:	83 c4 10             	add    $0x10,%esp
  2001a3:	5b                   	pop    %ebx
  2001a4:	5d                   	pop    %ebp
  2001a5:	c3                   	ret    
  2001a6:	66 90                	xchg   %ax,%ax

002001a8 <cli>:
  2001a8:	55                   	push   %ebp
  2001a9:	89 e5                	mov    %esp,%ebp
  2001ab:	fa                   	cli    
  2001ac:	5d                   	pop    %ebp
  2001ad:	c3                   	ret    

002001ae <sti>:
  2001ae:	55                   	push   %ebp
  2001af:	89 e5                	mov    %esp,%ebp
  2001b1:	fb                   	sti    
  2001b2:	5d                   	pop    %ebp
  2001b3:	c3                   	ret    

002001b4 <outb>:
  2001b4:	55                   	push   %ebp
  2001b5:	89 e5                	mov    %esp,%ebp
  2001b7:	83 ec 08             	sub    $0x8,%esp
  2001ba:	8b 55 08             	mov    0x8(%ebp),%edx
  2001bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001c0:	88 55 fc             	mov    %dl,-0x4(%ebp)
  2001c3:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  2001c7:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2001cb:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2001cf:	ee                   	out    %al,(%dx)
  2001d0:	c9                   	leave  
  2001d1:	c3                   	ret    

002001d2 <inb>:
  2001d2:	55                   	push   %ebp
  2001d3:	89 e5                	mov    %esp,%ebp
  2001d5:	83 ec 14             	sub    $0x14,%esp
  2001d8:	8b 45 08             	mov    0x8(%ebp),%eax
  2001db:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  2001df:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  2001e3:	89 c2                	mov    %eax,%edx
  2001e5:	ec                   	in     (%dx),%al
  2001e6:	88 45 ff             	mov    %al,-0x1(%ebp)
  2001e9:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2001ed:	c9                   	leave  
  2001ee:	c3                   	ret    

002001ef <io_delay>:
  2001ef:	55                   	push   %ebp
  2001f0:	89 e5                	mov    %esp,%ebp
  2001f2:	83 ec 10             	sub    $0x10,%esp
  2001f5:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  2001fb:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  2001ff:	89 c2                	mov    %eax,%edx
  200201:	ee                   	out    %al,(%dx)
  200202:	c9                   	leave  
  200203:	c3                   	ret    

00200204 <outb_pic>:
  200204:	55                   	push   %ebp
  200205:	89 e5                	mov    %esp,%ebp
  200207:	83 ec 0c             	sub    $0xc,%esp
  20020a:	8b 45 08             	mov    0x8(%ebp),%eax
  20020d:	88 45 fc             	mov    %al,-0x4(%ebp)
  200210:	8b 45 0c             	mov    0xc(%ebp),%eax
  200213:	0f b7 d0             	movzwl %ax,%edx
  200216:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20021a:	89 54 24 04          	mov    %edx,0x4(%esp)
  20021e:	89 04 24             	mov    %eax,(%esp)
  200221:	e8 8e ff ff ff       	call   2001b4 <outb>
  200226:	e8 c4 ff ff ff       	call   2001ef <io_delay>
  20022b:	c9                   	leave  
  20022c:	c3                   	ret    

0020022d <inb_pic>:
  20022d:	55                   	push   %ebp
  20022e:	89 e5                	mov    %esp,%ebp
  200230:	83 ec 14             	sub    $0x14,%esp
  200233:	8b 45 08             	mov    0x8(%ebp),%eax
  200236:	0f b7 c0             	movzwl %ax,%eax
  200239:	89 04 24             	mov    %eax,(%esp)
  20023c:	e8 91 ff ff ff       	call   2001d2 <inb>
  200241:	88 45 ff             	mov    %al,-0x1(%ebp)
  200244:	e8 a6 ff ff ff       	call   2001ef <io_delay>
  200249:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  20024d:	c9                   	leave  
  20024e:	c3                   	ret    

0020024f <Init_8259A>:
  20024f:	55                   	push   %ebp
  200250:	89 e5                	mov    %esp,%ebp
  200252:	83 ec 08             	sub    $0x8,%esp
  200255:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20025c:	00 
  20025d:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200264:	e8 9b ff ff ff       	call   200204 <outb_pic>
  200269:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200270:	00 
  200271:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200278:	e8 87 ff ff ff       	call   200204 <outb_pic>
  20027d:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200284:	00 
  200285:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  20028c:	e8 73 ff ff ff       	call   200204 <outb_pic>
  200291:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200298:	00 
  200299:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  2002a0:	e8 5f ff ff ff       	call   200204 <outb_pic>
  2002a5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002ac:	00 
  2002ad:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2002b4:	e8 4b ff ff ff       	call   200204 <outb_pic>
  2002b9:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002c0:	00 
  2002c1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2002c8:	e8 37 ff ff ff       	call   200204 <outb_pic>
  2002cd:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002d4:	00 
  2002d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002dc:	e8 23 ff ff ff       	call   200204 <outb_pic>
  2002e1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002e8:	00 
  2002e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002f0:	e8 0f ff ff ff       	call   200204 <outb_pic>
  2002f5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002fc:	00 
  2002fd:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200304:	e8 fb fe ff ff       	call   200204 <outb_pic>
  200309:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200310:	00 
  200311:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200318:	e8 e7 fe ff ff       	call   200204 <outb_pic>
  20031d:	90                   	nop
  20031e:	c9                   	leave  
  20031f:	c3                   	ret    

00200320 <enable_irq>:
  200320:	55                   	push   %ebp
  200321:	89 e5                	mov    %esp,%ebp
  200323:	83 ec 18             	sub    $0x18,%esp
  200326:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  20032a:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  20032e:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  200335:	e8 f3 fe ff ff       	call   20022d <inb_pic>
  20033a:	88 45 fd             	mov    %al,-0x3(%ebp)
  20033d:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  200344:	e8 e4 fe ff ff       	call   20022d <inb_pic>
  200349:	88 45 fc             	mov    %al,-0x4(%ebp)
  20034c:	fa                   	cli    
  20034d:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  200351:	7f 35                	jg     200388 <enable_irq+0x68>
  200353:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  200357:	74 2f                	je     200388 <enable_irq+0x68>
  200359:	8b 45 08             	mov    0x8(%ebp),%eax
  20035c:	ba 01 00 00 00       	mov    $0x1,%edx
  200361:	89 c1                	mov    %eax,%ecx
  200363:	d3 e2                	shl    %cl,%edx
  200365:	89 d0                	mov    %edx,%eax
  200367:	f7 d0                	not    %eax
  200369:	89 c2                	mov    %eax,%edx
  20036b:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  20036f:	21 d0                	and    %edx,%eax
  200371:	88 45 ff             	mov    %al,-0x1(%ebp)
  200374:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200378:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20037f:	00 
  200380:	89 04 24             	mov    %eax,(%esp)
  200383:	e8 7c fe ff ff       	call   200204 <outb_pic>
  200388:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  20038c:	7e 56                	jle    2003e4 <enable_irq+0xc4>
  20038e:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  200392:	7f 50                	jg     2003e4 <enable_irq+0xc4>
  200394:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  200398:	83 e0 fb             	and    $0xfffffffb,%eax
  20039b:	88 45 ff             	mov    %al,-0x1(%ebp)
  20039e:	8b 45 08             	mov    0x8(%ebp),%eax
  2003a1:	83 e8 08             	sub    $0x8,%eax
  2003a4:	ba 01 00 00 00       	mov    $0x1,%edx
  2003a9:	89 c1                	mov    %eax,%ecx
  2003ab:	d3 e2                	shl    %cl,%edx
  2003ad:	89 d0                	mov    %edx,%eax
  2003af:	f7 d0                	not    %eax
  2003b1:	89 c2                	mov    %eax,%edx
  2003b3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2003b7:	21 d0                	and    %edx,%eax
  2003b9:	88 45 fe             	mov    %al,-0x2(%ebp)
  2003bc:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2003c0:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2003c7:	00 
  2003c8:	89 04 24             	mov    %eax,(%esp)
  2003cb:	e8 34 fe ff ff       	call   200204 <outb_pic>
  2003d0:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  2003d4:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2003db:	00 
  2003dc:	89 04 24             	mov    %eax,(%esp)
  2003df:	e8 20 fe ff ff       	call   200204 <outb_pic>
  2003e4:	fb                   	sti    
  2003e5:	90                   	nop
  2003e6:	c9                   	leave  
  2003e7:	c3                   	ret    

002003e8 <disable_irqs>:
  2003e8:	55                   	push   %ebp
  2003e9:	89 e5                	mov    %esp,%ebp
  2003eb:	b0 ff                	mov    $0xff,%al
  2003ed:	e6 21                	out    %al,$0x21
  2003ef:	e6 a1                	out    %al,$0xa1
  2003f1:	5d                   	pop    %ebp
  2003f2:	c3                   	ret    

002003f3 <EOI_master>:
  2003f3:	55                   	push   %ebp
  2003f4:	89 e5                	mov    %esp,%ebp
  2003f6:	83 ec 08             	sub    $0x8,%esp
  2003f9:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200400:	00 
  200401:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200408:	e8 f7 fd ff ff       	call   200204 <outb_pic>
  20040d:	fb                   	sti    
  20040e:	c9                   	leave  
  20040f:	c3                   	ret    

00200410 <EOI_slave>:
  200410:	55                   	push   %ebp
  200411:	89 e5                	mov    %esp,%ebp
  200413:	83 ec 08             	sub    $0x8,%esp
  200416:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20041d:	00 
  20041e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200425:	e8 da fd ff ff       	call   200204 <outb_pic>
  20042a:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200431:	00 
  200432:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200439:	e8 c6 fd ff ff       	call   200204 <outb_pic>
  20043e:	fb                   	sti    
  20043f:	c9                   	leave  
  200440:	c3                   	ret    
  200441:	66 90                	xchg   %ax,%ax
  200443:	90                   	nop

00200444 <set_gate>:
  200444:	55                   	push   %ebp
  200445:	89 e5                	mov    %esp,%ebp
  200447:	8b 45 18             	mov    0x18(%ebp),%eax
  20044a:	c1 e0 10             	shl    $0x10,%eax
  20044d:	89 c2                	mov    %eax,%edx
  20044f:	8b 45 10             	mov    0x10(%ebp),%eax
  200452:	0f b7 c0             	movzwl %ax,%eax
  200455:	09 c2                	or     %eax,%edx
  200457:	8b 45 08             	mov    0x8(%ebp),%eax
  20045a:	89 10                	mov    %edx,(%eax)
  20045c:	8b 45 10             	mov    0x10(%ebp),%eax
  20045f:	66 b8 00 00          	mov    $0x0,%ax
  200463:	89 c2                	mov    %eax,%edx
  200465:	8b 45 14             	mov    0x14(%ebp),%eax
  200468:	c1 e0 05             	shl    $0x5,%eax
  20046b:	0b 45 0c             	or     0xc(%ebp),%eax
  20046e:	0f b6 c0             	movzbl %al,%eax
  200471:	0c 80                	or     $0x80,%al
  200473:	c1 e0 08             	shl    $0x8,%eax
  200476:	09 c2                	or     %eax,%edx
  200478:	8b 45 08             	mov    0x8(%ebp),%eax
  20047b:	89 50 04             	mov    %edx,0x4(%eax)
  20047e:	5d                   	pop    %ebp
  20047f:	c3                   	ret    

00200480 <set_exception_gate>:
  200480:	55                   	push   %ebp
  200481:	89 e5                	mov    %esp,%ebp
  200483:	83 ec 14             	sub    $0x14,%esp
  200486:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20048d:	00 
  20048e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200495:	00 
  200496:	c7 44 24 08 77 09 20 	movl   $0x200977,0x8(%esp)
  20049d:	00 
  20049e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004a5:	00 
  2004a6:	c7 04 24 a0 81 20 00 	movl   $0x2081a0,(%esp)
  2004ad:	e8 92 ff ff ff       	call   200444 <set_gate>
  2004b2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004b9:	00 
  2004ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004c1:	00 
  2004c2:	c7 44 24 08 93 09 20 	movl   $0x200993,0x8(%esp)
  2004c9:	00 
  2004ca:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004d1:	00 
  2004d2:	c7 04 24 a8 81 20 00 	movl   $0x2081a8,(%esp)
  2004d9:	e8 66 ff ff ff       	call   200444 <set_gate>
  2004de:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004e5:	00 
  2004e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004ed:	00 
  2004ee:	c7 44 24 08 af 09 20 	movl   $0x2009af,0x8(%esp)
  2004f5:	00 
  2004f6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004fd:	00 
  2004fe:	c7 04 24 b0 81 20 00 	movl   $0x2081b0,(%esp)
  200505:	e8 3a ff ff ff       	call   200444 <set_gate>
  20050a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200511:	00 
  200512:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200519:	00 
  20051a:	c7 44 24 08 cb 09 20 	movl   $0x2009cb,0x8(%esp)
  200521:	00 
  200522:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200529:	00 
  20052a:	c7 04 24 b8 81 20 00 	movl   $0x2081b8,(%esp)
  200531:	e8 0e ff ff ff       	call   200444 <set_gate>
  200536:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20053d:	00 
  20053e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200545:	00 
  200546:	c7 44 24 08 e7 09 20 	movl   $0x2009e7,0x8(%esp)
  20054d:	00 
  20054e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200555:	00 
  200556:	c7 04 24 c0 81 20 00 	movl   $0x2081c0,(%esp)
  20055d:	e8 e2 fe ff ff       	call   200444 <set_gate>
  200562:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200569:	00 
  20056a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200571:	00 
  200572:	c7 44 24 08 03 0a 20 	movl   $0x200a03,0x8(%esp)
  200579:	00 
  20057a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200581:	00 
  200582:	c7 04 24 c8 81 20 00 	movl   $0x2081c8,(%esp)
  200589:	e8 b6 fe ff ff       	call   200444 <set_gate>
  20058e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200595:	00 
  200596:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20059d:	00 
  20059e:	c7 44 24 08 1f 0a 20 	movl   $0x200a1f,0x8(%esp)
  2005a5:	00 
  2005a6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005ad:	00 
  2005ae:	c7 04 24 d0 81 20 00 	movl   $0x2081d0,(%esp)
  2005b5:	e8 8a fe ff ff       	call   200444 <set_gate>
  2005ba:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005c1:	00 
  2005c2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005c9:	00 
  2005ca:	c7 44 24 08 3b 0a 20 	movl   $0x200a3b,0x8(%esp)
  2005d1:	00 
  2005d2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005d9:	00 
  2005da:	c7 04 24 d8 81 20 00 	movl   $0x2081d8,(%esp)
  2005e1:	e8 5e fe ff ff       	call   200444 <set_gate>
  2005e6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005ed:	00 
  2005ee:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005f5:	00 
  2005f6:	c7 44 24 08 57 0a 20 	movl   $0x200a57,0x8(%esp)
  2005fd:	00 
  2005fe:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200605:	00 
  200606:	c7 04 24 e0 81 20 00 	movl   $0x2081e0,(%esp)
  20060d:	e8 32 fe ff ff       	call   200444 <set_gate>
  200612:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200619:	00 
  20061a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200621:	00 
  200622:	c7 44 24 08 73 0a 20 	movl   $0x200a73,0x8(%esp)
  200629:	00 
  20062a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200631:	00 
  200632:	c7 04 24 e8 81 20 00 	movl   $0x2081e8,(%esp)
  200639:	e8 06 fe ff ff       	call   200444 <set_gate>
  20063e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200645:	00 
  200646:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20064d:	00 
  20064e:	c7 44 24 08 8f 0a 20 	movl   $0x200a8f,0x8(%esp)
  200655:	00 
  200656:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20065d:	00 
  20065e:	c7 04 24 f0 81 20 00 	movl   $0x2081f0,(%esp)
  200665:	e8 da fd ff ff       	call   200444 <set_gate>
  20066a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200671:	00 
  200672:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200679:	00 
  20067a:	c7 44 24 08 ab 0a 20 	movl   $0x200aab,0x8(%esp)
  200681:	00 
  200682:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200689:	00 
  20068a:	c7 04 24 f8 81 20 00 	movl   $0x2081f8,(%esp)
  200691:	e8 ae fd ff ff       	call   200444 <set_gate>
  200696:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20069d:	00 
  20069e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006a5:	00 
  2006a6:	c7 44 24 08 c7 0a 20 	movl   $0x200ac7,0x8(%esp)
  2006ad:	00 
  2006ae:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006b5:	00 
  2006b6:	c7 04 24 00 82 20 00 	movl   $0x208200,(%esp)
  2006bd:	e8 82 fd ff ff       	call   200444 <set_gate>
  2006c2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006c9:	00 
  2006ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006d1:	00 
  2006d2:	c7 44 24 08 e3 0a 20 	movl   $0x200ae3,0x8(%esp)
  2006d9:	00 
  2006da:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006e1:	00 
  2006e2:	c7 04 24 08 82 20 00 	movl   $0x208208,(%esp)
  2006e9:	e8 56 fd ff ff       	call   200444 <set_gate>
  2006ee:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006f5:	00 
  2006f6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006fd:	00 
  2006fe:	c7 44 24 08 ff 0a 20 	movl   $0x200aff,0x8(%esp)
  200705:	00 
  200706:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20070d:	00 
  20070e:	c7 04 24 10 82 20 00 	movl   $0x208210,(%esp)
  200715:	e8 2a fd ff ff       	call   200444 <set_gate>
  20071a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200721:	00 
  200722:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200729:	00 
  20072a:	c7 44 24 08 1b 0b 20 	movl   $0x200b1b,0x8(%esp)
  200731:	00 
  200732:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200739:	00 
  20073a:	c7 04 24 18 82 20 00 	movl   $0x208218,(%esp)
  200741:	e8 fe fc ff ff       	call   200444 <set_gate>
  200746:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20074d:	00 
  20074e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200755:	00 
  200756:	c7 44 24 08 37 0b 20 	movl   $0x200b37,0x8(%esp)
  20075d:	00 
  20075e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200765:	00 
  200766:	c7 04 24 20 82 20 00 	movl   $0x208220,(%esp)
  20076d:	e8 d2 fc ff ff       	call   200444 <set_gate>
  200772:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200779:	00 
  20077a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200781:	00 
  200782:	c7 44 24 08 53 0b 20 	movl   $0x200b53,0x8(%esp)
  200789:	00 
  20078a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200791:	00 
  200792:	c7 04 24 28 82 20 00 	movl   $0x208228,(%esp)
  200799:	e8 a6 fc ff ff       	call   200444 <set_gate>
  20079e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007a5:	00 
  2007a6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2007ad:	00 
  2007ae:	c7 44 24 08 b8 14 20 	movl   $0x2014b8,0x8(%esp)
  2007b5:	00 
  2007b6:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  2007bd:	00 
  2007be:	c7 04 24 a0 85 20 00 	movl   $0x2085a0,(%esp)
  2007c5:	e8 7a fc ff ff       	call   200444 <set_gate>
  2007ca:	c9                   	leave  
  2007cb:	c3                   	ret    

002007cc <load_idt>:
  2007cc:	55                   	push   %ebp
  2007cd:	89 e5                	mov    %esp,%ebp
  2007cf:	fa                   	cli    
  2007d0:	0f 01 1d 00 40 20 00 	lidtl  0x204000
  2007d7:	90                   	nop
  2007d8:	fb                   	sti    
  2007d9:	e8 a2 fc ff ff       	call   200480 <set_exception_gate>
  2007de:	90                   	nop
  2007df:	5d                   	pop    %ebp
  2007e0:	c3                   	ret    

002007e1 <set_intr_gate>:
  2007e1:	55                   	push   %ebp
  2007e2:	89 e5                	mov    %esp,%ebp
  2007e4:	83 ec 38             	sub    $0x38,%esp
  2007e7:	8b 45 08             	mov    0x8(%ebp),%eax
  2007ea:	83 c0 30             	add    $0x30,%eax
  2007ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2007f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007f3:	c1 e0 03             	shl    $0x3,%eax
  2007f6:	8d 90 a0 81 20 00    	lea    0x2081a0(%eax),%edx
  2007fc:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200803:	00 
  200804:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20080b:	00 
  20080c:	8b 45 0c             	mov    0xc(%ebp),%eax
  20080f:	89 44 24 08          	mov    %eax,0x8(%esp)
  200813:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  20081a:	00 
  20081b:	89 14 24             	mov    %edx,(%esp)
  20081e:	e8 21 fc ff ff       	call   200444 <set_gate>
  200823:	8b 45 08             	mov    0x8(%ebp),%eax
  200826:	89 04 24             	mov    %eax,(%esp)
  200829:	e8 f2 fa ff ff       	call   200320 <enable_irq>
  20082e:	c9                   	leave  
  20082f:	c3                   	ret    

00200830 <irq00_handler>:
  200830:	60                   	pusha  
  200831:	1e                   	push   %ds
  200832:	06                   	push   %es
  200833:	0f a0                	push   %fs
  200835:	0f a8                	push   %gs
  200837:	a1 04 80 22 00       	mov    0x228004,%eax
  20083c:	89 20                	mov    %esp,(%eax)
  20083e:	65 fe 05 00 0f 00 00 	incb   %gs:0xf00
  200845:	e8 a9 fb ff ff       	call   2003f3 <EOI_master>
  20084a:	e8 11 00 00 00       	call   200860 <timer_handler>
  20084f:	a1 04 80 22 00       	mov    0x228004,%eax
  200854:	8b 20                	mov    (%eax),%esp
  200856:	0f a9                	pop    %gs
  200858:	0f a1                	pop    %fs
  20085a:	07                   	pop    %es
  20085b:	1f                   	pop    %ds
  20085c:	61                   	popa   
  20085d:	cb                   	lret   
  20085e:	66 90                	xchg   %ax,%ax

00200860 <timer_handler>:
  200860:	55                   	push   %ebp
  200861:	89 e5                	mov    %esp,%ebp
  200863:	83 ec 18             	sub    $0x18,%esp
  200866:	a1 08 40 20 00       	mov    0x204008,%eax
  20086b:	83 c0 01             	add    $0x1,%eax
  20086e:	a3 08 40 20 00       	mov    %eax,0x204008
  200873:	8b 0d 08 40 20 00    	mov    0x204008,%ecx
  200879:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  20087e:	89 c8                	mov    %ecx,%eax
  200880:	f7 e2                	mul    %edx
  200882:	c1 ea 04             	shr    $0x4,%edx
  200885:	89 d0                	mov    %edx,%eax
  200887:	c1 e0 02             	shl    $0x2,%eax
  20088a:	01 d0                	add    %edx,%eax
  20088c:	c1 e0 02             	shl    $0x2,%eax
  20088f:	29 c1                	sub    %eax,%ecx
  200891:	89 ca                	mov    %ecx,%edx
  200893:	85 d2                	test   %edx,%edx
  200895:	75 59                	jne    2008f0 <timer_handler+0x90>
  200897:	a1 00 80 22 00       	mov    0x228000,%eax
  20089c:	85 c0                	test   %eax,%eax
  20089e:	74 50                	je     2008f0 <timer_handler+0x90>
  2008a0:	a1 00 80 22 00       	mov    0x228000,%eax
  2008a5:	8b 40 04             	mov    0x4(%eax),%eax
  2008a8:	8b 15 04 80 22 00    	mov    0x228004,%edx
  2008ae:	83 c2 20             	add    $0x20,%edx
  2008b1:	89 44 24 04          	mov    %eax,0x4(%esp)
  2008b5:	89 14 24             	mov    %edx,(%esp)
  2008b8:	e8 bf 0c 00 00       	call   20157c <list_add_tail>
  2008bd:	a1 00 80 22 00       	mov    0x228000,%eax
  2008c2:	83 e8 20             	sub    $0x20,%eax
  2008c5:	a3 08 80 22 00       	mov    %eax,0x228008
  2008ca:	a1 00 80 22 00       	mov    0x228000,%eax
  2008cf:	8b 00                	mov    (%eax),%eax
  2008d1:	a3 00 80 22 00       	mov    %eax,0x228000
  2008d6:	a1 08 80 22 00       	mov    0x228008,%eax
  2008db:	83 c0 20             	add    $0x20,%eax
  2008de:	89 04 24             	mov    %eax,(%esp)
  2008e1:	e8 d0 0c 00 00       	call   2015b6 <list_del>
  2008e6:	a1 08 80 22 00       	mov    0x228008,%eax
  2008eb:	a3 04 80 22 00       	mov    %eax,0x228004
  2008f0:	90                   	nop
  2008f1:	c9                   	leave  
  2008f2:	c3                   	ret    

002008f3 <init_timer>:
  2008f3:	55                   	push   %ebp
  2008f4:	89 e5                	mov    %esp,%ebp
  2008f6:	83 ec 18             	sub    $0x18,%esp
  2008f9:	c7 05 c0 89 20 00 60 	movl   $0x200860,0x2089c0
  200900:	08 20 00 
  200903:	c7 44 24 04 30 08 20 	movl   $0x200830,0x4(%esp)
  20090a:	00 
  20090b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200912:	e8 ca fe ff ff       	call   2007e1 <set_intr_gate>
  200917:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  20091e:	e8 fd f9 ff ff       	call   200320 <enable_irq>
  200923:	c9                   	leave  
  200924:	c3                   	ret    
  200925:	66 90                	xchg   %ax,%ax
  200927:	90                   	nop

00200928 <exception_handler>:
  200928:	55                   	push   %ebp
  200929:	89 e5                	mov    %esp,%ebp
  20092b:	83 ec 18             	sub    $0x18,%esp
  20092e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200935:	00 
  200936:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  20093d:	00 
  20093e:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200945:	00 
  200946:	c7 04 24 c4 16 20 00 	movl   $0x2016c4,(%esp)
  20094d:	e8 1e 02 00 00       	call   200b70 <dis_str>
  200952:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  200959:	00 
  20095a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200961:	00 
  200962:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200969:	00 
  20096a:	8b 45 0c             	mov    0xc(%ebp),%eax
  20096d:	89 04 24             	mov    %eax,(%esp)
  200970:	e8 fb 01 00 00       	call   200b70 <dis_str>
  200975:	eb fe                	jmp    200975 <exception_handler+0x4d>

00200977 <divide_error>:
  200977:	55                   	push   %ebp
  200978:	89 e5                	mov    %esp,%ebp
  20097a:	83 ec 18             	sub    $0x18,%esp
  20097d:	c7 44 24 04 cf 16 20 	movl   $0x2016cf,0x4(%esp)
  200984:	00 
  200985:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  20098c:	e8 97 ff ff ff       	call   200928 <exception_handler>
  200991:	c9                   	leave  
  200992:	c3                   	ret    

00200993 <single_step_exception>:
  200993:	55                   	push   %ebp
  200994:	89 e5                	mov    %esp,%ebp
  200996:	83 ec 18             	sub    $0x18,%esp
  200999:	c7 44 24 04 dc 16 20 	movl   $0x2016dc,0x4(%esp)
  2009a0:	00 
  2009a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2009a8:	e8 7b ff ff ff       	call   200928 <exception_handler>
  2009ad:	c9                   	leave  
  2009ae:	c3                   	ret    

002009af <nmi>:
  2009af:	55                   	push   %ebp
  2009b0:	89 e5                	mov    %esp,%ebp
  2009b2:	83 ec 18             	sub    $0x18,%esp
  2009b5:	c7 44 24 04 f2 16 20 	movl   $0x2016f2,0x4(%esp)
  2009bc:	00 
  2009bd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2009c4:	e8 5f ff ff ff       	call   200928 <exception_handler>
  2009c9:	c9                   	leave  
  2009ca:	c3                   	ret    

002009cb <breakpoint_exception>:
  2009cb:	55                   	push   %ebp
  2009cc:	89 e5                	mov    %esp,%ebp
  2009ce:	83 ec 18             	sub    $0x18,%esp
  2009d1:	c7 44 24 04 f6 16 20 	movl   $0x2016f6,0x4(%esp)
  2009d8:	00 
  2009d9:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  2009e0:	e8 43 ff ff ff       	call   200928 <exception_handler>
  2009e5:	c9                   	leave  
  2009e6:	c3                   	ret    

002009e7 <overflow>:
  2009e7:	55                   	push   %ebp
  2009e8:	89 e5                	mov    %esp,%ebp
  2009ea:	83 ec 18             	sub    $0x18,%esp
  2009ed:	c7 44 24 04 0b 17 20 	movl   $0x20170b,0x4(%esp)
  2009f4:	00 
  2009f5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2009fc:	e8 27 ff ff ff       	call   200928 <exception_handler>
  200a01:	c9                   	leave  
  200a02:	c3                   	ret    

00200a03 <bounds_check>:
  200a03:	55                   	push   %ebp
  200a04:	89 e5                	mov    %esp,%ebp
  200a06:	83 ec 18             	sub    $0x18,%esp
  200a09:	c7 44 24 04 14 17 20 	movl   $0x201714,0x4(%esp)
  200a10:	00 
  200a11:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  200a18:	e8 0b ff ff ff       	call   200928 <exception_handler>
  200a1d:	c9                   	leave  
  200a1e:	c3                   	ret    

00200a1f <inval_opcode>:
  200a1f:	55                   	push   %ebp
  200a20:	89 e5                	mov    %esp,%ebp
  200a22:	83 ec 18             	sub    $0x18,%esp
  200a25:	c7 44 24 04 21 17 20 	movl   $0x201721,0x4(%esp)
  200a2c:	00 
  200a2d:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  200a34:	e8 ef fe ff ff       	call   200928 <exception_handler>
  200a39:	c9                   	leave  
  200a3a:	c3                   	ret    

00200a3b <copr_not_available>:
  200a3b:	55                   	push   %ebp
  200a3c:	89 e5                	mov    %esp,%ebp
  200a3e:	83 ec 18             	sub    $0x18,%esp
  200a41:	c7 44 24 04 2e 17 20 	movl   $0x20172e,0x4(%esp)
  200a48:	00 
  200a49:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  200a50:	e8 d3 fe ff ff       	call   200928 <exception_handler>
  200a55:	c9                   	leave  
  200a56:	c3                   	ret    

00200a57 <double_fault>:
  200a57:	55                   	push   %ebp
  200a58:	89 e5                	mov    %esp,%ebp
  200a5a:	83 ec 18             	sub    $0x18,%esp
  200a5d:	c7 44 24 04 41 17 20 	movl   $0x201741,0x4(%esp)
  200a64:	00 
  200a65:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  200a6c:	e8 b7 fe ff ff       	call   200928 <exception_handler>
  200a71:	c9                   	leave  
  200a72:	c3                   	ret    

00200a73 <copr_seg_overrun>:
  200a73:	55                   	push   %ebp
  200a74:	89 e5                	mov    %esp,%ebp
  200a76:	83 ec 18             	sub    $0x18,%esp
  200a79:	c7 44 24 04 4e 17 20 	movl   $0x20174e,0x4(%esp)
  200a80:	00 
  200a81:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200a88:	e8 9b fe ff ff       	call   200928 <exception_handler>
  200a8d:	c9                   	leave  
  200a8e:	c3                   	ret    

00200a8f <inval_tss>:
  200a8f:	55                   	push   %ebp
  200a90:	89 e5                	mov    %esp,%ebp
  200a92:	83 ec 18             	sub    $0x18,%esp
  200a95:	c7 44 24 04 5f 17 20 	movl   $0x20175f,0x4(%esp)
  200a9c:	00 
  200a9d:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200aa4:	e8 7f fe ff ff       	call   200928 <exception_handler>
  200aa9:	c9                   	leave  
  200aaa:	c3                   	ret    

00200aab <segment_not_present>:
  200aab:	55                   	push   %ebp
  200aac:	89 e5                	mov    %esp,%ebp
  200aae:	83 ec 18             	sub    $0x18,%esp
  200ab1:	c7 44 24 04 69 17 20 	movl   $0x201769,0x4(%esp)
  200ab8:	00 
  200ab9:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200ac0:	e8 63 fe ff ff       	call   200928 <exception_handler>
  200ac5:	c9                   	leave  
  200ac6:	c3                   	ret    

00200ac7 <stack_exception>:
  200ac7:	55                   	push   %ebp
  200ac8:	89 e5                	mov    %esp,%ebp
  200aca:	83 ec 18             	sub    $0x18,%esp
  200acd:	c7 44 24 04 7d 17 20 	movl   $0x20177d,0x4(%esp)
  200ad4:	00 
  200ad5:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200adc:	e8 47 fe ff ff       	call   200928 <exception_handler>
  200ae1:	c9                   	leave  
  200ae2:	c3                   	ret    

00200ae3 <general_protection>:
  200ae3:	55                   	push   %ebp
  200ae4:	89 e5                	mov    %esp,%ebp
  200ae6:	83 ec 18             	sub    $0x18,%esp
  200ae9:	c7 44 24 04 8d 17 20 	movl   $0x20178d,0x4(%esp)
  200af0:	00 
  200af1:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200af8:	e8 2b fe ff ff       	call   200928 <exception_handler>
  200afd:	c9                   	leave  
  200afe:	c3                   	ret    

00200aff <page_fault>:
  200aff:	55                   	push   %ebp
  200b00:	89 e5                	mov    %esp,%ebp
  200b02:	83 ec 18             	sub    $0x18,%esp
  200b05:	c7 44 24 04 a0 17 20 	movl   $0x2017a0,0x4(%esp)
  200b0c:	00 
  200b0d:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200b14:	e8 0f fe ff ff       	call   200928 <exception_handler>
  200b19:	c9                   	leave  
  200b1a:	c3                   	ret    

00200b1b <copr_error>:
  200b1b:	55                   	push   %ebp
  200b1c:	89 e5                	mov    %esp,%ebp
  200b1e:	83 ec 18             	sub    $0x18,%esp
  200b21:	c7 44 24 04 ab 17 20 	movl   $0x2017ab,0x4(%esp)
  200b28:	00 
  200b29:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200b30:	e8 f3 fd ff ff       	call   200928 <exception_handler>
  200b35:	c9                   	leave  
  200b36:	c3                   	ret    

00200b37 <float_error>:
  200b37:	55                   	push   %ebp
  200b38:	89 e5                	mov    %esp,%ebp
  200b3a:	83 ec 18             	sub    $0x18,%esp
  200b3d:	c7 44 24 04 b6 17 20 	movl   $0x2017b6,0x4(%esp)
  200b44:	00 
  200b45:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200b4c:	e8 d7 fd ff ff       	call   200928 <exception_handler>
  200b51:	c9                   	leave  
  200b52:	c3                   	ret    

00200b53 <alignment_check>:
  200b53:	55                   	push   %ebp
  200b54:	89 e5                	mov    %esp,%ebp
  200b56:	83 ec 18             	sub    $0x18,%esp
  200b59:	c7 44 24 04 c2 17 20 	movl   $0x2017c2,0x4(%esp)
  200b60:	00 
  200b61:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200b68:	e8 bb fd ff ff       	call   200928 <exception_handler>
  200b6d:	c9                   	leave  
  200b6e:	c3                   	ret    
  200b6f:	90                   	nop

00200b70 <dis_str>:
  200b70:	55                   	push   %ebp
  200b71:	89 e5                	mov    %esp,%ebp
  200b73:	57                   	push   %edi
  200b74:	53                   	push   %ebx
  200b75:	83 ec 30             	sub    $0x30,%esp
  200b78:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b7b:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200b7e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200b85:	8b 55 10             	mov    0x10(%ebp),%edx
  200b88:	89 d0                	mov    %edx,%eax
  200b8a:	c1 e0 02             	shl    $0x2,%eax
  200b8d:	01 d0                	add    %edx,%eax
  200b8f:	c1 e0 04             	shl    $0x4,%eax
  200b92:	89 c2                	mov    %eax,%edx
  200b94:	8b 45 14             	mov    0x14(%ebp),%eax
  200b97:	01 d0                	add    %edx,%eax
  200b99:	01 c0                	add    %eax,%eax
  200b9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200b9e:	8b 45 08             	mov    0x8(%ebp),%eax
  200ba1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200ba4:	8b 45 08             	mov    0x8(%ebp),%eax
  200ba7:	89 04 24             	mov    %eax,(%esp)
  200baa:	e8 02 01 00 00       	call   200cb1 <strlen>
  200baf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200bb2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200bb9:	eb 2e                	jmp    200be9 <dis_str+0x79>
  200bbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200bbe:	8d 50 01             	lea    0x1(%eax),%edx
  200bc1:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200bc4:	0f b6 00             	movzbl (%eax),%eax
  200bc7:	88 45 e7             	mov    %al,-0x19(%ebp)
  200bca:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200bce:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200bd2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200bd5:	89 d3                	mov    %edx,%ebx
  200bd7:	89 cf                	mov    %ecx,%edi
  200bd9:	88 c4                	mov    %al,%ah
  200bdb:	88 d8                	mov    %bl,%al
  200bdd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200be1:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200be5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bec:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200bef:	7c ca                	jl     200bbb <dis_str+0x4b>
  200bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bf4:	83 c4 30             	add    $0x30,%esp
  200bf7:	5b                   	pop    %ebx
  200bf8:	5f                   	pop    %edi
  200bf9:	5d                   	pop    %ebp
  200bfa:	c3                   	ret    

00200bfb <dis_nchar>:
  200bfb:	55                   	push   %ebp
  200bfc:	89 e5                	mov    %esp,%ebp
  200bfe:	57                   	push   %edi
  200bff:	53                   	push   %ebx
  200c00:	83 ec 14             	sub    $0x14,%esp
  200c03:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c06:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200c09:	8b 55 14             	mov    0x14(%ebp),%edx
  200c0c:	89 d0                	mov    %edx,%eax
  200c0e:	c1 e0 02             	shl    $0x2,%eax
  200c11:	01 d0                	add    %edx,%eax
  200c13:	c1 e0 04             	shl    $0x4,%eax
  200c16:	89 c2                	mov    %eax,%edx
  200c18:	8b 45 18             	mov    0x18(%ebp),%eax
  200c1b:	01 d0                	add    %edx,%eax
  200c1d:	01 c0                	add    %eax,%eax
  200c1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200c22:	8b 45 08             	mov    0x8(%ebp),%eax
  200c25:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200c28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200c2f:	eb 2e                	jmp    200c5f <dis_nchar+0x64>
  200c31:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200c34:	8d 50 01             	lea    0x1(%eax),%edx
  200c37:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200c3a:	0f b6 00             	movzbl (%eax),%eax
  200c3d:	88 45 eb             	mov    %al,-0x15(%ebp)
  200c40:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200c44:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200c48:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200c4b:	89 d3                	mov    %edx,%ebx
  200c4d:	89 cf                	mov    %ecx,%edi
  200c4f:	88 c4                	mov    %al,%ah
  200c51:	88 d8                	mov    %bl,%al
  200c53:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200c57:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200c5b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200c5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c62:	3b 45 10             	cmp    0x10(%ebp),%eax
  200c65:	7c ca                	jl     200c31 <dis_nchar+0x36>
  200c67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c6a:	83 c4 14             	add    $0x14,%esp
  200c6d:	5b                   	pop    %ebx
  200c6e:	5f                   	pop    %edi
  200c6f:	5d                   	pop    %ebp
  200c70:	c3                   	ret    
  200c71:	66 90                	xchg   %ax,%ax
  200c73:	90                   	nop

00200c74 <memcpy>:
  200c74:	55                   	push   %ebp
  200c75:	89 e5                	mov    %esp,%ebp
  200c77:	83 ec 10             	sub    $0x10,%esp
  200c7a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200c80:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c83:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c86:	eb 17                	jmp    200c9f <memcpy+0x2b>
  200c88:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c8b:	8d 50 01             	lea    0x1(%eax),%edx
  200c8e:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200c91:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200c94:	8d 4a 01             	lea    0x1(%edx),%ecx
  200c97:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200c9a:	0f b6 12             	movzbl (%edx),%edx
  200c9d:	88 10                	mov    %dl,(%eax)
  200c9f:	8b 45 10             	mov    0x10(%ebp),%eax
  200ca2:	8d 50 ff             	lea    -0x1(%eax),%edx
  200ca5:	89 55 10             	mov    %edx,0x10(%ebp)
  200ca8:	85 c0                	test   %eax,%eax
  200caa:	75 dc                	jne    200c88 <memcpy+0x14>
  200cac:	8b 45 08             	mov    0x8(%ebp),%eax
  200caf:	c9                   	leave  
  200cb0:	c3                   	ret    

00200cb1 <strlen>:
  200cb1:	55                   	push   %ebp
  200cb2:	89 e5                	mov    %esp,%ebp
  200cb4:	83 ec 10             	sub    $0x10,%esp
  200cb7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  200cc1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200cc4:	eb 08                	jmp    200cce <strlen+0x1d>
  200cc6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200cca:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200cce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200cd1:	0f b6 00             	movzbl (%eax),%eax
  200cd4:	84 c0                	test   %al,%al
  200cd6:	75 ee                	jne    200cc6 <strlen+0x15>
  200cd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200cdb:	c9                   	leave  
  200cdc:	c3                   	ret    

00200cdd <strcmp>:
  200cdd:	55                   	push   %ebp
  200cde:	89 e5                	mov    %esp,%ebp
  200ce0:	eb 0c                	jmp    200cee <strcmp+0x11>
  200ce2:	8b 45 08             	mov    0x8(%ebp),%eax
  200ce5:	0f b6 00             	movzbl (%eax),%eax
  200ce8:	84 c0                	test   %al,%al
  200cea:	75 02                	jne    200cee <strcmp+0x11>
  200cec:	eb 1c                	jmp    200d0a <strcmp+0x2d>
  200cee:	8b 45 08             	mov    0x8(%ebp),%eax
  200cf1:	8d 50 01             	lea    0x1(%eax),%edx
  200cf4:	89 55 08             	mov    %edx,0x8(%ebp)
  200cf7:	0f b6 08             	movzbl (%eax),%ecx
  200cfa:	8b 45 0c             	mov    0xc(%ebp),%eax
  200cfd:	8d 50 01             	lea    0x1(%eax),%edx
  200d00:	89 55 0c             	mov    %edx,0xc(%ebp)
  200d03:	0f b6 00             	movzbl (%eax),%eax
  200d06:	38 c1                	cmp    %al,%cl
  200d08:	74 d8                	je     200ce2 <strcmp+0x5>
  200d0a:	8b 45 08             	mov    0x8(%ebp),%eax
  200d0d:	0f b6 00             	movzbl (%eax),%eax
  200d10:	0f be d0             	movsbl %al,%edx
  200d13:	8b 45 0c             	mov    0xc(%ebp),%eax
  200d16:	0f b6 00             	movzbl (%eax),%eax
  200d19:	0f be c0             	movsbl %al,%eax
  200d1c:	29 c2                	sub    %eax,%edx
  200d1e:	89 d0                	mov    %edx,%eax
  200d20:	5d                   	pop    %ebp
  200d21:	c3                   	ret    

00200d22 <memset>:
  200d22:	55                   	push   %ebp
  200d23:	89 e5                	mov    %esp,%ebp
  200d25:	83 ec 10             	sub    $0x10,%esp
  200d28:	8b 45 08             	mov    0x8(%ebp),%eax
  200d2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200d2e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200d35:	eb 12                	jmp    200d49 <memset+0x27>
  200d37:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200d3a:	8d 50 01             	lea    0x1(%eax),%edx
  200d3d:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200d40:	8b 55 0c             	mov    0xc(%ebp),%edx
  200d43:	88 10                	mov    %dl,(%eax)
  200d45:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200d49:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200d4c:	3b 45 10             	cmp    0x10(%ebp),%eax
  200d4f:	72 e6                	jb     200d37 <memset+0x15>
  200d51:	8b 45 08             	mov    0x8(%ebp),%eax
  200d54:	c9                   	leave  
  200d55:	c3                   	ret    
  200d56:	66 90                	xchg   %ax,%ax

00200d58 <testA>:
  200d58:	55                   	push   %ebp
  200d59:	89 e5                	mov    %esp,%ebp
  200d5b:	83 ec 18             	sub    $0x18,%esp
  200d5e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200d65:	00 
  200d66:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  200d6d:	00 
  200d6e:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200d75:	00 
  200d76:	c7 04 24 d2 17 20 00 	movl   $0x2017d2,(%esp)
  200d7d:	e8 ee fd ff ff       	call   200b70 <dis_str>
  200d82:	b8 01 00 00 00       	mov    $0x1,%eax
  200d87:	bb 02 00 00 00       	mov    $0x2,%ebx
  200d8c:	b9 03 00 00 00       	mov    $0x3,%ecx
  200d91:	ba 04 00 00 00       	mov    $0x4,%edx
  200d96:	be 05 00 00 00       	mov    $0x5,%esi
  200d9b:	bf 06 00 00 00       	mov    $0x6,%edi
  200da0:	cd 80                	int    $0x80
  200da2:	65 fe 05 c8 00 00 00 	incb   %gs:0xc8
  200da9:	eb f7                	jmp    200da2 <testA+0x4a>

00200dab <init_thread>:
  200dab:	55                   	push   %ebp
  200dac:	89 e5                	mov    %esp,%ebp
  200dae:	83 ec 28             	sub    $0x28,%esp
  200db1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200db8:	00 
  200db9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200dc0:	00 
  200dc1:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200dc8:	00 
  200dc9:	c7 04 24 e6 17 20 00 	movl   $0x2017e6,(%esp)
  200dd0:	e8 9b fd ff ff       	call   200b70 <dis_str>
  200dd5:	c7 44 24 04 58 0d 20 	movl   $0x200d58,0x4(%esp)
  200ddc:	00 
  200ddd:	c7 04 24 fb 17 20 00 	movl   $0x2017fb,(%esp)
  200de4:	e8 21 01 00 00       	call   200f0a <thread_creat>
  200de9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200def:	83 c0 20             	add    $0x20,%eax
  200df2:	a3 00 80 22 00       	mov    %eax,0x228000
  200df7:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  200dfe:	00 21 00 
  200e01:	a1 00 80 22 00       	mov    0x228000,%eax
  200e06:	83 e8 20             	sub    $0x20,%eax
  200e09:	a3 08 80 22 00       	mov    %eax,0x228008
  200e0e:	65 fe 05 28 00 00 00 	incb   %gs:0x28
  200e15:	eb f7                	jmp    200e0e <init_thread+0x63>

00200e17 <creat_init>:
  200e17:	55                   	push   %ebp
  200e18:	89 e5                	mov    %esp,%ebp
  200e1a:	83 ec 18             	sub    $0x18,%esp
  200e1d:	c7 05 04 00 21 00 00 	movl   $0x0,0x210004
  200e24:	00 00 00 
  200e27:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200e2e:	00 
  200e2f:	c7 44 24 04 01 18 20 	movl   $0x201801,0x4(%esp)
  200e36:	00 
  200e37:	c7 04 24 0c 00 21 00 	movl   $0x21000c,(%esp)
  200e3e:	e8 31 fe ff ff       	call   200c74 <memcpy>
  200e43:	b8 ab 0d 20 00       	mov    $0x200dab,%eax
  200e48:	a3 08 00 21 00       	mov    %eax,0x210008
  200e4d:	b8 00 00 22 00       	mov    $0x220000,%eax
  200e52:	a3 00 00 21 00       	mov    %eax,0x210000
  200e57:	c7 05 1c 00 21 00 00 	movl   $0x218000,0x21001c
  200e5e:	80 21 00 
  200e61:	c7 04 24 20 00 21 00 	movl   $0x210020,(%esp)
  200e68:	e8 af 06 00 00       	call   20151c <INIT_LIST_HEAD>
  200e6d:	c7 05 0c 00 22 00 28 	movl   $0x28,0x22000c
  200e74:	00 00 00 
  200e77:	c7 05 34 00 22 00 20 	movl   $0x20,0x220034
  200e7e:	00 00 00 
  200e81:	c7 05 08 00 22 00 28 	movl   $0x28,0x220008
  200e88:	00 00 00 
  200e8b:	c7 05 04 00 22 00 28 	movl   $0x28,0x220004
  200e92:	00 00 00 
  200e95:	c7 05 3c 00 22 00 28 	movl   $0x28,0x22003c
  200e9c:	00 00 00 
  200e9f:	c7 05 00 00 22 00 48 	movl   $0x48,0x220000
  200ea6:	00 00 00 
  200ea9:	b8 ab 0d 20 00       	mov    $0x200dab,%eax
  200eae:	a3 30 00 22 00       	mov    %eax,0x220030
  200eb3:	a1 1c 00 21 00       	mov    0x21001c,%eax
  200eb8:	a3 38 00 22 00       	mov    %eax,0x220038
  200ebd:	c7 05 40 00 22 00 02 	movl   $0x1202,0x220040
  200ec4:	12 00 00 
  200ec7:	c7 05 44 00 22 00 00 	movl   $0x210000,0x220044
  200ece:	00 21 00 
  200ed1:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  200ed8:	00 21 00 
  200edb:	c7 04 24 00 00 21 00 	movl   $0x210000,(%esp)
  200ee2:	e8 39 01 00 00       	call   201020 <schedule>
  200ee7:	c9                   	leave  
  200ee8:	c3                   	ret    

00200ee9 <get_pid>:
  200ee9:	55                   	push   %ebp
  200eea:	89 e5                	mov    %esp,%ebp
  200eec:	83 ec 10             	sub    $0x10,%esp
  200eef:	a1 a0 89 20 00       	mov    0x2089a0,%eax
  200ef4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200ef7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200efa:	8d 50 01             	lea    0x1(%eax),%edx
  200efd:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200f00:	a3 a0 89 20 00       	mov    %eax,0x2089a0
  200f05:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200f08:	c9                   	leave  
  200f09:	c3                   	ret    

00200f0a <thread_creat>:
  200f0a:	55                   	push   %ebp
  200f0b:	89 e5                	mov    %esp,%ebp
  200f0d:	83 ec 28             	sub    $0x28,%esp
  200f10:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200f17:	e8 6f 02 00 00       	call   20118b <get_pages>
  200f1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200f1f:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200f26:	e8 60 02 00 00       	call   20118b <get_pages>
  200f2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200f2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f31:	83 c0 20             	add    $0x20,%eax
  200f34:	89 04 24             	mov    %eax,(%esp)
  200f37:	e8 e0 05 00 00       	call   20151c <INIT_LIST_HEAD>
  200f3c:	e8 a8 ff ff ff       	call   200ee9 <get_pid>
  200f41:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f44:	89 42 04             	mov    %eax,0x4(%edx)
  200f47:	8b 45 08             	mov    0x8(%ebp),%eax
  200f4a:	89 04 24             	mov    %eax,(%esp)
  200f4d:	e8 5f fd ff ff       	call   200cb1 <strlen>
  200f52:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f55:	83 c2 0c             	add    $0xc,%edx
  200f58:	89 44 24 08          	mov    %eax,0x8(%esp)
  200f5c:	8b 45 08             	mov    0x8(%ebp),%eax
  200f5f:	89 44 24 04          	mov    %eax,0x4(%esp)
  200f63:	89 14 24             	mov    %edx,(%esp)
  200f66:	e8 09 fd ff ff       	call   200c74 <memcpy>
  200f6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  200f6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f71:	89 50 08             	mov    %edx,0x8(%eax)
  200f74:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200f77:	05 00 80 00 00       	add    $0x8000,%eax
  200f7c:	89 c2                	mov    %eax,%edx
  200f7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f81:	89 10                	mov    %edx,(%eax)
  200f83:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200f86:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f89:	89 50 1c             	mov    %edx,0x1c(%eax)
  200f8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200f8f:	c7 80 0c 80 00 00 28 	movl   $0x28,0x800c(%eax)
  200f96:	00 00 00 
  200f99:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200f9c:	c7 80 34 80 00 00 20 	movl   $0x20,0x8034(%eax)
  200fa3:	00 00 00 
  200fa6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fa9:	c7 80 08 80 00 00 28 	movl   $0x28,0x8008(%eax)
  200fb0:	00 00 00 
  200fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fb6:	c7 80 04 80 00 00 28 	movl   $0x28,0x8004(%eax)
  200fbd:	00 00 00 
  200fc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fc3:	c7 80 3c 80 00 00 28 	movl   $0x28,0x803c(%eax)
  200fca:	00 00 00 
  200fcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fd0:	c7 80 00 80 00 00 48 	movl   $0x48,0x8000(%eax)
  200fd7:	00 00 00 
  200fda:	8b 55 0c             	mov    0xc(%ebp),%edx
  200fdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fe0:	89 90 30 80 00 00    	mov    %edx,0x8030(%eax)
  200fe6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200fe9:	8b 40 1c             	mov    0x1c(%eax),%eax
  200fec:	89 c2                	mov    %eax,%edx
  200fee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200ff1:	89 90 38 80 00 00    	mov    %edx,0x8038(%eax)
  200ff7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200ffa:	c7 80 40 80 00 00 02 	movl   $0x1202,0x8040(%eax)
  201001:	12 00 00 
  201004:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201007:	c7 80 44 80 00 00 00 	movl   $0x210000,0x8044(%eax)
  20100e:	00 21 00 
  201011:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  201018:	00 21 00 
  20101b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20101e:	c9                   	leave  
  20101f:	c3                   	ret    

00201020 <schedule>:
  201020:	55                   	push   %ebp
  201021:	89 e5                	mov    %esp,%ebp
  201023:	8b 45 08             	mov    0x8(%ebp),%eax
  201026:	8b 00                	mov    (%eax),%eax
  201028:	89 c4                	mov    %eax,%esp
  20102a:	e9 05 00 00 00       	jmp    201034 <switch_to>
  20102f:	5d                   	pop    %ebp
  201030:	c3                   	ret    
  201031:	66 90                	xchg   %ax,%ax
  201033:	90                   	nop

00201034 <switch_to>:
  201034:	89 c4                	mov    %eax,%esp
  201036:	0f a9                	pop    %gs
  201038:	0f a1                	pop    %fs
  20103a:	07                   	pop    %es
  20103b:	1f                   	pop    %ds
  20103c:	61                   	popa   
  20103d:	cb                   	lret   
  20103e:	66 90                	xchg   %ax,%ax

00201040 <get_memory_info>:
  201040:	55                   	push   %ebp
  201041:	89 e5                	mov    %esp,%ebp
  201043:	83 ec 28             	sub    $0x28,%esp
  201046:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20104d:	a1 00 00 10 00       	mov    0x100000,%eax
  201052:	a3 84 80 22 00       	mov    %eax,0x228084
  201057:	a1 04 00 10 00       	mov    0x100004,%eax
  20105c:	a3 88 80 22 00       	mov    %eax,0x228088
  201061:	a1 08 00 10 00       	mov    0x100008,%eax
  201066:	a3 8c 80 22 00       	mov    %eax,0x22808c
  20106b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201072:	eb 3e                	jmp    2010b2 <get_memory_info+0x72>
  201074:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201077:	89 d0                	mov    %edx,%eax
  201079:	c1 e0 02             	shl    $0x2,%eax
  20107c:	01 d0                	add    %edx,%eax
  20107e:	c1 e0 02             	shl    $0x2,%eax
  201081:	05 00 80 00 00       	add    $0x8000,%eax
  201086:	89 c1                	mov    %eax,%ecx
  201088:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20108b:	89 d0                	mov    %edx,%eax
  20108d:	c1 e0 02             	shl    $0x2,%eax
  201090:	01 d0                	add    %edx,%eax
  201092:	c1 e0 02             	shl    $0x2,%eax
  201095:	05 20 80 22 00       	add    $0x228020,%eax
  20109a:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  2010a1:	00 
  2010a2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  2010a6:	89 04 24             	mov    %eax,(%esp)
  2010a9:	e8 c6 fb ff ff       	call   200c74 <memcpy>
  2010ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2010b2:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  2010b6:	7e bc                	jle    201074 <get_memory_info+0x34>
  2010b8:	90                   	nop
  2010b9:	c9                   	leave  
  2010ba:	c3                   	ret    
  2010bb:	90                   	nop

002010bc <init_page_bit_map>:
  2010bc:	55                   	push   %ebp
  2010bd:	89 e5                	mov    %esp,%ebp
  2010bf:	83 ec 10             	sub    $0x10,%esp
  2010c2:	a1 0c 40 20 00       	mov    0x20400c,%eax
  2010c7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2010ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2010d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2010d8:	eb 4f                	jmp    201129 <init_page_bit_map+0x6d>
  2010da:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2010dd:	89 d0                	mov    %edx,%eax
  2010df:	c1 e0 02             	shl    $0x2,%eax
  2010e2:	01 d0                	add    %edx,%eax
  2010e4:	c1 e0 02             	shl    $0x2,%eax
  2010e7:	05 30 80 22 00       	add    $0x228030,%eax
  2010ec:	8b 00                	mov    (%eax),%eax
  2010ee:	83 f8 01             	cmp    $0x1,%eax
  2010f1:	75 32                	jne    201125 <init_page_bit_map+0x69>
  2010f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2010f6:	89 d0                	mov    %edx,%eax
  2010f8:	c1 e0 02             	shl    $0x2,%eax
  2010fb:	01 d0                	add    %edx,%eax
  2010fd:	c1 e0 02             	shl    $0x2,%eax
  201100:	05 20 80 22 00       	add    $0x228020,%eax
  201105:	8b 40 08             	mov    0x8(%eax),%eax
  201108:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  20110b:	76 18                	jbe    201125 <init_page_bit_map+0x69>
  20110d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201110:	89 d0                	mov    %edx,%eax
  201112:	c1 e0 02             	shl    $0x2,%eax
  201115:	01 d0                	add    %edx,%eax
  201117:	c1 e0 02             	shl    $0x2,%eax
  20111a:	05 20 80 22 00       	add    $0x228020,%eax
  20111f:	8b 40 08             	mov    0x8(%eax),%eax
  201122:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201125:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201129:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20112c:	a1 8c 80 22 00       	mov    0x22808c,%eax
  201131:	39 c2                	cmp    %eax,%edx
  201133:	72 a5                	jb     2010da <init_page_bit_map+0x1e>
  201135:	a1 0c 40 20 00       	mov    0x20400c,%eax
  20113a:	29 45 f4             	sub    %eax,-0xc(%ebp)
  20113d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201140:	05 ff 0f 00 00       	add    $0xfff,%eax
  201145:	c1 e8 0c             	shr    $0xc,%eax
  201148:	a3 a4 89 20 00       	mov    %eax,0x2089a4
  20114d:	a1 a4 89 20 00       	mov    0x2089a4,%eax
  201152:	83 c0 07             	add    $0x7,%eax
  201155:	c1 e8 03             	shr    $0x3,%eax
  201158:	a3 a8 89 20 00       	mov    %eax,0x2089a8
  20115d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201164:	eb 0e                	jmp    201174 <init_page_bit_map+0xb8>
  201166:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201169:	c6 00 00             	movb   $0x0,(%eax)
  20116c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  201170:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201174:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201177:	a1 a8 89 20 00       	mov    0x2089a8,%eax
  20117c:	39 c2                	cmp    %eax,%edx
  20117e:	72 e6                	jb     201166 <init_page_bit_map+0xaa>
  201180:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201185:	c6 00 80             	movb   $0x80,(%eax)
  201188:	90                   	nop
  201189:	c9                   	leave  
  20118a:	c3                   	ret    

0020118b <get_pages>:
  20118b:	55                   	push   %ebp
  20118c:	89 e5                	mov    %esp,%ebp
  20118e:	83 ec 28             	sub    $0x28,%esp
  201191:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201196:	89 45 e8             	mov    %eax,-0x18(%ebp)
  201199:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20119d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  2011a1:	76 4b                	jbe    2011ee <get_pages+0x63>
  2011a3:	fa                   	cli    
  2011a4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2011ab:	00 
  2011ac:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2011b3:	00 
  2011b4:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
  2011bb:	00 
  2011bc:	c7 04 24 10 18 20 00 	movl   $0x201810,(%esp)
  2011c3:	e8 a8 f9 ff ff       	call   200b70 <dis_str>
  2011c8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2011cf:	00 
  2011d0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2011d7:	00 
  2011d8:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2011df:	00 
  2011e0:	c7 04 24 18 18 20 00 	movl   $0x201818,(%esp)
  2011e7:	e8 84 f9 ff ff       	call   200b70 <dis_str>
  2011ec:	eb fe                	jmp    2011ec <get_pages+0x61>
  2011ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2011f5:	eb 10                	jmp    201207 <get_pages+0x7c>
  2011f7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2011fb:	01 c0                	add    %eax,%eax
  2011fd:	83 c8 01             	or     $0x1,%eax
  201200:	88 45 ef             	mov    %al,-0x11(%ebp)
  201203:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201207:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20120a:	3b 45 08             	cmp    0x8(%ebp),%eax
  20120d:	72 e8                	jb     2011f7 <get_pages+0x6c>
  20120f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201216:	eb 60                	jmp    201278 <get_pages+0xed>
  201218:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20121f:	eb 46                	jmp    201267 <get_pages+0xdc>
  201221:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201224:	0f b6 00             	movzbl (%eax),%eax
  201227:	22 45 ef             	and    -0x11(%ebp),%al
  20122a:	84 c0                	test   %al,%al
  20122c:	75 32                	jne    201260 <get_pages+0xd5>
  20122e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201231:	0f b6 00             	movzbl (%eax),%eax
  201234:	0a 45 ef             	or     -0x11(%ebp),%al
  201237:	89 c2                	mov    %eax,%edx
  201239:	8b 45 e8             	mov    -0x18(%ebp),%eax
  20123c:	88 10                	mov    %dl,(%eax)
  20123e:	8b 15 0c 40 20 00    	mov    0x20400c,%edx
  201244:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201247:	c1 e0 03             	shl    $0x3,%eax
  20124a:	89 c1                	mov    %eax,%ecx
  20124c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20124f:	f7 d8                	neg    %eax
  201251:	2b 45 08             	sub    0x8(%ebp),%eax
  201254:	01 c8                	add    %ecx,%eax
  201256:	83 c0 08             	add    $0x8,%eax
  201259:	c1 e0 0c             	shl    $0xc,%eax
  20125c:	01 d0                	add    %edx,%eax
  20125e:	eb 29                	jmp    201289 <get_pages+0xfe>
  201260:	d0 65 ef             	shlb   -0x11(%ebp)
  201263:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  201267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20126a:	8b 45 08             	mov    0x8(%ebp),%eax
  20126d:	01 d0                	add    %edx,%eax
  20126f:	83 f8 07             	cmp    $0x7,%eax
  201272:	76 ad                	jbe    201221 <get_pages+0x96>
  201274:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201278:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20127b:	a1 a8 89 20 00       	mov    0x2089a8,%eax
  201280:	39 c2                	cmp    %eax,%edx
  201282:	72 94                	jb     201218 <get_pages+0x8d>
  201284:	b8 00 00 00 00       	mov    $0x0,%eax
  201289:	c9                   	leave  
  20128a:	c3                   	ret    

0020128b <free_pages>:
  20128b:	55                   	push   %ebp
  20128c:	89 e5                	mov    %esp,%ebp
  20128e:	53                   	push   %ebx
  20128f:	83 ec 10             	sub    $0x10,%esp
  201292:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201297:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20129a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  20129e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2012a5:	eb 10                	jmp    2012b7 <free_pages+0x2c>
  2012a7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  2012ab:	01 c0                	add    %eax,%eax
  2012ad:	83 c8 01             	or     $0x1,%eax
  2012b0:	88 45 f7             	mov    %al,-0x9(%ebp)
  2012b3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  2012b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2012ba:	3b 45 0c             	cmp    0xc(%ebp),%eax
  2012bd:	72 e8                	jb     2012a7 <free_pages+0x1c>
  2012bf:	8b 55 08             	mov    0x8(%ebp),%edx
  2012c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2012c5:	29 c2                	sub    %eax,%edx
  2012c7:	89 d0                	mov    %edx,%eax
  2012c9:	c1 f8 0c             	sar    $0xc,%eax
  2012cc:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  2012d2:	85 c0                	test   %eax,%eax
  2012d4:	0f 48 c2             	cmovs  %edx,%eax
  2012d7:	c1 f8 0c             	sar    $0xc,%eax
  2012da:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2012dd:	0f b6 5d f7          	movzbl -0x9(%ebp),%ebx
  2012e1:	8b 55 08             	mov    0x8(%ebp),%edx
  2012e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2012e7:	29 c2                	sub    %eax,%edx
  2012e9:	89 d0                	mov    %edx,%eax
  2012eb:	c1 f8 0c             	sar    $0xc,%eax
  2012ee:	89 c2                	mov    %eax,%edx
  2012f0:	89 d0                	mov    %edx,%eax
  2012f2:	c1 f8 1f             	sar    $0x1f,%eax
  2012f5:	c1 e8 1d             	shr    $0x1d,%eax
  2012f8:	01 c2                	add    %eax,%edx
  2012fa:	83 e2 07             	and    $0x7,%edx
  2012fd:	29 c2                	sub    %eax,%edx
  2012ff:	89 d0                	mov    %edx,%eax
  201301:	f7 d8                	neg    %eax
  201303:	2b 45 0c             	sub    0xc(%ebp),%eax
  201306:	83 c0 08             	add    $0x8,%eax
  201309:	89 c1                	mov    %eax,%ecx
  20130b:	d3 e3                	shl    %cl,%ebx
  20130d:	89 d8                	mov    %ebx,%eax
  20130f:	f7 d0                	not    %eax
  201311:	88 45 f7             	mov    %al,-0x9(%ebp)
  201314:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201317:	01 45 f0             	add    %eax,-0x10(%ebp)
  20131a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20131d:	0f b6 00             	movzbl (%eax),%eax
  201320:	22 45 f7             	and    -0x9(%ebp),%al
  201323:	89 c2                	mov    %eax,%edx
  201325:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201328:	88 10                	mov    %dl,(%eax)
  20132a:	90                   	nop
  20132b:	83 c4 10             	add    $0x10,%esp
  20132e:	5b                   	pop    %ebx
  20132f:	5d                   	pop    %ebp
  201330:	c3                   	ret    

00201331 <get_page_cnt>:
  201331:	55                   	push   %ebp
  201332:	89 e5                	mov    %esp,%ebp
  201334:	83 ec 10             	sub    $0x10,%esp
  201337:	c7 45 f8 20 80 22 00 	movl   $0x228020,-0x8(%ebp)
  20133e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201345:	eb 32                	jmp    201379 <get_page_cnt+0x48>
  201347:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20134a:	89 d0                	mov    %edx,%eax
  20134c:	c1 e0 02             	shl    $0x2,%eax
  20134f:	01 d0                	add    %edx,%eax
  201351:	c1 e0 02             	shl    $0x2,%eax
  201354:	05 30 80 22 00       	add    $0x228030,%eax
  201359:	8b 00                	mov    (%eax),%eax
  20135b:	83 f8 01             	cmp    $0x1,%eax
  20135e:	75 15                	jne    201375 <get_page_cnt+0x44>
  201360:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201363:	89 d0                	mov    %edx,%eax
  201365:	c1 e0 02             	shl    $0x2,%eax
  201368:	01 d0                	add    %edx,%eax
  20136a:	c1 e0 02             	shl    $0x2,%eax
  20136d:	05 20 80 22 00       	add    $0x228020,%eax
  201372:	89 45 f8             	mov    %eax,-0x8(%ebp)
  201375:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201379:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20137c:	a1 8c 80 22 00       	mov    0x22808c,%eax
  201381:	39 c2                	cmp    %eax,%edx
  201383:	72 c2                	jb     201347 <get_page_cnt+0x16>
  201385:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201388:	8b 10                	mov    (%eax),%edx
  20138a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20138d:	8b 40 08             	mov    0x8(%eax),%eax
  201390:	01 d0                	add    %edx,%eax
  201392:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201395:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201398:	05 ff 0f 00 00       	add    $0xfff,%eax
  20139d:	c1 e8 0c             	shr    $0xc,%eax
  2013a0:	c9                   	leave  
  2013a1:	c3                   	ret    

002013a2 <get_ptet_cnt>:
  2013a2:	55                   	push   %ebp
  2013a3:	89 e5                	mov    %esp,%ebp
  2013a5:	8b 45 08             	mov    0x8(%ebp),%eax
  2013a8:	05 ff 03 00 00       	add    $0x3ff,%eax
  2013ad:	c1 e8 0a             	shr    $0xa,%eax
  2013b0:	5d                   	pop    %ebp
  2013b1:	c3                   	ret    

002013b2 <set_page>:
  2013b2:	55                   	push   %ebp
  2013b3:	89 e5                	mov    %esp,%ebp
  2013b5:	83 ec 34             	sub    $0x34,%esp
  2013b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2013bf:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  2013c6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  2013cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2013d4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2013db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2013e2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2013e9:	e8 43 ff ff ff       	call   201331 <get_page_cnt>
  2013ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2013f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2013f4:	89 04 24             	mov    %eax,(%esp)
  2013f7:	e8 a6 ff ff ff       	call   2013a2 <get_ptet_cnt>
  2013fc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2013ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
  201402:	89 04 24             	mov    %eax,(%esp)
  201405:	e8 98 ff ff ff       	call   2013a2 <get_ptet_cnt>
  20140a:	89 45 dc             	mov    %eax,-0x24(%ebp)
  20140d:	c7 45 f0 00 00 10 00 	movl   $0x100000,-0x10(%ebp)
  201414:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201417:	89 45 d8             	mov    %eax,-0x28(%ebp)
  20141a:	c7 45 ec 00 10 10 00 	movl   $0x101000,-0x14(%ebp)
  201421:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201428:	eb 6c                	jmp    201496 <set_page+0xe4>
  20142a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  201431:	eb 50                	jmp    201483 <set_page+0xd1>
  201433:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201436:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  20143b:	83 c8 07             	or     $0x7,%eax
  20143e:	89 c1                	mov    %eax,%ecx
  201440:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201443:	8b 55 f8             	mov    -0x8(%ebp),%edx
  201446:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201449:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201450:	eb 1c                	jmp    20146e <set_page+0xbc>
  201452:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201455:	83 c8 07             	or     $0x7,%eax
  201458:	89 c1                	mov    %eax,%ecx
  20145a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20145d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201460:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201463:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
  20146a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  20146e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201471:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  201476:	76 da                	jbe    201452 <set_page+0xa0>
  201478:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  20147f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  201483:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201486:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  201489:	7c a8                	jl     201433 <set_page+0x81>
  20148b:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  201492:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201496:	8b 45 fc             	mov    -0x4(%ebp),%eax
  201499:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  20149c:	7c 8c                	jl     20142a <set_page+0x78>
  20149e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2014a1:	0f 22 d8             	mov    %eax,%cr3
  2014a4:	0f 20 c0             	mov    %cr0,%eax
  2014a7:	0d 00 00 00 80       	or     $0x80000000,%eax
  2014ac:	0f 22 c0             	mov    %eax,%cr0
  2014af:	e8 08 fc ff ff       	call   2010bc <init_page_bit_map>
  2014b4:	90                   	nop
  2014b5:	c9                   	leave  
  2014b6:	c3                   	ret    
  2014b7:	90                   	nop

002014b8 <sys_entry>:
  2014b8:	1e                   	push   %ds
  2014b9:	06                   	push   %es
  2014ba:	0f a0                	push   %fs
  2014bc:	0f a8                	push   %gs
  2014be:	fb                   	sti    
  2014bf:	57                   	push   %edi
  2014c0:	56                   	push   %esi
  2014c1:	52                   	push   %edx
  2014c2:	51                   	push   %ecx
  2014c3:	53                   	push   %ebx
  2014c4:	50                   	push   %eax
  2014c5:	e8 22 00 00 00       	call   2014ec <syscall_handler>
  2014ca:	83 c4 18             	add    $0x18,%esp
  2014cd:	0f a9                	pop    %gs
  2014cf:	0f a1                	pop    %fs
  2014d1:	07                   	pop    %es
  2014d2:	1f                   	pop    %ds
  2014d3:	8b 04 24             	mov    (%esp),%eax
  2014d6:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  2014da:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  2014de:	89 44 24 04          	mov    %eax,0x4(%esp)
  2014e2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  2014e6:	89 0c 24             	mov    %ecx,(%esp)
  2014e9:	9d                   	popf   
  2014ea:	cb                   	lret   
  2014eb:	90                   	nop

002014ec <syscall_handler>:
  2014ec:	55                   	push   %ebp
  2014ed:	89 e5                	mov    %esp,%ebp
  2014ef:	83 ec 18             	sub    $0x18,%esp
  2014f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2014f9:	00 
  2014fa:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  201501:	00 
  201502:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
  201509:	00 
  20150a:	c7 04 24 40 18 20 00 	movl   $0x201840,(%esp)
  201511:	e8 5a f6 ff ff       	call   200b70 <dis_str>
  201516:	90                   	nop
  201517:	c9                   	leave  
  201518:	c3                   	ret    
  201519:	66 90                	xchg   %ax,%ax
  20151b:	90                   	nop

0020151c <INIT_LIST_HEAD>:
  20151c:	55                   	push   %ebp
  20151d:	89 e5                	mov    %esp,%ebp
  20151f:	8b 45 08             	mov    0x8(%ebp),%eax
  201522:	8b 55 08             	mov    0x8(%ebp),%edx
  201525:	89 50 04             	mov    %edx,0x4(%eax)
  201528:	8b 45 08             	mov    0x8(%ebp),%eax
  20152b:	8b 55 08             	mov    0x8(%ebp),%edx
  20152e:	89 10                	mov    %edx,(%eax)
  201530:	5d                   	pop    %ebp
  201531:	c3                   	ret    

00201532 <__list_add>:
  201532:	55                   	push   %ebp
  201533:	89 e5                	mov    %esp,%ebp
  201535:	8b 45 10             	mov    0x10(%ebp),%eax
  201538:	8b 55 08             	mov    0x8(%ebp),%edx
  20153b:	89 50 04             	mov    %edx,0x4(%eax)
  20153e:	8b 45 08             	mov    0x8(%ebp),%eax
  201541:	8b 55 10             	mov    0x10(%ebp),%edx
  201544:	89 10                	mov    %edx,(%eax)
  201546:	8b 45 08             	mov    0x8(%ebp),%eax
  201549:	8b 55 0c             	mov    0xc(%ebp),%edx
  20154c:	89 50 04             	mov    %edx,0x4(%eax)
  20154f:	8b 45 0c             	mov    0xc(%ebp),%eax
  201552:	8b 55 08             	mov    0x8(%ebp),%edx
  201555:	89 10                	mov    %edx,(%eax)
  201557:	5d                   	pop    %ebp
  201558:	c3                   	ret    

00201559 <list_add>:
  201559:	55                   	push   %ebp
  20155a:	89 e5                	mov    %esp,%ebp
  20155c:	83 ec 0c             	sub    $0xc,%esp
  20155f:	8b 45 0c             	mov    0xc(%ebp),%eax
  201562:	8b 00                	mov    (%eax),%eax
  201564:	89 44 24 08          	mov    %eax,0x8(%esp)
  201568:	8b 45 0c             	mov    0xc(%ebp),%eax
  20156b:	89 44 24 04          	mov    %eax,0x4(%esp)
  20156f:	8b 45 08             	mov    0x8(%ebp),%eax
  201572:	89 04 24             	mov    %eax,(%esp)
  201575:	e8 b8 ff ff ff       	call   201532 <__list_add>
  20157a:	c9                   	leave  
  20157b:	c3                   	ret    

0020157c <list_add_tail>:
  20157c:	55                   	push   %ebp
  20157d:	89 e5                	mov    %esp,%ebp
  20157f:	83 ec 0c             	sub    $0xc,%esp
  201582:	8b 45 0c             	mov    0xc(%ebp),%eax
  201585:	8b 40 04             	mov    0x4(%eax),%eax
  201588:	8b 55 0c             	mov    0xc(%ebp),%edx
  20158b:	89 54 24 08          	mov    %edx,0x8(%esp)
  20158f:	89 44 24 04          	mov    %eax,0x4(%esp)
  201593:	8b 45 08             	mov    0x8(%ebp),%eax
  201596:	89 04 24             	mov    %eax,(%esp)
  201599:	e8 94 ff ff ff       	call   201532 <__list_add>
  20159e:	c9                   	leave  
  20159f:	c3                   	ret    

002015a0 <__list_del>:
  2015a0:	55                   	push   %ebp
  2015a1:	89 e5                	mov    %esp,%ebp
  2015a3:	8b 45 08             	mov    0x8(%ebp),%eax
  2015a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  2015a9:	89 10                	mov    %edx,(%eax)
  2015ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  2015ae:	8b 55 08             	mov    0x8(%ebp),%edx
  2015b1:	89 50 04             	mov    %edx,0x4(%eax)
  2015b4:	5d                   	pop    %ebp
  2015b5:	c3                   	ret    

002015b6 <list_del>:
  2015b6:	55                   	push   %ebp
  2015b7:	89 e5                	mov    %esp,%ebp
  2015b9:	83 ec 08             	sub    $0x8,%esp
  2015bc:	8b 45 08             	mov    0x8(%ebp),%eax
  2015bf:	8b 10                	mov    (%eax),%edx
  2015c1:	8b 45 08             	mov    0x8(%ebp),%eax
  2015c4:	8b 40 04             	mov    0x4(%eax),%eax
  2015c7:	89 54 24 04          	mov    %edx,0x4(%esp)
  2015cb:	89 04 24             	mov    %eax,(%esp)
  2015ce:	e8 cd ff ff ff       	call   2015a0 <__list_del>
  2015d3:	8b 45 08             	mov    0x8(%ebp),%eax
  2015d6:	89 04 24             	mov    %eax,(%esp)
  2015d9:	e8 3e ff ff ff       	call   20151c <INIT_LIST_HEAD>
  2015de:	c9                   	leave  
  2015df:	c3                   	ret    

002015e0 <list_replace>:
  2015e0:	55                   	push   %ebp
  2015e1:	89 e5                	mov    %esp,%ebp
  2015e3:	83 ec 04             	sub    $0x4,%esp
  2015e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  2015e9:	8b 10                	mov    (%eax),%edx
  2015eb:	8b 45 08             	mov    0x8(%ebp),%eax
  2015ee:	89 10                	mov    %edx,(%eax)
  2015f0:	8b 45 08             	mov    0x8(%ebp),%eax
  2015f3:	8b 00                	mov    (%eax),%eax
  2015f5:	8b 55 08             	mov    0x8(%ebp),%edx
  2015f8:	89 50 04             	mov    %edx,0x4(%eax)
  2015fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  2015fe:	8b 50 04             	mov    0x4(%eax),%edx
  201601:	8b 45 08             	mov    0x8(%ebp),%eax
  201604:	89 50 04             	mov    %edx,0x4(%eax)
  201607:	8b 45 08             	mov    0x8(%ebp),%eax
  20160a:	8b 40 04             	mov    0x4(%eax),%eax
  20160d:	8b 55 08             	mov    0x8(%ebp),%edx
  201610:	89 10                	mov    %edx,(%eax)
  201612:	8b 45 0c             	mov    0xc(%ebp),%eax
  201615:	89 04 24             	mov    %eax,(%esp)
  201618:	e8 ff fe ff ff       	call   20151c <INIT_LIST_HEAD>
  20161d:	c9                   	leave  
  20161e:	c3                   	ret    
  20161f:	90                   	nop

00201620 <outb>:
  201620:	55                   	push   %ebp
  201621:	89 e5                	mov    %esp,%ebp
  201623:	83 ec 08             	sub    $0x8,%esp
  201626:	8b 55 08             	mov    0x8(%ebp),%edx
  201629:	8b 45 0c             	mov    0xc(%ebp),%eax
  20162c:	88 55 fc             	mov    %dl,-0x4(%ebp)
  20162f:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  201633:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  201637:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  20163b:	ee                   	out    %al,(%dx)
  20163c:	c9                   	leave  
  20163d:	c3                   	ret    

0020163e <io_delay>:
  20163e:	55                   	push   %ebp
  20163f:	89 e5                	mov    %esp,%ebp
  201641:	83 ec 10             	sub    $0x10,%esp
  201644:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  20164a:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  20164e:	89 c2                	mov    %eax,%edx
  201650:	ee                   	out    %al,(%dx)
  201651:	c9                   	leave  
  201652:	c3                   	ret    

00201653 <outb_pic>:
  201653:	55                   	push   %ebp
  201654:	89 e5                	mov    %esp,%ebp
  201656:	83 ec 0c             	sub    $0xc,%esp
  201659:	8b 45 08             	mov    0x8(%ebp),%eax
  20165c:	88 45 fc             	mov    %al,-0x4(%ebp)
  20165f:	8b 45 0c             	mov    0xc(%ebp),%eax
  201662:	0f b7 d0             	movzwl %ax,%edx
  201665:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  201669:	89 54 24 04          	mov    %edx,0x4(%esp)
  20166d:	89 04 24             	mov    %eax,(%esp)
  201670:	e8 ab ff ff ff       	call   201620 <outb>
  201675:	e8 c4 ff ff ff       	call   20163e <io_delay>
  20167a:	c9                   	leave  
  20167b:	c3                   	ret    

0020167c <init_8253>:
  20167c:	55                   	push   %ebp
  20167d:	89 e5                	mov    %esp,%ebp
  20167f:	83 ec 08             	sub    $0x8,%esp
  201682:	c7 44 24 04 43 00 00 	movl   $0x43,0x4(%esp)
  201689:	00 
  20168a:	c7 04 24 34 00 00 00 	movl   $0x34,(%esp)
  201691:	e8 bd ff ff ff       	call   201653 <outb_pic>
  201696:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
  20169d:	00 
  20169e:	c7 04 24 9b 00 00 00 	movl   $0x9b,(%esp)
  2016a5:	e8 a9 ff ff ff       	call   201653 <outb_pic>
  2016aa:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
  2016b1:	00 
  2016b2:	c7 04 24 2e 00 00 00 	movl   $0x2e,(%esp)
  2016b9:	e8 95 ff ff ff       	call   201653 <outb_pic>
  2016be:	90                   	nop
  2016bf:	c9                   	leave  
  2016c0:	c3                   	ret    
