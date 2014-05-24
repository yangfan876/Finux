
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
  20001f:	e8 f0 10 00 00       	call   201114 <get_memory_info>
  200024:	e8 5d 14 00 00       	call   201486 <set_page>
  200029:	e8 b6 03 00 00       	call   2003e4 <disable_irqs>
  20002e:	e8 95 07 00 00       	call   2007c8 <load_idt>
  200033:	e8 b7 08 00 00       	call   2008ef <init_timer>
  200038:	e8 69 0e 00 00       	call   200ea6 <creat_init>
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
  2007aa:	c7 44 24 08 8c 15 20 	movl   $0x20158c,0x8(%esp)
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
  2008b4:	e8 e7 0d 00 00       	call   2016a0 <list_add_tail>
  2008b9:	a1 00 80 22 00       	mov    0x228000,%eax
  2008be:	83 e8 20             	sub    $0x20,%eax
  2008c1:	a3 14 80 22 00       	mov    %eax,0x228014
  2008c6:	a1 00 80 22 00       	mov    0x228000,%eax
  2008cb:	8b 00                	mov    (%eax),%eax
  2008cd:	a3 00 80 22 00       	mov    %eax,0x228000
  2008d2:	a1 14 80 22 00       	mov    0x228014,%eax
  2008d7:	83 c0 20             	add    $0x20,%eax
  2008da:	89 04 24             	mov    %eax,(%esp)
  2008dd:	e8 f7 0d 00 00       	call   2016d9 <list_del>
  2008e2:	a1 14 80 22 00       	mov    0x228014,%eax
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
  200942:	c7 04 24 40 19 20 00 	movl   $0x201940,(%esp)
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
  200979:	c7 44 24 04 4b 19 20 	movl   $0x20194b,0x4(%esp)
  200980:	00 
  200981:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  200988:	e8 97 ff ff ff       	call   200924 <exception_handler>
  20098d:	c9                   	leave  
  20098e:	c3                   	ret    

0020098f <single_step_exception>:
  20098f:	55                   	push   %ebp
  200990:	89 e5                	mov    %esp,%ebp
  200992:	83 ec 18             	sub    $0x18,%esp
  200995:	c7 44 24 04 58 19 20 	movl   $0x201958,0x4(%esp)
  20099c:	00 
  20099d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2009a4:	e8 7b ff ff ff       	call   200924 <exception_handler>
  2009a9:	c9                   	leave  
  2009aa:	c3                   	ret    

002009ab <nmi>:
  2009ab:	55                   	push   %ebp
  2009ac:	89 e5                	mov    %esp,%ebp
  2009ae:	83 ec 18             	sub    $0x18,%esp
  2009b1:	c7 44 24 04 6e 19 20 	movl   $0x20196e,0x4(%esp)
  2009b8:	00 
  2009b9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2009c0:	e8 5f ff ff ff       	call   200924 <exception_handler>
  2009c5:	c9                   	leave  
  2009c6:	c3                   	ret    

002009c7 <breakpoint_exception>:
  2009c7:	55                   	push   %ebp
  2009c8:	89 e5                	mov    %esp,%ebp
  2009ca:	83 ec 18             	sub    $0x18,%esp
  2009cd:	c7 44 24 04 72 19 20 	movl   $0x201972,0x4(%esp)
  2009d4:	00 
  2009d5:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  2009dc:	e8 43 ff ff ff       	call   200924 <exception_handler>
  2009e1:	c9                   	leave  
  2009e2:	c3                   	ret    

002009e3 <overflow>:
  2009e3:	55                   	push   %ebp
  2009e4:	89 e5                	mov    %esp,%ebp
  2009e6:	83 ec 18             	sub    $0x18,%esp
  2009e9:	c7 44 24 04 87 19 20 	movl   $0x201987,0x4(%esp)
  2009f0:	00 
  2009f1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  2009f8:	e8 27 ff ff ff       	call   200924 <exception_handler>
  2009fd:	c9                   	leave  
  2009fe:	c3                   	ret    

002009ff <bounds_check>:
  2009ff:	55                   	push   %ebp
  200a00:	89 e5                	mov    %esp,%ebp
  200a02:	83 ec 18             	sub    $0x18,%esp
  200a05:	c7 44 24 04 90 19 20 	movl   $0x201990,0x4(%esp)
  200a0c:	00 
  200a0d:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  200a14:	e8 0b ff ff ff       	call   200924 <exception_handler>
  200a19:	c9                   	leave  
  200a1a:	c3                   	ret    

00200a1b <inval_opcode>:
  200a1b:	55                   	push   %ebp
  200a1c:	89 e5                	mov    %esp,%ebp
  200a1e:	83 ec 18             	sub    $0x18,%esp
  200a21:	c7 44 24 04 9d 19 20 	movl   $0x20199d,0x4(%esp)
  200a28:	00 
  200a29:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
  200a30:	e8 ef fe ff ff       	call   200924 <exception_handler>
  200a35:	c9                   	leave  
  200a36:	c3                   	ret    

00200a37 <copr_not_available>:
  200a37:	55                   	push   %ebp
  200a38:	89 e5                	mov    %esp,%ebp
  200a3a:	83 ec 18             	sub    $0x18,%esp
  200a3d:	c7 44 24 04 aa 19 20 	movl   $0x2019aa,0x4(%esp)
  200a44:	00 
  200a45:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  200a4c:	e8 d3 fe ff ff       	call   200924 <exception_handler>
  200a51:	c9                   	leave  
  200a52:	c3                   	ret    

00200a53 <double_fault>:
  200a53:	55                   	push   %ebp
  200a54:	89 e5                	mov    %esp,%ebp
  200a56:	83 ec 18             	sub    $0x18,%esp
  200a59:	c7 44 24 04 bd 19 20 	movl   $0x2019bd,0x4(%esp)
  200a60:	00 
  200a61:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  200a68:	e8 b7 fe ff ff       	call   200924 <exception_handler>
  200a6d:	c9                   	leave  
  200a6e:	c3                   	ret    

00200a6f <copr_seg_overrun>:
  200a6f:	55                   	push   %ebp
  200a70:	89 e5                	mov    %esp,%ebp
  200a72:	83 ec 18             	sub    $0x18,%esp
  200a75:	c7 44 24 04 ca 19 20 	movl   $0x2019ca,0x4(%esp)
  200a7c:	00 
  200a7d:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  200a84:	e8 9b fe ff ff       	call   200924 <exception_handler>
  200a89:	c9                   	leave  
  200a8a:	c3                   	ret    

00200a8b <inval_tss>:
  200a8b:	55                   	push   %ebp
  200a8c:	89 e5                	mov    %esp,%ebp
  200a8e:	83 ec 18             	sub    $0x18,%esp
  200a91:	c7 44 24 04 db 19 20 	movl   $0x2019db,0x4(%esp)
  200a98:	00 
  200a99:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  200aa0:	e8 7f fe ff ff       	call   200924 <exception_handler>
  200aa5:	c9                   	leave  
  200aa6:	c3                   	ret    

00200aa7 <segment_not_present>:
  200aa7:	55                   	push   %ebp
  200aa8:	89 e5                	mov    %esp,%ebp
  200aaa:	83 ec 18             	sub    $0x18,%esp
  200aad:	c7 44 24 04 e5 19 20 	movl   $0x2019e5,0x4(%esp)
  200ab4:	00 
  200ab5:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
  200abc:	e8 63 fe ff ff       	call   200924 <exception_handler>
  200ac1:	c9                   	leave  
  200ac2:	c3                   	ret    

00200ac3 <stack_exception>:
  200ac3:	55                   	push   %ebp
  200ac4:	89 e5                	mov    %esp,%ebp
  200ac6:	83 ec 18             	sub    $0x18,%esp
  200ac9:	c7 44 24 04 f9 19 20 	movl   $0x2019f9,0x4(%esp)
  200ad0:	00 
  200ad1:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  200ad8:	e8 47 fe ff ff       	call   200924 <exception_handler>
  200add:	c9                   	leave  
  200ade:	c3                   	ret    

