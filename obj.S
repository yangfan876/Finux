
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 a0 00 00 00       	call   2000ab <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 28             	sub    $0x28,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 3d 00 00 00       	call   20005c <load_tss>
  20001f:	e8 c4 0e 00 00       	call   200ee8 <get_memory_info>
  200024:	e8 87 11 00 00       	call   2011b0 <set_page>
  200029:	e8 ca 03 00 00       	call   2003f8 <disable_irqs>
  20002e:	e8 7d 07 00 00       	call   2007b0 <load_idt>
  200033:	e8 65 08 00 00       	call   20089d <init_timer>
  200038:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  20003f:	e8 ef 0f 00 00       	call   201033 <get_pages>
  200044:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200047:	e8 d6 0d 00 00       	call   200e22 <creat_testA>
  20004c:	e8 e2 0c 00 00       	call   200d33 <creat_init>
  200051:	ea 00 00 00 00 80 00 	ljmp   $0x80,$0x0
  200058:	c9                   	leave  
  200059:	c3                   	ret    
  20005a:	66 90                	xchg   %ax,%ax

0020005c <load_tss>:
  20005c:	55                   	push   %ebp
  20005d:	89 e5                	mov    %esp,%ebp
  20005f:	83 ec 10             	sub    $0x10,%esp
  200062:	66 c7 45 fe 40 00    	movw   $0x40,-0x2(%ebp)
  200068:	c7 05 24 81 20 00 ff 	movl   $0x1fffff,0x208124
  20006f:	ff 1f 00 
  200072:	66 c7 05 28 81 20 00 	movw   $0x28,0x208128
  200079:	28 00 
  20007b:	66 c7 05 86 81 20 00 	movw   $0x6d,0x208186
  200082:	6d 00 
  200084:	c6 05 88 81 20 00 ff 	movb   $0xff,0x208188
  20008b:	c7 05 89 81 20 00 69 	movl   $0x69,0x208189
  200092:	00 00 00 
  200095:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  200099:	0f 00 d8             	ltr    %ax
  20009c:	c9                   	leave  
  20009d:	c3                   	ret    

0020009e <set_tss_esp>:
  20009e:	55                   	push   %ebp
  20009f:	89 e5                	mov    %esp,%ebp
  2000a1:	8b 45 08             	mov    0x8(%ebp),%eax
  2000a4:	a3 24 81 20 00       	mov    %eax,0x208124
  2000a9:	5d                   	pop    %ebp
  2000aa:	c3                   	ret    

002000ab <change_gdt>:
  2000ab:	55                   	push   %ebp
  2000ac:	89 e5                	mov    %esp,%ebp
  2000ae:	53                   	push   %ebx
  2000af:	83 ec 10             	sub    $0x10,%esp
  2000b2:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  2000b8:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  2000be:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  2000c4:	c7 05 20 80 20 00 ff 	movl   $0xffff,0x208020
  2000cb:	ff 00 00 
  2000ce:	c7 05 24 80 20 00 00 	movl   $0xcf9b00,0x208024
  2000d5:	9b cf 00 
  2000d8:	c7 05 28 80 20 00 ff 	movl   $0xffff,0x208028
  2000df:	ff 00 00 
  2000e2:	c7 05 2c 80 20 00 00 	movl   $0xcf9300,0x20802c
  2000e9:	93 cf 00 
  2000ec:	c7 05 30 80 20 00 ff 	movl   $0xffff,0x208030
  2000f3:	ff 00 00 
  2000f6:	c7 05 34 80 20 00 00 	movl   $0xcffa00,0x208034
  2000fd:	fa cf 00 
  200100:	c7 05 38 80 20 00 ff 	movl   $0xffff,0x208038
  200107:	ff 00 00 
  20010a:	c7 05 3c 80 20 00 00 	movl   $0xcff200,0x20803c
  200111:	f2 cf 00 
  200114:	a1 89 81 20 00       	mov    0x208189,%eax
  200119:	83 e8 01             	sub    $0x1,%eax
  20011c:	0f b7 c0             	movzwl %ax,%eax
  20011f:	ba 20 81 20 00       	mov    $0x208120,%edx
  200124:	c1 e2 10             	shl    $0x10,%edx
  200127:	09 d0                	or     %edx,%eax
  200129:	a3 40 80 20 00       	mov    %eax,0x208040
  20012e:	a1 89 81 20 00       	mov    0x208189,%eax
  200133:	83 e8 01             	sub    $0x1,%eax
  200136:	25 00 00 0f 00       	and    $0xf0000,%eax
  20013b:	89 c2                	mov    %eax,%edx
  20013d:	b8 20 81 20 00       	mov    $0x208120,%eax
  200142:	25 00 00 ff 00       	and    $0xff0000,%eax
  200147:	c1 e8 10             	shr    $0x10,%eax
  20014a:	80 cc 89             	or     $0x89,%ah
  20014d:	89 c1                	mov    %eax,%ecx
  20014f:	b8 20 81 20 00       	mov    $0x208120,%eax
  200154:	25 00 00 00 ff       	and    $0xff000000,%eax
  200159:	09 c8                	or     %ecx,%eax
  20015b:	09 d0                	or     %edx,%eax
  20015d:	a3 44 80 20 00       	mov    %eax,0x208044
  200162:	c7 05 48 80 20 00 ff 	movl   $0x8000ffff,0x208048
  200169:	ff 00 80 
  20016c:	c7 05 4c 80 20 00 0b 	movl   $0xf30b,0x20804c
  200173:	f3 00 00 
  200176:	66 c7 05 00 81 20 00 	movw   $0xff,0x208100
  20017d:	ff 00 
  20017f:	b8 00 80 20 00       	mov    $0x208000,%eax
  200184:	a3 02 81 20 00       	mov    %eax,0x208102
  200189:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  20018d:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  200191:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  200195:	89 d3                	mov    %edx,%ebx
  200197:	0f 01 15 00 81 20 00 	lgdtl  0x208100
  20019e:	8e db                	mov    %ebx,%ds
  2001a0:	8e c3                	mov    %ebx,%es
  2001a2:	8e e3                	mov    %ebx,%fs
  2001a4:	8e d3                	mov    %ebx,%ss
  2001a6:	8e e9                	mov    %ecx,%gs
  2001a8:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  2001af:	90                   	nop
  2001b0:	83 c4 10             	add    $0x10,%esp
  2001b3:	5b                   	pop    %ebx
  2001b4:	5d                   	pop    %ebp
  2001b5:	c3                   	ret    
  2001b6:	66 90                	xchg   %ax,%ax

002001b8 <cli>:
  2001b8:	55                   	push   %ebp
  2001b9:	89 e5                	mov    %esp,%ebp
  2001bb:	fa                   	cli    
  2001bc:	5d                   	pop    %ebp
  2001bd:	c3                   	ret    

002001be <sti>:
  2001be:	55                   	push   %ebp
  2001bf:	89 e5                	mov    %esp,%ebp
  2001c1:	fb                   	sti    
  2001c2:	5d                   	pop    %ebp
  2001c3:	c3                   	ret    

002001c4 <outb>:
  2001c4:	55                   	push   %ebp
  2001c5:	89 e5                	mov    %esp,%ebp
  2001c7:	83 ec 08             	sub    $0x8,%esp
  2001ca:	8b 55 08             	mov    0x8(%ebp),%edx
  2001cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001d0:	88 55 fc             	mov    %dl,-0x4(%ebp)
  2001d3:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  2001d7:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2001db:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2001df:	ee                   	out    %al,(%dx)
  2001e0:	c9                   	leave  
  2001e1:	c3                   	ret    

002001e2 <inb>:
  2001e2:	55                   	push   %ebp
  2001e3:	89 e5                	mov    %esp,%ebp
  2001e5:	83 ec 14             	sub    $0x14,%esp
  2001e8:	8b 45 08             	mov    0x8(%ebp),%eax
  2001eb:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  2001ef:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  2001f3:	89 c2                	mov    %eax,%edx
  2001f5:	ec                   	in     (%dx),%al
  2001f6:	88 45 ff             	mov    %al,-0x1(%ebp)
  2001f9:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2001fd:	c9                   	leave  
  2001fe:	c3                   	ret    

002001ff <io_delay>:
  2001ff:	55                   	push   %ebp
  200200:	89 e5                	mov    %esp,%ebp
  200202:	83 ec 10             	sub    $0x10,%esp
  200205:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  20020b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  20020f:	89 c2                	mov    %eax,%edx
  200211:	ee                   	out    %al,(%dx)
  200212:	c9                   	leave  
  200213:	c3                   	ret    

