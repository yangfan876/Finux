
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
  20001f:	e8 b4 0e 00 00       	call   200ed8 <get_memory_info>
  200024:	e8 ac 0f 00 00       	call   200fd5 <set_page>
  200029:	e8 ba 03 00 00       	call   2003e8 <disable_irqs>
  20002e:	e8 6d 07 00 00       	call   2007a0 <load_idt>
  200033:	e8 55 08 00 00       	call   20088d <init_timer>
  200038:	e8 d5 0d 00 00       	call   200e12 <creat_testA>
  20003d:	e8 e1 0c 00 00       	call   200d23 <creat_init>
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
  200496:	c7 44 24 08 0f 09 20 	movl   $0x20090f,0x8(%esp)
  20049d:	00 
  20049e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004a5:	00 
  2004a6:	c7 04 24 a0 81 20 00 	movl   $0x2081a0,(%esp)
  2004ad:	e8 92 ff ff ff       	call   200444 <set_gate>
  2004b2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004b9:	00 
  2004ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004c1:	00 
  2004c2:	c7 44 24 08 2b 09 20 	movl   $0x20092b,0x8(%esp)
  2004c9:	00 
  2004ca:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004d1:	00 
  2004d2:	c7 04 24 a8 81 20 00 	movl   $0x2081a8,(%esp)
  2004d9:	e8 66 ff ff ff       	call   200444 <set_gate>
  2004de:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004e5:	00 
  2004e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004ed:	00 
  2004ee:	c7 44 24 08 47 09 20 	movl   $0x200947,0x8(%esp)
  2004f5:	00 
  2004f6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004fd:	00 
  2004fe:	c7 04 24 b0 81 20 00 	movl   $0x2081b0,(%esp)
  200505:	e8 3a ff ff ff       	call   200444 <set_gate>
  20050a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200511:	00 
  200512:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200519:	00 
  20051a:	c7 44 24 08 63 09 20 	movl   $0x200963,0x8(%esp)
  200521:	00 
  200522:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200529:	00 
  20052a:	c7 04 24 b8 81 20 00 	movl   $0x2081b8,(%esp)
  200531:	e8 0e ff ff ff       	call   200444 <set_gate>
  200536:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20053d:	00 
  20053e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200545:	00 
  200546:	c7 44 24 08 7f 09 20 	movl   $0x20097f,0x8(%esp)
  20054d:	00 
  20054e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200555:	00 
  200556:	c7 04 24 c0 81 20 00 	movl   $0x2081c0,(%esp)
  20055d:	e8 e2 fe ff ff       	call   200444 <set_gate>
  200562:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200569:	00 
  20056a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200571:	00 
  200572:	c7 44 24 08 9b 09 20 	movl   $0x20099b,0x8(%esp)
  200579:	00 
  20057a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200581:	00 
  200582:	c7 04 24 c8 81 20 00 	movl   $0x2081c8,(%esp)
  200589:	e8 b6 fe ff ff       	call   200444 <set_gate>
  20058e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200595:	00 
  200596:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20059d:	00 
  20059e:	c7 44 24 08 b7 09 20 	movl   $0x2009b7,0x8(%esp)
  2005a5:	00 
  2005a6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005ad:	00 
  2005ae:	c7 04 24 d0 81 20 00 	movl   $0x2081d0,(%esp)
  2005b5:	e8 8a fe ff ff       	call   200444 <set_gate>
  2005ba:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005c1:	00 
  2005c2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005c9:	00 
  2005ca:	c7 44 24 08 d3 09 20 	movl   $0x2009d3,0x8(%esp)
  2005d1:	00 
  2005d2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005d9:	00 
  2005da:	c7 04 24 d8 81 20 00 	movl   $0x2081d8,(%esp)
  2005e1:	e8 5e fe ff ff       	call   200444 <set_gate>
  2005e6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005ed:	00 
  2005ee:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005f5:	00 
  2005f6:	c7 44 24 08 ef 09 20 	movl   $0x2009ef,0x8(%esp)
  2005fd:	00 
  2005fe:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200605:	00 
  200606:	c7 04 24 e0 81 20 00 	movl   $0x2081e0,(%esp)
  20060d:	e8 32 fe ff ff       	call   200444 <set_gate>
  200612:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200619:	00 
  20061a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200621:	00 
  200622:	c7 44 24 08 0b 0a 20 	movl   $0x200a0b,0x8(%esp)
  200629:	00 
  20062a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200631:	00 
  200632:	c7 04 24 e8 81 20 00 	movl   $0x2081e8,(%esp)
  200639:	e8 06 fe ff ff       	call   200444 <set_gate>
  20063e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200645:	00 
  200646:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20064d:	00 
  20064e:	c7 44 24 08 27 0a 20 	movl   $0x200a27,0x8(%esp)
  200655:	00 
  200656:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20065d:	00 
  20065e:	c7 04 24 f0 81 20 00 	movl   $0x2081f0,(%esp)
  200665:	e8 da fd ff ff       	call   200444 <set_gate>
  20066a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200671:	00 
  200672:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200679:	00 
  20067a:	c7 44 24 08 43 0a 20 	movl   $0x200a43,0x8(%esp)
  200681:	00 
  200682:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200689:	00 
  20068a:	c7 04 24 f8 81 20 00 	movl   $0x2081f8,(%esp)
  200691:	e8 ae fd ff ff       	call   200444 <set_gate>
  200696:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20069d:	00 
  20069e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006a5:	00 
  2006a6:	c7 44 24 08 5f 0a 20 	movl   $0x200a5f,0x8(%esp)
  2006ad:	00 
  2006ae:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006b5:	00 
  2006b6:	c7 04 24 00 82 20 00 	movl   $0x208200,(%esp)
  2006bd:	e8 82 fd ff ff       	call   200444 <set_gate>
  2006c2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006c9:	00 
  2006ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006d1:	00 
  2006d2:	c7 44 24 08 7b 0a 20 	movl   $0x200a7b,0x8(%esp)
  2006d9:	00 
  2006da:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006e1:	00 
  2006e2:	c7 04 24 08 82 20 00 	movl   $0x208208,(%esp)
  2006e9:	e8 56 fd ff ff       	call   200444 <set_gate>
  2006ee:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006f5:	00 
  2006f6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006fd:	00 
  2006fe:	c7 44 24 08 97 0a 20 	movl   $0x200a97,0x8(%esp)
  200705:	00 
  200706:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20070d:	00 
  20070e:	c7 04 24 10 82 20 00 	movl   $0x208210,(%esp)
  200715:	e8 2a fd ff ff       	call   200444 <set_gate>
  20071a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200721:	00 
  200722:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200729:	00 
  20072a:	c7 44 24 08 b3 0a 20 	movl   $0x200ab3,0x8(%esp)
  200731:	00 
  200732:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200739:	00 
  20073a:	c7 04 24 18 82 20 00 	movl   $0x208218,(%esp)
  200741:	e8 fe fc ff ff       	call   200444 <set_gate>
  200746:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20074d:	00 
  20074e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200755:	00 
  200756:	c7 44 24 08 cf 0a 20 	movl   $0x200acf,0x8(%esp)
  20075d:	00 
  20075e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200765:	00 
  200766:	c7 04 24 20 82 20 00 	movl   $0x208220,(%esp)
  20076d:	e8 d2 fc ff ff       	call   200444 <set_gate>
  200772:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200779:	00 
  20077a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200781:	00 
  200782:	c7 44 24 08 eb 0a 20 	movl   $0x200aeb,0x8(%esp)
  200789:	00 
  20078a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200791:	00 
  200792:	c7 04 24 28 82 20 00 	movl   $0x208228,(%esp)
  200799:	e8 a6 fc ff ff       	call   200444 <set_gate>
  20079e:	c9                   	leave  
  20079f:	c3                   	ret    

