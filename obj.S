
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 8c 00 00 00       	call   200097 <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 08             	sub    $0x8,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 29 00 00 00       	call   200048 <load_tss>
  20001f:	e8 18 10 00 00       	call   20103c <get_memory_info>
  200024:	e8 85 13 00 00       	call   2013ae <set_page>
  200029:	e8 b6 03 00 00       	call   2003e4 <disable_irqs>
  20002e:	e8 95 07 00 00       	call   2007c8 <load_idt>
  200033:	e8 b7 08 00 00       	call   2008ef <init_timer>
  200038:	e8 d6 0d 00 00       	call   200e13 <creat_init>
  20003d:	ea 00 00 00 00 80 00 	ljmp   $0x80,$0x0
  200044:	c9                   	leave  
  200045:	c3                   	ret    
  200046:	66 90                	xchg   %ax,%ax

00200048 <load_tss>:
  200048:	55                   	push   %ebp
  200049:	89 e5                	mov    %esp,%ebp
  20004b:	83 ec 10             	sub    $0x10,%esp
  20004e:	66 c7 45 fe 40 00    	movw   $0x40,-0x2(%ebp)
  200054:	c7 05 24 81 20 00 ff 	movl   $0x1fffff,0x208124
  20005b:	ff 1f 00 
  20005e:	66 c7 05 28 81 20 00 	movw   $0x28,0x208128
  200065:	28 00 
  200067:	66 c7 05 86 81 20 00 	movw   $0x6d,0x208186
  20006e:	6d 00 
  200070:	c6 05 88 81 20 00 ff 	movb   $0xff,0x208188
  200077:	c7 05 89 81 20 00 69 	movl   $0x69,0x208189
  20007e:	00 00 00 
  200081:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  200085:	0f 00 d8             	ltr    %ax
  200088:	c9                   	leave  
  200089:	c3                   	ret    

0020008a <set_tss_esp>:
  20008a:	55                   	push   %ebp
  20008b:	89 e5                	mov    %esp,%ebp
  20008d:	8b 45 08             	mov    0x8(%ebp),%eax
  200090:	a3 24 81 20 00       	mov    %eax,0x208124
  200095:	5d                   	pop    %ebp
  200096:	c3                   	ret    

00200097 <change_gdt>:
  200097:	55                   	push   %ebp
  200098:	89 e5                	mov    %esp,%ebp
  20009a:	53                   	push   %ebx
  20009b:	83 ec 10             	sub    $0x10,%esp
  20009e:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  2000a4:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  2000aa:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  2000b0:	c7 05 20 80 20 00 ff 	movl   $0xffff,0x208020
  2000b7:	ff 00 00 
  2000ba:	c7 05 24 80 20 00 00 	movl   $0xcf9b00,0x208024
  2000c1:	9b cf 00 
  2000c4:	c7 05 28 80 20 00 ff 	movl   $0xffff,0x208028
  2000cb:	ff 00 00 
  2000ce:	c7 05 2c 80 20 00 00 	movl   $0xcf9300,0x20802c
  2000d5:	93 cf 00 
  2000d8:	c7 05 30 80 20 00 ff 	movl   $0xffff,0x208030
  2000df:	ff 00 00 
  2000e2:	c7 05 34 80 20 00 00 	movl   $0xcffa00,0x208034
  2000e9:	fa cf 00 
  2000ec:	c7 05 38 80 20 00 ff 	movl   $0xffff,0x208038
  2000f3:	ff 00 00 
  2000f6:	c7 05 3c 80 20 00 00 	movl   $0xcff200,0x20803c
  2000fd:	f2 cf 00 
  200100:	a1 89 81 20 00       	mov    0x208189,%eax
  200105:	83 e8 01             	sub    $0x1,%eax
  200108:	0f b7 c0             	movzwl %ax,%eax
  20010b:	ba 20 81 20 00       	mov    $0x208120,%edx
  200110:	c1 e2 10             	shl    $0x10,%edx
  200113:	09 d0                	or     %edx,%eax
  200115:	a3 40 80 20 00       	mov    %eax,0x208040
  20011a:	a1 89 81 20 00       	mov    0x208189,%eax
  20011f:	83 e8 01             	sub    $0x1,%eax
  200122:	25 00 00 0f 00       	and    $0xf0000,%eax
  200127:	89 c2                	mov    %eax,%edx
  200129:	b8 20 81 20 00       	mov    $0x208120,%eax
  20012e:	25 00 00 ff 00       	and    $0xff0000,%eax
  200133:	c1 e8 10             	shr    $0x10,%eax
  200136:	80 cc 89             	or     $0x89,%ah
  200139:	89 c1                	mov    %eax,%ecx
  20013b:	b8 20 81 20 00       	mov    $0x208120,%eax
  200140:	25 00 00 00 ff       	and    $0xff000000,%eax
  200145:	09 c8                	or     %ecx,%eax
  200147:	09 d0                	or     %edx,%eax
  200149:	a3 44 80 20 00       	mov    %eax,0x208044
  20014e:	c7 05 48 80 20 00 ff 	movl   $0x8000ffff,0x208048
  200155:	ff 00 80 
  200158:	c7 05 4c 80 20 00 0b 	movl   $0xf30b,0x20804c
  20015f:	f3 00 00 
  200162:	66 c7 05 00 81 20 00 	movw   $0xff,0x208100
  200169:	ff 00 
  20016b:	b8 00 80 20 00       	mov    $0x208000,%eax
  200170:	a3 02 81 20 00       	mov    %eax,0x208102
  200175:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  200179:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  20017d:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  200181:	89 d3                	mov    %edx,%ebx
  200183:	0f 01 15 00 81 20 00 	lgdtl  0x208100
  20018a:	8e db                	mov    %ebx,%ds
  20018c:	8e c3                	mov    %ebx,%es
  20018e:	8e e3                	mov    %ebx,%fs
  200190:	8e d3                	mov    %ebx,%ss
  200192:	8e e9                	mov    %ecx,%gs
  200194:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  20019b:	90                   	nop
  20019c:	83 c4 10             	add    $0x10,%esp
  20019f:	5b                   	pop    %ebx
  2001a0:	5d                   	pop    %ebp
  2001a1:	c3                   	ret    
  2001a2:	66 90                	xchg   %ax,%ax

002001a4 <cli>:
  2001a4:	55                   	push   %ebp
  2001a5:	89 e5                	mov    %esp,%ebp
  2001a7:	fa                   	cli    
  2001a8:	5d                   	pop    %ebp
  2001a9:	c3                   	ret    

002001aa <sti>:
  2001aa:	55                   	push   %ebp
  2001ab:	89 e5                	mov    %esp,%ebp
  2001ad:	fb                   	sti    
  2001ae:	5d                   	pop    %ebp
  2001af:	c3                   	ret    

002001b0 <outb>:
  2001b0:	55                   	push   %ebp
  2001b1:	89 e5                	mov    %esp,%ebp
  2001b3:	83 ec 08             	sub    $0x8,%esp
  2001b6:	8b 55 08             	mov    0x8(%ebp),%edx
  2001b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001bc:	88 55 fc             	mov    %dl,-0x4(%ebp)
  2001bf:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  2001c3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2001c7:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2001cb:	ee                   	out    %al,(%dx)
  2001cc:	c9                   	leave  
  2001cd:	c3                   	ret    

002001ce <inb>:
  2001ce:	55                   	push   %ebp
  2001cf:	89 e5                	mov    %esp,%ebp
  2001d1:	83 ec 14             	sub    $0x14,%esp
  2001d4:	8b 45 08             	mov    0x8(%ebp),%eax
  2001d7:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  2001db:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  2001df:	89 c2                	mov    %eax,%edx
  2001e1:	ec                   	in     (%dx),%al
  2001e2:	88 45 ff             	mov    %al,-0x1(%ebp)
  2001e5:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2001e9:	c9                   	leave  
  2001ea:	c3                   	ret    

002001eb <io_delay>:
  2001eb:	55                   	push   %ebp
  2001ec:	89 e5                	mov    %esp,%ebp
  2001ee:	83 ec 10             	sub    $0x10,%esp
  2001f1:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  2001f7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  2001fb:	89 c2                	mov    %eax,%edx
  2001fd:	ee                   	out    %al,(%dx)
  2001fe:	c9                   	leave  
  2001ff:	c3                   	ret    

00200200 <outb_pic>:
  200200:	55                   	push   %ebp
  200201:	89 e5                	mov    %esp,%ebp
  200203:	83 ec 0c             	sub    $0xc,%esp
  200206:	8b 45 08             	mov    0x8(%ebp),%eax
  200209:	88 45 fc             	mov    %al,-0x4(%ebp)
  20020c:	8b 45 0c             	mov    0xc(%ebp),%eax
  20020f:	0f b7 d0             	movzwl %ax,%edx
  200212:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  200216:	89 54 24 04          	mov    %edx,0x4(%esp)
  20021a:	89 04 24             	mov    %eax,(%esp)
  20021d:	e8 8e ff ff ff       	call   2001b0 <outb>
  200222:	e8 c4 ff ff ff       	call   2001eb <io_delay>
  200227:	c9                   	leave  
  200228:	c3                   	ret    

00200229 <inb_pic>:
  200229:	55                   	push   %ebp
  20022a:	89 e5                	mov    %esp,%ebp
  20022c:	83 ec 14             	sub    $0x14,%esp
  20022f:	8b 45 08             	mov    0x8(%ebp),%eax
  200232:	0f b7 c0             	movzwl %ax,%eax
  200235:	89 04 24             	mov    %eax,(%esp)
  200238:	e8 91 ff ff ff       	call   2001ce <inb>
  20023d:	88 45 ff             	mov    %al,-0x1(%ebp)
  200240:	e8 a6 ff ff ff       	call   2001eb <io_delay>
  200245:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200249:	c9                   	leave  
  20024a:	c3                   	ret    

0020024b <Init_8259A>:
  20024b:	55                   	push   %ebp
  20024c:	89 e5                	mov    %esp,%ebp
  20024e:	83 ec 08             	sub    $0x8,%esp
  200251:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200258:	00 
  200259:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200260:	e8 9b ff ff ff       	call   200200 <outb_pic>
  200265:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  20026c:	00 
  20026d:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200274:	e8 87 ff ff ff       	call   200200 <outb_pic>
  200279:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200280:	00 
  200281:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  200288:	e8 73 ff ff ff       	call   200200 <outb_pic>
  20028d:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200294:	00 
  200295:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  20029c:	e8 5f ff ff ff       	call   200200 <outb_pic>
  2002a1:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002a8:	00 
  2002a9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2002b0:	e8 4b ff ff ff       	call   200200 <outb_pic>
  2002b5:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002bc:	00 
  2002bd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2002c4:	e8 37 ff ff ff       	call   200200 <outb_pic>
  2002c9:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002d0:	00 
  2002d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002d8:	e8 23 ff ff ff       	call   200200 <outb_pic>
  2002dd:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2002e4:	00 
  2002e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2002ec:	e8 0f ff ff ff       	call   200200 <outb_pic>
  2002f1:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002f8:	00 
  2002f9:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200300:	e8 fb fe ff ff       	call   200200 <outb_pic>
  200305:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  20030c:	00 
  20030d:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200314:	e8 e7 fe ff ff       	call   200200 <outb_pic>
  200319:	90                   	nop
  20031a:	c9                   	leave  
  20031b:	c3                   	ret    