00200214 <outb_pic>:
  200214:	55                   	push   %ebp
  200215:	89 e5                	mov    %esp,%ebp
  200217:	83 ec 0c             	sub    $0xc,%esp
  20021a:	8b 45 08             	mov    0x8(%ebp),%eax
  20021d:	88 45 fc             	mov    %al,-0x4(%ebp)
  200220:	8b 45 0c             	mov    0xc(%ebp),%eax
  200223:	0f b7 d0             	movzwl %ax,%edx
  200226:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20022a:	89 54 24 04          	mov    %edx,0x4(%esp)
  20022e:	89 04 24             	mov    %eax,(%esp)
  200231:	e8 8e ff ff ff       	call   2001c4 <outb>
  200236:	e8 c4 ff ff ff       	call   2001ff <io_delay>
  20023b:	c9                   	leave  
  20023c:	c3                   	ret    

0020023d <inb_pic>:
  20023d:	55                   	push   %ebp
  20023e:	89 e5                	mov    %esp,%ebp
  200240:	83 ec 14             	sub    $0x14,%esp
  200243:	8b 45 08             	mov    0x8(%ebp),%eax
  200246:	0f b7 c0             	movzwl %ax,%eax
  200249:	89 04 24             	mov    %eax,(%esp)
  20024c:	e8 91 ff ff ff       	call   2001e2 <inb>
  200251:	88 45 ff             	mov    %al,-0x1(%ebp)
  200254:	e8 a6 ff ff ff       	call   2001ff <io_delay>
  200259:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  20025d:	c9                   	leave  
  20025e:	c3                   	ret    

0020025f <Init_8259A>:
  20025f:	55                   	push   %ebp
  200260:	89 e5                	mov    %esp,%ebp
  200262:	83 ec 08             	sub    $0x8,%esp
  200265:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20026c:	00 
  20026d:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200274:	e8 9b ff ff ff       	call   200214 <outb_pic>
  200279:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200280:	00 
  200281:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200288:	e8 87 ff ff ff       	call   200214 <outb_pic>
  20028d:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200294:	00 
  200295:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  20029c:	e8 73 ff ff ff       	call   200214 <outb_pic>
  2002a1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002a8:	00 
  2002a9:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  2002b0:	e8 5f ff ff ff       	call   200214 <outb_pic>
  2002b5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002bc:	00 
  2002bd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2002c4:	e8 4b ff ff ff       	call   200214 <outb_pic>
  2002c9:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002d0:	00 
  2002d1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2002d8:	e8 37 ff ff ff       	call   200214 <outb_pic>
  2002dd:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002e4:	00 
  2002e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002ec:	e8 23 ff ff ff       	call   200214 <outb_pic>
  2002f1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002f8:	00 
  2002f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200300:	e8 0f ff ff ff       	call   200214 <outb_pic>
  200305:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20030c:	00 
  20030d:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200314:	e8 fb fe ff ff       	call   200214 <outb_pic>
  200319:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200320:	00 
  200321:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200328:	e8 e7 fe ff ff       	call   200214 <outb_pic>
  20032d:	90                   	nop
  20032e:	c9                   	leave  
  20032f:	c3                   	ret    

00200330 <enable_irq>:
  200330:	55                   	push   %ebp
  200331:	89 e5                	mov    %esp,%ebp
  200333:	83 ec 18             	sub    $0x18,%esp
  200336:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  20033a:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  20033e:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  200345:	e8 f3 fe ff ff       	call   20023d <inb_pic>
  20034a:	88 45 fd             	mov    %al,-0x3(%ebp)
  20034d:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  200354:	e8 e4 fe ff ff       	call   20023d <inb_pic>
  200359:	88 45 fc             	mov    %al,-0x4(%ebp)
  20035c:	fa                   	cli    
  20035d:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  200361:	7f 35                	jg     200398 <enable_irq+0x68>
  200363:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  200367:	74 2f                	je     200398 <enable_irq+0x68>
  200369:	8b 45 08             	mov    0x8(%ebp),%eax
  20036c:	ba 01 00 00 00       	mov    $0x1,%edx
  200371:	89 c1                	mov    %eax,%ecx
  200373:	d3 e2                	shl    %cl,%edx
  200375:	89 d0                	mov    %edx,%eax
  200377:	f7 d0                	not    %eax
  200379:	89 c2                	mov    %eax,%edx
  20037b:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  20037f:	21 d0                	and    %edx,%eax
  200381:	88 45 ff             	mov    %al,-0x1(%ebp)
  200384:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200388:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20038f:	00 
  200390:	89 04 24             	mov    %eax,(%esp)
  200393:	e8 7c fe ff ff       	call   200214 <outb_pic>
  200398:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  20039c:	7e 56                	jle    2003f4 <enable_irq+0xc4>
  20039e:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  2003a2:	7f 50                	jg     2003f4 <enable_irq+0xc4>
  2003a4:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  2003a8:	83 e0 fb             	and    $0xfffffffb,%eax
  2003ab:	88 45 ff             	mov    %al,-0x1(%ebp)
  2003ae:	8b 45 08             	mov    0x8(%ebp),%eax
  2003b1:	83 e8 08             	sub    $0x8,%eax
  2003b4:	ba 01 00 00 00       	mov    $0x1,%edx
  2003b9:	89 c1                	mov    %eax,%ecx
  2003bb:	d3 e2                	shl    %cl,%edx
  2003bd:	89 d0                	mov    %edx,%eax
  2003bf:	f7 d0                	not    %eax
  2003c1:	89 c2                	mov    %eax,%edx
  2003c3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2003c7:	21 d0                	and    %edx,%eax
  2003c9:	88 45 fe             	mov    %al,-0x2(%ebp)
  2003cc:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2003d0:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2003d7:	00 
  2003d8:	89 04 24             	mov    %eax,(%esp)
  2003db:	e8 34 fe ff ff       	call   200214 <outb_pic>
  2003e0:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  2003e4:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2003eb:	00 
  2003ec:	89 04 24             	mov    %eax,(%esp)
  2003ef:	e8 20 fe ff ff       	call   200214 <outb_pic>
  2003f4:	fb                   	sti    
  2003f5:	90                   	nop
  2003f6:	c9                   	leave  
  2003f7:	c3                   	ret    

002003f8 <disable_irqs>:
  2003f8:	55                   	push   %ebp
  2003f9:	89 e5                	mov    %esp,%ebp
  2003fb:	b0 ff                	mov    $0xff,%al
  2003fd:	e6 21                	out    %al,$0x21
  2003ff:	e6 a1                	out    %al,$0xa1
  200401:	5d                   	pop    %ebp
  200402:	c3                   	ret    

00200403 <EOI_master>:
  200403:	55                   	push   %ebp
  200404:	89 e5                	mov    %esp,%ebp
  200406:	83 ec 08             	sub    $0x8,%esp
  200409:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200410:	00 
  200411:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200418:	e8 f7 fd ff ff       	call   200214 <outb_pic>
  20041d:	fb                   	sti    
  20041e:	c9                   	leave  
  20041f:	c3                   	ret    

00200420 <EOI_slave>:
  200420:	55                   	push   %ebp
  200421:	89 e5                	mov    %esp,%ebp
  200423:	83 ec 08             	sub    $0x8,%esp
  200426:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20042d:	00 
  20042e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200435:	e8 da fd ff ff       	call   200214 <outb_pic>
  20043a:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200441:	00 
  200442:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200449:	e8 c6 fd ff ff       	call   200214 <outb_pic>
  20044e:	fb                   	sti    
  20044f:	c9                   	leave  
  200450:	c3                   	ret    
  200451:	66 90                	xchg   %ax,%ax
  200453:	90                   	nop

00200454 <set_gate>:
  200454:	55                   	push   %ebp
  200455:	89 e5                	mov    %esp,%ebp
  200457:	8b 45 18             	mov    0x18(%ebp),%eax
  20045a:	c1 e0 10             	shl    $0x10,%eax
  20045d:	89 c2                	mov    %eax,%edx
  20045f:	8b 45 10             	mov    0x10(%ebp),%eax
  200462:	0f b7 c0             	movzwl %ax,%eax
  200465:	09 c2                	or     %eax,%edx
  200467:	8b 45 08             	mov    0x8(%ebp),%eax
  20046a:	89 10                	mov    %edx,(%eax)
  20046c:	8b 45 10             	mov    0x10(%ebp),%eax
  20046f:	66 b8 00 00          	mov    $0x0,%ax
  200473:	89 c2                	mov    %eax,%edx
  200475:	8b 45 14             	mov    0x14(%ebp),%eax
  200478:	c1 e0 05             	shl    $0x5,%eax
  20047b:	0b 45 0c             	or     0xc(%ebp),%eax
  20047e:	0f b6 c0             	movzbl %al,%eax
  200481:	0c 80                	or     $0x80,%al
  200483:	c1 e0 08             	shl    $0x8,%eax
  200486:	09 c2                	or     %eax,%edx
  200488:	8b 45 08             	mov    0x8(%ebp),%eax
  20048b:	89 50 04             	mov    %edx,0x4(%eax)
  20048e:	5d                   	pop    %ebp
  20048f:	c3                   	ret    