00200adf <general_protection>:
  200adf:	55                   	push   %ebp
  200ae0:	89 e5                	mov    %esp,%ebp
  200ae2:	83 ec 18             	sub    $0x18,%esp
  200ae5:	c7 44 24 04 09 1a 20 	movl   $0x201a09,0x4(%esp)
  200aec:	00 
  200aed:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
  200af4:	e8 2b fe ff ff       	call   200924 <exception_handler>
  200af9:	c9                   	leave  
  200afa:	c3                   	ret    

00200afb <page_fault>:
  200afb:	55                   	push   %ebp
  200afc:	89 e5                	mov    %esp,%ebp
  200afe:	83 ec 18             	sub    $0x18,%esp
  200b01:	c7 44 24 04 1c 1a 20 	movl   $0x201a1c,0x4(%esp)
  200b08:	00 
  200b09:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  200b10:	e8 0f fe ff ff       	call   200924 <exception_handler>
  200b15:	c9                   	leave  
  200b16:	c3                   	ret    

00200b17 <copr_error>:
  200b17:	55                   	push   %ebp
  200b18:	89 e5                	mov    %esp,%ebp
  200b1a:	83 ec 18             	sub    $0x18,%esp
  200b1d:	c7 44 24 04 27 1a 20 	movl   $0x201a27,0x4(%esp)
  200b24:	00 
  200b25:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
  200b2c:	e8 f3 fd ff ff       	call   200924 <exception_handler>
  200b31:	c9                   	leave  
  200b32:	c3                   	ret    

00200b33 <float_error>:
  200b33:	55                   	push   %ebp
  200b34:	89 e5                	mov    %esp,%ebp
  200b36:	83 ec 18             	sub    $0x18,%esp
  200b39:	c7 44 24 04 32 1a 20 	movl   $0x201a32,0x4(%esp)
  200b40:	00 
  200b41:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  200b48:	e8 d7 fd ff ff       	call   200924 <exception_handler>
  200b4d:	c9                   	leave  
  200b4e:	c3                   	ret    

00200b4f <alignment_check>:
  200b4f:	55                   	push   %ebp
  200b50:	89 e5                	mov    %esp,%ebp
  200b52:	83 ec 18             	sub    $0x18,%esp
  200b55:	c7 44 24 04 3e 1a 20 	movl   $0x201a3e,0x4(%esp)
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

00200d54 <test_lock1>:
  200d54:	55                   	push   %ebp
  200d55:	89 e5                	mov    %esp,%ebp
  200d57:	83 ec 28             	sub    $0x28,%esp
  200d5a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200d61:	00 
  200d62:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  200d69:	00 
  200d6a:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200d71:	00 
  200d72:	c7 04 24 4e 1a 20 00 	movl   $0x201a4e,(%esp)
  200d79:	e8 ee fd ff ff       	call   200b6c <dis_str>
  200d7e:	c7 04 24 08 80 22 00 	movl   $0x228008,(%esp)
  200d85:	e8 7e 0a 00 00       	call   201808 <lock_acquire>
  200d8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200d91:	eb 0b                	jmp    200d9e <test_lock1+0x4a>
  200d93:	65 fe 05 c8 00 00 00 	incb   %gs:0xc8
  200d9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  200d9e:	81 7d f4 f7 d6 a3 00 	cmpl   $0xa3d6f7,-0xc(%ebp)
  200da5:	7e ec                	jle    200d93 <test_lock1+0x3f>
  200da7:	c7 04 24 08 80 22 00 	movl   $0x228008,(%esp)
  200dae:	e8 98 0a 00 00       	call   20184b <lock_realse>
  200db3:	65 fe 05 d2 00 00 00 	incb   %gs:0xd2
  200dba:	eb f7                	jmp    200db3 <test_lock1+0x5f>

00200dbc <test_lock2>:
  200dbc:	55                   	push   %ebp
  200dbd:	89 e5                	mov    %esp,%ebp
  200dbf:	83 ec 18             	sub    $0x18,%esp
  200dc2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200dc9:	00 
  200dca:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
  200dd1:	00 
  200dd2:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200dd9:	00 
  200dda:	c7 04 24 67 1a 20 00 	movl   $0x201a67,(%esp)
  200de1:	e8 86 fd ff ff       	call   200b6c <dis_str>
  200de6:	c7 04 24 08 80 22 00 	movl   $0x228008,(%esp)
  200ded:	e8 16 0a 00 00       	call   201808 <lock_acquire>
  200df2:	65 fe 05 68 01 00 00 	incb   %gs:0x168
  200df9:	eb f7                	jmp    200df2 <test_lock2+0x36>

00200dfb <init_thread>:
  200dfb:	55                   	push   %ebp
  200dfc:	89 e5                	mov    %esp,%ebp
  200dfe:	83 ec 28             	sub    $0x28,%esp
  200e01:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200e08:	00 
  200e09:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  200e10:	00 
  200e11:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
  200e18:	00 
  200e19:	c7 04 24 80 1a 20 00 	movl   $0x201a80,(%esp)
  200e20:	e8 47 fd ff ff       	call   200b6c <dis_str>
  200e25:	c7 44 24 04 54 0d 20 	movl   $0x200d54,0x4(%esp)
  200e2c:	00 
  200e2d:	c7 04 24 95 1a 20 00 	movl   $0x201a95,(%esp)
  200e34:	e8 60 01 00 00       	call   200f99 <thread_creat>
  200e39:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200e3c:	c7 44 24 04 bc 0d 20 	movl   $0x200dbc,0x4(%esp)
  200e43:	00 
  200e44:	c7 04 24 a0 1a 20 00 	movl   $0x201aa0,(%esp)
  200e4b:	e8 49 01 00 00       	call   200f99 <thread_creat>
  200e50:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200e53:	c7 04 24 08 80 22 00 	movl   $0x228008,(%esp)
  200e5a:	e8 89 09 00 00       	call   2017e8 <get_lock>
  200e5f:	fa                   	cli    
  200e60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200e63:	83 c0 20             	add    $0x20,%eax
  200e66:	a3 00 80 22 00       	mov    %eax,0x228000
  200e6b:	a1 00 80 22 00       	mov    0x228000,%eax
  200e70:	8b 40 04             	mov    0x4(%eax),%eax
  200e73:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200e76:	83 c2 20             	add    $0x20,%edx
  200e79:	89 44 24 04          	mov    %eax,0x4(%esp)
  200e7d:	89 14 24             	mov    %edx,(%esp)
  200e80:	e8 1b 08 00 00       	call   2016a0 <list_add_tail>
  200e85:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  200e8c:	00 21 00 
  200e8f:	a1 00 80 22 00       	mov    0x228000,%eax
  200e94:	83 e8 20             	sub    $0x20,%eax
  200e97:	a3 14 80 22 00       	mov    %eax,0x228014
  200e9c:	fb                   	sti    
  200e9d:	65 fe 05 28 00 00 00 	incb   %gs:0x28
  200ea4:	eb f7                	jmp    200e9d <init_thread+0xa2>