0020031c <enable_irq>:
  20031c:	55                   	push   %ebp
  20031d:	89 e5                	mov    %esp,%ebp
  20031f:	83 ec 18             	sub    $0x18,%esp
  200322:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  200326:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  20032a:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  200331:	e8 f3 fe ff ff       	call   200229 <inb_pic>
  200336:	88 45 fd             	mov    %al,-0x3(%ebp)
  200339:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  200340:	e8 e4 fe ff ff       	call   200229 <inb_pic>
  200345:	88 45 fc             	mov    %al,-0x4(%ebp)
  200348:	fa                   	cli    
  200349:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  20034d:	7f 35                	jg     200384 <enable_irq+0x68>
  20034f:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  200353:	74 2f                	je     200384 <enable_irq+0x68>
  200355:	8b 45 08             	mov    0x8(%ebp),%eax
  200358:	ba 01 00 00 00       	mov    $0x1,%edx
  20035d:	89 c1                	mov    %eax,%ecx
  20035f:	d3 e2                	shl    %cl,%edx
  200361:	89 d0                	mov    %edx,%eax
  200363:	f7 d0                	not    %eax
  200365:	89 c2                	mov    %eax,%edx
  200367:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  20036b:	21 d0                	and    %edx,%eax
  20036d:	88 45 ff             	mov    %al,-0x1(%ebp)
  200370:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200374:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20037b:	00 
  20037c:	89 04 24             	mov    %eax,(%esp)
  20037f:	e8 7c fe ff ff       	call   200200 <outb_pic>
  200384:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  200388:	7e 56                	jle    2003e0 <enable_irq+0xc4>
  20038a:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  20038e:	7f 50                	jg     2003e0 <enable_irq+0xc4>
  200390:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  200394:	83 e0 fb             	and    $0xfffffffb,%eax
  200397:	88 45 ff             	mov    %al,-0x1(%ebp)
  20039a:	8b 45 08             	mov    0x8(%ebp),%eax
  20039d:	83 e8 08             	sub    $0x8,%eax
  2003a0:	ba 01 00 00 00       	mov    $0x1,%edx
  2003a5:	89 c1                	mov    %eax,%ecx
  2003a7:	d3 e2                	shl    %cl,%edx
  2003a9:	89 d0                	mov    %edx,%eax
  2003ab:	f7 d0                	not    %eax
  2003ad:	89 c2                	mov    %eax,%edx
  2003af:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  2003b3:	21 d0                	and    %edx,%eax
  2003b5:	88 45 fe             	mov    %al,-0x2(%ebp)
  2003b8:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2003bc:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2003c3:	00 
  2003c4:	89 04 24             	mov    %eax,(%esp)
  2003c7:	e8 34 fe ff ff       	call   200200 <outb_pic>
  2003cc:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  2003d0:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2003d7:	00 
  2003d8:	89 04 24             	mov    %eax,(%esp)
  2003db:	e8 20 fe ff ff       	call   200200 <outb_pic>
  2003e0:	fb                   	sti    
  2003e1:	90                   	nop
  2003e2:	c9                   	leave  
  2003e3:	c3                   	ret    

002003e4 <disable_irqs>:
  2003e4:	55                   	push   %ebp
  2003e5:	89 e5                	mov    %esp,%ebp
  2003e7:	b0 ff                	mov    $0xff,%al
  2003e9:	e6 21                	out    %al,$0x21
  2003eb:	e6 a1                	out    %al,$0xa1
  2003ed:	5d                   	pop    %ebp
  2003ee:	c3                   	ret    

002003ef <EOI_master>:
  2003ef:	55                   	push   %ebp
  2003f0:	89 e5                	mov    %esp,%ebp
  2003f2:	83 ec 08             	sub    $0x8,%esp
  2003f5:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  2003fc:	00 
  2003fd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200404:	e8 f7 fd ff ff       	call   200200 <outb_pic>
  200409:	fb                   	sti    
  20040a:	c9                   	leave  
  20040b:	c3                   	ret    

0020040c <EOI_slave>:
  20040c:	55                   	push   %ebp
  20040d:	89 e5                	mov    %esp,%ebp
  20040f:	83 ec 08             	sub    $0x8,%esp
  200412:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200419:	00 
  20041a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200421:	e8 da fd ff ff       	call   200200 <outb_pic>
  200426:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  20042d:	00 
  20042e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200435:	e8 c6 fd ff ff       	call   200200 <outb_pic>
  20043a:	fb                   	sti    
  20043b:	c9                   	leave  
  20043c:	c3                   	ret    
  20043d:	66 90                	xchg   %ax,%ax
  20043f:	90                   	nop

00200440 <set_gate>:
  200440:	55                   	push   %ebp
  200441:	89 e5                	mov    %esp,%ebp
  200443:	8b 45 18             	mov    0x18(%ebp),%eax
  200446:	c1 e0 10             	shl    $0x10,%eax
  200449:	89 c2                	mov    %eax,%edx
  20044b:	8b 45 10             	mov    0x10(%ebp),%eax
  20044e:	0f b7 c0             	movzwl %ax,%eax
  200451:	09 c2                	or     %eax,%edx
  200453:	8b 45 08             	mov    0x8(%ebp),%eax
  200456:	89 10                	mov    %edx,(%eax)
  200458:	8b 45 10             	mov    0x10(%ebp),%eax
  20045b:	66 b8 00 00          	mov    $0x0,%ax
  20045f:	89 c2                	mov    %eax,%edx
  200461:	8b 45 14             	mov    0x14(%ebp),%eax
  200464:	c1 e0 05             	shl    $0x5,%eax
  200467:	0b 45 0c             	or     0xc(%ebp),%eax
  20046a:	0f b6 c0             	movzbl %al,%eax
  20046d:	0c 80                	or     $0x80,%al
  20046f:	c1 e0 08             	shl    $0x8,%eax
  200472:	09 c2                	or     %eax,%edx
  200474:	8b 45 08             	mov    0x8(%ebp),%eax
  200477:	89 50 04             	mov    %edx,0x4(%eax)
  20047a:	5d                   	pop    %ebp
  20047b:	c3                   	ret    

0020047c <set_exception_gate>:
  20047c:	55                   	push   %ebp
  20047d:	89 e5                	mov    %esp,%ebp
  20047f:	83 ec 14             	sub    $0x14,%esp
  200482:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200489:	00 
  20048a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200491:	00 
  200492:	c7 44 24 08 73 09 20 	movl   $0x200973,0x8(%esp)
  200499:	00 
  20049a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004a1:	00 
  2004a2:	c7 04 24 a0 81 20 00 	movl   $0x2081a0,(%esp)
  2004a9:	e8 92 ff ff ff       	call   200440 <set_gate>
  2004ae:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004b5:	00 
  2004b6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004bd:	00 
  2004be:	c7 44 24 08 8f 09 20 	movl   $0x20098f,0x8(%esp)
  2004c5:	00 
  2004c6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004cd:	00 
  2004ce:	c7 04 24 a8 81 20 00 	movl   $0x2081a8,(%esp)
  2004d5:	e8 66 ff ff ff       	call   200440 <set_gate>
  2004da:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2004e1:	00 
  2004e2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2004e9:	00 
  2004ea:	c7 44 24 08 ab 09 20 	movl   $0x2009ab,0x8(%esp)
  2004f1:	00 
  2004f2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2004f9:	00 
  2004fa:	c7 04 24 b0 81 20 00 	movl   $0x2081b0,(%esp)
  200501:	e8 3a ff ff ff       	call   200440 <set_gate>
  200506:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20050d:	00 
  20050e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200515:	00 
  200516:	c7 44 24 08 c7 09 20 	movl   $0x2009c7,0x8(%esp)
  20051d:	00 
  20051e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200525:	00 
  200526:	c7 04 24 b8 81 20 00 	movl   $0x2081b8,(%esp)
  20052d:	e8 0e ff ff ff       	call   200440 <set_gate>
  200532:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200539:	00 
  20053a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200541:	00 
  200542:	c7 44 24 08 e3 09 20 	movl   $0x2009e3,0x8(%esp)
  200549:	00 
  20054a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200551:	00 
  200552:	c7 04 24 c0 81 20 00 	movl   $0x2081c0,(%esp)
  200559:	e8 e2 fe ff ff       	call   200440 <set_gate>
  20055e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200565:	00 
  200566:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20056d:	00 
  20056e:	c7 44 24 08 ff 09 20 	movl   $0x2009ff,0x8(%esp)
  200575:	00 
  200576:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20057d:	00 
  20057e:	c7 04 24 c8 81 20 00 	movl   $0x2081c8,(%esp)
  200585:	e8 b6 fe ff ff       	call   200440 <set_gate>
  20058a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200591:	00 
  200592:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200599:	00 
  20059a:	c7 44 24 08 1b 0a 20 	movl   $0x200a1b,0x8(%esp)
  2005a1:	00 
  2005a2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005a9:	00 
  2005aa:	c7 04 24 d0 81 20 00 	movl   $0x2081d0,(%esp)
  2005b1:	e8 8a fe ff ff       	call   200440 <set_gate>
  2005b6:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005bd:	00 
  2005be:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005c5:	00 
  2005c6:	c7 44 24 08 37 0a 20 	movl   $0x200a37,0x8(%esp)
  2005cd:	00 
  2005ce:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2005d5:	00 
  2005d6:	c7 04 24 d8 81 20 00 	movl   $0x2081d8,(%esp)
  2005dd:	e8 5e fe ff ff       	call   200440 <set_gate>
  2005e2:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2005e9:	00 
  2005ea:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2005f1:	00 
  2005f2:	c7 44 24 08 53 0a 20 	movl   $0x200a53,0x8(%esp)
  2005f9:	00 
  2005fa:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200601:	00 
  200602:	c7 04 24 e0 81 20 00 	movl   $0x2081e0,(%esp)
  200609:	e8 32 fe ff ff       	call   200440 <set_gate>
  20060e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200615:	00 
  200616:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20061d:	00 
  20061e:	c7 44 24 08 6f 0a 20 	movl   $0x200a6f,0x8(%esp)
  200625:	00 
  200626:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20062d:	00 
  20062e:	c7 04 24 e8 81 20 00 	movl   $0x2081e8,(%esp)
  200635:	e8 06 fe ff ff       	call   200440 <set_gate>
  20063a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200641:	00 
  200642:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200649:	00 
  20064a:	c7 44 24 08 8b 0a 20 	movl   $0x200a8b,0x8(%esp)
  200651:	00 
  200652:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200659:	00 
  20065a:	c7 04 24 f0 81 20 00 	movl   $0x2081f0,(%esp)
  200661:	e8 da fd ff ff       	call   200440 <set_gate>
  200666:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20066d:	00 
  20066e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200675:	00 
  200676:	c7 44 24 08 a7 0a 20 	movl   $0x200aa7,0x8(%esp)
  20067d:	00 
  20067e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200685:	00 
  200686:	c7 04 24 f8 81 20 00 	movl   $0x2081f8,(%esp)
  20068d:	e8 ae fd ff ff       	call   200440 <set_gate>
  200692:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200699:	00 
  20069a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006a1:	00 
  2006a2:	c7 44 24 08 c3 0a 20 	movl   $0x200ac3,0x8(%esp)
  2006a9:	00 
  2006aa:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006b1:	00 
  2006b2:	c7 04 24 00 82 20 00 	movl   $0x208200,(%esp)
  2006b9:	e8 82 fd ff ff       	call   200440 <set_gate>
  2006be:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006c5:	00 
  2006c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006cd:	00 
  2006ce:	c7 44 24 08 df 0a 20 	movl   $0x200adf,0x8(%esp)
  2006d5:	00 
  2006d6:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  2006dd:	00 
  2006de:	c7 04 24 08 82 20 00 	movl   $0x208208,(%esp)
  2006e5:	e8 56 fd ff ff       	call   200440 <set_gate>
  2006ea:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2006f1:	00 
  2006f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2006f9:	00 
  2006fa:	c7 44 24 08 fb 0a 20 	movl   $0x200afb,0x8(%esp)
  200701:	00 
  200702:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200709:	00 
  20070a:	c7 04 24 10 82 20 00 	movl   $0x208210,(%esp)
  200711:	e8 2a fd ff ff       	call   200440 <set_gate>
  200716:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  20071d:	00 
  20071e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200725:	00 
  200726:	c7 44 24 08 17 0b 20 	movl   $0x200b17,0x8(%esp)
  20072d:	00 
  20072e:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200735:	00 
  200736:	c7 04 24 18 82 20 00 	movl   $0x208218,(%esp)
  20073d:	e8 fe fc ff ff       	call   200440 <set_gate>
  200742:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200749:	00 
  20074a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200751:	00 
  200752:	c7 44 24 08 33 0b 20 	movl   $0x200b33,0x8(%esp)
  200759:	00 
  20075a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  200761:	00 
  200762:	c7 04 24 20 82 20 00 	movl   $0x208220,(%esp)
  200769:	e8 d2 fc ff ff       	call   200440 <set_gate>
  20076e:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  200775:	00 
  200776:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20077d:	00 
  20077e:	c7 44 24 08 4f 0b 20 	movl   $0x200b4f,0x8(%esp)
  200785:	00 
  200786:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
  20078d:	00 
  20078e:	c7 04 24 28 82 20 00 	movl   $0x208228,(%esp)
  200795:	e8 a6 fc ff ff       	call   200440 <set_gate>
  20079a:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007a1:	00 
  2007a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2007a9:	00 
  2007aa:	c7 44 24 08 b4 14 20 	movl   $0x2014b4,0x8(%esp)
  2007b1:	00 
  2007b2:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  2007b9:	00 
  2007ba:	c7 04 24 a0 85 20 00 	movl   $0x2085a0,(%esp)
  2007c1:	e8 7a fc ff ff       	call   200440 <set_gate>
  2007c6:	c9                   	leave  
  2007c7:	c3                   	ret    