00200490 <set_exception_gate>:
  200490:	55                   	push   %ebp
  200491:	89 e5                	mov    %esp,%ebp
  200493:	83 ec 14             	sub    $0x14,%esp
  200496:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20049d:	00 
  20049e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004a5:	00 
  2004a6:	c7 44 24 08 1f 09 20 	movl   $0x20091f,0x8(%esp)
  2004ad:	00 
  2004ae:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004b5:	00 
  2004b6:	c7 04 24 a0 81 20 00 	movl   $0x2081a0,(%esp)
  2004bd:	e8 92 ff ff ff       	call   200454 <set_gate>
  2004c2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004c9:	00 
  2004ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004d1:	00 
  2004d2:	c7 44 24 08 3b 09 20 	movl   $0x20093b,0x8(%esp)
  2004d9:	00 
  2004da:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004e1:	00 
  2004e2:	c7 04 24 a8 81 20 00 	movl   $0x2081a8,(%esp)
  2004e9:	e8 66 ff ff ff       	call   200454 <set_gate>
  2004ee:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004f5:	00 
  2004f6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004fd:	00 
  2004fe:	c7 44 24 08 57 09 20 	movl   $0x200957,0x8(%esp)
  200505:	00 
  200506:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20050d:	00 
  20050e:	c7 04 24 b0 81 20 00 	movl   $0x2081b0,(%esp)
  200515:	e8 3a ff ff ff       	call   200454 <set_gate>
  20051a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200521:	00 
  200522:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200529:	00 
  20052a:	c7 44 24 08 73 09 20 	movl   $0x200973,0x8(%esp)
  200531:	00 
  200532:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200539:	00 
  20053a:	c7 04 24 b8 81 20 00 	movl   $0x2081b8,(%esp)
  200541:	e8 0e ff ff ff       	call   200454 <set_gate>
  200546:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20054d:	00 
  20054e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200555:	00 
  200556:	c7 44 24 08 8f 09 20 	movl   $0x20098f,0x8(%esp)
  20055d:	00 
  20055e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200565:	00 
  200566:	c7 04 24 c0 81 20 00 	movl   $0x2081c0,(%esp)
  20056d:	e8 e2 fe ff ff       	call   200454 <set_gate>
  200572:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200579:	00 
  20057a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200581:	00 
  200582:	c7 44 24 08 ab 09 20 	movl   $0x2009ab,0x8(%esp)
  200589:	00 
  20058a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200591:	00 
  200592:	c7 04 24 c8 81 20 00 	movl   $0x2081c8,(%esp)
  200599:	e8 b6 fe ff ff       	call   200454 <set_gate>
  20059e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005a5:	00 
  2005a6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005ad:	00 
  2005ae:	c7 44 24 08 c7 09 20 	movl   $0x2009c7,0x8(%esp)
  2005b5:	00 
  2005b6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005bd:	00 
  2005be:	c7 04 24 d0 81 20 00 	movl   $0x2081d0,(%esp)
  2005c5:	e8 8a fe ff ff       	call   200454 <set_gate>
  2005ca:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005d1:	00 
  2005d2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005d9:	00 
  2005da:	c7 44 24 08 e3 09 20 	movl   $0x2009e3,0x8(%esp)
  2005e1:	00 
  2005e2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005e9:	00 
  2005ea:	c7 04 24 d8 81 20 00 	movl   $0x2081d8,(%esp)
  2005f1:	e8 5e fe ff ff       	call   200454 <set_gate>
  2005f6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005fd:	00 
  2005fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200605:	00 
  200606:	c7 44 24 08 ff 09 20 	movl   $0x2009ff,0x8(%esp)
  20060d:	00 
  20060e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200615:	00 
  200616:	c7 04 24 e0 81 20 00 	movl   $0x2081e0,(%esp)
  20061d:	e8 32 fe ff ff       	call   200454 <set_gate>
  200622:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200629:	00 
  20062a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200631:	00 
  200632:	c7 44 24 08 1b 0a 20 	movl   $0x200a1b,0x8(%esp)
  200639:	00 
  20063a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200641:	00 
  200642:	c7 04 24 e8 81 20 00 	movl   $0x2081e8,(%esp)
  200649:	e8 06 fe ff ff       	call   200454 <set_gate>
  20064e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200655:	00 
  200656:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20065d:	00 
  20065e:	c7 44 24 08 37 0a 20 	movl   $0x200a37,0x8(%esp)
  200665:	00 
  200666:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20066d:	00 
  20066e:	c7 04 24 f0 81 20 00 	movl   $0x2081f0,(%esp)
  200675:	e8 da fd ff ff       	call   200454 <set_gate>
  20067a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200681:	00 
  200682:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200689:	00 
  20068a:	c7 44 24 08 53 0a 20 	movl   $0x200a53,0x8(%esp)
  200691:	00 
  200692:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200699:	00 
  20069a:	c7 04 24 f8 81 20 00 	movl   $0x2081f8,(%esp)
  2006a1:	e8 ae fd ff ff       	call   200454 <set_gate>
  2006a6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006ad:	00 
  2006ae:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006b5:	00 
  2006b6:	c7 44 24 08 6f 0a 20 	movl   $0x200a6f,0x8(%esp)
  2006bd:	00 
  2006be:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006c5:	00 
  2006c6:	c7 04 24 00 82 20 00 	movl   $0x208200,(%esp)
  2006cd:	e8 82 fd ff ff       	call   200454 <set_gate>
  2006d2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006d9:	00 
  2006da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006e1:	00 
  2006e2:	c7 44 24 08 8b 0a 20 	movl   $0x200a8b,0x8(%esp)
  2006e9:	00 
  2006ea:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006f1:	00 
  2006f2:	c7 04 24 08 82 20 00 	movl   $0x208208,(%esp)
  2006f9:	e8 56 fd ff ff       	call   200454 <set_gate>
  2006fe:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200705:	00 
  200706:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20070d:	00 
  20070e:	c7 44 24 08 a7 0a 20 	movl   $0x200aa7,0x8(%esp)
  200715:	00 
  200716:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20071d:	00 
  20071e:	c7 04 24 10 82 20 00 	movl   $0x208210,(%esp)
  200725:	e8 2a fd ff ff       	call   200454 <set_gate>
  20072a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200731:	00 
  200732:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200739:	00 
  20073a:	c7 44 24 08 c3 0a 20 	movl   $0x200ac3,0x8(%esp)
  200741:	00 
  200742:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200749:	00 
  20074a:	c7 04 24 18 82 20 00 	movl   $0x208218,(%esp)
  200751:	e8 fe fc ff ff       	call   200454 <set_gate>
  200756:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20075d:	00 
  20075e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200765:	00 
  200766:	c7 44 24 08 df 0a 20 	movl   $0x200adf,0x8(%esp)
  20076d:	00 
  20076e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200775:	00 
  200776:	c7 04 24 20 82 20 00 	movl   $0x208220,(%esp)
  20077d:	e8 d2 fc ff ff       	call   200454 <set_gate>
  200782:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200789:	00 
  20078a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200791:	00 
  200792:	c7 44 24 08 fb 0a 20 	movl   $0x200afb,0x8(%esp)
  200799:	00 
  20079a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2007a1:	00 
  2007a2:	c7 04 24 28 82 20 00 	movl   $0x208228,(%esp)
  2007a9:	e8 a6 fc ff ff       	call   200454 <set_gate>
  2007ae:	c9                   	leave  
  2007af:	c3                   	ret    

002007b0 <load_idt>:
  2007b0:	55                   	push   %ebp
  2007b1:	89 e5                	mov    %esp,%ebp
  2007b3:	fa                   	cli    
  2007b4:	0f 01 1d 00 30 20 00 	lidtl  0x203000
  2007bb:	90                   	nop
  2007bc:	fb                   	sti    
  2007bd:	e8 ce fc ff ff       	call   200490 <set_exception_gate>
  2007c2:	90                   	nop
  2007c3:	5d                   	pop    %ebp
  2007c4:	c3                   	ret    

002007c5 <set_intr_gate>:
  2007c5:	55                   	push   %ebp
  2007c6:	89 e5                	mov    %esp,%ebp
  2007c8:	83 ec 38             	sub    $0x38,%esp
  2007cb:	8b 45 08             	mov    0x8(%ebp),%eax
  2007ce:	83 c0 30             	add    $0x30,%eax
  2007d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2007d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007d7:	c1 e0 03             	shl    $0x3,%eax
  2007da:	8d 90 a0 81 20 00    	lea    0x2081a0(%eax),%edx
  2007e0:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007e7:	00 
  2007e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2007ef:	00 
  2007f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  2007f3:	89 44 24 08          	mov    %eax,0x8(%esp)
  2007f7:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  2007fe:	00 
  2007ff:	89 14 24             	mov    %edx,(%esp)
  200802:	e8 4d fc ff ff       	call   200454 <set_gate>
  200807:	8b 45 08             	mov    0x8(%ebp),%eax
  20080a:	89 04 24             	mov    %eax,(%esp)
  20080d:	e8 1e fb ff ff       	call   200330 <enable_irq>
  200812:	c9                   	leave  
  200813:	c3                   	ret    

