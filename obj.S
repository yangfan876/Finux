
vmFinux.kernel:     file format elf32-i386


Disassembly of section .text:

00200000 <kernel_start>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 1d 00 00 00       	call   200028 <change_gdt>
  20000b:	eb fe                	jmp    20000b <kernel_start+0xb>

0020000d <start_kernel>:
  20000d:	55                   	push   %ebp
  20000e:	89 e5                	mov    %esp,%ebp
  200010:	83 ec 08             	sub    $0x8,%esp
  200013:	bc ff ff 1f 00       	mov    $0x1fffff,%esp
  200018:	89 e5                	mov    %esp,%ebp
  20001a:	e8 19 03 00 00       	call   200338 <disable_irqs>
  20001f:	e8 da 00 00 00       	call   2000fe <sti>
  200024:	eb fe                	jmp    200024 <start_kernel+0x17>
  200026:	66 90                	xchg   %ax,%ax

00200028 <change_gdt>:
  200028:	55                   	push   %ebp
  200029:	89 e5                	mov    %esp,%ebp
  20002b:	53                   	push   %ebx
  20002c:	83 ec 10             	sub    $0x10,%esp
  20002f:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  200035:	66 c7 45 f8 28 00    	movw   $0x28,-0x8(%ebp)
  20003b:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
  200041:	c7 05 20 20 20 00 ff 	movl   $0xffff,0x202020
  200048:	ff 00 00 
  20004b:	c7 05 24 20 20 00 00 	movl   $0xcf9b00,0x202024
  200052:	9b cf 00 
  200055:	c7 05 28 20 20 00 ff 	movl   $0xffff,0x202028
  20005c:	ff 00 00 
  20005f:	c7 05 2c 20 20 00 00 	movl   $0xcf9300,0x20202c
  200066:	93 cf 00 
  200069:	c7 05 30 20 20 00 ff 	movl   $0xffff,0x202030
  200070:	ff 00 00 
  200073:	c7 05 34 20 20 00 00 	movl   $0xcffa00,0x202034
  20007a:	fa cf 00 
  20007d:	c7 05 38 20 20 00 ff 	movl   $0xffff,0x202038
  200084:	ff 00 00 
  200087:	c7 05 3c 20 20 00 00 	movl   $0xcff200,0x20203c
  20008e:	f2 cf 00 
  200091:	c7 05 40 20 20 00 00 	movl   $0x0,0x202040
  200098:	00 00 00 
  20009b:	c7 05 44 20 20 00 00 	movl   $0x9200,0x202044
  2000a2:	92 00 00 
  2000a5:	c7 05 48 20 20 00 ff 	movl   $0x8000ffff,0x202048
  2000ac:	ff 00 80 
  2000af:	c7 05 4c 20 20 00 0b 	movl   $0x930b,0x20204c
  2000b6:	93 00 00 
  2000b9:	66 c7 05 00 21 20 00 	movw   $0xff,0x202100
  2000c0:	ff 00 
  2000c2:	b8 00 20 20 00       	mov    $0x202000,%eax
  2000c7:	a3 02 21 20 00       	mov    %eax,0x202102
  2000cc:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  2000d0:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  2000d4:	0f b7 4d f6          	movzwl -0xa(%ebp),%ecx
  2000d8:	89 d3                	mov    %edx,%ebx
  2000da:	0f 01 15 00 21 20 00 	lgdtl  0x202100
  2000e1:	8e db                	mov    %ebx,%ds
  2000e3:	8e c3                	mov    %ebx,%es
  2000e5:	8e e3                	mov    %ebx,%fs
  2000e7:	8e e9                	mov    %ecx,%gs
  2000e9:	ea 0d 00 20 00 20 00 	ljmp   $0x20,$0x20000d
  2000f0:	90                   	nop
  2000f1:	83 c4 10             	add    $0x10,%esp
  2000f4:	5b                   	pop    %ebx
  2000f5:	5d                   	pop    %ebp
  2000f6:	c3                   	ret    
  2000f7:	90                   	nop

002000f8 <cli>:
  2000f8:	55                   	push   %ebp
  2000f9:	89 e5                	mov    %esp,%ebp
  2000fb:	fa                   	cli    
  2000fc:	5d                   	pop    %ebp
  2000fd:	c3                   	ret    

002000fe <sti>:
  2000fe:	55                   	push   %ebp
  2000ff:	89 e5                	mov    %esp,%ebp
  200101:	fb                   	sti    
  200102:	5d                   	pop    %ebp
  200103:	c3                   	ret    