002007c8 <load_idt>:
  2007c8:	55                   	push   %ebp
  2007c9:	89 e5                	mov    %esp,%ebp
  2007cb:	fa                   	cli    
  2007cc:	0f 01 1d 00 40 20 00 	lidtl  0x204000
  2007d3:	90                   	nop
  2007d4:	fb                   	sti    
  2007d5:	e8 a2 fc ff ff       	call   20047c <set_exception_gate>
  2007da:	90                   	nop
  2007db:	5d                   	pop    %ebp
  2007dc:	c3                   	ret    

002007dd <set_intr_gate>:
  2007dd:	55                   	push   %ebp
  2007de:	89 e5                	mov    %esp,%ebp
  2007e0:	83 ec 38             	sub    $0x38,%esp
  2007e3:	8b 45 08             	mov    0x8(%ebp),%eax
  2007e6:	83 c0 30             	add    $0x30,%eax
  2007e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2007ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007ef:	c1 e0 03             	shl    $0x3,%eax
  2007f2:	8d 90 a0 81 20 00    	lea    0x2081a0(%eax),%edx
  2007f8:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
  2007ff:	00 
  200800:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200807:	00 
  200808:	8b 45 0c             	mov    0xc(%ebp),%eax
  20080b:	89 44 24 08          	mov    %eax,0x8(%esp)
  20080f:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
  200816:	00 
  200817:	89 14 24             	mov    %edx,(%esp)
  20081a:	e8 21 fc ff ff       	call   200440 <set_gate>
  20081f:	8b 45 08             	mov    0x8(%ebp),%eax
  200822:	89 04 24             	mov    %eax,(%esp)
  200825:	e8 f2 fa ff ff       	call   20031c <enable_irq>
  20082a:	c9                   	leave  
  20082b:	c3                   	ret    

0020082c <irq00_handler>:
  20082c:	60                   	pusha  
  20082d:	1e                   	push   %ds
  20082e:	06                   	push   %es
  20082f:	0f a0                	push   %fs
  200831:	0f a8                	push   %gs
  200833:	a1 04 80 22 00       	mov    0x228004,%eax
  200838:	89 20                	mov    %esp,(%eax)
  20083a:	65 fe 05 00 0f 00 00 	incb   %gs:0xf00
  200841:	e8 a9 fb ff ff       	call   2003ef <EOI_master>
  200846:	e8 11 00 00 00       	call   20085c <timer_handler>
  20084b:	a1 04 80 22 00       	mov    0x228004,%eax
  200850:	8b 20                	mov    (%eax),%esp
  200852:	0f a9                	pop    %gs
  200854:	0f a1                	pop    %fs
  200856:	07                   	pop    %es
  200857:	1f                   	pop    %ds
  200858:	61                   	popa   
  200859:	cb                   	lret   
  20085a:	66 90                	xchg   %ax,%ax

0020085c <timer_handler>:
  20085c:	55                   	push   %ebp
  20085d:	89 e5                	mov    %esp,%ebp
  20085f:	83 ec 18             	sub    $0x18,%esp
  200862:	a1 08 40 20 00       	mov    0x204008,%eax
  200867:	83 c0 01             	add    $0x1,%eax
  20086a:	a3 08 40 20 00       	mov    %eax,0x204008
  20086f:	8b 0d 08 40 20 00    	mov    0x204008,%ecx
  200875:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  20087a:	89 c8                	mov    %ecx,%eax
  20087c:	f7 e2                	mul    %edx
  20087e:	c1 ea 04             	shr    $0x4,%edx
  200881:	89 d0                	mov    %edx,%eax
  200883:	c1 e0 02             	shl    $0x2,%eax
  200886:	01 d0                	add    %edx,%eax
  200888:	c1 e0 02             	shl    $0x2,%eax
  20088b:	29 c1                	sub    %eax,%ecx
  20088d:	89 ca                	mov    %ecx,%edx
  20088f:	85 d2                	test   %edx,%edx
  200891:	75 59                	jne    2008ec <timer_handler+0x90>
  200893:	a1 00 80 22 00       	mov    0x228000,%eax
  200898:	85 c0                	test   %eax,%eax
  20089a:	74 50                	je     2008ec <timer_handler+0x90>
  20089c:	a1 00 80 22 00       	mov    0x228000,%eax
  2008a1:	8b 40 04             	mov    0x4(%eax),%eax
  2008a4:	8b 15 04 80 22 00    	mov    0x228004,%edx
  2008aa:	83 c2 20             	add    $0x20,%edx
  2008ad:	89 44 24 04          	mov    %eax,0x4(%esp)
  2008b1:	89 14 24             	mov    %edx,(%esp)
  2008b4:	e8 bf 0c 00 00       	call   201578 <list_add_tail>
  2008b9:	a1 00 80 22 00       	mov    0x228000,%eax
  2008be:	83 e8 20             	sub    $0x20,%eax
  2008c1:	a3 08 80 22 00       	mov    %eax,0x228008
  2008c6:	a1 00 80 22 00       	mov    0x228000,%eax
  2008cb:	8b 00                	mov    (%eax),%eax
  2008cd:	a3 00 80 22 00       	mov    %eax,0x228000
  2008d2:	a1 08 80 22 00       	mov    0x228008,%eax
  2008d7:	83 c0 20             	add    $0x20,%eax
  2008da:	89 04 24             	mov    %eax,(%esp)
  2008dd:	e8 d0 0c 00 00       	call   2015b2 <list_del>
  2008e2:	a1 08 80 22 00       	mov    0x228008,%eax
  2008e7:	a3 04 80 22 00       	mov    %eax,0x228004
  2008ec:	90                   	nop
  2008ed:	c9                   	leave  
  2008ee:	c3                   	ret    

002008ef <init_timer>:
  2008ef:	55                   	push   %ebp
  2008f0:	89 e5                	mov    %esp,%ebp
  2008f2:	83 ec 18             	sub    $0x18,%esp
  2008f5:	c7 05 c0 89 20 00 5c 	movl   $0x20085c,0x2089c0
  2008fc:	08 20 00 
  2008ff:	c7 44 24 04 2c 08 20 	movl   $0x20082c,0x4(%esp)
  200906:	00 
  200907:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  20090e:	e8 ca fe ff ff       	call   2007dd <set_intr_gate>
  200913:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  20091a:	e8 fd f9 ff ff       	call   20031c <enable_irq>
  20091f:	c9                   	leave  
  200920:	c3                   	ret    
  200921:	66 90                	xchg   %ax,%ax
  200923:	90                   	nop

00200924 <exception_handler>:
  200924:	55                   	push   %ebp
  200925:	89 e5                	mov    %esp,%ebp
  200927:	83 ec 18             	sub    $0x18,%esp
  20092a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200931:	00 
  200932:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200939:	00 
  20093a:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200941:	00 
  200942:	c7 04 24 1c 16 20 00 	movl   $0x20161c,(%esp)
  200949:	e8 1e 02 00 00       	call   200b6c <dis_str>
  20094e:	c7 44 24 0c 0a 00 00 	movl   $0xa,0xc(%esp)
  200955:	00 
  200956:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  20095d:	00 
  20095e:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  200965:	00 
  200966:	8b 45 0c             	mov    0xc(%ebp),%eax
  200969:	89 04 24             	mov    %eax,(%esp)
  20096c:	e8 fb 01 00 00       	call   200b6c <dis_str>
  200971:	eb fe                	jmp    200971 <exception_handler+0x4d>