00200ea6 <creat_init>:
  200ea6:	55                   	push   %ebp
  200ea7:	89 e5                	mov    %esp,%ebp
  200ea9:	83 ec 18             	sub    $0x18,%esp
  200eac:	c7 05 04 00 21 00 00 	movl   $0x0,0x210004
  200eb3:	00 00 00 
  200eb6:	c7 44 24 08 0b 00 00 	movl   $0xb,0x8(%esp)
  200ebd:	00 
  200ebe:	c7 44 24 04 ab 1a 20 	movl   $0x201aab,0x4(%esp)
  200ec5:	00 
  200ec6:	c7 04 24 0c 00 21 00 	movl   $0x21000c,(%esp)
  200ecd:	e8 9e fd ff ff       	call   200c70 <memcpy>
  200ed2:	b8 fb 0d 20 00       	mov    $0x200dfb,%eax
  200ed7:	a3 08 00 21 00       	mov    %eax,0x210008
  200edc:	b8 00 00 22 00       	mov    $0x220000,%eax
  200ee1:	a3 00 00 21 00       	mov    %eax,0x210000
  200ee6:	c7 05 1c 00 21 00 00 	movl   $0x218000,0x21001c
  200eed:	80 21 00 
  200ef0:	c7 04 24 20 00 21 00 	movl   $0x210020,(%esp)
  200ef7:	e8 44 07 00 00       	call   201640 <INIT_LIST_HEAD>
  200efc:	c7 05 0c 00 22 00 28 	movl   $0x28,0x22000c
  200f03:	00 00 00 
  200f06:	c7 05 34 00 22 00 20 	movl   $0x20,0x220034
  200f0d:	00 00 00 
  200f10:	c7 05 08 00 22 00 28 	movl   $0x28,0x220008
  200f17:	00 00 00 
  200f1a:	c7 05 04 00 22 00 28 	movl   $0x28,0x220004
  200f21:	00 00 00 
  200f24:	c7 05 3c 00 22 00 28 	movl   $0x28,0x22003c
  200f2b:	00 00 00 
  200f2e:	c7 05 00 00 22 00 48 	movl   $0x48,0x220000
  200f35:	00 00 00 
  200f38:	b8 fb 0d 20 00       	mov    $0x200dfb,%eax
  200f3d:	a3 30 00 22 00       	mov    %eax,0x220030
  200f42:	a1 1c 00 21 00       	mov    0x21001c,%eax
  200f47:	a3 38 00 22 00       	mov    %eax,0x220038
  200f4c:	c7 05 40 00 22 00 02 	movl   $0x1202,0x220040
  200f53:	12 00 00 
  200f56:	c7 05 44 00 22 00 00 	movl   $0x210000,0x220044
  200f5d:	00 21 00 
  200f60:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  200f67:	00 21 00 
  200f6a:	c7 04 24 00 00 21 00 	movl   $0x210000,(%esp)
  200f71:	e8 46 01 00 00       	call   2010bc <schedule>
  200f76:	c9                   	leave  
  200f77:	c3                   	ret    

00200f78 <get_pid>:
  200f78:	55                   	push   %ebp
  200f79:	89 e5                	mov    %esp,%ebp
  200f7b:	83 ec 10             	sub    $0x10,%esp
  200f7e:	a1 a0 89 20 00       	mov    0x2089a0,%eax
  200f83:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200f86:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200f89:	8d 50 01             	lea    0x1(%eax),%edx
  200f8c:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200f8f:	a3 a0 89 20 00       	mov    %eax,0x2089a0
  200f94:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200f97:	c9                   	leave  
  200f98:	c3                   	ret    

00200f99 <thread_creat>:
  200f99:	55                   	push   %ebp
  200f9a:	89 e5                	mov    %esp,%ebp
  200f9c:	83 ec 28             	sub    $0x28,%esp
  200f9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200fa6:	e8 b4 02 00 00       	call   20125f <get_pages>
  200fab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200fae:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  200fb5:	e8 a5 02 00 00       	call   20125f <get_pages>
  200fba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200fbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200fc0:	83 c0 20             	add    $0x20,%eax
  200fc3:	89 04 24             	mov    %eax,(%esp)
  200fc6:	e8 75 06 00 00       	call   201640 <INIT_LIST_HEAD>
  200fcb:	e8 a8 ff ff ff       	call   200f78 <get_pid>
  200fd0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200fd3:	89 42 04             	mov    %eax,0x4(%edx)
  200fd6:	8b 45 08             	mov    0x8(%ebp),%eax
  200fd9:	89 04 24             	mov    %eax,(%esp)
  200fdc:	e8 cc fc ff ff       	call   200cad <strlen>
  200fe1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200fe4:	83 c2 0c             	add    $0xc,%edx
  200fe7:	89 44 24 08          	mov    %eax,0x8(%esp)
  200feb:	8b 45 08             	mov    0x8(%ebp),%eax
  200fee:	89 44 24 04          	mov    %eax,0x4(%esp)
  200ff2:	89 14 24             	mov    %edx,(%esp)
  200ff5:	e8 76 fc ff ff       	call   200c70 <memcpy>
  200ffa:	8b 55 0c             	mov    0xc(%ebp),%edx
  200ffd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201000:	89 50 08             	mov    %edx,0x8(%eax)
  201003:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201006:	05 00 80 00 00       	add    $0x8000,%eax
  20100b:	89 c2                	mov    %eax,%edx
  20100d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201010:	89 10                	mov    %edx,(%eax)
  201012:	8b 55 f0             	mov    -0x10(%ebp),%edx
  201015:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201018:	89 50 1c             	mov    %edx,0x1c(%eax)
  20101b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20101e:	c7 80 0c 80 00 00 28 	movl   $0x28,0x800c(%eax)
  201025:	00 00 00 
  201028:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20102b:	c7 80 34 80 00 00 20 	movl   $0x20,0x8034(%eax)
  201032:	00 00 00 
  201035:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201038:	c7 80 08 80 00 00 28 	movl   $0x28,0x8008(%eax)
  20103f:	00 00 00 
  201042:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201045:	c7 80 04 80 00 00 28 	movl   $0x28,0x8004(%eax)
  20104c:	00 00 00 
  20104f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201052:	c7 80 3c 80 00 00 28 	movl   $0x28,0x803c(%eax)
  201059:	00 00 00 
  20105c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20105f:	c7 80 00 80 00 00 48 	movl   $0x48,0x8000(%eax)
  201066:	00 00 00 
  201069:	8b 55 0c             	mov    0xc(%ebp),%edx
  20106c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20106f:	89 90 30 80 00 00    	mov    %edx,0x8030(%eax)
  201075:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201078:	8b 40 1c             	mov    0x1c(%eax),%eax
  20107b:	89 c2                	mov    %eax,%edx
  20107d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201080:	89 90 38 80 00 00    	mov    %edx,0x8038(%eax)
  201086:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201089:	c7 80 40 80 00 00 02 	movl   $0x1202,0x8040(%eax)
  201090:	12 00 00 
  201093:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201096:	c7 80 44 80 00 00 00 	movl   $0x210000,0x8044(%eax)
  20109d:	00 21 00 
  2010a0:	c7 05 04 80 22 00 00 	movl   $0x210000,0x228004
  2010a7:	00 21 00 
  2010aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2010ad:	c9                   	leave  
  2010ae:	c3                   	ret    

002010af <thread_yield>:
  2010af:	55                   	push   %ebp
  2010b0:	89 e5                	mov    %esp,%ebp
  2010b2:	b8 01 00 00 00       	mov    $0x1,%eax
  2010b7:	cd 80                	int    $0x80
  2010b9:	90                   	nop
  2010ba:	5d                   	pop    %ebp
  2010bb:	c3                   	ret    

002010bc <schedule>:
  2010bc:	55                   	push   %ebp
  2010bd:	89 e5                	mov    %esp,%ebp
  2010bf:	8b 45 08             	mov    0x8(%ebp),%eax
  2010c2:	8b 00                	mov    (%eax),%eax
  2010c4:	89 c4                	mov    %eax,%esp
  2010c6:	e9 05 00 00 00       	jmp    2010d0 <switch_to>
  2010cb:	5d                   	pop    %ebp
  2010cc:	c3                   	ret    
  2010cd:	66 90                	xchg   %ax,%ax
  2010cf:	90                   	nop

002010d0 <switch_to>:
  2010d0:	89 c4                	mov    %eax,%esp
  2010d2:	0f a9                	pop    %gs
  2010d4:	0f a1                	pop    %fs
  2010d6:	07                   	pop    %es
  2010d7:	1f                   	pop    %ds
  2010d8:	61                   	popa   
  2010d9:	cb                   	lret   