002007a0 <load_idt>:
  2007a0:	55                   	push   %ebp
  2007a1:	89 e5                	mov    %esp,%ebp
  2007a3:	fa                   	cli    
  2007a4:	0f 01 1d 00 30 20 00 	lidtl  0x203000
  2007ab:	90                   	nop
  2007ac:	fb                   	sti    
  2007ad:	e8 ce fc ff ff       	call   200480 <set_exception_gate>
  2007b2:	90                   	nop
  2007b3:	5d                   	pop    %ebp
  2007b4:	c3                   	ret    

002007b5 <set_intr_gate>:
  2007b5:	55                   	push   %ebp
  2007b6:	89 e5                	mov    %esp,%ebp
  2007b8:	83 ec 38             	sub    $0x38,%esp
  2007bb:	8b 45 08             	mov    0x8(%ebp),%eax
  2007be:	83 c0 30             	add    $0x30,%eax
  2007c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2007c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007c7:	c1 e0 03             	shl    $0x3,%eax
  2007ca:	8d 90 a0 81 20 00    	lea    0x2081a0(%eax),%edx
  2007d0:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007d7:	00 
  2007d8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2007df:	00 
  2007e0:	8b 45 0c             	mov    0xc(%ebp),%eax
  2007e3:	89 44 24 08          	mov    %eax,0x8(%esp)
  2007e7:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  2007ee:	00 
  2007ef:	89 14 24             	mov    %edx,(%esp)
  2007f2:	e8 4d fc ff ff       	call   200444 <set_gate>
  2007f7:	8b 45 08             	mov    0x8(%ebp),%eax
  2007fa:	89 04 24             	mov    %eax,(%esp)
  2007fd:	e8 1e fb ff ff       	call   200320 <enable_irq>
  200802:	c9                   	leave  
  200803:	c3                   	ret    

00200804 <irq00_handler>:
  200804:	60                   	pusha  
  200805:	1e                   	push   %ds
  200806:	06                   	push   %es
  200807:	0f a0                	push   %fs
  200809:	0f a8                	push   %gs
  20080b:	a1 00 90 23 00       	mov    0x239000,%eax
  200810:	89 20                	mov    %esp,(%eax)
  200812:	65 fe 05 00 0f 00 00 	incb   %gs:0xf00
  200819:	e8 d5 fb ff ff       	call   2003f3 <EOI_master>
  20081e:	e8 11 00 00 00       	call   200834 <timer_handler>
  200823:	a1 00 90 23 00       	mov    0x239000,%eax
  200828:	8b 20                	mov    (%eax),%esp
  20082a:	0f a9                	pop    %gs
  20082c:	0f a1                	pop    %fs
  20082e:	07                   	pop    %es
  20082f:	1f                   	pop    %ds
  200830:	61                   	popa   
  200831:	cb                   	lret   
  200832:	66 90                	xchg   %ax,%ax

00200834 <timer_handler>:
  200834:	55                   	push   %ebp
  200835:	89 e5                	mov    %esp,%ebp
  200837:	a1 08 30 20 00       	mov    0x203008,%eax
  20083c:	83 c0 01             	add    $0x1,%eax
  20083f:	a3 08 30 20 00       	mov    %eax,0x203008
  200844:	8b 0d 08 30 20 00    	mov    0x203008,%ecx
  20084a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  20084f:	89 c8                	mov    %ecx,%eax
  200851:	f7 e2                	mul    %edx
  200853:	c1 ea 04             	shr    $0x4,%edx
  200856:	89 d0                	mov    %edx,%eax
  200858:	c1 e0 02             	shl    $0x2,%eax
  20085b:	01 d0                	add    %edx,%eax
  20085d:	c1 e0 02             	shl    $0x2,%eax
  200860:	29 c1                	sub    %eax,%ecx
  200862:	89 ca                	mov    %ecx,%edx
  200864:	85 d2                	test   %edx,%edx
  200866:	75 22                	jne    20088a <timer_handler+0x56>
  200868:	a1 00 90 23 00       	mov    0x239000,%eax
  20086d:	3d 00 80 23 00       	cmp    $0x238000,%eax
  200872:	75 0c                	jne    200880 <timer_handler+0x4c>
  200874:	c7 05 00 90 23 00 00 	movl   $0x210000,0x239000
  20087b:	00 21 00 
  20087e:	eb 0a                	jmp    20088a <timer_handler+0x56>
  200880:	c7 05 00 90 23 00 00 	movl   $0x238000,0x239000
  200887:	80 23 00 
  20088a:	90                   	nop
  20088b:	5d                   	pop    %ebp
  20088c:	c3                   	ret    