00200973 <divide_error>:
  200973:	55                   	push   %ebp
  200974:	89 e5                	mov    %esp,%ebp
  200976:	83 ec 18             	sub    $0x18,%esp
  200979:	c7 44 24 04 27 16 20 	movl   $0x201627,0x4(%esp)
  200980:	00 
  200981:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200988:	e8 97 ff ff ff       	call   200924 <exception_handler>
  20098d:	c9                   	leave  
  20098e:	c3                   	ret    

0020098f <single_step_exception>:
  20098f:	55                   	push   %ebp
  200990:	89 e5                	mov    %esp,%ebp
  200992:	83 ec 18             	sub    $0x18,%esp
  200995:	c7 44 24 04 34 16 20 	movl   $0x201634,0x4(%esp)
  20099c:	00 
  20099d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2009a4:	e8 7b ff ff ff       	call   200924 <exception_handler>
  2009a9:	c9                   	leave  
  2009aa:	c3                   	ret    

002009ab <nmi>:
  2009ab:	55                   	push   %ebp
  2009ac:	89 e5                	mov    %esp,%ebp
  2009ae:	83 ec 18             	sub    $0x18,%esp
  2009b1:	c7 44 24 04 4a 16 20 	movl   $0x20164a,0x4(%esp)
  2009b8:	00 
  2009b9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2009c0:	e8 5f ff ff ff       	call   200924 <exception_handler>
  2009c5:	c9                   	leave  
  2009c6:	c3                   	ret    

002009c7 <breakpoint_exception>:
  2009c7:	55                   	push   %ebp
  2009c8:	89 e5                	mov    %esp,%ebp
  2009ca:	83 ec 18             	sub    $0x18,%esp
  2009cd:	c7 44 24 04 4e 16 20 	movl   $0x20164e,0x4(%esp)
  2009d4:	00 
  2009d5:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  2009dc:	e8 43 ff ff ff       	call   200924 <exception_handler>
  2009e1:	c9                   	leave  
  2009e2:	c3                   	ret    

002009e3 <overflow>:
  2009e3:	55                   	push   %ebp
  2009e4:	89 e5                	mov    %esp,%ebp
  2009e6:	83 ec 18             	sub    $0x18,%esp
  2009e9:	c7 44 24 04 63 16 20 	movl   $0x201663,0x4(%esp)
  2009f0:	00 
  2009f1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2009f8:	e8 27 ff ff ff       	call   200924 <exception_handler>
  2009fd:	c9                   	leave  
  2009fe:	c3                   	ret    

002009ff <bounds_check>:
  2009ff:	55                   	push   %ebp
  200a00:	89 e5                	mov    %esp,%ebp
  200a02:	83 ec 18             	sub    $0x18,%esp
  200a05:	c7 44 24 04 6c 16 20 	movl   $0x20166c,0x4(%esp)
  200a0c:	00 
  200a0d:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  200a14:	e8 0b ff ff ff       	call   200924 <exception_handler>
  200a19:	c9                   	leave  
  200a1a:	c3                   	ret    

00200a1b <inval_opcode>:
  200a1b:	55                   	push   %ebp
  200a1c:	89 e5                	mov    %esp,%ebp
  200a1e:	83 ec 18             	sub    $0x18,%esp
  200a21:	c7 44 24 04 79 16 20 	movl   $0x201679,0x4(%esp)
  200a28:	00 
  200a29:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  200a30:	e8 ef fe ff ff       	call   200924 <exception_handler>
  200a35:	c9                   	leave  
  200a36:	c3                   	ret    

00200a37 <copr_not_available>:
  200a37:	55                   	push   %ebp
  200a38:	89 e5                	mov    %esp,%ebp
  200a3a:	83 ec 18             	sub    $0x18,%esp
  200a3d:	c7 44 24 04 86 16 20 	movl   $0x201686,0x4(%esp)
  200a44:	00 
  200a45:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  200a4c:	e8 d3 fe ff ff       	call   200924 <exception_handler>
  200a51:	c9                   	leave  
  200a52:	c3                   	ret    

00200a53 <double_fault>:
  200a53:	55                   	push   %ebp
  200a54:	89 e5                	mov    %esp,%ebp
  200a56:	83 ec 18             	sub    $0x18,%esp
  200a59:	c7 44 24 04 99 16 20 	movl   $0x201699,0x4(%esp)
  200a60:	00 
  200a61:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  200a68:	e8 b7 fe ff ff       	call   200924 <exception_handler>
  200a6d:	c9                   	leave  
  200a6e:	c3                   	ret    

00200a6f <copr_seg_overrun>:
  200a6f:	55                   	push   %ebp
  200a70:	89 e5                	mov    %esp,%ebp
  200a72:	83 ec 18             	sub    $0x18,%esp
  200a75:	c7 44 24 04 a6 16 20 	movl   $0x2016a6,0x4(%esp)
  200a7c:	00 
  200a7d:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200a84:	e8 9b fe ff ff       	call   200924 <exception_handler>
  200a89:	c9                   	leave  
  200a8a:	c3                   	ret    

00200a8b <inval_tss>:
  200a8b:	55                   	push   %ebp
  200a8c:	89 e5                	mov    %esp,%ebp
  200a8e:	83 ec 18             	sub    $0x18,%esp
  200a91:	c7 44 24 04 b7 16 20 	movl   $0x2016b7,0x4(%esp)
  200a98:	00 
  200a99:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200aa0:	e8 7f fe ff ff       	call   200924 <exception_handler>
  200aa5:	c9                   	leave  
  200aa6:	c3                   	ret    

00200aa7 <segment_not_present>:
  200aa7:	55                   	push   %ebp
  200aa8:	89 e5                	mov    %esp,%ebp
  200aaa:	83 ec 18             	sub    $0x18,%esp
  200aad:	c7 44 24 04 c1 16 20 	movl   $0x2016c1,0x4(%esp)
  200ab4:	00 
  200ab5:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200abc:	e8 63 fe ff ff       	call   200924 <exception_handler>
  200ac1:	c9                   	leave  
  200ac2:	c3                   	ret    

00200ac3 <stack_exception>:
  200ac3:	55                   	push   %ebp
  200ac4:	89 e5                	mov    %esp,%ebp
  200ac6:	83 ec 18             	sub    $0x18,%esp
  200ac9:	c7 44 24 04 d5 16 20 	movl   $0x2016d5,0x4(%esp)
  200ad0:	00 
  200ad1:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200ad8:	e8 47 fe ff ff       	call   200924 <exception_handler>
  200add:	c9                   	leave  
  200ade:	c3                   	ret    

00200adf <general_protection>:
  200adf:	55                   	push   %ebp
  200ae0:	89 e5                	mov    %esp,%ebp
  200ae2:	83 ec 18             	sub    $0x18,%esp
  200ae5:	c7 44 24 04 e5 16 20 	movl   $0x2016e5,0x4(%esp)
  200aec:	00 
  200aed:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200af4:	e8 2b fe ff ff       	call   200924 <exception_handler>
  200af9:	c9                   	leave  
  200afa:	c3                   	ret    

00200afb <page_fault>:
  200afb:	55                   	push   %ebp
  200afc:	89 e5                	mov    %esp,%ebp
  200afe:	83 ec 18             	sub    $0x18,%esp
  200b01:	c7 44 24 04 f8 16 20 	movl   $0x2016f8,0x4(%esp)
  200b08:	00 
  200b09:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200b10:	e8 0f fe ff ff       	call   200924 <exception_handler>
  200b15:	c9                   	leave  
  200b16:	c3                   	ret    

00200b17 <copr_error>:
  200b17:	55                   	push   %ebp
  200b18:	89 e5                	mov    %esp,%ebp
  200b1a:	83 ec 18             	sub    $0x18,%esp
  200b1d:	c7 44 24 04 03 17 20 	movl   $0x201703,0x4(%esp)
  200b24:	00 
  200b25:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200b2c:	e8 f3 fd ff ff       	call   200924 <exception_handler>
  200b31:	c9                   	leave  
  200b32:	c3                   	ret    

00200b33 <float_error>:
  200b33:	55                   	push   %ebp
  200b34:	89 e5                	mov    %esp,%ebp
  200b36:	83 ec 18             	sub    $0x18,%esp
  200b39:	c7 44 24 04 0e 17 20 	movl   $0x20170e,0x4(%esp)
  200b40:	00 
  200b41:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200b48:	e8 d7 fd ff ff       	call   200924 <exception_handler>
  200b4d:	c9                   	leave  
  200b4e:	c3                   	ret    

00200b4f <alignment_check>:
  200b4f:	55                   	push   %ebp
  200b50:	89 e5                	mov    %esp,%ebp
  200b52:	83 ec 18             	sub    $0x18,%esp
  200b55:	c7 44 24 04 1a 17 20 	movl   $0x20171a,0x4(%esp)
  200b5c:	00 
  200b5d:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  200b64:	e8 bb fd ff ff       	call   200924 <exception_handler>
  200b69:	c9                   	leave  
  200b6a:	c3                   	ret    
  200b6b:	90                   	nop

00200b6c <dis_str>:
  200b6c:	55                   	push   %ebp
  200b6d:	89 e5                	mov    %esp,%ebp
  200b6f:	57                   	push   %edi
  200b70:	53                   	push   %ebx
  200b71:	83 ec 30             	sub    $0x30,%esp
  200b74:	8b 45 0c             	mov    0xc(%ebp),%eax
  200b77:	88 45 d4             	mov    %al,-0x2c(%ebp)
  200b7a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200b81:	8b 55 10             	mov    0x10(%ebp),%edx
  200b84:	89 d0                	mov    %edx,%eax
  200b86:	c1 e0 02             	shl    $0x2,%eax
  200b89:	01 d0                	add    %edx,%eax
  200b8b:	c1 e0 04             	shl    $0x4,%eax
  200b8e:	89 c2                	mov    %eax,%edx
  200b90:	8b 45 14             	mov    0x14(%ebp),%eax
  200b93:	01 d0                	add    %edx,%eax
  200b95:	01 c0                	add    %eax,%eax
  200b97:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  200b9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200ba0:	8b 45 08             	mov    0x8(%ebp),%eax
  200ba3:	89 04 24             	mov    %eax,(%esp)
  200ba6:	e8 02 01 00 00       	call   200cad <strlen>
  200bab:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200bae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200bb5:	eb 2e                	jmp    200be5 <dis_str+0x79>
  200bb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200bba:	8d 50 01             	lea    0x1(%eax),%edx
  200bbd:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200bc0:	0f b6 00             	movzbl (%eax),%eax
  200bc3:	88 45 e7             	mov    %al,-0x19(%ebp)
  200bc6:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  200bca:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
  200bce:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200bd1:	89 d3                	mov    %edx,%ebx
  200bd3:	89 cf                	mov    %ecx,%edi
  200bd5:	88 c4                	mov    %al,%ah
  200bd7:	88 d8                	mov    %bl,%al
  200bd9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200bdd:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200be1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200be8:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  200beb:	7c ca                	jl     200bb7 <dis_str+0x4b>
  200bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200bf0:	83 c4 30             	add    $0x30,%esp
  200bf3:	5b                   	pop    %ebx
  200bf4:	5f                   	pop    %edi
  200bf5:	5d                   	pop    %ebp
  200bf6:	c3                   	ret    