002010da <yield>:
  2010da:	83 ec 04             	sub    $0x4,%esp
  2010dd:	50                   	push   %eax
  2010de:	8b 44 24 08          	mov    0x8(%esp),%eax
  2010e2:	89 44 24 04          	mov    %eax,0x4(%esp)
  2010e6:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
  2010ed:	00 
  2010ee:	58                   	pop    %eax
  2010ef:	60                   	pusha  
  2010f0:	1e                   	push   %ds
  2010f1:	06                   	push   %es
  2010f2:	0f a0                	push   %fs
  2010f4:	0f a8                	push   %gs
  2010f6:	a1 04 80 22 00       	mov    0x228004,%eax
  2010fb:	89 20                	mov    %esp,(%eax)
  2010fd:	e8 c2 04 00 00       	call   2015c4 <yield_thread>
  201102:	a1 04 80 22 00       	mov    0x228004,%eax
  201107:	8b 20                	mov    (%eax),%esp
  201109:	0f a9                	pop    %gs
  20110b:	0f a1                	pop    %fs
  20110d:	07                   	pop    %es
  20110e:	1f                   	pop    %ds
  20110f:	61                   	popa   
  201110:	fb                   	sti    
  201111:	cb                   	lret   

00201112 <jump_out_yield>:
  201112:	c3                   	ret    
  201113:	90                   	nop

00201114 <get_memory_info>:
  201114:	55                   	push   %ebp
  201115:	89 e5                	mov    %esp,%ebp
  201117:	83 ec 28             	sub    $0x28,%esp
  20111a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201121:	a1 00 00 10 00       	mov    0x100000,%eax
  201126:	a3 84 80 22 00       	mov    %eax,0x228084
  20112b:	a1 04 00 10 00       	mov    0x100004,%eax
  201130:	a3 88 80 22 00       	mov    %eax,0x228088
  201135:	a1 08 00 10 00       	mov    0x100008,%eax
  20113a:	a3 8c 80 22 00       	mov    %eax,0x22808c
  20113f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201146:	eb 3e                	jmp    201186 <get_memory_info+0x72>
  201148:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20114b:	89 d0                	mov    %edx,%eax
  20114d:	c1 e0 02             	shl    $0x2,%eax
  201150:	01 d0                	add    %edx,%eax
  201152:	c1 e0 02             	shl    $0x2,%eax
  201155:	05 00 80 00 00       	add    $0x8000,%eax
  20115a:	89 c1                	mov    %eax,%ecx
  20115c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20115f:	89 d0                	mov    %edx,%eax
  201161:	c1 e0 02             	shl    $0x2,%eax
  201164:	01 d0                	add    %edx,%eax
  201166:	c1 e0 02             	shl    $0x2,%eax
  201169:	05 20 80 22 00       	add    $0x228020,%eax
  20116e:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  201175:	00 
  201176:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  20117a:	89 04 24             	mov    %eax,(%esp)
  20117d:	e8 ee fa ff ff       	call   200c70 <memcpy>
  201182:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201186:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  20118a:	7e bc                	jle    201148 <get_memory_info+0x34>
  20118c:	90                   	nop
  20118d:	c9                   	leave  
  20118e:	c3                   	ret    
  20118f:	90                   	nop

00201190 <init_page_bit_map>:
  201190:	55                   	push   %ebp
  201191:	89 e5                	mov    %esp,%ebp
  201193:	83 ec 10             	sub    $0x10,%esp
  201196:	a1 0c 40 20 00       	mov    0x20400c,%eax
  20119b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  20119e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2011a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2011ac:	eb 4f                	jmp    2011fd <init_page_bit_map+0x6d>
  2011ae:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2011b1:	89 d0                	mov    %edx,%eax
  2011b3:	c1 e0 02             	shl    $0x2,%eax
  2011b6:	01 d0                	add    %edx,%eax
  2011b8:	c1 e0 02             	shl    $0x2,%eax
  2011bb:	05 30 80 22 00       	add    $0x228030,%eax
  2011c0:	8b 00                	mov    (%eax),%eax
  2011c2:	83 f8 01             	cmp    $0x1,%eax
  2011c5:	75 32                	jne    2011f9 <init_page_bit_map+0x69>
  2011c7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2011ca:	89 d0                	mov    %edx,%eax
  2011cc:	c1 e0 02             	shl    $0x2,%eax
  2011cf:	01 d0                	add    %edx,%eax
  2011d1:	c1 e0 02             	shl    $0x2,%eax
  2011d4:	05 20 80 22 00       	add    $0x228020,%eax
  2011d9:	8b 40 08             	mov    0x8(%eax),%eax
  2011dc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  2011df:	76 18                	jbe    2011f9 <init_page_bit_map+0x69>
  2011e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2011e4:	89 d0                	mov    %edx,%eax
  2011e6:	c1 e0 02             	shl    $0x2,%eax
  2011e9:	01 d0                	add    %edx,%eax
  2011eb:	c1 e0 02             	shl    $0x2,%eax
  2011ee:	05 20 80 22 00       	add    $0x228020,%eax
  2011f3:	8b 40 08             	mov    0x8(%eax),%eax
  2011f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2011f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2011fd:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201200:	a1 8c 80 22 00       	mov    0x22808c,%eax
  201205:	39 c2                	cmp    %eax,%edx
  201207:	72 a5                	jb     2011ae <init_page_bit_map+0x1e>
  201209:	a1 0c 40 20 00       	mov    0x20400c,%eax
  20120e:	29 45 f4             	sub    %eax,-0xc(%ebp)
  201211:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201214:	05 ff 0f 00 00       	add    $0xfff,%eax
  201219:	c1 e8 0c             	shr    $0xc,%eax
  20121c:	a3 a4 89 20 00       	mov    %eax,0x2089a4
  201221:	a1 a4 89 20 00       	mov    0x2089a4,%eax
  201226:	83 c0 07             	add    $0x7,%eax
  201229:	c1 e8 03             	shr    $0x3,%eax
  20122c:	a3 a8 89 20 00       	mov    %eax,0x2089a8
  201231:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201238:	eb 0e                	jmp    201248 <init_page_bit_map+0xb8>
  20123a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20123d:	c6 00 00             	movb   $0x0,(%eax)
  201240:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  201244:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  201248:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20124b:	a1 a8 89 20 00       	mov    0x2089a8,%eax
  201250:	39 c2                	cmp    %eax,%edx
  201252:	72 e6                	jb     20123a <init_page_bit_map+0xaa>
  201254:	a1 0c 40 20 00       	mov    0x20400c,%eax
  201259:	c6 00 80             	movb   $0x80,(%eax)
  20125c:	90                   	nop
  20125d:	c9                   	leave  
  20125e:	c3                   	ret    