00200814 <irq00_handler>:
  200814:	60                   	pusha  
  200815:	1e                   	push   %ds
  200816:	06                   	push   %es
  200817:	0f a0                	push   %fs
  200819:	0f a8                	push   %gs
  20081b:	a1 00 90 23 00       	mov    0x239000,%eax
  200820:	89 20                	mov    %esp,(%eax)
  200822:	65 fe 05 00 0f 00 00 	incb   %gs:0xf00
  200829:	e8 d5 fb ff ff       	call   200403 <EOI_master>
  20082e:	e8 11 00 00 00       	call   200844 <timer_handler>
  200833:	a1 00 90 23 00       	mov    0x239000,%eax
  200838:	8b 20                	mov    (%eax),%esp
  20083a:	0f a9                	pop    %gs
  20083c:	0f a1                	pop    %fs
  20083e:	07                   	pop    %es
  20083f:	1f                   	pop    %ds
  200840:	61                   	popa   
  200841:	cb                   	lret   
  200842:	66 90                	xchg   %ax,%ax

00200844 <timer_handler>:
  200844:	55                   	push   %ebp
  200845:	89 e5                	mov    %esp,%ebp
  200847:	a1 08 30 20 00       	mov    0x203008,%eax
  20084c:	83 c0 01             	add    $0x1,%eax
  20084f:	a3 08 30 20 00       	mov    %eax,0x203008
  200854:	8b 0d 08 30 20 00    	mov    0x203008,%ecx
  20085a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  20085f:	89 c8                	mov    %ecx,%eax
  200861:	f7 e2                	mul    %edx
  200863:	c1 ea 04             	shr    $0x4,%edx
  200866:	89 d0                	mov    %edx,%eax
  200868:	c1 e0 02             	shl    $0x2,%eax
  20086b:	01 d0                	add    %edx,%eax
  20086d:	c1 e0 02             	shl    $0x2,%eax
  200870:	29 c1                	sub    %eax,%ecx
  200872:	89 ca                	mov    %ecx,%edx
  200874:	85 d2                	test   %edx,%edx
  200876:	75 22                	jne    20089a <timer_handler+0x56>
  200878:	a1 00 90 23 00       	mov    0x239000,%eax
  20087d:	3d 00 80 23 00       	cmp    $0x238000,%eax
  200882:	75 0c                	jne    200890 <timer_handler+0x4c>
  200884:	c7 05 00 90 23 00 00 	movl   $0x210000,0x239000
  20088b:	00 21 00 
  20088e:	eb 0a                	jmp    20089a <timer_handler+0x56>
  200890:	c7 05 00 90 23 00 00 	movl   $0x238000,0x239000
  200897:	80 23 00 
  20089a:	90                   	nop
  20089b:	5d                   	pop    %ebp
  20089c:	c3                   	ret    

0020089d <init_timer>:
  20089d:	55                   	push   %ebp
  20089e:	89 e5                	mov    %esp,%ebp
  2008a0:	83 ec 18             	sub    $0x18,%esp
  2008a3:	c7 05 c0 89 20 00 44 	movl   $0x200844,0x2089c0
  2008aa:	08 20 00 
  2008ad:	c7 44 24 04 14 08 20 	movl   $0x200814,0x4(%esp)
  2008b4:	00 
  2008b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008bc:	e8 04 ff ff ff       	call   2007c5 <set_intr_gate>
  2008c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2008c8:	e8 63 fa ff ff       	call   200330 <enable_irq>
  2008cd:	c9                   	leave  
  2008ce:	c3                   	ret    
  2008cf:	90                   	nop

002008d0 <exception_handler>:
  2008d0:	55                   	push   %ebp
  2008d1:	89 e5                	mov    %esp,%ebp
  2008d3:	83 ec 18             	sub    $0x18,%esp
  2008d6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2008dd:	00 
  2008de:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2008e5:	00 
  2008e6:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2008ed:	00 
  2008ee:	c7 04 24 b8 12 20 00 	movl   $0x2012b8,(%esp)
  2008f5:	e8 1e 02 00 00       	call   200b18 <dis_str>
  2008fa:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  200901:	00 
  200902:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200909:	00 
  20090a:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200911:	00 
  200912:	8b 45 0c             	mov    0xc(%ebp),%eax
  200915:	89 04 24             	mov    %eax,(%esp)
  200918:	e8 fb 01 00 00       	call   200b18 <dis_str>
  20091d:	eb fe                	jmp    20091d <exception_handler+0x4d>

0020091f <divide_error>:
  20091f:	55                   	push   %ebp
  200920:	89 e5                	mov    %esp,%ebp
  200922:	83 ec 18             	sub    $0x18,%esp
  200925:	c7 44 24 04 c3 12 20 	movl   $0x2012c3,0x4(%esp)
  20092c:	00 
  20092d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200934:	e8 97 ff ff ff       	call   2008d0 <exception_handler>
  200939:	c9                   	leave  
  20093a:	c3                   	ret    

0020093b <single_step_exception>:
  20093b:	55                   	push   %ebp
  20093c:	89 e5                	mov    %esp,%ebp
  20093e:	83 ec 18             	sub    $0x18,%esp
  200941:	c7 44 24 04 d0 12 20 	movl   $0x2012d0,0x4(%esp)
  200948:	00 
  200949:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200950:	e8 7b ff ff ff       	call   2008d0 <exception_handler>
  200955:	c9                   	leave  
  200956:	c3                   	ret    

00200957 <nmi>:
  200957:	55                   	push   %ebp
  200958:	89 e5                	mov    %esp,%ebp
  20095a:	83 ec 18             	sub    $0x18,%esp
  20095d:	c7 44 24 04 e6 12 20 	movl   $0x2012e6,0x4(%esp)
  200964:	00 
  200965:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  20096c:	e8 5f ff ff ff       	call   2008d0 <exception_handler>
  200971:	c9                   	leave  
  200972:	c3                   	ret    

00200973 <breakpoint_exception>:
  200973:	55                   	push   %ebp
  200974:	89 e5                	mov    %esp,%ebp
  200976:	83 ec 18             	sub    $0x18,%esp
  200979:	c7 44 24 04 ea 12 20 	movl   $0x2012ea,0x4(%esp)
  200980:	00 
  200981:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200988:	e8 43 ff ff ff       	call   2008d0 <exception_handler>
  20098d:	c9                   	leave  
  20098e:	c3                   	ret    

0020098f <overflow>:
  20098f:	55                   	push   %ebp
  200990:	89 e5                	mov    %esp,%ebp
  200992:	83 ec 18             	sub    $0x18,%esp
  200995:	c7 44 24 04 ff 12 20 	movl   $0x2012ff,0x4(%esp)
  20099c:	00 
  20099d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2009a4:	e8 27 ff ff ff       	call   2008d0 <exception_handler>
  2009a9:	c9                   	leave  
  2009aa:	c3                   	ret    

002009ab <bounds_check>:
  2009ab:	55                   	push   %ebp
  2009ac:	89 e5                	mov    %esp,%ebp
  2009ae:	83 ec 18             	sub    $0x18,%esp
  2009b1:	c7 44 24 04 08 13 20 	movl   $0x201308,0x4(%esp)
  2009b8:	00 
  2009b9:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  2009c0:	e8 0b ff ff ff       	call   2008d0 <exception_handler>
  2009c5:	c9                   	leave  
  2009c6:	c3                   	ret    

002009c7 <inval_opcode>:
  2009c7:	55                   	push   %ebp
  2009c8:	89 e5                	mov    %esp,%ebp
  2009ca:	83 ec 18             	sub    $0x18,%esp
  2009cd:	c7 44 24 04 15 13 20 	movl   $0x201315,0x4(%esp)
  2009d4:	00 
  2009d5:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  2009dc:	e8 ef fe ff ff       	call   2008d0 <exception_handler>
  2009e1:	c9                   	leave  
  2009e2:	c3                   	ret    

002009e3 <copr_not_available>:
  2009e3:	55                   	push   %ebp
  2009e4:	89 e5                	mov    %esp,%ebp
  2009e6:	83 ec 18             	sub    $0x18,%esp
  2009e9:	c7 44 24 04 22 13 20 	movl   $0x201322,0x4(%esp)
  2009f0:	00 
  2009f1:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  2009f8:	e8 d3 fe ff ff       	call   2008d0 <exception_handler>
  2009fd:	c9                   	leave  
  2009fe:	c3                   	ret    

002009ff <double_fault>:
  2009ff:	55                   	push   %ebp
  200a00:	89 e5                	mov    %esp,%ebp
  200a02:	83 ec 18             	sub    $0x18,%esp
  200a05:	c7 44 24 04 35 13 20 	movl   $0x201335,0x4(%esp)
  200a0c:	00 
  200a0d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  200a14:	e8 b7 fe ff ff       	call   2008d0 <exception_handler>
  200a19:	c9                   	leave  
  200a1a:	c3                   	ret    