00200bf7 <dis_nchar>:
  200bf7:	55                   	push   %ebp
  200bf8:	89 e5                	mov    %esp,%ebp
  200bfa:	57                   	push   %edi
  200bfb:	53                   	push   %ebx
  200bfc:	83 ec 14             	sub    $0x14,%esp
  200bff:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c02:	88 45 e4             	mov    %al,-0x1c(%ebp)
  200c05:	8b 55 14             	mov    0x14(%ebp),%edx
  200c08:	89 d0                	mov    %edx,%eax
  200c0a:	c1 e0 02             	shl    $0x2,%eax
  200c0d:	01 d0                	add    %edx,%eax
  200c0f:	c1 e0 04             	shl    $0x4,%eax
  200c12:	89 c2                	mov    %eax,%edx
  200c14:	8b 45 18             	mov    0x18(%ebp),%eax
  200c17:	01 d0                	add    %edx,%eax
  200c19:	01 c0                	add    %eax,%eax
  200c1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200c1e:	8b 45 08             	mov    0x8(%ebp),%eax
  200c21:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200c24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200c2b:	eb 2e                	jmp    200c5b <dis_nchar+0x64>
  200c2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200c30:	8d 50 01             	lea    0x1(%eax),%edx
  200c33:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200c36:	0f b6 00             	movzbl (%eax),%eax
  200c39:	88 45 eb             	mov    %al,-0x15(%ebp)
  200c3c:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  200c40:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
  200c44:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200c47:	89 d3                	mov    %edx,%ebx
  200c49:	89 cf                	mov    %ecx,%edi
  200c4b:	88 c4                	mov    %al,%ah
  200c4d:	88 d8                	mov    %bl,%al
  200c4f:	65 66 89 07          	mov    %ax,%gs:(%edi)
  200c53:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  200c57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200c5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c5e:	3b 45 10             	cmp    0x10(%ebp),%eax
  200c61:	7c ca                	jl     200c2d <dis_nchar+0x36>
  200c63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200c66:	83 c4 14             	add    $0x14,%esp
  200c69:	5b                   	pop    %ebx
  200c6a:	5f                   	pop    %edi
  200c6b:	5d                   	pop    %ebp
  200c6c:	c3                   	ret    
  200c6d:	66 90                	xchg   %ax,%ax
  200c6f:	90                   	nop

00200c70 <memcpy>:
  200c70:	55                   	push   %ebp
  200c71:	89 e5                	mov    %esp,%ebp
  200c73:	83 ec 10             	sub    $0x10,%esp
  200c76:	8b 45 08             	mov    0x8(%ebp),%eax
  200c79:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200c7c:	8b 45 0c             	mov    0xc(%ebp),%eax
  200c7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200c82:	eb 17                	jmp    200c9b <memcpy+0x2b>
  200c84:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200c87:	8d 50 01             	lea    0x1(%eax),%edx
  200c8a:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200c8d:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200c90:	8d 4a 01             	lea    0x1(%edx),%ecx
  200c93:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  200c96:	0f b6 12             	movzbl (%edx),%edx
  200c99:	88 10                	mov    %dl,(%eax)
  200c9b:	8b 45 10             	mov    0x10(%ebp),%eax
  200c9e:	8d 50 ff             	lea    -0x1(%eax),%edx
  200ca1:	89 55 10             	mov    %edx,0x10(%ebp)
  200ca4:	85 c0                	test   %eax,%eax
  200ca6:	75 dc                	jne    200c84 <memcpy+0x14>
  200ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  200cab:	c9                   	leave  
  200cac:	c3                   	ret    

00200cad <strlen>:
  200cad:	55                   	push   %ebp
  200cae:	89 e5                	mov    %esp,%ebp
  200cb0:	83 ec 10             	sub    $0x10,%esp
  200cb3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200cba:	8b 45 08             	mov    0x8(%ebp),%eax
  200cbd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200cc0:	eb 08                	jmp    200cca <strlen+0x1d>
  200cc2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  200cc6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200cca:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200ccd:	0f b6 00             	movzbl (%eax),%eax
  200cd0:	84 c0                	test   %al,%al
  200cd2:	75 ee                	jne    200cc2 <strlen+0x15>
  200cd4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200cd7:	c9                   	leave  
  200cd8:	c3                   	ret    

00200cd9 <strcmp>:
  200cd9:	55                   	push   %ebp
  200cda:	89 e5                	mov    %esp,%ebp
  200cdc:	eb 0c                	jmp    200cea <strcmp+0x11>
  200cde:	8b 45 08             	mov    0x8(%ebp),%eax
  200ce1:	0f b6 00             	movzbl (%eax),%eax
  200ce4:	84 c0                	test   %al,%al
  200ce6:	75 02                	jne    200cea <strcmp+0x11>
  200ce8:	eb 1c                	jmp    200d06 <strcmp+0x2d>
  200cea:	8b 45 08             	mov    0x8(%ebp),%eax
  200ced:	8d 50 01             	lea    0x1(%eax),%edx
  200cf0:	89 55 08             	mov    %edx,0x8(%ebp)
  200cf3:	0f b6 08             	movzbl (%eax),%ecx
  200cf6:	8b 45 0c             	mov    0xc(%ebp),%eax
  200cf9:	8d 50 01             	lea    0x1(%eax),%edx
  200cfc:	89 55 0c             	mov    %edx,0xc(%ebp)
  200cff:	0f b6 00             	movzbl (%eax),%eax
  200d02:	38 c1                	cmp    %al,%cl
  200d04:	74 d8                	je     200cde <strcmp+0x5>
  200d06:	8b 45 08             	mov    0x8(%ebp),%eax
  200d09:	0f b6 00             	movzbl (%eax),%eax
  200d0c:	0f be d0             	movsbl %al,%edx
  200d0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200d12:	0f b6 00             	movzbl (%eax),%eax
  200d15:	0f be c0             	movsbl %al,%eax
  200d18:	29 c2                	sub    %eax,%edx
  200d1a:	89 d0                	mov    %edx,%eax
  200d1c:	5d                   	pop    %ebp
  200d1d:	c3                   	ret    

00200d1e <memset>:
  200d1e:	55                   	push   %ebp
  200d1f:	89 e5                	mov    %esp,%ebp
  200d21:	83 ec 10             	sub    $0x10,%esp
  200d24:	8b 45 08             	mov    0x8(%ebp),%eax
  200d27:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200d2a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200d31:	eb 12                	jmp    200d45 <memset+0x27>
  200d33:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200d36:	8d 50 01             	lea    0x1(%eax),%edx
  200d39:	89 55 f8             	mov    %edx,-0x8(%ebp)
  200d3c:	8b 55 0c             	mov    0xc(%ebp),%edx
  200d3f:	88 10                	mov    %dl,(%eax)
  200d41:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  200d45:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200d48:	3b 45 10             	cmp    0x10(%ebp),%eax
  200d4b:	72 e6                	jb     200d33 <memset+0x15>
  200d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  200d50:	c9                   	leave  
  200d51:	c3                   	ret    
  200d52:	66 90                	xchg   %ax,%ax

00200d54 <testA>:
  200d54:	55                   	push   %ebp
  200d55:	89 e5                	mov    %esp,%ebp
  200d57:	83 ec 18             	sub    $0x18,%esp
  200d5a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200d61:	00 
  200d62:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  200d69:	00 
  200d6a:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200d71:	00 
  200d72:	c7 04 24 2a 17 20 00 	movl   $0x20172a,(%esp)
  200d79:	e8 ee fd ff ff       	call   200b6c <dis_str>
  200d7e:	b8 01 00 00 00       	mov    $0x1,%eax
  200d83:	bb 02 00 00 00       	mov    $0x2,%ebx
  200d88:	b9 03 00 00 00       	mov    $0x3,%ecx
  200d8d:	ba 04 00 00 00       	mov    $0x4,%edx
  200d92:	be 05 00 00 00       	mov    $0x5,%esi
  200d97:	bf 06 00 00 00       	mov    $0x6,%edi
  200d9c:	cd 80                	int    $0x80
  200d9e:	65 fe 05 c8 00 00 00 	incb   %gs:0xc8
  200da5:	eb f7                	jmp    200d9e <testA+0x4a>

00200da7 <init_thread>:
  200da7:	55                   	push   %ebp
  200da8:	89 e5                	mov    %esp,%ebp
  200daa:	83 ec 28             	sub    $0x28,%esp
  200dad:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200db4:	00 
  200db5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200dbc:	00 
  200dbd:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200dc4:	00 
  200dc5:	c7 04 24 3e 17 20 00 	movl   $0x20173e,(%esp)
  200dcc:	e8 9b fd ff ff       	call   200b6c <dis_str>
  200dd1:	c7 44 24 04 54 0d 20 	movl   $0x200d54,0x4(%esp)
  200dd8:	00 
  200dd9:	c7 04 24 53 17 20 00 	movl   $0x201753,(%esp)
  200de0:	e8 21 01 00 00       	call   200f06 <thread_creat>
  200de5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200deb:	83 c0 20             	add    $0x20,%eax
  200dee:	a3 00 80 22 00       	mov    %eax,0x228000
  200df3:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  200dfa:	00 21 00 
  200dfd:	a1 00 80 22 00       	mov    0x228000,%eax
  200e02:	83 e8 20             	sub    $0x20,%eax
  200e05:	a3 08 80 22 00       	mov    %eax,0x228008
  200e0a:	65 fe 05 28 00 00 00 	incb   %gs:0x28
  200e11:	eb f7                	jmp    200e0a <init_thread+0x63>