0020125f <get_pages>:
  20125f:	55                   	push   %ebp
  201260:	89 e5                	mov    %esp,%ebp
  201262:	83 ec 28             	sub    $0x28,%esp
  201265:	a1 0c 40 20 00       	mov    0x20400c,%eax
  20126a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  20126d:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  201271:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  201275:	76 4b                	jbe    2012c2 <get_pages+0x63>
  201277:	fa                   	cli    
  201278:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20127f:	00 
  201280:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  201287:	00 
  201288:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
  20128f:	00 
  201290:	c7 04 24 b8 1a 20 00 	movl   $0x201ab8,(%esp)
  201297:	e8 d0 f8 ff ff       	call   200b6c <dis_str>
  20129c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2012a3:	00 
  2012a4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2012ab:	00 
  2012ac:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  2012b3:	00 
  2012b4:	c7 04 24 c0 1a 20 00 	movl   $0x201ac0,(%esp)
  2012bb:	e8 ac f8 ff ff       	call   200b6c <dis_str>
  2012c0:	eb fe                	jmp    2012c0 <get_pages+0x61>
  2012c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2012c9:	eb 10                	jmp    2012db <get_pages+0x7c>
  2012cb:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2012cf:	01 c0                	add    %eax,%eax
  2012d1:	83 c8 01             	or     $0x1,%eax
  2012d4:	88 45 ef             	mov    %al,-0x11(%ebp)
  2012d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2012db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2012de:	3b 45 08             	cmp    0x8(%ebp),%eax
  2012e1:	72 e8                	jb     2012cb <get_pages+0x6c>
  2012e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2012ea:	eb 60                	jmp    20134c <get_pages+0xed>
  2012ec:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2012f3:	eb 46                	jmp    20133b <get_pages+0xdc>
  2012f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2012f8:	0f b6 00             	movzbl (%eax),%eax
  2012fb:	22 45 ef             	and    -0x11(%ebp),%al
  2012fe:	84 c0                	test   %al,%al
  201300:	75 32                	jne    201334 <get_pages+0xd5>
  201302:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201305:	0f b6 00             	movzbl (%eax),%eax
  201308:	0a 45 ef             	or     -0x11(%ebp),%al
  20130b:	89 c2                	mov    %eax,%edx
  20130d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201310:	88 10                	mov    %dl,(%eax)
  201312:	8b 15 0c 40 20 00    	mov    0x20400c,%edx
  201318:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20131b:	c1 e0 03             	shl    $0x3,%eax
  20131e:	89 c1                	mov    %eax,%ecx
  201320:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201323:	f7 d8                	neg    %eax
  201325:	2b 45 08             	sub    0x8(%ebp),%eax
  201328:	01 c8                	add    %ecx,%eax
  20132a:	83 c0 08             	add    $0x8,%eax
  20132d:	c1 e0 0c             	shl    $0xc,%eax
  201330:	01 d0                	add    %edx,%eax
  201332:	eb 29                	jmp    20135d <get_pages+0xfe>
  201334:	d0 65 ef             	shlb   -0x11(%ebp)
  201337:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  20133b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20133e:	8b 45 08             	mov    0x8(%ebp),%eax
  201341:	01 d0                	add    %edx,%eax
  201343:	83 f8 07             	cmp    $0x7,%eax
  201346:	76 ad                	jbe    2012f5 <get_pages+0x96>
  201348:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  20134c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20134f:	a1 a8 89 20 00       	mov    0x2089a8,%eax
  201354:	39 c2                	cmp    %eax,%edx
  201356:	72 94                	jb     2012ec <get_pages+0x8d>
  201358:	b8 00 00 00 00       	mov    $0x0,%eax
  20135d:	c9                   	leave  
  20135e:	c3                   	ret    

0020135f <free_pages>:
  20135f:	55                   	push   %ebp
  201360:	89 e5                	mov    %esp,%ebp
  201362:	53                   	push   %ebx
  201363:	83 ec 10             	sub    $0x10,%esp
  201366:	a1 0c 40 20 00       	mov    0x20400c,%eax
  20136b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20136e:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  201372:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  201379:	eb 10                	jmp    20138b <free_pages+0x2c>
  20137b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  20137f:	01 c0                	add    %eax,%eax
  201381:	83 c8 01             	or     $0x1,%eax
  201384:	88 45 f7             	mov    %al,-0x9(%ebp)
  201387:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  20138b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20138e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  201391:	72 e8                	jb     20137b <free_pages+0x1c>
  201393:	8b 55 08             	mov    0x8(%ebp),%edx
  201396:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201399:	29 c2                	sub    %eax,%edx
  20139b:	89 d0                	mov    %edx,%eax
  20139d:	c1 f8 0c             	sar    $0xc,%eax
  2013a0:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  2013a6:	85 c0                	test   %eax,%eax
  2013a8:	0f 48 c2             	cmovs  %edx,%eax
  2013ab:	c1 f8 0c             	sar    $0xc,%eax
  2013ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2013b1:	0f b6 5d f7          	movzbl -0x9(%ebp),%ebx
  2013b5:	8b 55 08             	mov    0x8(%ebp),%edx
  2013b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2013bb:	29 c2                	sub    %eax,%edx
  2013bd:	89 d0                	mov    %edx,%eax
  2013bf:	c1 f8 0c             	sar    $0xc,%eax
  2013c2:	89 c2                	mov    %eax,%edx
  2013c4:	89 d0                	mov    %edx,%eax
  2013c6:	c1 f8 1f             	sar    $0x1f,%eax
  2013c9:	c1 e8 1d             	shr    $0x1d,%eax
  2013cc:	01 c2                	add    %eax,%edx
  2013ce:	83 e2 07             	and    $0x7,%edx
  2013d1:	29 c2                	sub    %eax,%edx
  2013d3:	89 d0                	mov    %edx,%eax
  2013d5:	f7 d8                	neg    %eax
  2013d7:	2b 45 0c             	sub    0xc(%ebp),%eax
  2013da:	83 c0 08             	add    $0x8,%eax
  2013dd:	89 c1                	mov    %eax,%ecx
  2013df:	d3 e3                	shl    %cl,%ebx
  2013e1:	89 d8                	mov    %ebx,%eax
  2013e3:	f7 d0                	not    %eax
  2013e5:	88 45 f7             	mov    %al,-0x9(%ebp)
  2013e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2013eb:	01 45 f0             	add    %eax,-0x10(%ebp)
  2013ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2013f1:	0f b6 00             	movzbl (%eax),%eax
  2013f4:	22 45 f7             	and    -0x9(%ebp),%al
  2013f7:	89 c2                	mov    %eax,%edx
  2013f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2013fc:	88 10                	mov    %dl,(%eax)
  2013fe:	90                   	nop
  2013ff:	83 c4 10             	add    $0x10,%esp
  201402:	5b                   	pop    %ebx
  201403:	5d                   	pop    %ebp
  201404:	c3                   	ret    

00201405 <get_page_cnt>:
  201405:	55                   	push   %ebp
  201406:	89 e5                	mov    %esp,%ebp
  201408:	83 ec 10             	sub    $0x10,%esp
  20140b:	c7 45 f8 20 80 22 00 	movl   $0x228020,-0x8(%ebp)
  201412:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  201419:	eb 32                	jmp    20144d <get_page_cnt+0x48>
  20141b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20141e:	89 d0                	mov    %edx,%eax
  201420:	c1 e0 02             	shl    $0x2,%eax
  201423:	01 d0                	add    %edx,%eax
  201425:	c1 e0 02             	shl    $0x2,%eax
  201428:	05 30 80 22 00       	add    $0x228030,%eax
  20142d:	8b 00                	mov    (%eax),%eax
  20142f:	83 f8 01             	cmp    $0x1,%eax
  201432:	75 15                	jne    201449 <get_page_cnt+0x44>
  201434:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201437:	89 d0                	mov    %edx,%eax
  201439:	c1 e0 02             	shl    $0x2,%eax
  20143c:	01 d0                	add    %edx,%eax
  20143e:	c1 e0 02             	shl    $0x2,%eax
  201441:	05 20 80 22 00       	add    $0x228020,%eax
  201446:	89 45 f8             	mov    %eax,-0x8(%ebp)
  201449:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  20144d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  201450:	a1 8c 80 22 00       	mov    0x22808c,%eax
  201455:	39 c2                	cmp    %eax,%edx
  201457:	72 c2                	jb     20141b <get_page_cnt+0x16>
  201459:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20145c:	8b 10                	mov    (%eax),%edx
  20145e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  201461:	8b 40 08             	mov    0x8(%eax),%eax
  201464:	01 d0                	add    %edx,%eax
  201466:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201469:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20146c:	05 ff 0f 00 00       	add    $0xfff,%eax
  201471:	c1 e8 0c             	shr    $0xc,%eax
  201474:	c9                   	leave  
  201475:	c3                   	ret    

00201476 <get_ptet_cnt>:
  201476:	55                   	push   %ebp
  201477:	89 e5                	mov    %esp,%ebp
  201479:	8b 45 08             	mov    0x8(%ebp),%eax
  20147c:	05 ff 03 00 00       	add    $0x3ff,%eax
  201481:	c1 e8 0a             	shr    $0xa,%eax
  201484:	5d                   	pop    %ebp
  201485:	c3                   	ret    