00200a1b <copr_seg_overrun>:
  200a1b:	55                   	push   %ebp
  200a1c:	89 e5                	mov    %esp,%ebp
  200a1e:	83 ec 18             	sub    $0x18,%esp
  200a21:	c7 44 24 04 42 13 20 	movl   $0x201342,0x4(%esp)
  200a28:	00 
  200a29:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200a30:	e8 9b fe ff ff       	call   2008d0 <exception_handler>
  200a35:	c9                   	leave  
  200a36:	c3                   	ret    

00200a37 <inval_tss>:
  200a37:	55                   	push   %ebp
  200a38:	89 e5                	mov    %esp,%ebp
  200a3a:	83 ec 18             	sub    $0x18,%esp
  200a3d:	c7 44 24 04 53 13 20 	movl   $0x201353,0x4(%esp)
  200a44:	00 
  200a45:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200a4c:	e8 7f fe ff ff       	call   2008d0 <exception_handler>
  200a51:	c9                   	leave  
  200a52:	c3                   	ret    

00200a53 <segment_not_present>:
  200a53:	55                   	push   %ebp
  200a54:	89 e5                	mov    %esp,%ebp
  200a56:	83 ec 18             	sub    $0x18,%esp
  200a59:	c7 44 24 04 5d 13 20 	movl   $0x20135d,0x4(%esp)
  200a60:	00 
  200a61:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200a68:	e8 63 fe ff ff       	call   2008d0 <exception_handler>
  200a6d:	c9                   	leave  
  200a6e:	c3                   	ret    

00200a6f <stack_exception>:
  200a6f:	55                   	push   %ebp
  200a70:	89 e5                	mov    %esp,%ebp
  200a72:	83 ec 18             	sub    $0x18,%esp
  200a75:	c7 44 24 04 71 13 20 	movl   $0x201371,0x4(%esp)
  200a7c:	00 
  200a7d:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200a84:	e8 47 fe ff ff       	call   2008d0 <exception_handler>
  200a89:	c9                   	leave  
  200a8a:	c3                   	ret    

00200a8b <general_protection>:
  200a8b:	55                   	push   %ebp
  200a8c:	89 e5                	mov    %esp,%ebp
  200a8e:	83 ec 18             	sub    $0x18,%esp
  200a91:	c7 44 24 04 81 13 20 	movl   $0x201381,0x4(%esp)
  200a98:	00 
  200a99:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200aa0:	e8 2b fe ff ff       	call   2008d0 <exception_handler>
  200aa5:	c9                   	leave  
  200aa6:	c3                   	ret    

00200aa7 <page_fault>:
  200aa7:	55                   	push   %ebp
  200aa8:	89 e5                	mov    %esp,%ebp
  200aaa:	83 ec 18             	sub    $0x18,%esp
  200aad:	c7 44 24 04 94 13 20 	movl   $0x201394,0x4(%esp)
  200ab4:	00 
  200ab5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200abc:	e8 0f fe ff ff       	call   2008d0 <exception_handler>
  200ac1:	c9                   	leave  
  200ac2:	c3                   	ret    

00200ac3 <copr_error>:
  200ac3:	55                   	push   %ebp
  200ac4:	89 e5                	mov    %esp,%ebp
  200ac6:	83 ec 18             	sub    $0x18,%esp
  200ac9:	c7 44 24 04 9f 13 20 	movl   $0x20139f,0x4(%esp)
  200ad0:	00 
  200ad1:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200ad8:	e8 f3 fd ff ff       	call   2008d0 <exception_handler>
  200add:	c9                   	leave  
  200ade:	c3                   	ret    

00200adf <float_error>:
  200adf:	55                   	push   %ebp
  200ae0:	89 e5                	mov    %esp,%ebp
  200ae2:	83 ec 18             	sub    $0x18,%esp
  200ae5:	c7 44 24 04 aa 13 20 	movl   $0x2013aa,0x4(%esp)
  200aec:	00 
  200aed:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200af4:	e8 d7 fd ff ff       	call   2008d0 <exception_handler>
  200af9:	c9                   	leave  
  200afa:	c3                   	ret    

00200afb <alignment_check>:
  200afb:	55                   	push   %ebp
  200afc:	89 e5                	mov    %esp,%ebp
  200afe:	83 ec 18             	sub    $0x18,%esp
  200b01:	c7 44 24 04 b6 13 20 	movl   $0x2013b6,0x4(%esp)
  200b08:	00 
  200b09:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200b10:	e8 bb fd ff ff       	call   2008d0 <exception_handler>
  200b15:	c9                   	leave  
  200b16:	c3                   	ret    
  200b17:	90                   	nop

00200b18 <dis_str>:
  200b18:	55                   	push   %ebp
  200b19:	89 e5                	mov    %esp,%ebp
  200b1b:	57                   	push   %edi
  200b1c:	53                   	push   %ebx
  200b1d:	83 ec 30             	sub    $0x30,%esp
  200b20:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b23:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200b26:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200b2d:	8b 55 10             	mov    0x10(%ebp),%edx
  200b30:	89 d0                	mov    %edx,%eax
  200b32:	c1 e0 02             	shl    $0x2,%eax
  200b35:	01 d0                	add    %edx,%eax
  200b37:	c1 e0 04             	shl    $0x4,%eax
  200b3a:	89 c2                	mov    %eax,%edx
  200b3c:	8b 45 14             	mov    0x14(%ebp),%eax
  200b3f:	01 d0                	add    %edx,%eax
  200b41:	01 c0                	add    %eax,%eax
  200b43:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200b46:	8b 45 08             	mov    0x8(%ebp),%eax
  200b49:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200b4c:	8b 45 08             	mov    0x8(%ebp),%eax
  200b4f:	89 04 24             	mov    %eax,(%esp)
  200b52:	e8 02 01 00 00       	call   200c59 <strlen>
  200b57:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200b5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200b61:	eb 2e                	jmp    200b91 <dis_str+0x79>
  200b63:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200b66:	8d 50 01             	lea    0x1(%eax),%edx
  200b69:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200b6c:	0f b6 00             	movzbl (%eax),%eax
  200b6f:	88 45 e7             	mov    %al,-0x19(%ebp)
  200b72:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200b76:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200b7a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200b7d:	89 d3                	mov    %edx,%ebx
  200b7f:	89 cf                	mov    %ecx,%edi
  200b81:	88 c4                	mov    %al,%ah
  200b83:	88 d8                	mov    %bl,%al
  200b85:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200b89:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200b8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200b91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b94:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200b97:	7c ca                	jl     200b63 <dis_str+0x4b>
  200b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200b9c:	83 c4 30             	add    $0x30,%esp
  200b9f:	5b                   	pop    %ebx
  200ba0:	5f                   	pop    %edi
  200ba1:	5d                   	pop    %ebp
  200ba2:	c3                   	ret    

00200ba3 <dis_nchar>:
  200ba3:	55                   	push   %ebp
  200ba4:	89 e5                	mov    %esp,%ebp
  200ba6:	57                   	push   %edi
  200ba7:	53                   	push   %ebx
  200ba8:	83 ec 14             	sub    $0x14,%esp
  200bab:	8b 45 0c             	mov    0xc(%ebp),%eax
  200bae:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200bb1:	8b 55 14             	mov    0x14(%ebp),%edx
  200bb4:	89 d0                	mov    %edx,%eax
  200bb6:	c1 e0 02             	shl    $0x2,%eax
  200bb9:	01 d0                	add    %edx,%eax
  200bbb:	c1 e0 04             	shl    $0x4,%eax
  200bbe:	89 c2                	mov    %eax,%edx
  200bc0:	8b 45 18             	mov    0x18(%ebp),%eax
  200bc3:	01 d0                	add    %edx,%eax
  200bc5:	01 c0                	add    %eax,%eax
  200bc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200bca:	8b 45 08             	mov    0x8(%ebp),%eax
  200bcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200bd0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200bd7:	eb 2e                	jmp    200c07 <dis_nchar+0x64>
  200bd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200bdc:	8d 50 01             	lea    0x1(%eax),%edx
  200bdf:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200be2:	0f b6 00             	movzbl (%eax),%eax
  200be5:	88 45 eb             	mov    %al,-0x15(%ebp)
  200be8:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200bec:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200bf0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200bf3:	89 d3                	mov    %edx,%ebx
  200bf5:	89 cf                	mov    %ecx,%edi
  200bf7:	88 c4                	mov    %al,%ah
  200bf9:	88 d8                	mov    %bl,%al
  200bfb:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200bff:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200c03:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200c07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c0a:	3b 45 10             	cmp    0x10(%ebp),%eax
  200c0d:	7c ca                	jl     200bd9 <dis_nchar+0x36>
  200c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c12:	83 c4 14             	add    $0x14,%esp
  200c15:	5b                   	pop    %ebx
  200c16:	5f                   	pop    %edi
  200c17:	5d                   	pop    %ebp
  200c18:	c3                   	ret    
  200c19:	66 90                	xchg   %ax,%ax
  200c1b:	90                   	nop