00200e13 <creat_init>:
  200e13:	55                   	push   %ebp
  200e14:	89 e5                	mov    %esp,%ebp
  200e16:	83 ec 18             	sub    $0x18,%esp
  200e19:	c7 05 04 00 21 00 00 	movl   $0x0,0x210004
  200e20:	00 00 00 
  200e23:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200e2a:	00 
  200e2b:	c7 44 24 04 59 17 20 	movl   $0x201759,0x4(%esp)
  200e32:	00 
  200e33:	c7 04 24 0c 00 21 00 	movl   $0x21000c,(%esp)
  200e3a:	e8 31 fe ff ff       	call   200c70 <memcpy>
  200e3f:	b8 a7 0d 20 00       	mov    $0x200da7,%eax
  200e44:	a3 08 00 21 00       	mov    %eax,0x210008
  200e49:	b8 00 00 22 00       	mov    $0x220000,%eax
  200e4e:	a3 00 00 21 00       	mov    %eax,0x210000
  200e53:	c7 05 1c 00 21 00 00 	movl   $0x218000,0x21001c
  200e5a:	80 21 00 
  200e5d:	c7 04 24 20 00 21 00 	movl   $0x210020,(%esp)
  200e64:	e8 af 06 00 00       	call   201518 <INIT_LIST_HEAD>
  200e69:	c7 05 0c 00 22 00 28 	movl   $0x28,0x22000c
  200e70:	00 00 00 
  200e73:	c7 05 34 00 22 00 20 	movl   $0x20,0x220034
  200e7a:	00 00 00 
  200e7d:	c7 05 08 00 22 00 28 	movl   $0x28,0x220008
  200e84:	00 00 00 
  200e87:	c7 05 04 00 22 00 28 	movl   $0x28,0x220004
  200e8e:	00 00 00 
  200e91:	c7 05 3c 00 22 00 28 	movl   $0x28,0x22003c
  200e98:	00 00 00 
  200e9b:	c7 05 00 00 22 00 48 	movl   $0x48,0x220000
  200ea2:	00 00 00 
  200ea5:	b8 a7 0d 20 00       	mov    $0x200da7,%eax
  200eaa:	a3 30 00 22 00       	mov    %eax,0x220030
  200eaf:	a1 1c 00 21 00       	mov    0x21001c,%eax
  200eb4:	a3 38 00 22 00       	mov    %eax,0x220038
  200eb9:	c7 05 40 00 22 00 02 	movl   $0x1202,0x220040
  200ec0:	12 00 00 
  200ec3:	c7 05 44 00 22 00 00 	movl   $0x210000,0x220044
  200eca:	00 21 00 
  200ecd:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  200ed4:	00 21 00 
  200ed7:	c7 04 24 00 00 21 00 	movl   $0x210000,(%esp)
  200ede:	e8 39 01 00 00       	call   20101c <schedule>
  200ee3:	c9                   	leave  
  200ee4:	c3                   	ret    

00200ee5 <get_pid>:
  200ee5:	55                   	push   %ebp
  200ee6:	89 e5                	mov    %esp,%ebp
  200ee8:	83 ec 10             	sub    $0x10,%esp
  200eeb:	a1 a0 89 20 00       	mov    0x2089a0,%eax
  200ef0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200ef3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200ef6:	8d 50 01             	lea    0x1(%eax),%edx
  200ef9:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200efc:	a3 a0 89 20 00       	mov    %eax,0x2089a0
  200f01:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200f04:	c9                   	leave  
  200f05:	c3                   	ret    

00200f06 <thread_creat>:
  200f06:	55                   	push   %ebp
  200f07:	89 e5                	mov    %esp,%ebp
  200f09:	83 ec 28             	sub    $0x28,%esp
  200f0c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200f13:	e8 6f 02 00 00       	call   201187 <get_pages>
  200f18:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200f1b:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200f22:	e8 60 02 00 00       	call   201187 <get_pages>
  200f27:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200f2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f2d:	83 c0 20             	add    $0x20,%eax
  200f30:	89 04 24             	mov    %eax,(%esp)
  200f33:	e8 e0 05 00 00       	call   201518 <INIT_LIST_HEAD>
  200f38:	e8 a8 ff ff ff       	call   200ee5 <get_pid>
  200f3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f40:	89 42 04             	mov    %eax,0x4(%edx)
  200f43:	8b 45 08             	mov    0x8(%ebp),%eax
  200f46:	89 04 24             	mov    %eax,(%esp)
  200f49:	e8 5f fd ff ff       	call   200cad <strlen>
  200f4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200f51:	83 c2 0c             	add    $0xc,%edx
  200f54:	89 44 24 08          	mov    %eax,0x8(%esp)
  200f58:	8b 45 08             	mov    0x8(%ebp),%eax
  200f5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  200f5f:	89 14 24             	mov    %edx,(%esp)
  200f62:	e8 09 fd ff ff       	call   200c70 <memcpy>
  200f67:	8b 55 0c             	mov    0xc(%ebp),%edx
  200f6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f6d:	89 50 08             	mov    %edx,0x8(%eax)
  200f70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200f73:	05 00 80 00 00       	add    $0x8000,%eax
  200f78:	89 c2                	mov    %eax,%edx
  200f7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f7d:	89 10                	mov    %edx,(%eax)
  200f7f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200f82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200f85:	89 50 1c             	mov    %edx,0x1c(%eax)
  200f88:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200f8b:	c7 80 0c 80 00 00 28 	movl   $0x28,0x800c(%eax)
  200f92:	00 00 00 
  200f95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200f98:	c7 80 34 80 00 00 20 	movl   $0x20,0x8034(%eax)
  200f9f:	00 00 00 
  200fa2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fa5:	c7 80 08 80 00 00 28 	movl   $0x28,0x8008(%eax)
  200fac:	00 00 00 
  200faf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fb2:	c7 80 04 80 00 00 28 	movl   $0x28,0x8004(%eax)
  200fb9:	00 00 00 
  200fbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fbf:	c7 80 3c 80 00 00 28 	movl   $0x28,0x803c(%eax)
  200fc6:	00 00 00 
  200fc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fcc:	c7 80 00 80 00 00 48 	movl   $0x48,0x8000(%eax)
  200fd3:	00 00 00 
  200fd6:	8b 55 0c             	mov    0xc(%ebp),%edx
  200fd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fdc:	89 90 30 80 00 00    	mov    %edx,0x8030(%eax)
  200fe2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200fe5:	8b 40 1c             	mov    0x1c(%eax),%eax
  200fe8:	89 c2                	mov    %eax,%edx
  200fea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200fed:	89 90 38 80 00 00    	mov    %edx,0x8038(%eax)
  200ff3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200ff6:	c7 80 40 80 00 00 02 	movl   $0x1202,0x8040(%eax)
  200ffd:	12 00 00 
  201000:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201003:	c7 80 44 80 00 00 00 	movl   $0x210000,0x8044(%eax)
  20100a:	00 21 00 
  20100d:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  201014:	00 21 00 
  201017:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20101a:	c9                   	leave  
  20101b:	c3                   	ret    

0020101c <schedule>:
  20101c:	55                   	push   %ebp
  20101d:	89 e5                	mov    %esp,%ebp
  20101f:	8b 45 08             	mov    0x8(%ebp),%eax
  201022:	8b 00                	mov    (%eax),%eax
  201024:	89 c4                	mov    %eax,%esp
  201026:	e9 05 00 00 00       	jmp    201030 <switch_to>
  20102b:	5d                   	pop    %ebp
  20102c:	c3                   	ret    
  20102d:	66 90                	xchg   %ax,%ax
  20102f:	90                   	nop

00201030 <switch_to>:
  201030:	89 c4                	mov    %eax,%esp
  201032:	0f a9                	pop    %gs
  201034:	0f a1                	pop    %fs
  201036:	07                   	pop    %es
  201037:	1f                   	pop    %ds
  201038:	61                   	popa   
  201039:	cb                   	lret   
  20103a:	66 90                	xchg   %ax,%ax

0020103c <get_memory_info>:
  20103c:	55                   	push   %ebp
  20103d:	89 e5                	mov    %esp,%ebp
  20103f:	83 ec 28             	sub    $0x28,%esp
  201042:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201049:	a1 00 00 10 00       	mov    0x100000,%eax
  20104e:	a3 84 80 22 00       	mov    %eax,0x228084
  201053:	a1 04 00 10 00       	mov    0x100004,%eax
  201058:	a3 88 80 22 00       	mov    %eax,0x228088
  20105d:	a1 08 00 10 00       	mov    0x100008,%eax
  201062:	a3 8c 80 22 00       	mov    %eax,0x22808c
  201067:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20106e:	eb 3e                	jmp    2010ae <get_memory_info+0x72>
  201070:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201073:	89 d0                	mov    %edx,%eax
  201075:	c1 e0 02             	shl    $0x2,%eax
  201078:	01 d0                	add    %edx,%eax
  20107a:	c1 e0 02             	shl    $0x2,%eax
  20107d:	05 00 80 00 00       	add    $0x8000,%eax
  201082:	89 c1                	mov    %eax,%ecx
  201084:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201087:	89 d0                	mov    %edx,%eax
  201089:	c1 e0 02             	shl    $0x2,%eax
  20108c:	01 d0                	add    %edx,%eax
  20108e:	c1 e0 02             	shl    $0x2,%eax
  201091:	05 20 80 22 00       	add    $0x228020,%eax
  201096:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  20109d:	00 
  20109e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  2010a2:	89 04 24             	mov    %eax,(%esp)
  2010a5:	e8 c6 fb ff ff       	call   200c70 <memcpy>
  2010aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2010ae:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  2010b2:	7e bc                	jle    201070 <get_memory_info+0x34>
  2010b4:	90                   	nop
  2010b5:	c9                   	leave  
  2010b6:	c3                   	ret    
  2010b7:	90                   	nop

002010b8 <init_page_bit_map>:
  2010b8:	55                   	push   %ebp
  2010b9:	89 e5                	mov    %esp,%ebp
  2010bb:	83 ec 10             	sub    $0x10,%esp
  2010be:	a1 0c 40 20 00       	mov    0x20400c,%eax
  2010c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2010c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2010cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2010d4:	eb 4f                	jmp    201125 <init_page_bit_map+0x6d>
  2010d6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2010d9:	89 d0                	mov    %edx,%eax
  2010db:	c1 e0 02             	shl    $0x2,%eax
  2010de:	01 d0                	add    %edx,%eax
  2010e0:	c1 e0 02             	shl    $0x2,%eax
  2010e3:	05 30 80 22 00       	add    $0x228030,%eax
  2010e8:	8b 00                	mov    (%eax),%eax
  2010ea:	83 f8 01             	cmp    $0x1,%eax
  2010ed:	75 32                	jne    201121 <init_page_bit_map+0x69>
  2010ef:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2010f2:	89 d0                	mov    %edx,%eax
  2010f4:	c1 e0 02             	shl    $0x2,%eax
  2010f7:	01 d0                	add    %edx,%eax
  2010f9:	c1 e0 02             	shl    $0x2,%eax
  2010fc:	05 20 80 22 00       	add    $0x228020,%eax
  201101:	8b 40 08             	mov    0x8(%eax),%eax
  201104:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  201107:	76 18                	jbe    201121 <init_page_bit_map+0x69>
  201109:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20110c:	89 d0                	mov    %edx,%eax
  20110e:	c1 e0 02             	shl    $0x2,%eax
  201111:	01 d0                	add    %edx,%eax
  201113:	c1 e0 02             	shl    $0x2,%eax
  201116:	05 20 80 22 00       	add    $0x228020,%eax
  20111b:	8b 40 08             	mov    0x8(%eax),%eax
  20111e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201121:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201125:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201128:	a1 8c 80 22 00       	mov    0x22808c,%eax
  20112d:	39 c2                	cmp    %eax,%edx
  20112f:	72 a5                	jb     2010d6 <init_page_bit_map+0x1e>
  201131:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201136:	29 45 f4             	sub    %eax,-0xc(%ebp)
  201139:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20113c:	05 ff 0f 00 00       	add    $0xfff,%eax
  201141:	c1 e8 0c             	shr    $0xc,%eax
  201144:	a3 a4 89 20 00       	mov    %eax,0x2089a4
  201149:	a1 a4 89 20 00       	mov    0x2089a4,%eax
  20114e:	83 c0 07             	add    $0x7,%eax
  201151:	c1 e8 03             	shr    $0x3,%eax
  201154:	a3 a8 89 20 00       	mov    %eax,0x2089a8
  201159:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201160:	eb 0e                	jmp    201170 <init_page_bit_map+0xb8>
  201162:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201165:	c6 00 00             	movb   $0x0,(%eax)
  201168:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  20116c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201170:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201173:	a1 a8 89 20 00       	mov    0x2089a8,%eax
  201178:	39 c2                	cmp    %eax,%edx
  20117a:	72 e6                	jb     201162 <init_page_bit_map+0xaa>
  20117c:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201181:	c6 00 80             	movb   $0x80,(%eax)
  201184:	90                   	nop
  201185:	c9                   	leave  
  201186:	c3                   	ret    