00201486 <set_page>:
  201486:	55                   	push   %ebp
  201487:	89 e5                	mov    %esp,%ebp
  201489:	83 ec 34             	sub    $0x34,%esp
  20148c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  201493:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  20149a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  2014a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2014a8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2014af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2014b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2014bd:	e8 43 ff ff ff       	call   201405 <get_page_cnt>
  2014c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2014c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2014c8:	89 04 24             	mov    %eax,(%esp)
  2014cb:	e8 a6 ff ff ff       	call   201476 <get_ptet_cnt>
  2014d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2014d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2014d6:	89 04 24             	mov    %eax,(%esp)
  2014d9:	e8 98 ff ff ff       	call   201476 <get_ptet_cnt>
  2014de:	89 45 dc             	mov    %eax,-0x24(%ebp)
  2014e1:	c7 45 f0 00 00 10 00 	movl   $0x100000,-0x10(%ebp)
  2014e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2014eb:	89 45 d8             	mov    %eax,-0x28(%ebp)
  2014ee:	c7 45 ec 00 10 10 00 	movl   $0x101000,-0x14(%ebp)
  2014f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2014fc:	eb 6c                	jmp    20156a <set_page+0xe4>
  2014fe:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  201505:	eb 50                	jmp    201557 <set_page+0xd1>
  201507:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20150a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  20150f:	83 c8 07             	or     $0x7,%eax
  201512:	89 c1                	mov    %eax,%ecx
  201514:	8b 45 f0             	mov    -0x10(%ebp),%eax
  201517:	8b 55 f8             	mov    -0x8(%ebp),%edx
  20151a:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  20151d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  201524:	eb 1c                	jmp    201542 <set_page+0xbc>
  201526:	8b 45 e8             	mov    -0x18(%ebp),%eax
  201529:	83 c8 07             	or     $0x7,%eax
  20152c:	89 c1                	mov    %eax,%ecx
  20152e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  201531:	8b 55 f4             	mov    -0xc(%ebp),%edx
  201534:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  201537:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
  20153e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  201542:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201545:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  20154a:	76 da                	jbe    201526 <set_page+0xa0>
  20154c:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  201553:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  201557:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20155a:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  20155d:	7c a8                	jl     201507 <set_page+0x81>
  20155f:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  201566:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  20156a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20156d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  201570:	7c 8c                	jl     2014fe <set_page+0x78>
  201572:	8b 45 d8             	mov    -0x28(%ebp),%eax
  201575:	0f 22 d8             	mov    %eax,%cr3
  201578:	0f 20 c0             	mov    %cr0,%eax
  20157b:	0d 00 00 00 80       	or     $0x80000000,%eax
  201580:	0f 22 c0             	mov    %eax,%cr0
  201583:	e8 08 fc ff ff       	call   201190 <init_page_bit_map>
  201588:	90                   	nop
  201589:	c9                   	leave  
  20158a:	c3                   	ret    
  20158b:	90                   	nop

0020158c <sys_entry>:
  20158c:	60                   	pusha  
  20158d:	1e                   	push   %ds
  20158e:	06                   	push   %es
  20158f:	0f a0                	push   %fs
  201591:	0f a8                	push   %gs
  201593:	fb                   	sti    
  201594:	57                   	push   %edi
  201595:	56                   	push   %esi
  201596:	52                   	push   %edx
  201597:	51                   	push   %ecx
  201598:	53                   	push   %ebx
  201599:	50                   	push   %eax
  20159a:	e8 61 00 00 00       	call   201600 <syscall_handler>
  20159f:	83 c4 18             	add    $0x18,%esp
  2015a2:	0f a9                	pop    %gs
  2015a4:	0f a1                	pop    %fs
  2015a6:	07                   	pop    %es
  2015a7:	1f                   	pop    %ds
  2015a8:	61                   	popa   
  2015a9:	8b 04 24             	mov    (%esp),%eax
  2015ac:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  2015b0:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  2015b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  2015b8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  2015bc:	89 0c 24             	mov    %ecx,(%esp)
  2015bf:	9d                   	popf   
  2015c0:	cb                   	lret   
  2015c1:	66 90                	xchg   %ax,%ax
  2015c3:	90                   	nop

002015c4 <yield_thread>:
  2015c4:	55                   	push   %ebp
  2015c5:	89 e5                	mov    %esp,%ebp
  2015c7:	83 ec 18             	sub    $0x18,%esp
  2015ca:	a1 00 80 22 00       	mov    0x228000,%eax
  2015cf:	83 e8 20             	sub    $0x20,%eax
  2015d2:	a3 14 80 22 00       	mov    %eax,0x228014
  2015d7:	a1 00 80 22 00       	mov    0x228000,%eax
  2015dc:	8b 00                	mov    (%eax),%eax
  2015de:	a3 00 80 22 00       	mov    %eax,0x228000
  2015e3:	a1 14 80 22 00       	mov    0x228014,%eax
  2015e8:	83 c0 20             	add    $0x20,%eax
  2015eb:	89 04 24             	mov    %eax,(%esp)
  2015ee:	e8 e6 00 00 00       	call   2016d9 <list_del>
  2015f3:	a1 14 80 22 00       	mov    0x228014,%eax
  2015f8:	a3 04 80 22 00       	mov    %eax,0x228004
  2015fd:	90                   	nop
  2015fe:	c9                   	leave  
  2015ff:	c3                   	ret    

00201600 <syscall_handler>:
  201600:	55                   	push   %ebp
  201601:	89 e5                	mov    %esp,%ebp
  201603:	83 ec 18             	sub    $0x18,%esp
  201606:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  20160d:	00 
  20160e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  201615:	00 
  201616:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
  20161d:	00 
  20161e:	c7 04 24 e8 1a 20 00 	movl   $0x201ae8,(%esp)
  201625:	e8 42 f5 ff ff       	call   200b6c <dis_str>
  20162a:	8b 45 08             	mov    0x8(%ebp),%eax
  20162d:	83 f8 01             	cmp    $0x1,%eax
  201630:	74 02                	je     201634 <syscall_handler+0x34>
  201632:	eb 06                	jmp    20163a <syscall_handler+0x3a>
  201634:	e8 a1 fa ff ff       	call   2010da <yield>
  201639:	90                   	nop
  20163a:	90                   	nop
  20163b:	c9                   	leave  
  20163c:	c3                   	ret    
  20163d:	66 90                	xchg   %ax,%ax
  20163f:	90                   	nop

00201640 <INIT_LIST_HEAD>:
  201640:	55                   	push   %ebp
  201641:	89 e5                	mov    %esp,%ebp
  201643:	8b 45 08             	mov    0x8(%ebp),%eax
  201646:	8b 55 08             	mov    0x8(%ebp),%edx
  201649:	89 50 04             	mov    %edx,0x4(%eax)
  20164c:	8b 45 08             	mov    0x8(%ebp),%eax
  20164f:	8b 55 08             	mov    0x8(%ebp),%edx
  201652:	89 10                	mov    %edx,(%eax)
  201654:	5d                   	pop    %ebp
  201655:	c3                   	ret    

00201656 <__list_add>:
  201656:	55                   	push   %ebp
  201657:	89 e5                	mov    %esp,%ebp
  201659:	8b 45 10             	mov    0x10(%ebp),%eax
  20165c:	8b 55 08             	mov    0x8(%ebp),%edx
  20165f:	89 50 04             	mov    %edx,0x4(%eax)
  201662:	8b 45 08             	mov    0x8(%ebp),%eax
  201665:	8b 55 10             	mov    0x10(%ebp),%edx
  201668:	89 10                	mov    %edx,(%eax)
  20166a:	8b 45 08             	mov    0x8(%ebp),%eax
  20166d:	8b 55 0c             	mov    0xc(%ebp),%edx
  201670:	89 50 04             	mov    %edx,0x4(%eax)
  201673:	8b 45 0c             	mov    0xc(%ebp),%eax
  201676:	8b 55 08             	mov    0x8(%ebp),%edx
  201679:	89 10                	mov    %edx,(%eax)
  20167b:	5d                   	pop    %ebp
  20167c:	c3                   	ret    