0020088d <init_timer>:
  20088d:	55                   	push   %ebp
  20088e:	89 e5                	mov    %esp,%ebp
  200890:	83 ec 18             	sub    $0x18,%esp
  200893:	c7 05 a0 89 20 00 34 	movl   $0x200834,0x2089a0
  20089a:	08 20 00 
  20089d:	c7 44 24 04 04 08 20 	movl   $0x200804,0x4(%esp)
  2008a4:	00 
  2008a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008ac:	e8 04 ff ff ff       	call   2007b5 <set_intr_gate>
  2008b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008b8:	e8 63 fa ff ff       	call   200320 <enable_irq>
  2008bd:	c9                   	leave  
  2008be:	c3                   	ret    
  2008bf:	90                   	nop

002008c0 <exception_handler>:
  2008c0:	55                   	push   %ebp
  2008c1:	89 e5                	mov    %esp,%ebp
  2008c3:	83 ec 18             	sub    $0x18,%esp
  2008c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2008cd:	00 
  2008ce:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2008d5:	00 
  2008d6:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2008dd:	00 
  2008de:	c7 04 24 d5 10 20 00 	movl   $0x2010d5,(%esp)
  2008e5:	e8 1e 02 00 00       	call   200b08 <dis_str>
  2008ea:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  2008f1:	00 
  2008f2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2008f9:	00 
  2008fa:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200901:	00 
  200902:	8b 45 0c             	mov    0xc(%ebp),%eax
  200905:	89 04 24             	mov    %eax,(%esp)
  200908:	e8 fb 01 00 00       	call   200b08 <dis_str>
  20090d:	eb fe                	jmp    20090d <exception_handler+0x4d>

0020090f <divide_error>:
  20090f:	55                   	push   %ebp
  200910:	89 e5                	mov    %esp,%ebp
  200912:	83 ec 18             	sub    $0x18,%esp
  200915:	c7 44 24 04 e0 10 20 	movl   $0x2010e0,0x4(%esp)
  20091c:	00 
  20091d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200924:	e8 97 ff ff ff       	call   2008c0 <exception_handler>
  200929:	c9                   	leave  
  20092a:	c3                   	ret    

0020092b <single_step_exception>:
  20092b:	55                   	push   %ebp
  20092c:	89 e5                	mov    %esp,%ebp
  20092e:	83 ec 18             	sub    $0x18,%esp
  200931:	c7 44 24 04 ed 10 20 	movl   $0x2010ed,0x4(%esp)
  200938:	00 
  200939:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200940:	e8 7b ff ff ff       	call   2008c0 <exception_handler>
  200945:	c9                   	leave  
  200946:	c3                   	ret    

00200947 <nmi>:
  200947:	55                   	push   %ebp
  200948:	89 e5                	mov    %esp,%ebp
  20094a:	83 ec 18             	sub    $0x18,%esp
  20094d:	c7 44 24 04 03 11 20 	movl   $0x201103,0x4(%esp)
  200954:	00 
  200955:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  20095c:	e8 5f ff ff ff       	call   2008c0 <exception_handler>
  200961:	c9                   	leave  
  200962:	c3                   	ret    

00200963 <breakpoint_exception>:
  200963:	55                   	push   %ebp
  200964:	89 e5                	mov    %esp,%ebp
  200966:	83 ec 18             	sub    $0x18,%esp
  200969:	c7 44 24 04 07 11 20 	movl   $0x201107,0x4(%esp)
  200970:	00 
  200971:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200978:	e8 43 ff ff ff       	call   2008c0 <exception_handler>
  20097d:	c9                   	leave  
  20097e:	c3                   	ret    

0020097f <overflow>:
  20097f:	55                   	push   %ebp
  200980:	89 e5                	mov    %esp,%ebp
  200982:	83 ec 18             	sub    $0x18,%esp
  200985:	c7 44 24 04 1c 11 20 	movl   $0x20111c,0x4(%esp)
  20098c:	00 
  20098d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  200994:	e8 27 ff ff ff       	call   2008c0 <exception_handler>
  200999:	c9                   	leave  
  20099a:	c3                   	ret    

0020099b <bounds_check>:
  20099b:	55                   	push   %ebp
  20099c:	89 e5                	mov    %esp,%ebp
  20099e:	83 ec 18             	sub    $0x18,%esp
  2009a1:	c7 44 24 04 25 11 20 	movl   $0x201125,0x4(%esp)
  2009a8:	00 
  2009a9:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  2009b0:	e8 0b ff ff ff       	call   2008c0 <exception_handler>
  2009b5:	c9                   	leave  
  2009b6:	c3                   	ret    

002009b7 <inval_opcode>:
  2009b7:	55                   	push   %ebp
  2009b8:	89 e5                	mov    %esp,%ebp
  2009ba:	83 ec 18             	sub    $0x18,%esp
  2009bd:	c7 44 24 04 32 11 20 	movl   $0x201132,0x4(%esp)
  2009c4:	00 
  2009c5:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  2009cc:	e8 ef fe ff ff       	call   2008c0 <exception_handler>
  2009d1:	c9                   	leave  
  2009d2:	c3                   	ret    