00201187 <get_pages>:
  201187:	55                   	push   %ebp
  201188:	89 e5                	mov    %esp,%ebp
  20118a:	83 ec 28             	sub    $0x28,%esp
  20118d:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201192:	89 45 e8             	mov    %eax,-0x18(%ebp)
  201195:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  201199:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  20119d:	76 4b                	jbe    2011ea <get_pages+0x63>
  20119f:	fa                   	cli    
  2011a0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2011a7:	00 
  2011a8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2011af:	00 
  2011b0:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
  2011b7:	00 
  2011b8:	c7 04 24 68 17 20 00 	movl   $0x201768,(%esp)
  2011bf:	e8 a8 f9 ff ff       	call   200b6c <dis_str>
  2011c4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2011cb:	00 
  2011cc:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2011d3:	00 
  2011d4:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2011db:	00 
  2011dc:	c7 04 24 70 17 20 00 	movl   $0x201770,(%esp)
  2011e3:	e8 84 f9 ff ff       	call   200b6c <dis_str>
  2011e8:	eb fe                	jmp    2011e8 <get_pages+0x61>
  2011ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2011f1:	eb 10                	jmp    201203 <get_pages+0x7c>
  2011f3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2011f7:	01 c0                	add    %eax,%eax
  2011f9:	83 c8 01             	or     $0x1,%eax
  2011fc:	88 45 ef             	mov    %al,-0x11(%ebp)
  2011ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201203:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201206:	3b 45 08             	cmp    0x8(%ebp),%eax
  201209:	72 e8                	jb     2011f3 <get_pages+0x6c>
  20120b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201212:	eb 60                	jmp    201274 <get_pages+0xed>
  201214:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20121b:	eb 46                	jmp    201263 <get_pages+0xdc>
  20121d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201220:	0f b6 00             	movzbl (%eax),%eax
  201223:	22 45 ef             	and    -0x11(%ebp),%al
  201226:	84 c0                	test   %al,%al
  201228:	75 32                	jne    20125c <get_pages+0xd5>
  20122a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  20122d:	0f b6 00             	movzbl (%eax),%eax
  201230:	0a 45 ef             	or     -0x11(%ebp),%al
  201233:	89 c2                	mov    %eax,%edx
  201235:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201238:	88 10                	mov    %dl,(%eax)
  20123a:	8b 15 0c 40 20 00    	mov    0x20400c,%edx
  201240:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201243:	c1 e0 03             	shl    $0x3,%eax
  201246:	89 c1                	mov    %eax,%ecx
  201248:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20124b:	f7 d8                	neg    %eax
  20124d:	2b 45 08             	sub    0x8(%ebp),%eax
  201250:	01 c8                	add    %ecx,%eax
  201252:	83 c0 08             	add    $0x8,%eax
  201255:	c1 e0 0c             	shl    $0xc,%eax
  201258:	01 d0                	add    %edx,%eax
  20125a:	eb 29                	jmp    201285 <get_pages+0xfe>
  20125c:	d0 65 ef             	shlb   -0x11(%ebp)
  20125f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  201263:	8b 55 f0             	mov    -0x10(%ebp),%edx
  201266:	8b 45 08             	mov    0x8(%ebp),%eax
  201269:	01 d0                	add    %edx,%eax
  20126b:	83 f8 07             	cmp    $0x7,%eax
  20126e:	76 ad                	jbe    20121d <get_pages+0x96>
  201270:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201274:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201277:	a1 a8 89 20 00       	mov    0x2089a8,%eax
  20127c:	39 c2                	cmp    %eax,%edx
  20127e:	72 94                	jb     201214 <get_pages+0x8d>
  201280:	b8 00 00 00 00       	mov    $0x0,%eax
  201285:	c9                   	leave  
  201286:	c3                   	ret    

00201287 <free_pages>:
  201287:	55                   	push   %ebp
  201288:	89 e5                	mov    %esp,%ebp
  20128a:	53                   	push   %ebx
  20128b:	83 ec 10             	sub    $0x10,%esp
  20128e:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201293:	89 45 f0             	mov    %eax,-0x10(%ebp)
  201296:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  20129a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2012a1:	eb 10                	jmp    2012b3 <free_pages+0x2c>
  2012a3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  2012a7:	01 c0                	add    %eax,%eax
  2012a9:	83 c8 01             	or     $0x1,%eax
  2012ac:	88 45 f7             	mov    %al,-0x9(%ebp)
  2012af:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  2012b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2012b6:	3b 45 0c             	cmp    0xc(%ebp),%eax
  2012b9:	72 e8                	jb     2012a3 <free_pages+0x1c>
  2012bb:	8b 55 08             	mov    0x8(%ebp),%edx
  2012be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2012c1:	29 c2                	sub    %eax,%edx
  2012c3:	89 d0                	mov    %edx,%eax
  2012c5:	c1 f8 0c             	sar    $0xc,%eax
  2012c8:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  2012ce:	85 c0                	test   %eax,%eax
  2012d0:	0f 48 c2             	cmovs  %edx,%eax
  2012d3:	c1 f8 0c             	sar    $0xc,%eax
  2012d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2012d9:	0f b6 5d f7          	movzbl -0x9(%ebp),%ebx
  2012dd:	8b 55 08             	mov    0x8(%ebp),%edx
  2012e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2012e3:	29 c2                	sub    %eax,%edx
  2012e5:	89 d0                	mov    %edx,%eax
  2012e7:	c1 f8 0c             	sar    $0xc,%eax
  2012ea:	89 c2                	mov    %eax,%edx
  2012ec:	89 d0                	mov    %edx,%eax
  2012ee:	c1 f8 1f             	sar    $0x1f,%eax
  2012f1:	c1 e8 1d             	shr    $0x1d,%eax
  2012f4:	01 c2                	add    %eax,%edx
  2012f6:	83 e2 07             	and    $0x7,%edx
  2012f9:	29 c2                	sub    %eax,%edx
  2012fb:	89 d0                	mov    %edx,%eax
  2012fd:	f7 d8                	neg    %eax
  2012ff:	2b 45 0c             	sub    0xc(%ebp),%eax
  201302:	83 c0 08             	add    $0x8,%eax
  201305:	89 c1                	mov    %eax,%ecx
  201307:	d3 e3                	shl    %cl,%ebx
  201309:	89 d8                	mov    %ebx,%eax
  20130b:	f7 d0                	not    %eax
  20130d:	88 45 f7             	mov    %al,-0x9(%ebp)
  201310:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201313:	01 45 f0             	add    %eax,-0x10(%ebp)
  201316:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201319:	0f b6 00             	movzbl (%eax),%eax
  20131c:	22 45 f7             	and    -0x9(%ebp),%al
  20131f:	89 c2                	mov    %eax,%edx
  201321:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201324:	88 10                	mov    %dl,(%eax)
  201326:	90                   	nop
  201327:	83 c4 10             	add    $0x10,%esp
  20132a:	5b                   	pop    %ebx
  20132b:	5d                   	pop    %ebp
  20132c:	c3                   	ret    

0020132d <get_page_cnt>:
  20132d:	55                   	push   %ebp
  20132e:	89 e5                	mov    %esp,%ebp
  201330:	83 ec 10             	sub    $0x10,%esp
  201333:	c7 45 f8 20 80 22 00 	movl   $0x228020,-0x8(%ebp)
  20133a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201341:	eb 32                	jmp    201375 <get_page_cnt+0x48>
  201343:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201346:	89 d0                	mov    %edx,%eax
  201348:	c1 e0 02             	shl    $0x2,%eax
  20134b:	01 d0                	add    %edx,%eax
  20134d:	c1 e0 02             	shl    $0x2,%eax
  201350:	05 30 80 22 00       	add    $0x228030,%eax
  201355:	8b 00                	mov    (%eax),%eax
  201357:	83 f8 01             	cmp    $0x1,%eax
  20135a:	75 15                	jne    201371 <get_page_cnt+0x44>
  20135c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20135f:	89 d0                	mov    %edx,%eax
  201361:	c1 e0 02             	shl    $0x2,%eax
  201364:	01 d0                	add    %edx,%eax
  201366:	c1 e0 02             	shl    $0x2,%eax
  201369:	05 20 80 22 00       	add    $0x228020,%eax
  20136e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  201371:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201375:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201378:	a1 8c 80 22 00       	mov    0x22808c,%eax
  20137d:	39 c2                	cmp    %eax,%edx
  20137f:	72 c2                	jb     201343 <get_page_cnt+0x16>
  201381:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201384:	8b 10                	mov    (%eax),%edx
  201386:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201389:	8b 40 08             	mov    0x8(%eax),%eax
  20138c:	01 d0                	add    %edx,%eax
  20138e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201391:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201394:	05 ff 0f 00 00       	add    $0xfff,%eax
  201399:	c1 e8 0c             	shr    $0xc,%eax
  20139c:	c9                   	leave  
  20139d:	c3                   	ret    

0020139e <get_ptet_cnt>:
  20139e:	55                   	push   %ebp
  20139f:	89 e5                	mov    %esp,%ebp
  2013a1:	8b 45 08             	mov    0x8(%ebp),%eax
  2013a4:	05 ff 03 00 00       	add    $0x3ff,%eax
  2013a9:	c1 e8 0a             	shr    $0xa,%eax
  2013ac:	5d                   	pop    %ebp
  2013ad:	c3                   	ret    