0020167d <list_add>:
  20167d:	55                   	push   %ebp
  20167e:	89 e5                	mov    %esp,%ebp
  201680:	83 ec 0c             	sub    $0xc,%esp
  201683:	8b 45 0c             	mov    0xc(%ebp),%eax
  201686:	8b 00                	mov    (%eax),%eax
  201688:	89 44 24 08          	mov    %eax,0x8(%esp)
  20168c:	8b 45 0c             	mov    0xc(%ebp),%eax
  20168f:	89 44 24 04          	mov    %eax,0x4(%esp)
  201693:	8b 45 08             	mov    0x8(%ebp),%eax
  201696:	89 04 24             	mov    %eax,(%esp)
  201699:	e8 b8 ff ff ff       	call   201656 <__list_add>
  20169e:	c9                   	leave  
  20169f:	c3                   	ret    

002016a0 <list_add_tail>:
  2016a0:	55                   	push   %ebp
  2016a1:	89 e5                	mov    %esp,%ebp
  2016a3:	83 ec 0c             	sub    $0xc,%esp
  2016a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  2016a9:	8b 00                	mov    (%eax),%eax
  2016ab:	89 44 24 08          	mov    %eax,0x8(%esp)
  2016af:	8b 45 0c             	mov    0xc(%ebp),%eax
  2016b2:	89 44 24 04          	mov    %eax,0x4(%esp)
  2016b6:	8b 45 08             	mov    0x8(%ebp),%eax
  2016b9:	89 04 24             	mov    %eax,(%esp)
  2016bc:	e8 95 ff ff ff       	call   201656 <__list_add>
  2016c1:	c9                   	leave  
  2016c2:	c3                   	ret    

002016c3 <__list_del>:
  2016c3:	55                   	push   %ebp
  2016c4:	89 e5                	mov    %esp,%ebp
  2016c6:	8b 45 08             	mov    0x8(%ebp),%eax
  2016c9:	8b 55 0c             	mov    0xc(%ebp),%edx
  2016cc:	89 10                	mov    %edx,(%eax)
  2016ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  2016d1:	8b 55 08             	mov    0x8(%ebp),%edx
  2016d4:	89 50 04             	mov    %edx,0x4(%eax)
  2016d7:	5d                   	pop    %ebp
  2016d8:	c3                   	ret    

002016d9 <list_del>:
  2016d9:	55                   	push   %ebp
  2016da:	89 e5                	mov    %esp,%ebp
  2016dc:	83 ec 08             	sub    $0x8,%esp
  2016df:	8b 45 08             	mov    0x8(%ebp),%eax
  2016e2:	8b 10                	mov    (%eax),%edx
  2016e4:	8b 45 08             	mov    0x8(%ebp),%eax
  2016e7:	8b 40 04             	mov    0x4(%eax),%eax
  2016ea:	89 54 24 04          	mov    %edx,0x4(%esp)
  2016ee:	89 04 24             	mov    %eax,(%esp)
  2016f1:	e8 cd ff ff ff       	call   2016c3 <__list_del>
  2016f6:	8b 45 08             	mov    0x8(%ebp),%eax
  2016f9:	89 04 24             	mov    %eax,(%esp)
  2016fc:	e8 3f ff ff ff       	call   201640 <INIT_LIST_HEAD>
  201701:	c9                   	leave  
  201702:	c3                   	ret    

00201703 <list_replace>:
  201703:	55                   	push   %ebp
  201704:	89 e5                	mov    %esp,%ebp
  201706:	83 ec 04             	sub    $0x4,%esp
  201709:	8b 45 0c             	mov    0xc(%ebp),%eax
  20170c:	8b 10                	mov    (%eax),%edx
  20170e:	8b 45 08             	mov    0x8(%ebp),%eax
  201711:	89 10                	mov    %edx,(%eax)
  201713:	8b 45 08             	mov    0x8(%ebp),%eax
  201716:	8b 00                	mov    (%eax),%eax
  201718:	8b 55 08             	mov    0x8(%ebp),%edx
  20171b:	89 50 04             	mov    %edx,0x4(%eax)
  20171e:	8b 45 0c             	mov    0xc(%ebp),%eax
  201721:	8b 50 04             	mov    0x4(%eax),%edx
  201724:	8b 45 08             	mov    0x8(%ebp),%eax
  201727:	89 50 04             	mov    %edx,0x4(%eax)
  20172a:	8b 45 08             	mov    0x8(%ebp),%eax
  20172d:	8b 40 04             	mov    0x4(%eax),%eax
  201730:	8b 55 08             	mov    0x8(%ebp),%edx
  201733:	89 10                	mov    %edx,(%eax)
  201735:	8b 45 0c             	mov    0xc(%ebp),%eax
  201738:	89 04 24             	mov    %eax,(%esp)
  20173b:	e8 00 ff ff ff       	call   201640 <INIT_LIST_HEAD>
  201740:	c9                   	leave  
  201741:	c3                   	ret    
  201742:	66 90                	xchg   %ax,%ax

00201744 <outb>:
  201744:	55                   	push   %ebp
  201745:	89 e5                	mov    %esp,%ebp
  201747:	83 ec 08             	sub    $0x8,%esp
  20174a:	8b 55 08             	mov    0x8(%ebp),%edx
  20174d:	8b 45 0c             	mov    0xc(%ebp),%eax
  201750:	88 55 fc             	mov    %dl,-0x4(%ebp)
  201753:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  201757:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20175b:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  20175f:	ee                   	out    %al,(%dx)
  201760:	c9                   	leave  
  201761:	c3                   	ret    

00201762 <io_delay>:
  201762:	55                   	push   %ebp
  201763:	89 e5                	mov    %esp,%ebp
  201765:	83 ec 10             	sub    $0x10,%esp
  201768:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  20176e:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  201772:	89 c2                	mov    %eax,%edx
  201774:	ee                   	out    %al,(%dx)
  201775:	c9                   	leave  
  201776:	c3                   	ret    

00201777 <outb_pic>:
  201777:	55                   	push   %ebp
  201778:	89 e5                	mov    %esp,%ebp
  20177a:	83 ec 0c             	sub    $0xc,%esp
  20177d:	8b 45 08             	mov    0x8(%ebp),%eax
  201780:	88 45 fc             	mov    %al,-0x4(%ebp)
  201783:	8b 45 0c             	mov    0xc(%ebp),%eax
  201786:	0f b7 d0             	movzwl %ax,%edx
  201789:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20178d:	89 54 24 04          	mov    %edx,0x4(%esp)
  201791:	89 04 24             	mov    %eax,(%esp)
  201794:	e8 ab ff ff ff       	call   201744 <outb>
  201799:	e8 c4 ff ff ff       	call   201762 <io_delay>
  20179e:	c9                   	leave  
  20179f:	c3                   	ret    

002017a0 <init_8253>:
  2017a0:	55                   	push   %ebp
  2017a1:	89 e5                	mov    %esp,%ebp
  2017a3:	83 ec 08             	sub    $0x8,%esp
  2017a6:	c7 44 24 04 43 00 00 	movl   $0x43,0x4(%esp)
  2017ad:	00 
  2017ae:	c7 04 24 34 00 00 00 	movl   $0x34,(%esp)
  2017b5:	e8 bd ff ff ff       	call   201777 <outb_pic>
  2017ba:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
  2017c1:	00 
  2017c2:	c7 04 24 9b 00 00 00 	movl   $0x9b,(%esp)
  2017c9:	e8 a9 ff ff ff       	call   201777 <outb_pic>
  2017ce:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
  2017d5:	00 
  2017d6:	c7 04 24 2e 00 00 00 	movl   $0x2e,(%esp)
  2017dd:	e8 95 ff ff ff       	call   201777 <outb_pic>
  2017e2:	90                   	nop
  2017e3:	c9                   	leave  
  2017e4:	c3                   	ret    
  2017e5:	66 90                	xchg   %ax,%ax
  2017e7:	90                   	nop