002009d3 <copr_not_available>:
  2009d3:	55                   	push   %ebp
  2009d4:	89 e5                	mov    %esp,%ebp
  2009d6:	83 ec 18             	sub    $0x18,%esp
  2009d9:	c7 44 24 04 3f 11 20 	movl   $0x20113f,0x4(%esp)
  2009e0:	00 
  2009e1:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  2009e8:	e8 d3 fe ff ff       	call   2008c0 <exception_handler>
  2009ed:	c9                   	leave  
  2009ee:	c3                   	ret    

002009ef <double_fault>:
  2009ef:	55                   	push   %ebp
  2009f0:	89 e5                	mov    %esp,%ebp
  2009f2:	83 ec 18             	sub    $0x18,%esp
  2009f5:	c7 44 24 04 52 11 20 	movl   $0x201152,0x4(%esp)
  2009fc:	00 
  2009fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  200a04:	e8 b7 fe ff ff       	call   2008c0 <exception_handler>
  200a09:	c9                   	leave  
  200a0a:	c3                   	ret    

00200a0b <copr_seg_overrun>:
  200a0b:	55                   	push   %ebp
  200a0c:	89 e5                	mov    %esp,%ebp
  200a0e:	83 ec 18             	sub    $0x18,%esp
  200a11:	c7 44 24 04 5f 11 20 	movl   $0x20115f,0x4(%esp)
  200a18:	00 
  200a19:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200a20:	e8 9b fe ff ff       	call   2008c0 <exception_handler>
  200a25:	c9                   	leave  
  200a26:	c3                   	ret    

00200a27 <inval_tss>:
  200a27:	55                   	push   %ebp
  200a28:	89 e5                	mov    %esp,%ebp
  200a2a:	83 ec 18             	sub    $0x18,%esp
  200a2d:	c7 44 24 04 70 11 20 	movl   $0x201170,0x4(%esp)
  200a34:	00 
  200a35:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200a3c:	e8 7f fe ff ff       	call   2008c0 <exception_handler>
  200a41:	c9                   	leave  
  200a42:	c3                   	ret    

00200a43 <segment_not_present>:
  200a43:	55                   	push   %ebp
  200a44:	89 e5                	mov    %esp,%ebp
  200a46:	83 ec 18             	sub    $0x18,%esp
  200a49:	c7 44 24 04 7a 11 20 	movl   $0x20117a,0x4(%esp)
  200a50:	00 
  200a51:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200a58:	e8 63 fe ff ff       	call   2008c0 <exception_handler>
  200a5d:	c9                   	leave  
  200a5e:	c3                   	ret    

00200a5f <stack_exception>:
  200a5f:	55                   	push   %ebp
  200a60:	89 e5                	mov    %esp,%ebp
  200a62:	83 ec 18             	sub    $0x18,%esp
  200a65:	c7 44 24 04 8e 11 20 	movl   $0x20118e,0x4(%esp)
  200a6c:	00 
  200a6d:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200a74:	e8 47 fe ff ff       	call   2008c0 <exception_handler>
  200a79:	c9                   	leave  
  200a7a:	c3                   	ret    

00200a7b <general_protection>:
  200a7b:	55                   	push   %ebp
  200a7c:	89 e5                	mov    %esp,%ebp
  200a7e:	83 ec 18             	sub    $0x18,%esp
  200a81:	c7 44 24 04 9e 11 20 	movl   $0x20119e,0x4(%esp)
  200a88:	00 
  200a89:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200a90:	e8 2b fe ff ff       	call   2008c0 <exception_handler>
  200a95:	c9                   	leave  
  200a96:	c3                   	ret    

00200a97 <page_fault>:
  200a97:	55                   	push   %ebp
  200a98:	89 e5                	mov    %esp,%ebp
  200a9a:	83 ec 18             	sub    $0x18,%esp
  200a9d:	c7 44 24 04 b1 11 20 	movl   $0x2011b1,0x4(%esp)
  200aa4:	00 
  200aa5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200aac:	e8 0f fe ff ff       	call   2008c0 <exception_handler>
  200ab1:	c9                   	leave  
  200ab2:	c3                   	ret    

00200ab3 <copr_error>:
  200ab3:	55                   	push   %ebp
  200ab4:	89 e5                	mov    %esp,%ebp
  200ab6:	83 ec 18             	sub    $0x18,%esp
  200ab9:	c7 44 24 04 bc 11 20 	movl   $0x2011bc,0x4(%esp)
  200ac0:	00 
  200ac1:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200ac8:	e8 f3 fd ff ff       	call   2008c0 <exception_handler>
  200acd:	c9                   	leave  
  200ace:	c3                   	ret    

00200acf <float_error>:
  200acf:	55                   	push   %ebp
  200ad0:	89 e5                	mov    %esp,%ebp
  200ad2:	83 ec 18             	sub    $0x18,%esp
  200ad5:	c7 44 24 04 c7 11 20 	movl   $0x2011c7,0x4(%esp)
  200adc:	00 
  200add:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200ae4:	e8 d7 fd ff ff       	call   2008c0 <exception_handler>
  200ae9:	c9                   	leave  
  200aea:	c3                   	ret    

00200aeb <alignment_check>:
  200aeb:	55                   	push   %ebp
  200aec:	89 e5                	mov    %esp,%ebp
  200aee:	83 ec 18             	sub    $0x18,%esp
  200af1:	c7 44 24 04 d3 11 20 	movl   $0x2011d3,0x4(%esp)
  200af8:	00 
  200af9:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200b00:	e8 bb fd ff ff       	call   2008c0 <exception_handler>
  200b05:	c9                   	leave  
  200b06:	c3                   	ret    
  200b07:	90                   	nop