00200104 <outb>:
  200104:	55                   	push   %ebp
  200105:	89 e5                	mov    %esp,%ebp
  200107:	83 ec 08             	sub    $0x8,%esp
  20010a:	8b 55 08             	mov    0x8(%ebp),%edx
  20010d:	8b 45 0c             	mov    0xc(%ebp),%eax
  200110:	88 55 fc             	mov    %dl,-0x4(%ebp)
  200113:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  200117:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20011b:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  20011f:	ee                   	out    %al,(%dx)
  200120:	c9                   	leave  
  200121:	c3                   	ret    

00200122 <inb>:
  200122:	55                   	push   %ebp
  200123:	89 e5                	mov    %esp,%ebp
  200125:	83 ec 14             	sub    $0x14,%esp
  200128:	8b 45 08             	mov    0x8(%ebp),%eax
  20012b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  20012f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  200133:	89 c2                	mov    %eax,%edx
  200135:	ec                   	in     (%dx),%al
  200136:	88 45 ff             	mov    %al,-0x1(%ebp)
  200139:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  20013d:	c9                   	leave  
  20013e:	c3                   	ret    

0020013f <io_delay>:
  20013f:	55                   	push   %ebp
  200140:	89 e5                	mov    %esp,%ebp
  200142:	83 ec 10             	sub    $0x10,%esp
  200145:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  20014b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  20014f:	89 c2                	mov    %eax,%edx
  200151:	ee                   	out    %al,(%dx)
  200152:	c9                   	leave  
  200153:	c3                   	ret    

00200154 <outb_pic>:
  200154:	55                   	push   %ebp
  200155:	89 e5                	mov    %esp,%ebp
  200157:	83 ec 0c             	sub    $0xc,%esp
  20015a:	8b 45 08             	mov    0x8(%ebp),%eax
  20015d:	88 45 fc             	mov    %al,-0x4(%ebp)
  200160:	8b 45 0c             	mov    0xc(%ebp),%eax
  200163:	0f b7 d0             	movzwl %ax,%edx
  200166:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  20016a:	89 54 24 04          	mov    %edx,0x4(%esp)
  20016e:	89 04 24             	mov    %eax,(%esp)
  200171:	e8 8e ff ff ff       	call   200104 <outb>
  200176:	e8 c4 ff ff ff       	call   20013f <io_delay>
  20017b:	c9                   	leave  
  20017c:	c3                   	ret    

0020017d <inb_pic>:
  20017d:	55                   	push   %ebp
  20017e:	89 e5                	mov    %esp,%ebp
  200180:	83 ec 14             	sub    $0x14,%esp
  200183:	8b 45 08             	mov    0x8(%ebp),%eax
  200186:	0f b7 c0             	movzwl %ax,%eax
  200189:	89 04 24             	mov    %eax,(%esp)
  20018c:	e8 91 ff ff ff       	call   200122 <inb>
  200191:	88 45 ff             	mov    %al,-0x1(%ebp)
  200194:	e8 a6 ff ff ff       	call   20013f <io_delay>
  200199:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  20019d:	c9                   	leave  
  20019e:	c3                   	ret    

0020019f <Init_8259A>:
  20019f:	55                   	push   %ebp
  2001a0:	89 e5                	mov    %esp,%ebp
  2001a2:	83 ec 08             	sub    $0x8,%esp
  2001a5:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  2001ac:	00 
  2001ad:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  2001b4:	e8 9b ff ff ff       	call   200154 <outb_pic>
  2001b9:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  2001c0:	00 
  2001c1:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
  2001c8:	e8 87 ff ff ff       	call   200154 <outb_pic>
  2001cd:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2001d4:	00 
  2001d5:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  2001dc:	e8 73 ff ff ff       	call   200154 <outb_pic>
  2001e1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  2001e8:	00 
  2001e9:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
  2001f0:	e8 5f ff ff ff       	call   200154 <outb_pic>
  2001f5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2001fc:	00 
  2001fd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  200204:	e8 4b ff ff ff       	call   200154 <outb_pic>
  200209:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200210:	00 
  200211:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  200218:	e8 37 ff ff ff       	call   200154 <outb_pic>
  20021d:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200224:	00 
  200225:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  20022c:	e8 23 ff ff ff       	call   200154 <outb_pic>
  200231:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200238:	00 
  200239:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200240:	e8 0f ff ff ff       	call   200154 <outb_pic>
  200245:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  20024c:	00 
  20024d:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200254:	e8 fb fe ff ff       	call   200154 <outb_pic>
  200259:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  200260:	00 
  200261:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
  200268:	e8 e7 fe ff ff       	call   200154 <outb_pic>
  20026d:	90                   	nop
  20026e:	c9                   	leave  
  20026f:	c3                   	ret    