00200c1c <memcpy>:
  200c1c:	55                   	push   %ebp
  200c1d:	89 e5                	mov    %esp,%ebp
  200c1f:	83 ec 10             	sub    $0x10,%esp
  200c22:	8b 45 08             	mov    0x8(%ebp),%eax
  200c25:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200c28:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c2e:	eb 17                	jmp    200c47 <memcpy+0x2b>
  200c30:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c33:	8d 50 01             	lea    0x1(%eax),%edx
  200c36:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200c39:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200c3c:	8d 4a 01             	lea    0x1(%edx),%ecx
  200c3f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200c42:	0f b6 12             	movzbl (%edx),%edx
  200c45:	88 10                	mov    %dl,(%eax)
  200c47:	8b 45 10             	mov    0x10(%ebp),%eax
  200c4a:	8d 50 ff             	lea    -0x1(%eax),%edx
  200c4d:	89 55 10             	mov    %edx,0x10(%ebp)
  200c50:	85 c0                	test   %eax,%eax
  200c52:	75 dc                	jne    200c30 <memcpy+0x14>
  200c54:	8b 45 08             	mov    0x8(%ebp),%eax
  200c57:	c9                   	leave  
  200c58:	c3                   	ret    

00200c59 <strlen>:
  200c59:	55                   	push   %ebp
  200c5a:	89 e5                	mov    %esp,%ebp
  200c5c:	83 ec 10             	sub    $0x10,%esp
  200c5f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200c66:	8b 45 08             	mov    0x8(%ebp),%eax
  200c69:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c6c:	eb 08                	jmp    200c76 <strlen+0x1d>
  200c6e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200c72:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200c76:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200c79:	0f b6 00             	movzbl (%eax),%eax
  200c7c:	84 c0                	test   %al,%al
  200c7e:	75 ee                	jne    200c6e <strlen+0x15>
  200c80:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c83:	c9                   	leave  
  200c84:	c3                   	ret    

00200c85 <strcmp>:
  200c85:	55                   	push   %ebp
  200c86:	89 e5                	mov    %esp,%ebp
  200c88:	eb 0c                	jmp    200c96 <strcmp+0x11>
  200c8a:	8b 45 08             	mov    0x8(%ebp),%eax
  200c8d:	0f b6 00             	movzbl (%eax),%eax
  200c90:	84 c0                	test   %al,%al
  200c92:	75 02                	jne    200c96 <strcmp+0x11>
  200c94:	eb 1c                	jmp    200cb2 <strcmp+0x2d>
  200c96:	8b 45 08             	mov    0x8(%ebp),%eax
  200c99:	8d 50 01             	lea    0x1(%eax),%edx
  200c9c:	89 55 08             	mov    %edx,0x8(%ebp)
  200c9f:	0f b6 08             	movzbl (%eax),%ecx
  200ca2:	8b 45 0c             	mov    0xc(%ebp),%eax
  200ca5:	8d 50 01             	lea    0x1(%eax),%edx
  200ca8:	89 55 0c             	mov    %edx,0xc(%ebp)
  200cab:	0f b6 00             	movzbl (%eax),%eax
  200cae:	38 c1                	cmp    %al,%cl
  200cb0:	74 d8                	je     200c8a <strcmp+0x5>
  200cb2:	8b 45 08             	mov    0x8(%ebp),%eax
  200cb5:	0f b6 00             	movzbl (%eax),%eax
  200cb8:	0f be d0             	movsbl %al,%edx
  200cbb:	8b 45 0c             	mov    0xc(%ebp),%eax
  200cbe:	0f b6 00             	movzbl (%eax),%eax
  200cc1:	0f be c0             	movsbl %al,%eax
  200cc4:	29 c2                	sub    %eax,%edx
  200cc6:	89 d0                	mov    %edx,%eax
  200cc8:	5d                   	pop    %ebp
  200cc9:	c3                   	ret    

00200cca <memset>:
  200cca:	55                   	push   %ebp
  200ccb:	89 e5                	mov    %esp,%ebp
  200ccd:	83 ec 10             	sub    $0x10,%esp
  200cd0:	8b 45 08             	mov    0x8(%ebp),%eax
  200cd3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200cd6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200cdd:	eb 12                	jmp    200cf1 <memset+0x27>
  200cdf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200ce2:	8d 50 01             	lea    0x1(%eax),%edx
  200ce5:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200ce8:	8b 55 0c             	mov    0xc(%ebp),%edx
  200ceb:	88 10                	mov    %dl,(%eax)
  200ced:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200cf1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200cf4:	3b 45 10             	cmp    0x10(%ebp),%eax
  200cf7:	72 e6                	jb     200cdf <memset+0x15>
  200cf9:	8b 45 08             	mov    0x8(%ebp),%eax
  200cfc:	c9                   	leave  
  200cfd:	c3                   	ret    
  200cfe:	66 90                	xchg   %ax,%ax

00200d00 <init_thread>:
  200d00:	55                   	push   %ebp
  200d01:	89 e5                	mov    %esp,%ebp
  200d03:	83 ec 18             	sub    $0x18,%esp
  200d06:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200d0d:	00 
  200d0e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200d15:	00 
  200d16:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200d1d:	00 
  200d1e:	c7 04 24 c6 13 20 00 	movl   $0x2013c6,(%esp)
  200d25:	e8 ee fd ff ff       	call   200b18 <dis_str>
  200d2a:	65 fe 05 28 00 00 00 	incb   %gs:0x28
  200d31:	eb f7                	jmp    200d2a <init_thread+0x2a>

00200d33 <creat_init>:
  200d33:	55                   	push   %ebp
  200d34:	89 e5                	mov    %esp,%ebp
  200d36:	83 ec 18             	sub    $0x18,%esp
  200d39:	c7 05 04 00 21 00 00 	movl   $0x0,0x210004
  200d40:	00 00 00 
  200d43:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200d4a:	00 
  200d4b:	c7 44 24 04 d9 13 20 	movl   $0x2013d9,0x4(%esp)
  200d52:	00 
  200d53:	c7 04 24 0c 00 21 00 	movl   $0x21000c,(%esp)
  200d5a:	e8 bd fe ff ff       	call   200c1c <memcpy>
  200d5f:	b8 00 0d 20 00       	mov    $0x200d00,%eax
  200d64:	a3 08 00 21 00       	mov    %eax,0x210008
  200d69:	b8 00 00 22 00       	mov    $0x220000,%eax
  200d6e:	a3 00 00 21 00       	mov    %eax,0x210000
  200d73:	c7 05 0c 00 22 00 28 	movl   $0x28,0x22000c
  200d7a:	00 00 00 
  200d7d:	c7 05 34 00 22 00 20 	movl   $0x20,0x220034
  200d84:	00 00 00 
  200d87:	c7 05 08 00 22 00 28 	movl   $0x28,0x220008
  200d8e:	00 00 00 
  200d91:	c7 05 04 00 22 00 28 	movl   $0x28,0x220004
  200d98:	00 00 00 
  200d9b:	c7 05 3c 00 22 00 28 	movl   $0x28,0x22003c
  200da2:	00 00 00 
  200da5:	c7 05 00 00 22 00 48 	movl   $0x48,0x220000
  200dac:	00 00 00 
  200daf:	b8 00 0d 20 00       	mov    $0x200d00,%eax
  200db4:	a3 30 00 22 00       	mov    %eax,0x220030
  200db9:	a1 1c 00 21 00       	mov    0x21001c,%eax
  200dbe:	a3 38 00 22 00       	mov    %eax,0x220038
  200dc3:	c7 05 40 00 22 00 02 	movl   $0x1202,0x220040
  200dca:	12 00 00 
  200dcd:	c7 05 44 00 22 00 00 	movl   $0x210000,0x220044
  200dd4:	00 21 00 
  200dd7:	c7 05 00 90 23 00 00 	movl   $0x210000,0x239000
  200dde:	00 21 00 
  200de1:	c7 04 24 00 00 21 00 	movl   $0x210000,(%esp)
  200de8:	e8 db 00 00 00       	call   200ec8 <schedule>
  200ded:	c9                   	leave  
  200dee:	c3                   	ret    

00200def <testA>:
  200def:	55                   	push   %ebp
  200df0:	89 e5                	mov    %esp,%ebp
  200df2:	83 ec 18             	sub    $0x18,%esp
  200df5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200dfc:	00 
  200dfd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  200e04:	00 
  200e05:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200e0c:	00 
  200e0d:	c7 04 24 e5 13 20 00 	movl   $0x2013e5,(%esp)
  200e14:	e8 ff fc ff ff       	call   200b18 <dis_str>
  200e19:	65 fe 05 c8 00 00 00 	incb   %gs:0xc8
  200e20:	eb f7                	jmp    200e19 <testA+0x2a>