00200b08 <dis_str>:
  200b08:	55                   	push   %ebp
  200b09:	89 e5                	mov    %esp,%ebp
  200b0b:	57                   	push   %edi
  200b0c:	53                   	push   %ebx
  200b0d:	83 ec 30             	sub    $0x30,%esp
  200b10:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b13:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200b16:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200b1d:	8b 55 10             	mov    0x10(%ebp),%edx
  200b20:	89 d0                	mov    %edx,%eax
  200b22:	c1 e0 02             	shl    $0x2,%eax
  200b25:	01 d0                	add    %edx,%eax
  200b27:	c1 e0 04             	shl    $0x4,%eax
  200b2a:	89 c2                	mov    %eax,%edx
  200b2c:	8b 45 14             	mov    0x14(%ebp),%eax
  200b2f:	01 d0                	add    %edx,%eax
  200b31:	01 c0                	add    %eax,%eax
  200b33:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200b36:	8b 45 08             	mov    0x8(%ebp),%eax
  200b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200b3c:	8b 45 08             	mov    0x8(%ebp),%eax
  200b3f:	89 04 24             	mov    %eax,(%esp)
  200b42:	e8 02 01 00 00       	call   200c49 <strlen>
  200b47:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200b4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200b51:	eb 2e                	jmp    200b81 <dis_str+0x79>
  200b53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200b56:	8d 50 01             	lea    0x1(%eax),%edx
  200b59:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200b5c:	0f b6 00             	movzbl (%eax),%eax
  200b5f:	88 45 e7             	mov    %al,-0x19(%ebp)
  200b62:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200b66:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200b6a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200b6d:	89 d3                	mov    %edx,%ebx
  200b6f:	89 cf                	mov    %ecx,%edi
  200b71:	88 c4                	mov    %al,%ah
  200b73:	88 d8                	mov    %bl,%al
  200b75:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200b79:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200b7d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b84:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200b87:	7c ca                	jl     200b53 <dis_str+0x4b>
  200b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b8c:	83 c4 30             	add    $0x30,%esp
  200b8f:	5b                   	pop    %ebx
  200b90:	5f                   	pop    %edi
  200b91:	5d                   	pop    %ebp
  200b92:	c3                   	ret    

00200b93 <dis_nchar>:
  200b93:	55                   	push   %ebp
  200b94:	89 e5                	mov    %esp,%ebp
  200b96:	57                   	push   %edi
  200b97:	53                   	push   %ebx
  200b98:	83 ec 14             	sub    $0x14,%esp
  200b9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b9e:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200ba1:	8b 55 14             	mov    0x14(%ebp),%edx
  200ba4:	89 d0                	mov    %edx,%eax
  200ba6:	c1 e0 02             	shl    $0x2,%eax
  200ba9:	01 d0                	add    %edx,%eax
  200bab:	c1 e0 04             	shl    $0x4,%eax
  200bae:	89 c2                	mov    %eax,%edx
  200bb0:	8b 45 18             	mov    0x18(%ebp),%eax
  200bb3:	01 d0                	add    %edx,%eax
  200bb5:	01 c0                	add    %eax,%eax
  200bb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200bba:	8b 45 08             	mov    0x8(%ebp),%eax
  200bbd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200bc0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200bc7:	eb 2e                	jmp    200bf7 <dis_nchar+0x64>
  200bc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200bcc:	8d 50 01             	lea    0x1(%eax),%edx
  200bcf:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200bd2:	0f b6 00             	movzbl (%eax),%eax
  200bd5:	88 45 eb             	mov    %al,-0x15(%ebp)
  200bd8:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200bdc:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200be0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200be3:	89 d3                	mov    %edx,%ebx
  200be5:	89 cf                	mov    %ecx,%edi
  200be7:	88 c4                	mov    %al,%ah
  200be9:	88 d8                	mov    %bl,%al
  200beb:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200bef:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200bf3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bfa:	3b 45 10             	cmp    0x10(%ebp),%eax
  200bfd:	7c ca                	jl     200bc9 <dis_nchar+0x36>
  200bff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c02:	83 c4 14             	add    $0x14,%esp
  200c05:	5b                   	pop    %ebx
  200c06:	5f                   	pop    %edi
  200c07:	5d                   	pop    %ebp
  200c08:	c3                   	ret    
  200c09:	66 90                	xchg   %ax,%ax
  200c0b:	90                   	nop

00200c0c <memcpy>:
  200c0c:	55                   	push   %ebp
  200c0d:	89 e5                	mov    %esp,%ebp
  200c0f:	83 ec 10             	sub    $0x10,%esp
  200c12:	8b 45 08             	mov    0x8(%ebp),%eax
  200c15:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200c18:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c1b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c1e:	eb 17                	jmp    200c37 <memcpy+0x2b>
  200c20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c23:	8d 50 01             	lea    0x1(%eax),%edx
  200c26:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200c29:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200c2c:	8d 4a 01             	lea    0x1(%edx),%ecx
  200c2f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200c32:	0f b6 12             	movzbl (%edx),%edx
  200c35:	88 10                	mov    %dl,(%eax)
  200c37:	8b 45 10             	mov    0x10(%ebp),%eax
  200c3a:	8d 50 ff             	lea    -0x1(%eax),%edx
  200c3d:	89 55 10             	mov    %edx,0x10(%ebp)
  200c40:	85 c0                	test   %eax,%eax
  200c42:	75 dc                	jne    200c20 <memcpy+0x14>
  200c44:	8b 45 08             	mov    0x8(%ebp),%eax
  200c47:	c9                   	leave  
  200c48:	c3                   	ret    

00200c49 <strlen>:
  200c49:	55                   	push   %ebp
  200c4a:	89 e5                	mov    %esp,%ebp
  200c4c:	83 ec 10             	sub    $0x10,%esp
  200c4f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200c56:	8b 45 08             	mov    0x8(%ebp),%eax
  200c59:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c5c:	eb 08                	jmp    200c66 <strlen+0x1d>
  200c5e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200c62:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200c66:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200c69:	0f b6 00             	movzbl (%eax),%eax
  200c6c:	84 c0                	test   %al,%al
  200c6e:	75 ee                	jne    200c5e <strlen+0x15>
  200c70:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c73:	c9                   	leave  
  200c74:	c3                   	ret    