00200270 <enable_irq>:
  200270:	55                   	push   %ebp
  200271:	89 e5                	mov    %esp,%ebp
  200273:	83 ec 18             	sub    $0x18,%esp
  200276:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  20027a:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  20027e:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  200285:	e8 f3 fe ff ff       	call   20017d <inb_pic>
  20028a:	88 45 fd             	mov    %al,-0x3(%ebp)
  20028d:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
  200294:	e8 e4 fe ff ff       	call   20017d <inb_pic>
  200299:	88 45 fc             	mov    %al,-0x4(%ebp)
  20029c:	fa                   	cli    
  20029d:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  2002a1:	7f 35                	jg     2002d8 <enable_irq+0x68>
  2002a3:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  2002a7:	74 2f                	je     2002d8 <enable_irq+0x68>
  2002a9:	8b 45 08             	mov    0x8(%ebp),%eax
  2002ac:	ba 01 00 00 00       	mov    $0x1,%edx
  2002b1:	89 c1                	mov    %eax,%ecx
  2002b3:	d3 e2                	shl    %cl,%edx
  2002b5:	89 d0                	mov    %edx,%eax
  2002b7:	f7 d0                	not    %eax
  2002b9:	89 c2                	mov    %eax,%edx
  2002bb:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  2002bf:	21 d0                	and    %edx,%eax
  2002c1:	88 45 ff             	mov    %al,-0x1(%ebp)
  2002c4:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  2002c8:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  2002cf:	00 
  2002d0:	89 04 24             	mov    %eax,(%esp)
  2002d3:	e8 7c fe ff ff       	call   200154 <outb_pic>
  2002d8:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  2002dc:	7e 56                	jle    200334 <enable_irq+0xc4>
  2002de:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  2002e2:	7f 50                	jg     200334 <enable_irq+0xc4>
  2002e4:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  2002e8:	83 e0 fb             	and    $0xfffffffb,%eax
  2002eb:	88 45 ff             	mov    %al,-0x1(%ebp)
  2002ee:	8b 45 08             	mov    0x8(%ebp),%eax
  2002f1:	83 e8 08             	sub    $0x8,%eax
  2002f4:	ba 01 00 00 00       	mov    $0x1,%edx
  2002f9:	89 c1                	mov    %eax,%ecx
  2002fb:	d3 e2                	shl    %cl,%edx
  2002fd:	89 d0                	mov    %edx,%eax
  2002ff:	f7 d0                	not    %eax
  200301:	89 c2                	mov    %eax,%edx
  200303:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  200307:	21 d0                	and    %edx,%eax
  200309:	88 45 fe             	mov    %al,-0x2(%ebp)
  20030c:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  200310:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
  200317:	00 
  200318:	89 04 24             	mov    %eax,(%esp)
  20031b:	e8 34 fe ff ff       	call   200154 <outb_pic>
  200320:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  200324:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
  20032b:	00 
  20032c:	89 04 24             	mov    %eax,(%esp)
  20032f:	e8 20 fe ff ff       	call   200154 <outb_pic>
  200334:	fb                   	sti    
  200335:	90                   	nop
  200336:	c9                   	leave  
  200337:	c3                   	ret    

00200338 <disable_irqs>:
  200338:	55                   	push   %ebp
  200339:	89 e5                	mov    %esp,%ebp
  20033b:	b0 ff                	mov    $0xff,%al
  20033d:	e6 21                	out    %al,$0x21
  20033f:	e6 a1                	out    %al,$0xa1
  200341:	5d                   	pop    %ebp
  200342:	c3                   	ret    

00200343 <EOI_master>:
  200343:	55                   	push   %ebp
  200344:	89 e5                	mov    %esp,%ebp
  200346:	83 ec 08             	sub    $0x8,%esp
  200349:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  200350:	00 
  200351:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200358:	e8 f7 fd ff ff       	call   200154 <outb_pic>
  20035d:	fb                   	sti    
  20035e:	c9                   	leave  
  20035f:	c3                   	ret    

00200360 <EOI_slave>:
  200360:	55                   	push   %ebp
  200361:	89 e5                	mov    %esp,%ebp
  200363:	83 ec 08             	sub    $0x8,%esp
  200366:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  20036d:	00 
  20036e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200375:	e8 da fd ff ff       	call   200154 <outb_pic>
  20037a:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
  200381:	00 
  200382:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  200389:	e8 c6 fd ff ff       	call   200154 <outb_pic>
  20038e:	fb                   	sti    
  20038f:	c9                   	leave  
  200390:	c3                   	ret    