00200e22 <creat_testA>:
  200e22:	55                   	push   %ebp
  200e23:	89 e5                	mov    %esp,%ebp
  200e25:	83 ec 18             	sub    $0x18,%esp
  200e28:	c7 05 04 80 23 00 00 	movl   $0x0,0x238004
  200e2f:	00 00 00 
  200e32:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200e39:	00 
  200e3a:	c7 44 24 04 f9 13 20 	movl   $0x2013f9,0x4(%esp)
  200e41:	00 
  200e42:	c7 04 24 0c 80 23 00 	movl   $0x23800c,(%esp)
  200e49:	e8 ce fd ff ff       	call   200c1c <memcpy>
  200e4e:	b8 ef 0d 20 00       	mov    $0x200def,%eax
  200e53:	a3 08 80 23 00       	mov    %eax,0x238008
  200e58:	b8 00 00 23 00       	mov    $0x230000,%eax
  200e5d:	a3 00 80 23 00       	mov    %eax,0x238000
  200e62:	c7 05 0c 00 23 00 28 	movl   $0x28,0x23000c
  200e69:	00 00 00 
  200e6c:	c7 05 34 00 23 00 20 	movl   $0x20,0x230034
  200e73:	00 00 00 
  200e76:	c7 05 08 00 23 00 28 	movl   $0x28,0x230008
  200e7d:	00 00 00 
  200e80:	c7 05 04 00 23 00 28 	movl   $0x28,0x230004
  200e87:	00 00 00 
  200e8a:	c7 05 3c 00 23 00 28 	movl   $0x28,0x23003c
  200e91:	00 00 00 
  200e94:	c7 05 00 00 23 00 48 	movl   $0x48,0x230000
  200e9b:	00 00 00 
  200e9e:	b8 ef 0d 20 00       	mov    $0x200def,%eax
  200ea3:	a3 30 00 23 00       	mov    %eax,0x230030
  200ea8:	a1 1c 80 23 00       	mov    0x23801c,%eax
  200ead:	a3 38 00 23 00       	mov    %eax,0x230038
  200eb2:	c7 05 40 00 23 00 02 	movl   $0x1202,0x230040
  200eb9:	12 00 00 
  200ebc:	c7 05 44 00 23 00 00 	movl   $0x238000,0x230044
  200ec3:	80 23 00 
  200ec6:	c9                   	leave  
  200ec7:	c3                   	ret    

00200ec8 <schedule>:
  200ec8:	55                   	push   %ebp
  200ec9:	89 e5                	mov    %esp,%ebp
  200ecb:	8b 45 08             	mov    0x8(%ebp),%eax
  200ece:	8b 00                	mov    (%eax),%eax
  200ed0:	89 c4                	mov    %eax,%esp
  200ed2:	e9 05 00 00 00       	jmp    200edc <switch_to>
  200ed7:	5d                   	pop    %ebp
  200ed8:	c3                   	ret    
  200ed9:	66 90                	xchg   %ax,%ax
  200edb:	90                   	nop

00200edc <switch_to>:
  200edc:	89 c4                	mov    %eax,%esp
  200ede:	0f a9                	pop    %gs
  200ee0:	0f a1                	pop    %fs
  200ee2:	07                   	pop    %es
  200ee3:	1f                   	pop    %ds
  200ee4:	61                   	popa   
  200ee5:	cb                   	lret   
  200ee6:	66 90                	xchg   %ax,%ax

00200ee8 <get_memory_info>:
  200ee8:	55                   	push   %ebp
  200ee9:	89 e5                	mov    %esp,%ebp
  200eeb:	83 ec 28             	sub    $0x28,%esp
  200eee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200ef5:	a1 00 00 10 00       	mov    0x100000,%eax
  200efa:	a3 84 90 23 00       	mov    %eax,0x239084
  200eff:	a1 04 00 10 00       	mov    0x100004,%eax
  200f04:	a3 88 90 23 00       	mov    %eax,0x239088
  200f09:	a1 08 00 10 00       	mov    0x100008,%eax
  200f0e:	a3 8c 90 23 00       	mov    %eax,0x23908c
  200f13:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200f1a:	eb 3e                	jmp    200f5a <get_memory_info+0x72>
  200f1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f1f:	89 d0                	mov    %edx,%eax
  200f21:	c1 e0 02             	shl    $0x2,%eax
  200f24:	01 d0                	add    %edx,%eax
  200f26:	c1 e0 02             	shl    $0x2,%eax
  200f29:	05 00 80 00 00       	add    $0x8000,%eax
  200f2e:	89 c1                	mov    %eax,%ecx
  200f30:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f33:	89 d0                	mov    %edx,%eax
  200f35:	c1 e0 02             	shl    $0x2,%eax
  200f38:	01 d0                	add    %edx,%eax
  200f3a:	c1 e0 02             	shl    $0x2,%eax
  200f3d:	05 20 90 23 00       	add    $0x239020,%eax
  200f42:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  200f49:	00 
  200f4a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  200f4e:	89 04 24             	mov    %eax,(%esp)
  200f51:	e8 c6 fc ff ff       	call   200c1c <memcpy>
  200f56:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200f5a:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  200f5e:	7e bc                	jle    200f1c <get_memory_info+0x34>
  200f60:	90                   	nop
  200f61:	c9                   	leave  
  200f62:	c3                   	ret    
  200f63:	90                   	nop

00200f64 <init_page_bit_map>:
  200f64:	55                   	push   %ebp
  200f65:	89 e5                	mov    %esp,%ebp
  200f67:	83 ec 10             	sub    $0x10,%esp
  200f6a:	a1 0c 30 20 00       	mov    0x20300c,%eax
  200f6f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200f72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200f79:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200f80:	eb 4f                	jmp    200fd1 <init_page_bit_map+0x6d>
  200f82:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200f85:	89 d0                	mov    %edx,%eax
  200f87:	c1 e0 02             	shl    $0x2,%eax
  200f8a:	01 d0                	add    %edx,%eax
  200f8c:	c1 e0 02             	shl    $0x2,%eax
  200f8f:	05 30 90 23 00       	add    $0x239030,%eax
  200f94:	8b 00                	mov    (%eax),%eax
  200f96:	83 f8 01             	cmp    $0x1,%eax
  200f99:	75 32                	jne    200fcd <init_page_bit_map+0x69>
  200f9b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200f9e:	89 d0                	mov    %edx,%eax
  200fa0:	c1 e0 02             	shl    $0x2,%eax
  200fa3:	01 d0                	add    %edx,%eax
  200fa5:	c1 e0 02             	shl    $0x2,%eax
  200fa8:	05 20 90 23 00       	add    $0x239020,%eax
  200fad:	8b 40 08             	mov    0x8(%eax),%eax
  200fb0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  200fb3:	76 18                	jbe    200fcd <init_page_bit_map+0x69>
  200fb5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200fb8:	89 d0                	mov    %edx,%eax
  200fba:	c1 e0 02             	shl    $0x2,%eax
  200fbd:	01 d0                	add    %edx,%eax
  200fbf:	c1 e0 02             	shl    $0x2,%eax
  200fc2:	05 20 90 23 00       	add    $0x239020,%eax
  200fc7:	8b 40 08             	mov    0x8(%eax),%eax
  200fca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200fcd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200fd1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200fd4:	a1 8c 90 23 00       	mov    0x23908c,%eax
  200fd9:	39 c2                	cmp    %eax,%edx
  200fdb:	72 a5                	jb     200f82 <init_page_bit_map+0x1e>
  200fdd:	a1 0c 30 20 00       	mov    0x20300c,%eax
  200fe2:	29 45 f4             	sub    %eax,-0xc(%ebp)
  200fe5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200fe8:	05 ff 0f 00 00       	add    $0xfff,%eax
  200fed:	c1 e8 0c             	shr    $0xc,%eax
  200ff0:	a3 a0 89 20 00       	mov    %eax,0x2089a0
  200ff5:	a1 a0 89 20 00       	mov    0x2089a0,%eax
  200ffa:	83 c0 07             	add    $0x7,%eax
  200ffd:	c1 e8 03             	shr    $0x3,%eax
  201000:	a3 a4 89 20 00       	mov    %eax,0x2089a4
  201005:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20100c:	eb 0e                	jmp    20101c <init_page_bit_map+0xb8>
  20100e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201011:	c6 00 00             	movb   $0x0,(%eax)
  201014:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  201018:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  20101c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20101f:	a1 a4 89 20 00       	mov    0x2089a4,%eax
  201024:	39 c2                	cmp    %eax,%edx
  201026:	72 e6                	jb     20100e <init_page_bit_map+0xaa>
  201028:	a1 0c 30 20 00       	mov    0x20300c,%eax
  20102d:	c6 00 80             	movb   $0x80,(%eax)
  201030:	90                   	nop
  201031:	c9                   	leave  
  201032:	c3                   	ret    