002017e8 <get_lock>:
  2017e8:	55                   	push   %ebp
  2017e9:	89 e5                	mov    %esp,%ebp
  2017eb:	83 ec 18             	sub    $0x18,%esp
  2017ee:	8b 45 08             	mov    0x8(%ebp),%eax
  2017f1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  2017f7:	8b 45 08             	mov    0x8(%ebp),%eax
  2017fa:	83 c0 04             	add    $0x4,%eax
  2017fd:	89 04 24             	mov    %eax,(%esp)
  201800:	e8 3b fe ff ff       	call   201640 <INIT_LIST_HEAD>
  201805:	90                   	nop
  201806:	c9                   	leave  
  201807:	c3                   	ret    

00201808 <lock_acquire>:
  201808:	55                   	push   %ebp
  201809:	89 e5                	mov    %esp,%ebp
  20180b:	83 ec 18             	sub    $0x18,%esp
  20180e:	eb 22                	jmp    201832 <lock_acquire+0x2a>
  201810:	fa                   	cli    
  201811:	8b 45 08             	mov    0x8(%ebp),%eax
  201814:	8b 40 08             	mov    0x8(%eax),%eax
  201817:	8b 15 04 80 22 00    	mov    0x228004,%edx
  20181d:	83 c2 20             	add    $0x20,%edx
  201820:	89 44 24 04          	mov    %eax,0x4(%esp)
  201824:	89 14 24             	mov    %edx,(%esp)
  201827:	e8 74 fe ff ff       	call   2016a0 <list_add_tail>
  20182c:	fb                   	sti    
  20182d:	e8 7d f8 ff ff       	call   2010af <thread_yield>
  201832:	8b 45 08             	mov    0x8(%ebp),%eax
  201835:	8b 00                	mov    (%eax),%eax
  201837:	85 c0                	test   %eax,%eax
  201839:	78 d5                	js     201810 <lock_acquire+0x8>
  20183b:	8b 45 08             	mov    0x8(%ebp),%eax
  20183e:	8b 00                	mov    (%eax),%eax
  201840:	8d 50 ff             	lea    -0x1(%eax),%edx
  201843:	8b 45 08             	mov    0x8(%ebp),%eax
  201846:	89 10                	mov    %edx,(%eax)
  201848:	90                   	nop
  201849:	c9                   	leave  
  20184a:	c3                   	ret    

0020184b <lock_realse>:
  20184b:	55                   	push   %ebp
  20184c:	89 e5                	mov    %esp,%ebp
  20184e:	83 ec 28             	sub    $0x28,%esp
  201851:	8b 45 08             	mov    0x8(%ebp),%eax
  201854:	8b 00                	mov    (%eax),%eax
  201856:	8d 50 01             	lea    0x1(%eax),%edx
  201859:	8b 45 08             	mov    0x8(%ebp),%eax
  20185c:	89 10                	mov    %edx,(%eax)
  20185e:	8b 45 08             	mov    0x8(%ebp),%eax
  201861:	8b 00                	mov    (%eax),%eax
  201863:	85 c0                	test   %eax,%eax
  201865:	78 2b                	js     201892 <lock_realse+0x47>
  201867:	8b 45 08             	mov    0x8(%ebp),%eax
  20186a:	8b 40 04             	mov    0x4(%eax),%eax
  20186d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  201870:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201873:	89 04 24             	mov    %eax,(%esp)
  201876:	e8 5e fe ff ff       	call   2016d9 <list_del>
  20187b:	a1 00 80 22 00       	mov    0x228000,%eax
  201880:	8b 40 04             	mov    0x4(%eax),%eax
  201883:	89 44 24 04          	mov    %eax,0x4(%esp)
  201887:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20188a:	89 04 24             	mov    %eax,(%esp)
  20188d:	e8 0e fe ff ff       	call   2016a0 <list_add_tail>
  201892:	90                   	nop
  201893:	c9                   	leave  
  201894:	c3                   	ret    

00201895 <get_sema>:
  201895:	55                   	push   %ebp
  201896:	89 e5                	mov    %esp,%ebp
  201898:	83 ec 18             	sub    $0x18,%esp
  20189b:	8b 55 0c             	mov    0xc(%ebp),%edx
  20189e:	8b 45 08             	mov    0x8(%ebp),%eax
  2018a1:	89 10                	mov    %edx,(%eax)
  2018a3:	8b 45 08             	mov    0x8(%ebp),%eax
  2018a6:	83 c0 04             	add    $0x4,%eax
  2018a9:	89 04 24             	mov    %eax,(%esp)
  2018ac:	e8 8f fd ff ff       	call   201640 <INIT_LIST_HEAD>
  2018b1:	90                   	nop
  2018b2:	c9                   	leave  
  2018b3:	c3                   	ret    

002018b4 <sema_acquire>:
  2018b4:	55                   	push   %ebp
  2018b5:	89 e5                	mov    %esp,%ebp
  2018b7:	83 ec 18             	sub    $0x18,%esp
  2018ba:	eb 21                	jmp    2018dd <sema_acquire+0x29>
  2018bc:	fa                   	cli    
  2018bd:	8b 45 08             	mov    0x8(%ebp),%eax
  2018c0:	8b 40 08             	mov    0x8(%eax),%eax
  2018c3:	8b 15 04 80 22 00    	mov    0x228004,%edx
  2018c9:	83 c2 20             	add    $0x20,%edx
  2018cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  2018d0:	89 14 24             	mov    %edx,(%esp)
  2018d3:	e8 c8 fd ff ff       	call   2016a0 <list_add_tail>
  2018d8:	e8 d2 f7 ff ff       	call   2010af <thread_yield>
  2018dd:	8b 45 08             	mov    0x8(%ebp),%eax
  2018e0:	8b 00                	mov    (%eax),%eax
  2018e2:	85 c0                	test   %eax,%eax
  2018e4:	78 d6                	js     2018bc <sema_acquire+0x8>
  2018e6:	8b 45 08             	mov    0x8(%ebp),%eax
  2018e9:	8b 00                	mov    (%eax),%eax
  2018eb:	8d 50 ff             	lea    -0x1(%eax),%edx
  2018ee:	8b 45 08             	mov    0x8(%ebp),%eax
  2018f1:	89 10                	mov    %edx,(%eax)
  2018f3:	90                   	nop
  2018f4:	c9                   	leave  
  2018f5:	c3                   	ret    

002018f6 <sema_realse>:
  2018f6:	55                   	push   %ebp
  2018f7:	89 e5                	mov    %esp,%ebp
  2018f9:	83 ec 28             	sub    $0x28,%esp
  2018fc:	8b 45 08             	mov    0x8(%ebp),%eax
  2018ff:	8b 00                	mov    (%eax),%eax
  201901:	8d 50 01             	lea    0x1(%eax),%edx
  201904:	8b 45 08             	mov    0x8(%ebp),%eax
  201907:	89 10                	mov    %edx,(%eax)
  201909:	8b 45 08             	mov    0x8(%ebp),%eax
  20190c:	8b 00                	mov    (%eax),%eax
  20190e:	85 c0                	test   %eax,%eax
  201910:	78 2b                	js     20193d <sema_realse+0x47>
  201912:	8b 45 08             	mov    0x8(%ebp),%eax
  201915:	8b 40 04             	mov    0x4(%eax),%eax
  201918:	89 45 f4             	mov    %eax,-0xc(%ebp)
  20191b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20191e:	89 04 24             	mov    %eax,(%esp)
  201921:	e8 b3 fd ff ff       	call   2016d9 <list_del>
  201926:	a1 00 80 22 00       	mov    0x228000,%eax
  20192b:	8b 40 04             	mov    0x4(%eax),%eax
  20192e:	89 44 24 04          	mov    %eax,0x4(%esp)
  201932:	8b 45 f4             	mov    -0xc(%ebp),%eax
  201935:	89 04 24             	mov    %eax,(%esp)
  201938:	e8 63 fd ff ff       	call   2016a0 <list_add_tail>
  20193d:	90                   	nop
  20193e:	c9                   	leave  
  20193f:	c3                   	ret    