00200c75 <strcmp>:
  200c75:	55                   	push   %ebp
  200c76:	89 e5                	mov    %esp,%ebp
  200c78:	eb 0c                	jmp    200c86 <strcmp+0x11>
  200c7a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c7d:	0f b6 00             	movzbl (%eax),%eax
  200c80:	84 c0                	test   %al,%al
  200c82:	75 02                	jne    200c86 <strcmp+0x11>
  200c84:	eb 1c                	jmp    200ca2 <strcmp+0x2d>
  200c86:	8b 45 08             	mov    0x8(%ebp),%eax
  200c89:	8d 50 01             	lea    0x1(%eax),%edx
  200c8c:	89 55 08             	mov    %edx,0x8(%ebp)
  200c8f:	0f b6 08             	movzbl (%eax),%ecx
  200c92:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c95:	8d 50 01             	lea    0x1(%eax),%edx
  200c98:	89 55 0c             	mov    %edx,0xc(%ebp)
  200c9b:	0f b6 00             	movzbl (%eax),%eax
  200c9e:	38 c1                	cmp    %al,%cl
  200ca0:	74 d8                	je     200c7a <strcmp+0x5>
  200ca2:	8b 45 08             	mov    0x8(%ebp),%eax
  200ca5:	0f b6 00             	movzbl (%eax),%eax
  200ca8:	0f be d0             	movsbl %al,%edx
  200cab:	8b 45 0c             	mov    0xc(%ebp),%eax
  200cae:	0f b6 00             	movzbl (%eax),%eax
  200cb1:	0f be c0             	movsbl %al,%eax
  200cb4:	29 c2                	sub    %eax,%edx
  200cb6:	89 d0                	mov    %edx,%eax
  200cb8:	5d                   	pop    %ebp
  200cb9:	c3                   	ret    

00200cba <memset>:
  200cba:	55                   	push   %ebp
  200cbb:	89 e5                	mov    %esp,%ebp
  200cbd:	83 ec 10             	sub    $0x10,%esp
  200cc0:	8b 45 08             	mov    0x8(%ebp),%eax
  200cc3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200cc6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200ccd:	eb 12                	jmp    200ce1 <memset+0x27>
  200ccf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200cd2:	8d 50 01             	lea    0x1(%eax),%edx
  200cd5:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200cd8:	8b 55 0c             	mov    0xc(%ebp),%edx
  200cdb:	88 10                	mov    %dl,(%eax)
  200cdd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200ce1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200ce4:	3b 45 10             	cmp    0x10(%ebp),%eax
  200ce7:	72 e6                	jb     200ccf <memset+0x15>
  200ce9:	8b 45 08             	mov    0x8(%ebp),%eax
  200cec:	c9                   	leave  
  200ced:	c3                   	ret    
  200cee:	66 90                	xchg   %ax,%ax

00200cf0 <init_thread>:
  200cf0:	55                   	push   %ebp
  200cf1:	89 e5                	mov    %esp,%ebp
  200cf3:	83 ec 18             	sub    $0x18,%esp
  200cf6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200cfd:	00 
  200cfe:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200d05:	00 
  200d06:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200d0d:	00 
  200d0e:	c7 04 24 e3 11 20 00 	movl   $0x2011e3,(%esp)
  200d15:	e8 ee fd ff ff       	call   200b08 <dis_str>
  200d1a:	65 fe 05 28 00 00 00 	incb   %gs:0x28
  200d21:	eb f7                	jmp    200d1a <init_thread+0x2a>

00200d23 <creat_init>:
  200d23:	55                   	push   %ebp
  200d24:	89 e5                	mov    %esp,%ebp
  200d26:	83 ec 18             	sub    $0x18,%esp
  200d29:	c7 05 04 00 21 00 00 	movl   $0x0,0x210004
  200d30:	00 00 00 
  200d33:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200d3a:	00 
  200d3b:	c7 44 24 04 f6 11 20 	movl   $0x2011f6,0x4(%esp)
  200d42:	00 
  200d43:	c7 04 24 0c 00 21 00 	movl   $0x21000c,(%esp)
  200d4a:	e8 bd fe ff ff       	call   200c0c <memcpy>
  200d4f:	b8 f0 0c 20 00       	mov    $0x200cf0,%eax
  200d54:	a3 08 00 21 00       	mov    %eax,0x210008
  200d59:	b8 00 00 22 00       	mov    $0x220000,%eax
  200d5e:	a3 00 00 21 00       	mov    %eax,0x210000
  200d63:	c7 05 0c 00 22 00 28 	movl   $0x28,0x22000c
  200d6a:	00 00 00 
  200d6d:	c7 05 34 00 22 00 20 	movl   $0x20,0x220034
  200d74:	00 00 00 
  200d77:	c7 05 08 00 22 00 28 	movl   $0x28,0x220008
  200d7e:	00 00 00 
  200d81:	c7 05 04 00 22 00 28 	movl   $0x28,0x220004
  200d88:	00 00 00 
  200d8b:	c7 05 3c 00 22 00 28 	movl   $0x28,0x22003c
  200d92:	00 00 00 
  200d95:	c7 05 00 00 22 00 48 	movl   $0x48,0x220000
  200d9c:	00 00 00 
  200d9f:	b8 f0 0c 20 00       	mov    $0x200cf0,%eax
  200da4:	a3 30 00 22 00       	mov    %eax,0x220030
  200da9:	a1 1c 00 21 00       	mov    0x21001c,%eax
  200dae:	a3 38 00 22 00       	mov    %eax,0x220038
  200db3:	c7 05 40 00 22 00 02 	movl   $0x1202,0x220040
  200dba:	12 00 00 
  200dbd:	c7 05 44 00 22 00 00 	movl   $0x210000,0x220044
  200dc4:	00 21 00 
  200dc7:	c7 05 00 90 23 00 00 	movl   $0x210000,0x239000
  200dce:	00 21 00 
  200dd1:	c7 04 24 00 00 21 00 	movl   $0x210000,(%esp)
  200dd8:	e8 db 00 00 00       	call   200eb8 <schedule>
  200ddd:	c9                   	leave  
  200dde:	c3                   	ret    