00201033 <get_pages>:
  201033:	55                   	push   %ebp
  201034:	89 e5                	mov    %esp,%ebp
  201036:	83 ec 28             	sub    $0x28,%esp
  201039:	a1 0c 30 20 00       	mov    0x20300c,%eax
  20103e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  201041:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  201045:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  201049:	76 4a                	jbe    201095 <get_pages+0x62>
  20104b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  201052:	00 
  201053:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  20105a:	00 
  20105b:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
  201062:	00 
  201063:	c7 04 24 00 14 20 00 	movl   $0x201400,(%esp)
  20106a:	e8 a9 fa ff ff       	call   200b18 <dis_str>
  20106f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  201076:	00 
  201077:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  20107e:	00 
  20107f:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  201086:	00 
  201087:	c7 04 24 08 14 20 00 	movl   $0x201408,(%esp)
  20108e:	e8 85 fa ff ff       	call   200b18 <dis_str>
  201093:	eb fe                	jmp    201093 <get_pages+0x60>
  201095:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20109c:	eb 10                	jmp    2010ae <get_pages+0x7b>
  20109e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2010a2:	01 c0                	add    %eax,%eax
  2010a4:	83 c8 01             	or     $0x1,%eax
  2010a7:	88 45 ef             	mov    %al,-0x11(%ebp)
  2010aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2010ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2010b1:	3b 45 08             	cmp    0x8(%ebp),%eax
  2010b4:	72 e8                	jb     20109e <get_pages+0x6b>
  2010b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2010bd:	eb 5d                	jmp    20111c <get_pages+0xe9>
  2010bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2010c6:	eb 43                	jmp    20110b <get_pages+0xd8>
  2010c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2010cb:	0f b6 00             	movzbl (%eax),%eax
  2010ce:	22 45 ef             	and    -0x11(%ebp),%al
  2010d1:	84 c0                	test   %al,%al
  2010d3:	75 32                	jne    201107 <get_pages+0xd4>
  2010d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2010d8:	0f b6 00             	movzbl (%eax),%eax
  2010db:	0a 45 ef             	or     -0x11(%ebp),%al
  2010de:	89 c2                	mov    %eax,%edx
  2010e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2010e3:	88 10                	mov    %dl,(%eax)
  2010e5:	8b 15 0c 30 20 00    	mov    0x20300c,%edx
  2010eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2010ee:	c1 e0 03             	shl    $0x3,%eax
  2010f1:	89 c1                	mov    %eax,%ecx
  2010f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2010f6:	f7 d8                	neg    %eax
  2010f8:	2b 45 08             	sub    0x8(%ebp),%eax
  2010fb:	01 c8                	add    %ecx,%eax
  2010fd:	83 c0 08             	add    $0x8,%eax
  201100:	c1 e0 0c             	shl    $0xc,%eax
  201103:	01 d0                	add    %edx,%eax
  201105:	eb 26                	jmp    20112d <get_pages+0xfa>
  201107:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  20110b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20110e:	8b 45 08             	mov    0x8(%ebp),%eax
  201111:	01 d0                	add    %edx,%eax
  201113:	83 f8 07             	cmp    $0x7,%eax
  201116:	76 b0                	jbe    2010c8 <get_pages+0x95>
  201118:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  20111c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20111f:	a1 a4 89 20 00       	mov    0x2089a4,%eax
  201124:	39 c2                	cmp    %eax,%edx
  201126:	72 97                	jb     2010bf <get_pages+0x8c>
  201128:	b8 00 00 00 00       	mov    $0x0,%eax
  20112d:	c9                   	leave  
  20112e:	c3                   	ret    

0020112f <get_page_cnt>:
  20112f:	55                   	push   %ebp
  201130:	89 e5                	mov    %esp,%ebp
  201132:	83 ec 10             	sub    $0x10,%esp
  201135:	c7 45 f8 20 90 23 00 	movl   $0x239020,-0x8(%ebp)
  20113c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201143:	eb 32                	jmp    201177 <get_page_cnt+0x48>
  201145:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201148:	89 d0                	mov    %edx,%eax
  20114a:	c1 e0 02             	shl    $0x2,%eax
  20114d:	01 d0                	add    %edx,%eax
  20114f:	c1 e0 02             	shl    $0x2,%eax
  201152:	05 30 90 23 00       	add    $0x239030,%eax
  201157:	8b 00                	mov    (%eax),%eax
  201159:	83 f8 01             	cmp    $0x1,%eax
  20115c:	75 15                	jne    201173 <get_page_cnt+0x44>
  20115e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201161:	89 d0                	mov    %edx,%eax
  201163:	c1 e0 02             	shl    $0x2,%eax
  201166:	01 d0                	add    %edx,%eax
  201168:	c1 e0 02             	shl    $0x2,%eax
  20116b:	05 20 90 23 00       	add    $0x239020,%eax
  201170:	89 45 f8             	mov    %eax,-0x8(%ebp)
  201173:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201177:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20117a:	a1 8c 90 23 00       	mov    0x23908c,%eax
  20117f:	39 c2                	cmp    %eax,%edx
  201181:	72 c2                	jb     201145 <get_page_cnt+0x16>
  201183:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201186:	8b 10                	mov    (%eax),%edx
  201188:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20118b:	8b 40 08             	mov    0x8(%eax),%eax
  20118e:	01 d0                	add    %edx,%eax
  201190:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201193:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201196:	05 ff 0f 00 00       	add    $0xfff,%eax
  20119b:	c1 e8 0c             	shr    $0xc,%eax
  20119e:	c9                   	leave  
  20119f:	c3                   	ret    

002011a0 <get_ptet_cnt>:
  2011a0:	55                   	push   %ebp
  2011a1:	89 e5                	mov    %esp,%ebp
  2011a3:	8b 45 08             	mov    0x8(%ebp),%eax
  2011a6:	05 ff 03 00 00       	add    $0x3ff,%eax
  2011ab:	c1 e8 0a             	shr    $0xa,%eax
  2011ae:	5d                   	pop    %ebp
  2011af:	c3                   	ret    

002011b0 <set_page>:
  2011b0:	55                   	push   %ebp
  2011b1:	89 e5                	mov    %esp,%ebp
  2011b3:	83 ec 34             	sub    $0x34,%esp
  2011b6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2011bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  2011c4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  2011cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2011d2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2011d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2011e0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2011e7:	e8 43 ff ff ff       	call   20112f <get_page_cnt>
  2011ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2011ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2011f2:	89 04 24             	mov    %eax,(%esp)
  2011f5:	e8 a6 ff ff ff       	call   2011a0 <get_ptet_cnt>
  2011fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2011fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  201200:	89 04 24             	mov    %eax,(%esp)
  201203:	e8 98 ff ff ff       	call   2011a0 <get_ptet_cnt>
  201208:	89 45 dc             	mov    %eax,-0x24(%ebp)
  20120b:	c7 45 f0 00 00 10 00 	movl   $0x100000,-0x10(%ebp)
  201212:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201215:	89 45 d8             	mov    %eax,-0x28(%ebp)
  201218:	c7 45 ec 00 10 10 00 	movl   $0x101000,-0x14(%ebp)
  20121f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201226:	eb 6c                	jmp    201294 <set_page+0xe4>
  201228:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20122f:	eb 50                	jmp    201281 <set_page+0xd1>
  201231:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201234:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  201239:	83 c8 07             	or     $0x7,%eax
  20123c:	89 c1                	mov    %eax,%ecx
  20123e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201241:	8b 55 f8             	mov    -0x8(%ebp),%edx
  201244:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201247:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20124e:	eb 1c                	jmp    20126c <set_page+0xbc>
  201250:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201253:	83 c8 07             	or     $0x7,%eax
  201256:	89 c1                	mov    %eax,%ecx
  201258:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20125b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20125e:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201261:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
  201268:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  20126c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20126f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  201274:	76 da                	jbe    201250 <set_page+0xa0>
  201276:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  20127d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  201281:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201284:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  201287:	7c a8                	jl     201231 <set_page+0x81>
  201289:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  201290:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201294:	8b 45 fc             	mov    -0x4(%ebp),%eax
  201297:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  20129a:	7c 8c                	jl     201228 <set_page+0x78>
  20129c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  20129f:	0f 22 d8             	mov    %eax,%cr3
  2012a2:	0f 20 c0             	mov    %cr0,%eax
  2012a5:	0d 00 00 00 80       	or     $0x80000000,%eax
  2012aa:	0f 22 c0             	mov    %eax,%cr0
  2012ad:	e8 b2 fc ff ff       	call   200f64 <init_page_bit_map>
  2012b2:	90                   	nop
  2012b3:	c9                   	leave  
  2012b4:	c3                   	ret    