002013ae <set_page>:
  2013ae:	55                   	push   %ebp
  2013af:	89 e5                	mov    %esp,%ebp
  2013b1:	83 ec 34             	sub    $0x34,%esp
  2013b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2013bb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  2013c2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  2013c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2013d0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2013d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2013de:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2013e5:	e8 43 ff ff ff       	call   20132d <get_page_cnt>
  2013ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2013ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2013f0:	89 04 24             	mov    %eax,(%esp)
  2013f3:	e8 a6 ff ff ff       	call   20139e <get_ptet_cnt>
  2013f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2013fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2013fe:	89 04 24             	mov    %eax,(%esp)
  201401:	e8 98 ff ff ff       	call   20139e <get_ptet_cnt>
  201406:	89 45 dc             	mov    %eax,-0x24(%ebp)
  201409:	c7 45 f0 00 00 10 00 	movl   $0x100000,-0x10(%ebp)
  201410:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201413:	89 45 d8             	mov    %eax,-0x28(%ebp)
  201416:	c7 45 ec 00 10 10 00 	movl   $0x101000,-0x14(%ebp)
  20141d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201424:	eb 6c                	jmp    201492 <set_page+0xe4>
  201426:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20142d:	eb 50                	jmp    20147f <set_page+0xd1>
  20142f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201432:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  201437:	83 c8 07             	or     $0x7,%eax
  20143a:	89 c1                	mov    %eax,%ecx
  20143c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20143f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  201442:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201445:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20144c:	eb 1c                	jmp    20146a <set_page+0xbc>
  20144e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201451:	83 c8 07             	or     $0x7,%eax
  201454:	89 c1                	mov    %eax,%ecx
  201456:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201459:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20145c:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  20145f:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
  201466:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  20146a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20146d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  201472:	76 da                	jbe    20144e <set_page+0xa0>
  201474:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  20147b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  20147f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201482:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  201485:	7c a8                	jl     20142f <set_page+0x81>
  201487:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  20148e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201492:	8b 45 fc             	mov    -0x4(%ebp),%eax
  201495:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  201498:	7c 8c                	jl     201426 <set_page+0x78>
  20149a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  20149d:	0f 22 d8             	mov    %eax,%cr3
  2014a0:	0f 20 c0             	mov    %cr0,%eax
  2014a3:	0d 00 00 00 80       	or     $0x80000000,%eax
  2014a8:	0f 22 c0             	mov    %eax,%cr0
  2014ab:	e8 08 fc ff ff       	call   2010b8 <init_page_bit_map>
  2014b0:	90                   	nop
  2014b1:	c9                   	leave  
  2014b2:	c3                   	ret    
  2014b3:	90                   	nop

002014b4 <sys_entry>:
  2014b4:	1e                   	push   %ds
  2014b5:	06                   	push   %es
  2014b6:	0f a0                	push   %fs
  2014b8:	0f a8                	push   %gs
  2014ba:	fb                   	sti    
  2014bb:	57                   	push   %edi
  2014bc:	56                   	push   %esi
  2014bd:	52                   	push   %edx
  2014be:	51                   	push   %ecx
  2014bf:	53                   	push   %ebx
  2014c0:	50                   	push   %eax
  2014c1:	e8 22 00 00 00       	call   2014e8 <syscall_handler>
  2014c6:	83 c4 18             	add    $0x18,%esp
  2014c9:	0f a9                	pop    %gs
  2014cb:	0f a1                	pop    %fs
  2014cd:	07                   	pop    %es
  2014ce:	1f                   	pop    %ds
  2014cf:	8b 04 24             	mov    (%esp),%eax
  2014d2:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  2014d6:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  2014da:	89 44 24 04          	mov    %eax,0x4(%esp)
  2014de:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  2014e2:	89 0c 24             	mov    %ecx,(%esp)
  2014e5:	9d                   	popf   
  2014e6:	cb                   	lret   
  2014e7:	90                   	nop

002014e8 <syscall_handler>:
  2014e8:	55                   	push   %ebp
  2014e9:	89 e5                	mov    %esp,%ebp
  2014eb:	83 ec 18             	sub    $0x18,%esp
  2014ee:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2014f5:	00 
  2014f6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2014fd:	00 
  2014fe:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
  201505:	00 
  201506:	c7 04 24 98 17 20 00 	movl   $0x201798,(%esp)
  20150d:	e8 5a f6 ff ff       	call   200b6c <dis_str>
  201512:	90                   	nop
  201513:	c9                   	leave  
  201514:	c3                   	ret    
  201515:	66 90                	xchg   %ax,%ax
  201517:	90                   	nop

00201518 <INIT_LIST_HEAD>:
  201518:	55                   	push   %ebp
  201519:	89 e5                	mov    %esp,%ebp
  20151b:	8b 45 08             	mov    0x8(%ebp),%eax
  20151e:	8b 55 08             	mov    0x8(%ebp),%edx
  201521:	89 50 04             	mov    %edx,0x4(%eax)
  201524:	8b 45 08             	mov    0x8(%ebp),%eax
  201527:	8b 55 08             	mov    0x8(%ebp),%edx
  20152a:	89 10                	mov    %edx,(%eax)
  20152c:	5d                   	pop    %ebp
  20152d:	c3                   	ret    

0020152e <__list_add>:
  20152e:	55                   	push   %ebp
  20152f:	89 e5                	mov    %esp,%ebp
  201531:	8b 45 10             	mov    0x10(%ebp),%eax
  201534:	8b 55 08             	mov    0x8(%ebp),%edx
  201537:	89 50 04             	mov    %edx,0x4(%eax)
  20153a:	8b 45 08             	mov    0x8(%ebp),%eax
  20153d:	8b 55 10             	mov    0x10(%ebp),%edx
  201540:	89 10                	mov    %edx,(%eax)
  201542:	8b 45 08             	mov    0x8(%ebp),%eax
  201545:	8b 55 0c             	mov    0xc(%ebp),%edx
  201548:	89 50 04             	mov    %edx,0x4(%eax)
  20154b:	8b 45 0c             	mov    0xc(%ebp),%eax
  20154e:	8b 55 08             	mov    0x8(%ebp),%edx
  201551:	89 10                	mov    %edx,(%eax)
  201553:	5d                   	pop    %ebp
  201554:	c3                   	ret    

00201555 <list_add>:
  201555:	55                   	push   %ebp
  201556:	89 e5                	mov    %esp,%ebp
  201558:	83 ec 0c             	sub    $0xc,%esp
  20155b:	8b 45 0c             	mov    0xc(%ebp),%eax
  20155e:	8b 00                	mov    (%eax),%eax
  201560:	89 44 24 08          	mov    %eax,0x8(%esp)
  201564:	8b 45 0c             	mov    0xc(%ebp),%eax
  201567:	89 44 24 04          	mov    %eax,0x4(%esp)
  20156b:	8b 45 08             	mov    0x8(%ebp),%eax
  20156e:	89 04 24             	mov    %eax,(%esp)
  201571:	e8 b8 ff ff ff       	call   20152e <__list_add>
  201576:	c9                   	leave  
  201577:	c3                   	ret    

00201578 <list_add_tail>:
  201578:	55                   	push   %ebp
  201579:	89 e5                	mov    %esp,%ebp
  20157b:	83 ec 0c             	sub    $0xc,%esp
  20157e:	8b 45 0c             	mov    0xc(%ebp),%eax
  201581:	8b 40 04             	mov    0x4(%eax),%eax
  201584:	8b 55 0c             	mov    0xc(%ebp),%edx
  201587:	89 54 24 08          	mov    %edx,0x8(%esp)
  20158b:	89 44 24 04          	mov    %eax,0x4(%esp)
  20158f:	8b 45 08             	mov    0x8(%ebp),%eax
  201592:	89 04 24             	mov    %eax,(%esp)
  201595:	e8 94 ff ff ff       	call   20152e <__list_add>
  20159a:	c9                   	leave  
  20159b:	c3                   	ret    

0020159c <__list_del>:
  20159c:	55                   	push   %ebp
  20159d:	89 e5                	mov    %esp,%ebp
  20159f:	8b 45 08             	mov    0x8(%ebp),%eax
  2015a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  2015a5:	89 10                	mov    %edx,(%eax)
  2015a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  2015aa:	8b 55 08             	mov    0x8(%ebp),%edx
  2015ad:	89 50 04             	mov    %edx,0x4(%eax)
  2015b0:	5d                   	pop    %ebp
  2015b1:	c3                   	ret    

002015b2 <list_del>:
  2015b2:	55                   	push   %ebp
  2015b3:	89 e5                	mov    %esp,%ebp
  2015b5:	83 ec 08             	sub    $0x8,%esp
  2015b8:	8b 45 08             	mov    0x8(%ebp),%eax
  2015bb:	8b 10                	mov    (%eax),%edx
  2015bd:	8b 45 08             	mov    0x8(%ebp),%eax
  2015c0:	8b 40 04             	mov    0x4(%eax),%eax
  2015c3:	89 54 24 04          	mov    %edx,0x4(%esp)
  2015c7:	89 04 24             	mov    %eax,(%esp)
  2015ca:	e8 cd ff ff ff       	call   20159c <__list_del>
  2015cf:	8b 45 08             	mov    0x8(%ebp),%eax
  2015d2:	89 04 24             	mov    %eax,(%esp)
  2015d5:	e8 3e ff ff ff       	call   201518 <INIT_LIST_HEAD>
  2015da:	c9                   	leave  
  2015db:	c3                   	ret    

002015dc <list_replace>:
  2015dc:	55                   	push   %ebp
  2015dd:	89 e5                	mov    %esp,%ebp
  2015df:	83 ec 04             	sub    $0x4,%esp
  2015e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  2015e5:	8b 10                	mov    (%eax),%edx
  2015e7:	8b 45 08             	mov    0x8(%ebp),%eax
  2015ea:	89 10                	mov    %edx,(%eax)
  2015ec:	8b 45 08             	mov    0x8(%ebp),%eax
  2015ef:	8b 00                	mov    (%eax),%eax
  2015f1:	8b 55 08             	mov    0x8(%ebp),%edx
  2015f4:	89 50 04             	mov    %edx,0x4(%eax)
  2015f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  2015fa:	8b 50 04             	mov    0x4(%eax),%edx
  2015fd:	8b 45 08             	mov    0x8(%ebp),%eax
  201600:	89 50 04             	mov    %edx,0x4(%eax)
  201603:	8b 45 08             	mov    0x8(%ebp),%eax
  201606:	8b 40 04             	mov    0x4(%eax),%eax
  201609:	8b 55 08             	mov    0x8(%ebp),%edx
  20160c:	89 10                	mov    %edx,(%eax)
  20160e:	8b 45 0c             	mov    0xc(%ebp),%eax
  201611:	89 04 24             	mov    %eax,(%esp)
  201614:	e8 ff fe ff ff       	call   201518 <INIT_LIST_HEAD>
  201619:	c9                   	leave  
  20161a:	c3                   	ret    