00200ddf <testA>:
  200ddf:	55                   	push   %ebp
  200de0:	89 e5                	mov    %esp,%ebp
  200de2:	83 ec 18             	sub    $0x18,%esp
  200de5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200dec:	00 
  200ded:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  200df4:	00 
  200df5:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200dfc:	00 
  200dfd:	c7 04 24 02 12 20 00 	movl   $0x201202,(%esp)
  200e04:	e8 ff fc ff ff       	call   200b08 <dis_str>
  200e09:	65 fe 05 c8 00 00 00 	incb   %gs:0xc8
  200e10:	eb f7                	jmp    200e09 <testA+0x2a>

00200e12 <creat_testA>:
  200e12:	55                   	push   %ebp
  200e13:	89 e5                	mov    %esp,%ebp
  200e15:	83 ec 18             	sub    $0x18,%esp
  200e18:	c7 05 04 80 23 00 00 	movl   $0x0,0x238004
  200e1f:	00 00 00 
  200e22:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200e29:	00 
  200e2a:	c7 44 24 04 16 12 20 	movl   $0x201216,0x4(%esp)
  200e31:	00 
  200e32:	c7 04 24 0c 80 23 00 	movl   $0x23800c,(%esp)
  200e39:	e8 ce fd ff ff       	call   200c0c <memcpy>
  200e3e:	b8 df 0d 20 00       	mov    $0x200ddf,%eax
  200e43:	a3 08 80 23 00       	mov    %eax,0x238008
  200e48:	b8 00 00 23 00       	mov    $0x230000,%eax
  200e4d:	a3 00 80 23 00       	mov    %eax,0x238000
  200e52:	c7 05 0c 00 23 00 28 	movl   $0x28,0x23000c
  200e59:	00 00 00 
  200e5c:	c7 05 34 00 23 00 20 	movl   $0x20,0x230034
  200e63:	00 00 00 
  200e66:	c7 05 08 00 23 00 28 	movl   $0x28,0x230008
  200e6d:	00 00 00 
  200e70:	c7 05 04 00 23 00 28 	movl   $0x28,0x230004
  200e77:	00 00 00 
  200e7a:	c7 05 3c 00 23 00 28 	movl   $0x28,0x23003c
  200e81:	00 00 00 
  200e84:	c7 05 00 00 23 00 48 	movl   $0x48,0x230000
  200e8b:	00 00 00 
  200e8e:	b8 df 0d 20 00       	mov    $0x200ddf,%eax
  200e93:	a3 30 00 23 00       	mov    %eax,0x230030
  200e98:	a1 1c 80 23 00       	mov    0x23801c,%eax
  200e9d:	a3 38 00 23 00       	mov    %eax,0x230038
  200ea2:	c7 05 40 00 23 00 02 	movl   $0x1202,0x230040
  200ea9:	12 00 00 
  200eac:	c7 05 44 00 23 00 00 	movl   $0x238000,0x230044
  200eb3:	80 23 00 
  200eb6:	c9                   	leave  
  200eb7:	c3                   	ret    

00200eb8 <schedule>:
  200eb8:	55                   	push   %ebp
  200eb9:	89 e5                	mov    %esp,%ebp
  200ebb:	8b 45 08             	mov    0x8(%ebp),%eax
  200ebe:	8b 00                	mov    (%eax),%eax
  200ec0:	89 c4                	mov    %eax,%esp
  200ec2:	e9 05 00 00 00       	jmp    200ecc <switch_to>
  200ec7:	5d                   	pop    %ebp
  200ec8:	c3                   	ret    
  200ec9:	66 90                	xchg   %ax,%ax
  200ecb:	90                   	nop

00200ecc <switch_to>:
  200ecc:	89 c4                	mov    %eax,%esp
  200ece:	0f a9                	pop    %gs
  200ed0:	0f a1                	pop    %fs
  200ed2:	07                   	pop    %es
  200ed3:	1f                   	pop    %ds
  200ed4:	61                   	popa   
  200ed5:	cb                   	lret   
  200ed6:	66 90                	xchg   %ax,%ax

00200ed8 <get_memory_info>:
  200ed8:	55                   	push   %ebp
  200ed9:	89 e5                	mov    %esp,%ebp
  200edb:	83 ec 28             	sub    $0x28,%esp
  200ede:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200ee5:	a1 00 00 10 00       	mov    0x100000,%eax
  200eea:	a3 84 90 23 00       	mov    %eax,0x239084
  200eef:	a1 04 00 10 00       	mov    0x100004,%eax
  200ef4:	a3 88 90 23 00       	mov    %eax,0x239088
  200ef9:	a1 08 00 10 00       	mov    0x100008,%eax
  200efe:	a3 8c 90 23 00       	mov    %eax,0x23908c
  200f03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200f0a:	eb 3e                	jmp    200f4a <get_memory_info+0x72>
  200f0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f0f:	89 d0                	mov    %edx,%eax
  200f11:	c1 e0 02             	shl    $0x2,%eax
  200f14:	01 d0                	add    %edx,%eax
  200f16:	c1 e0 02             	shl    $0x2,%eax
  200f19:	05 00 80 00 00       	add    $0x8000,%eax
  200f1e:	89 c1                	mov    %eax,%ecx
  200f20:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f23:	89 d0                	mov    %edx,%eax
  200f25:	c1 e0 02             	shl    $0x2,%eax
  200f28:	01 d0                	add    %edx,%eax
  200f2a:	c1 e0 02             	shl    $0x2,%eax
  200f2d:	05 20 90 23 00       	add    $0x239020,%eax
  200f32:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  200f39:	00 
  200f3a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  200f3e:	89 04 24             	mov    %eax,(%esp)
  200f41:	e8 c6 fc ff ff       	call   200c0c <memcpy>
  200f46:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200f4a:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  200f4e:	7e bc                	jle    200f0c <get_memory_info+0x34>
  200f50:	90                   	nop
  200f51:	c9                   	leave  
  200f52:	c3                   	ret    
  200f53:	90                   	nop

00200f54 <get_page_cnt>:
  200f54:	55                   	push   %ebp
  200f55:	89 e5                	mov    %esp,%ebp
  200f57:	83 ec 10             	sub    $0x10,%esp
  200f5a:	c7 45 f8 20 90 23 00 	movl   $0x239020,-0x8(%ebp)
  200f61:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200f68:	eb 32                	jmp    200f9c <get_page_cnt+0x48>
  200f6a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200f6d:	89 d0                	mov    %edx,%eax
  200f6f:	c1 e0 02             	shl    $0x2,%eax
  200f72:	01 d0                	add    %edx,%eax
  200f74:	c1 e0 02             	shl    $0x2,%eax
  200f77:	05 30 90 23 00       	add    $0x239030,%eax
  200f7c:	8b 00                	mov    (%eax),%eax
  200f7e:	83 f8 01             	cmp    $0x1,%eax
  200f81:	75 15                	jne    200f98 <get_page_cnt+0x44>
  200f83:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200f86:	89 d0                	mov    %edx,%eax
  200f88:	c1 e0 02             	shl    $0x2,%eax
  200f8b:	01 d0                	add    %edx,%eax
  200f8d:	c1 e0 02             	shl    $0x2,%eax
  200f90:	05 20 90 23 00       	add    $0x239020,%eax
  200f95:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200f98:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200f9c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200f9f:	a1 8c 90 23 00       	mov    0x23908c,%eax
  200fa4:	39 c2                	cmp    %eax,%edx
  200fa6:	72 c2                	jb     200f6a <get_page_cnt+0x16>
  200fa8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200fab:	8b 10                	mov    (%eax),%edx
  200fad:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200fb0:	8b 40 08             	mov    0x8(%eax),%eax
  200fb3:	01 d0                	add    %edx,%eax
  200fb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200fb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200fbb:	05 ff 0f 00 00       	add    $0xfff,%eax
  200fc0:	c1 e8 0c             	shr    $0xc,%eax
  200fc3:	c9                   	leave  
  200fc4:	c3                   	ret    

00200fc5 <get_ptet_cnt>:
  200fc5:	55                   	push   %ebp
  200fc6:	89 e5                	mov    %esp,%ebp
  200fc8:	8b 45 08             	mov    0x8(%ebp),%eax
  200fcb:	05 ff 03 00 00       	add    $0x3ff,%eax
  200fd0:	c1 e8 0a             	shr    $0xa,%eax
  200fd3:	5d                   	pop    %ebp
  200fd4:	c3                   	ret    

00200fd5 <set_page>:
  200fd5:	55                   	push   %ebp
  200fd6:	89 e5                	mov    %esp,%ebp
  200fd8:	83 ec 34             	sub    $0x34,%esp
  200fdb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  200fe2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  200fe9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200ff0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200ff7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200ffe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201005:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  20100c:	e8 43 ff ff ff       	call   200f54 <get_page_cnt>
  201011:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  201014:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  201017:	89 04 24             	mov    %eax,(%esp)
  20101a:	e8 a6 ff ff ff       	call   200fc5 <get_ptet_cnt>
  20101f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  201022:	8b 45 e0             	mov    -0x20(%ebp),%eax
  201025:	89 04 24             	mov    %eax,(%esp)
  201028:	e8 98 ff ff ff       	call   200fc5 <get_ptet_cnt>
  20102d:	89 45 dc             	mov    %eax,-0x24(%ebp)
  201030:	c7 45 f0 00 00 10 00 	movl   $0x100000,-0x10(%ebp)
  201037:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20103a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  20103d:	c7 45 ec 00 10 10 00 	movl   $0x101000,-0x14(%ebp)
  201044:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20104b:	eb 6c                	jmp    2010b9 <set_page+0xe4>
  20104d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  201054:	eb 50                	jmp    2010a6 <set_page+0xd1>
  201056:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201059:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  20105e:	83 c8 07             	or     $0x7,%eax
  201061:	89 c1                	mov    %eax,%ecx
  201063:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201066:	8b 55 f8             	mov    -0x8(%ebp),%edx
  201069:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  20106c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201073:	eb 1c                	jmp    201091 <set_page+0xbc>
  201075:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201078:	83 c8 07             	or     $0x7,%eax
  20107b:	89 c1                	mov    %eax,%ecx
  20107d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201080:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201083:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201086:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
  20108d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201091:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201094:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  201099:	76 da                	jbe    201075 <set_page+0xa0>
  20109b:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  2010a2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  2010a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2010a9:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  2010ac:	7c a8                	jl     201056 <set_page+0x81>
  2010ae:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  2010b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2010b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2010bc:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  2010bf:	7c 8c                	jl     20104d <set_page+0x78>
  2010c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2010c4:	0f 22 d8             	mov    %eax,%cr3
  2010c7:	0f 20 c0             	mov    %cr0,%eax
  2010ca:	0d 00 00 00 80       	or     $0x80000000,%eax
  2010cf:	0f 22 c0             	mov    %eax,%cr0
  2010d2:	90                   	nop
  2010d3:	c9                   	leave  
  2010d4:	c3                   	ret    
