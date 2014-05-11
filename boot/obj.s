
loader:     file format elf32-i386


Disassembly of section .text:

00009000 <loader_start>:
    9000:	8c c8                	mov    %cs,%eax
    9002:	8e d8                	mov    %eax,%ds
    9004:	8e c0                	mov    %eax,%es
    9006:	e8 26 00 0f 01       	call   10f9031 <_end+0x10eb411>
    900b:	16                   	push   %ss
    900c:	fe                   	(bad)  
    900d:	90                   	nop
    900e:	e4 92                	in     $0x92,%al
    9010:	0c 02                	or     $0x2,%al
    9012:	e6 92                	out    %al,$0x92
    9014:	0f 20 c0             	mov    %cr0,%eax
    9017:	66 83 f0 01          	xor    $0x1,%ax
    901b:	0f 22 c0             	mov    %eax,%cr0
    901e:	ea a8 90 08 00 8c c8 	ljmp   $0xc88c,$0x890a8

00009023 <REAL_MODE>:
    9023:	8c c8                	mov    %cs,%eax
    9025:	8e c0                	mov    %eax,%es
    9027:	e4 92                	in     $0x92,%al
    9029:	24 fd                	and    $0xfd,%al
    902b:	e6 92                	out    %al,$0x92
    902d:	eb fe                	jmp    902d <REAL_MODE+0xa>

0000902f <Init_e820>:
    902f:	66 31 c0             	xor    %ax,%ax
    9032:	bf 00 80 66 31       	mov    $0x31668000,%edi
    9037:	db 66 b8             	(bad)  -0x48(%esi)

00009038 <Mem_e820>:
    9038:	66 b8 20 e8          	mov    $0xe820,%ax
    903c:	00 00                	add    %al,(%eax)
    903e:	66 b9 14 00          	mov    $0x14,%cx
    9042:	00 00                	add    %al,(%eax)
    9044:	66 8b 16             	mov    (%esi),%dx
    9047:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    9048:	90                   	nop
    9049:	cd 15                	int    $0x15

0000904b <Check_e820>:
    904b:	72 10                	jb     905d <Fail_e820>
    904d:	66 83 fb 00          	cmp    $0x0,%bx
    9051:	74 19                	je     906c <End_e820>

00009053 <Again_e820>:
    9053:	83 c7 14             	add    $0x14,%edi
    9056:	66 ff 06             	incw   (%esi)
    9059:	a0 90 eb db be       	mov    0xbedbeb90,%al

0000905d <Fail_e820>:
    905d:	be 85 90 8b 0e       	mov    $0xe8b9085,%esi
    9062:	9c                   	pushf  
    9063:	90                   	nop
    9064:	66 31 ff             	xor    %di,%di
    9067:	e8 03 00 eb fe       	call   feeb906f <_end+0xfeeab44f>

0000906c <End_e820>:
    906c:	c3                   	ret    

0000906d <print_real>:
    906d:	31 c0                	xor    %eax,%eax
    906f:	b8 00 b8 8e e8       	mov    $0xe88eb800,%eax
    9074:	b4 0c                	mov    $0xc,%ah

00009076 <loop1>:
    9076:	8a 04 65 67 89 07 66 	mov    0x66078967(,%eiz,2),%al
    907d:	46                   	inc    %esi
    907e:	66 83 c7 02          	add    $0x2,%di
    9082:	e2 f2                	loop   9076 <loop1>
    9084:	c3                   	ret    

00009085 <FailStr>:
    9085:	47                   	inc    %edi
    9086:	65                   	gs
    9087:	74 20                	je     90a9 <CODE32_START+0x1>
    9089:	6d                   	insl   (%dx),%es:(%edi)
    908a:	65                   	gs
    908b:	6d                   	insl   (%dx),%es:(%edi)
    908c:	6f                   	outsl  %ds:(%esi),(%dx)
    908d:	72 79                	jb     9108 <Cstart+0x4>
    908f:	20 6d 61             	and    %ch,0x61(%ebp)
    9092:	70 20                	jo     90b4 <CODE32_START+0xc>
    9094:	66 61                	popaw  
    9096:	69 6c 65 64 2e 00 17 	imul   $0x17002e,0x64(%ebp,%eiz,2),%ebp
    909d:	00 

0000909c <FailStrLen>:
    909c:	17                   	pop    %ss
    909d:	00 00                	add    %al,(%eax)
	...

000090a0 <DetectCount>:
    90a0:	00 00                	add    %al,(%eax)
	...

000090a4 <SMAP>:
    90a4:	50                   	push   %eax
    90a5:	41                   	inc    %ecx
    90a6:	4d                   	dec    %ebp
    90a7:	53                   	push   %ebx

000090a8 <CODE32_START>:
    90a8:	66 b8 10 00          	mov    $0x10,%ax
    90ac:	8e d8                	mov    %eax,%ds
    90ae:	8e d0                	mov    %eax,%ss
    90b0:	8e c0                	mov    %eax,%es
    90b2:	8e e0                	mov    %eax,%fs
    90b4:	66 b8 18 00          	mov    $0x18,%ax
    90b8:	8e e8                	mov    %eax,%gs
    90ba:	bc ff 7b 00 00       	mov    $0x7bff,%esp
    90bf:	e9 40 00 00 00       	jmp    9104 <Cstart>

000090c4 <JMP_TO_REAL>:
    90c4:	66 31 c0             	xor    %ax,%ax
    90c7:	8e d8                	mov    %eax,%ds
    90c9:	8e c0                	mov    %eax,%es
    90cb:	8e e0                	mov    %eax,%fs
    90cd:	8e e8                	mov    %eax,%gs
    90cf:	0f 20 c0             	mov    %cr0,%eax
    90d2:	24 fe                	and    $0xfe,%al
    90d4:	0f 22 c0             	mov    %eax,%cr0
    90d7:	ea 23 90 00 00 00 00 	ljmp   $0x0,$0x9023

000090de <GDT>:
	...
    90e6:	ff                   	(bad)  
    90e7:	ff 00                	incl   (%eax)
    90e9:	00 00                	add    %al,(%eax)
    90eb:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    90f2:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    90f8:	00 80 0b 93 00 00    	add    %al,0x930b(%eax)

000090fe <GDTPTR>:
    90fe:	1f                   	pop    %ds
    90ff:	00 de                	add    %bl,%dh
    9101:	90                   	nop
	...

00009104 <Cstart>:
    9104:	55                   	push   %ebp
    9105:	89 e5                	mov    %esp,%ebp
    9107:	83 ec 18             	sub    $0x18,%esp
    910a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9111:	00 
    9112:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9119:	00 
    911a:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9121:	00 
    9122:	c7 04 24 a8 a7 00 00 	movl   $0xa7a8,(%esp)
    9129:	e8 8a 01 00 00       	call   92b8 <dis_str>
    912e:	e8 24 03 00 00       	call   9457 <Init_8259A>
    9133:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    913a:	00 
    913b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    9142:	00 
    9143:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    914a:	00 
    914b:	c7 04 24 bd a7 00 00 	movl   $0xa7bd,(%esp)
    9152:	e8 61 01 00 00       	call   92b8 <dis_str>
    9157:	e8 20 05 00 00       	call   967c <init_idt>
    915c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9163:	00 
    9164:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    916b:	00 
    916c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9173:	00 
    9174:	c7 04 24 d0 a7 00 00 	movl   $0xa7d0,(%esp)
    917b:	e8 38 01 00 00       	call   92b8 <dis_str>
    9180:	e8 1c 0a 00 00       	call   9ba1 <init_timer>
    9185:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    918c:	00 
    918d:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    9194:	00 
    9195:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    919c:	00 
    919d:	c7 04 24 e5 a7 00 00 	movl   $0xa7e5,(%esp)
    91a4:	e8 0f 01 00 00       	call   92b8 <dis_str>
    91a9:	e8 85 09 00 00       	call   9b33 <init_hd>
    91ae:	e8 4d 07 00 00       	call   9900 <hd_identify>
    91b3:	e8 00 0b 00 00       	call   9cb8 <get_part_information>
    91b8:	e8 d0 0c 00 00       	call   9e8d <make_fs>
    91bd:	85 c0                	test   %eax,%eax
    91bf:	74 4a                	je     920b <Cstart+0x107>
    91c1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91c8:	00 
    91c9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    91d0:	00 
    91d1:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    91d8:	00 
    91d9:	c7 04 24 f8 a7 00 00 	movl   $0xa7f8,(%esp)
    91e0:	e8 d3 00 00 00       	call   92b8 <dis_str>
    91e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91ec:	00 
    91ed:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    91f4:	00 
    91f5:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    91fc:	00 
    91fd:	c7 04 24 00 a8 00 00 	movl   $0xa800,(%esp)
    9204:	e8 af 00 00 00       	call   92b8 <dis_str>
    9209:	eb fe                	jmp    9209 <Cstart+0x105>
    920b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9212:	00 
    9213:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    921a:	00 
    921b:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9222:	00 
    9223:	c7 04 24 41 a8 00 00 	movl   $0xa841,(%esp)
    922a:	e8 89 00 00 00       	call   92b8 <dis_str>
    922f:	e8 9d 11 00 00       	call   a3d1 <get_super_block>
    9234:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    923b:	00 
    923c:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    9243:	00 
    9244:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    924b:	00 
    924c:	c7 04 24 54 a8 00 00 	movl   $0xa854,(%esp)
    9253:	e8 60 00 00 00       	call   92b8 <dis_str>
    9258:	e8 b5 12 00 00       	call   a512 <get_inode_array>
    925d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9264:	00 
    9265:	c7 44 24 08 06 00 00 	movl   $0x6,0x8(%esp)
    926c:	00 
    926d:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9274:	00 
    9275:	c7 04 24 67 a8 00 00 	movl   $0xa867,(%esp)
    927c:	e8 37 00 00 00       	call   92b8 <dis_str>
    9281:	e8 02 12 00 00       	call   a488 <get_root_area>
    9286:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    928d:	00 
    928e:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    9295:	00 
    9296:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    929d:	00 
    929e:	c7 04 24 78 a8 00 00 	movl   $0xa878,(%esp)
    92a5:	e8 0e 00 00 00       	call   92b8 <dis_str>
    92aa:	e8 13 13 00 00       	call   a5c2 <loader_kernel>
    92af:	b8 00 00 10 00       	mov    $0x100000,%eax
    92b4:	ff e0                	jmp    *%eax
    92b6:	c9                   	leave  
    92b7:	c3                   	ret    

000092b8 <dis_str>:
    92b8:	55                   	push   %ebp
    92b9:	89 e5                	mov    %esp,%ebp
    92bb:	57                   	push   %edi
    92bc:	53                   	push   %ebx
    92bd:	83 ec 30             	sub    $0x30,%esp
    92c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    92c3:	88 45 d4             	mov    %al,-0x2c(%ebp)
    92c6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    92cd:	8b 55 10             	mov    0x10(%ebp),%edx
    92d0:	89 d0                	mov    %edx,%eax
    92d2:	c1 e0 02             	shl    $0x2,%eax
    92d5:	01 d0                	add    %edx,%eax
    92d7:	c1 e0 04             	shl    $0x4,%eax
    92da:	89 c2                	mov    %eax,%edx
    92dc:	8b 45 14             	mov    0x14(%ebp),%eax
    92df:	01 d0                	add    %edx,%eax
    92e1:	01 c0                	add    %eax,%eax
    92e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    92e6:	8b 45 08             	mov    0x8(%ebp),%eax
    92e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    92ec:	8b 45 08             	mov    0x8(%ebp),%eax
    92ef:	89 04 24             	mov    %eax,(%esp)
    92f2:	e8 1a 09 00 00       	call   9c11 <strlen>
    92f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    92fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9301:	eb 2e                	jmp    9331 <dis_str+0x79>
    9303:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9306:	8d 50 01             	lea    0x1(%eax),%edx
    9309:	89 55 ec             	mov    %edx,-0x14(%ebp)
    930c:	0f b6 00             	movzbl (%eax),%eax
    930f:	88 45 e7             	mov    %al,-0x19(%ebp)
    9312:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
    9316:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
    931a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    931d:	89 d3                	mov    %edx,%ebx
    931f:	89 cf                	mov    %ecx,%edi
    9321:	88 c4                	mov    %al,%ah
    9323:	88 d8                	mov    %bl,%al
    9325:	65 66 89 07          	mov    %ax,%gs:(%edi)
    9329:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    932d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9331:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9334:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9337:	7c ca                	jl     9303 <dis_str+0x4b>
    9339:	8b 45 f4             	mov    -0xc(%ebp),%eax
    933c:	83 c4 30             	add    $0x30,%esp
    933f:	5b                   	pop    %ebx
    9340:	5f                   	pop    %edi
    9341:	5d                   	pop    %ebp
    9342:	c3                   	ret    

00009343 <dis_nchar>:
    9343:	55                   	push   %ebp
    9344:	89 e5                	mov    %esp,%ebp
    9346:	57                   	push   %edi
    9347:	53                   	push   %ebx
    9348:	83 ec 14             	sub    $0x14,%esp
    934b:	8b 45 0c             	mov    0xc(%ebp),%eax
    934e:	88 45 e4             	mov    %al,-0x1c(%ebp)
    9351:	8b 55 14             	mov    0x14(%ebp),%edx
    9354:	89 d0                	mov    %edx,%eax
    9356:	c1 e0 02             	shl    $0x2,%eax
    9359:	01 d0                	add    %edx,%eax
    935b:	c1 e0 04             	shl    $0x4,%eax
    935e:	89 c2                	mov    %eax,%edx
    9360:	8b 45 18             	mov    0x18(%ebp),%eax
    9363:	01 d0                	add    %edx,%eax
    9365:	01 c0                	add    %eax,%eax
    9367:	89 45 f0             	mov    %eax,-0x10(%ebp)
    936a:	8b 45 08             	mov    0x8(%ebp),%eax
    936d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    9370:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9377:	eb 2e                	jmp    93a7 <dis_nchar+0x64>
    9379:	8b 45 ec             	mov    -0x14(%ebp),%eax
    937c:	8d 50 01             	lea    0x1(%eax),%edx
    937f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    9382:	0f b6 00             	movzbl (%eax),%eax
    9385:	88 45 eb             	mov    %al,-0x15(%ebp)
    9388:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    938c:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    9390:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9393:	89 d3                	mov    %edx,%ebx
    9395:	89 cf                	mov    %ecx,%edi
    9397:	88 c4                	mov    %al,%ah
    9399:	88 d8                	mov    %bl,%al
    939b:	65 66 89 07          	mov    %ax,%gs:(%edi)
    939f:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    93a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    93a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93aa:	3b 45 10             	cmp    0x10(%ebp),%eax
    93ad:	7c ca                	jl     9379 <dis_nchar+0x36>
    93af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93b2:	83 c4 14             	add    $0x14,%esp
    93b5:	5b                   	pop    %ebx
    93b6:	5f                   	pop    %edi
    93b7:	5d                   	pop    %ebp
    93b8:	c3                   	ret    
    93b9:	66 90                	xchg   %ax,%ax
    93bb:	90                   	nop

000093bc <outb>:
    93bc:	55                   	push   %ebp
    93bd:	89 e5                	mov    %esp,%ebp
    93bf:	83 ec 08             	sub    $0x8,%esp
    93c2:	8b 55 08             	mov    0x8(%ebp),%edx
    93c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    93c8:	88 55 fc             	mov    %dl,-0x4(%ebp)
    93cb:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    93cf:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    93d3:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    93d7:	ee                   	out    %al,(%dx)
    93d8:	c9                   	leave  
    93d9:	c3                   	ret    

000093da <inb>:
    93da:	55                   	push   %ebp
    93db:	89 e5                	mov    %esp,%ebp
    93dd:	83 ec 14             	sub    $0x14,%esp
    93e0:	8b 45 08             	mov    0x8(%ebp),%eax
    93e3:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    93e7:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    93eb:	89 c2                	mov    %eax,%edx
    93ed:	ec                   	in     (%dx),%al
    93ee:	88 45 ff             	mov    %al,-0x1(%ebp)
    93f1:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    93f5:	c9                   	leave  
    93f6:	c3                   	ret    

000093f7 <io_delay>:
    93f7:	55                   	push   %ebp
    93f8:	89 e5                	mov    %esp,%ebp
    93fa:	83 ec 10             	sub    $0x10,%esp
    93fd:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    9403:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    9407:	89 c2                	mov    %eax,%edx
    9409:	ee                   	out    %al,(%dx)
    940a:	c9                   	leave  
    940b:	c3                   	ret    

0000940c <outb_pic>:
    940c:	55                   	push   %ebp
    940d:	89 e5                	mov    %esp,%ebp
    940f:	83 ec 0c             	sub    $0xc,%esp
    9412:	8b 45 08             	mov    0x8(%ebp),%eax
    9415:	88 45 fc             	mov    %al,-0x4(%ebp)
    9418:	8b 45 0c             	mov    0xc(%ebp),%eax
    941b:	0f b7 d0             	movzwl %ax,%edx
    941e:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    9422:	89 54 24 04          	mov    %edx,0x4(%esp)
    9426:	89 04 24             	mov    %eax,(%esp)
    9429:	e8 8e ff ff ff       	call   93bc <outb>
    942e:	e8 c4 ff ff ff       	call   93f7 <io_delay>
    9433:	c9                   	leave  
    9434:	c3                   	ret    

00009435 <inb_pic>:
    9435:	55                   	push   %ebp
    9436:	89 e5                	mov    %esp,%ebp
    9438:	83 ec 14             	sub    $0x14,%esp
    943b:	8b 45 08             	mov    0x8(%ebp),%eax
    943e:	0f b7 c0             	movzwl %ax,%eax
    9441:	89 04 24             	mov    %eax,(%esp)
    9444:	e8 91 ff ff ff       	call   93da <inb>
    9449:	88 45 ff             	mov    %al,-0x1(%ebp)
    944c:	e8 a6 ff ff ff       	call   93f7 <io_delay>
    9451:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9455:	c9                   	leave  
    9456:	c3                   	ret    

00009457 <Init_8259A>:
    9457:	55                   	push   %ebp
    9458:	89 e5                	mov    %esp,%ebp
    945a:	83 ec 08             	sub    $0x8,%esp
    945d:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9464:	00 
    9465:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    946c:	e8 9b ff ff ff       	call   940c <outb_pic>
    9471:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    9478:	00 
    9479:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    9480:	e8 87 ff ff ff       	call   940c <outb_pic>
    9485:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    948c:	00 
    948d:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    9494:	e8 73 ff ff ff       	call   940c <outb_pic>
    9499:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94a0:	00 
    94a1:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
    94a8:	e8 5f ff ff ff       	call   940c <outb_pic>
    94ad:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94b4:	00 
    94b5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    94bc:	e8 4b ff ff ff       	call   940c <outb_pic>
    94c1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94c8:	00 
    94c9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    94d0:	e8 37 ff ff ff       	call   940c <outb_pic>
    94d5:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94dc:	00 
    94dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    94e4:	e8 23 ff ff ff       	call   940c <outb_pic>
    94e9:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94f0:	00 
    94f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    94f8:	e8 0f ff ff ff       	call   940c <outb_pic>
    94fd:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9504:	00 
    9505:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    950c:	e8 fb fe ff ff       	call   940c <outb_pic>
    9511:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    9518:	00 
    9519:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    9520:	e8 e7 fe ff ff       	call   940c <outb_pic>
    9525:	90                   	nop
    9526:	c9                   	leave  
    9527:	c3                   	ret    

00009528 <enable_irq>:
    9528:	55                   	push   %ebp
    9529:	89 e5                	mov    %esp,%ebp
    952b:	83 ec 18             	sub    $0x18,%esp
    952e:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
    9532:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
    9536:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
    953d:	e8 f3 fe ff ff       	call   9435 <inb_pic>
    9542:	88 45 fd             	mov    %al,-0x3(%ebp)
    9545:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
    954c:	e8 e4 fe ff ff       	call   9435 <inb_pic>
    9551:	88 45 fc             	mov    %al,-0x4(%ebp)
    9554:	fa                   	cli    
    9555:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
    9559:	7f 35                	jg     9590 <enable_irq+0x68>
    955b:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    955f:	74 2f                	je     9590 <enable_irq+0x68>
    9561:	8b 45 08             	mov    0x8(%ebp),%eax
    9564:	ba 01 00 00 00       	mov    $0x1,%edx
    9569:	89 c1                	mov    %eax,%ecx
    956b:	d3 e2                	shl    %cl,%edx
    956d:	89 d0                	mov    %edx,%eax
    956f:	f7 d0                	not    %eax
    9571:	89 c2                	mov    %eax,%edx
    9573:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    9577:	21 d0                	and    %edx,%eax
    9579:	88 45 ff             	mov    %al,-0x1(%ebp)
    957c:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9580:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9587:	00 
    9588:	89 04 24             	mov    %eax,(%esp)
    958b:	e8 7c fe ff ff       	call   940c <outb_pic>
    9590:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
    9594:	7e 56                	jle    95ec <enable_irq+0xc4>
    9596:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
    959a:	7f 50                	jg     95ec <enable_irq+0xc4>
    959c:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    95a0:	83 e0 fb             	and    $0xfffffffb,%eax
    95a3:	88 45 ff             	mov    %al,-0x1(%ebp)
    95a6:	8b 45 08             	mov    0x8(%ebp),%eax
    95a9:	83 e8 08             	sub    $0x8,%eax
    95ac:	ba 01 00 00 00       	mov    $0x1,%edx
    95b1:	89 c1                	mov    %eax,%ecx
    95b3:	d3 e2                	shl    %cl,%edx
    95b5:	89 d0                	mov    %edx,%eax
    95b7:	f7 d0                	not    %eax
    95b9:	89 c2                	mov    %eax,%edx
    95bb:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    95bf:	21 d0                	and    %edx,%eax
    95c1:	88 45 fe             	mov    %al,-0x2(%ebp)
    95c4:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    95c8:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    95cf:	00 
    95d0:	89 04 24             	mov    %eax,(%esp)
    95d3:	e8 34 fe ff ff       	call   940c <outb_pic>
    95d8:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
    95dc:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    95e3:	00 
    95e4:	89 04 24             	mov    %eax,(%esp)
    95e7:	e8 20 fe ff ff       	call   940c <outb_pic>
    95ec:	fb                   	sti    
    95ed:	90                   	nop
    95ee:	c9                   	leave  
    95ef:	c3                   	ret    

000095f0 <EOI_master>:
    95f0:	55                   	push   %ebp
    95f1:	89 e5                	mov    %esp,%ebp
    95f3:	83 ec 08             	sub    $0x8,%esp
    95f6:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    95fd:	00 
    95fe:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9605:	e8 02 fe ff ff       	call   940c <outb_pic>
    960a:	fb                   	sti    
    960b:	c9                   	leave  
    960c:	c3                   	ret    

0000960d <EOI_slave>:
    960d:	55                   	push   %ebp
    960e:	89 e5                	mov    %esp,%ebp
    9610:	83 ec 08             	sub    $0x8,%esp
    9613:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    961a:	00 
    961b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9622:	e8 e5 fd ff ff       	call   940c <outb_pic>
    9627:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    962e:	00 
    962f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9636:	e8 d1 fd ff ff       	call   940c <outb_pic>
    963b:	fb                   	sti    
    963c:	c9                   	leave  
    963d:	c3                   	ret    
    963e:	66 90                	xchg   %ax,%ax

00009640 <set_gate>:
    9640:	55                   	push   %ebp
    9641:	89 e5                	mov    %esp,%ebp
    9643:	8b 45 18             	mov    0x18(%ebp),%eax
    9646:	c1 e0 10             	shl    $0x10,%eax
    9649:	89 c2                	mov    %eax,%edx
    964b:	8b 45 10             	mov    0x10(%ebp),%eax
    964e:	0f b7 c0             	movzwl %ax,%eax
    9651:	09 c2                	or     %eax,%edx
    9653:	8b 45 08             	mov    0x8(%ebp),%eax
    9656:	89 10                	mov    %edx,(%eax)
    9658:	8b 45 10             	mov    0x10(%ebp),%eax
    965b:	66 b8 00 00          	mov    $0x0,%ax
    965f:	89 c2                	mov    %eax,%edx
    9661:	8b 45 14             	mov    0x14(%ebp),%eax
    9664:	c1 e0 05             	shl    $0x5,%eax
    9667:	0b 45 0c             	or     0xc(%ebp),%eax
    966a:	0f b6 c0             	movzbl %al,%eax
    966d:	0c 80                	or     $0x80,%al
    966f:	c1 e0 08             	shl    $0x8,%eax
    9672:	09 c2                	or     %eax,%edx
    9674:	8b 45 08             	mov    0x8(%ebp),%eax
    9677:	89 50 04             	mov    %edx,0x4(%eax)
    967a:	5d                   	pop    %ebp
    967b:	c3                   	ret    

0000967c <init_idt>:
    967c:	55                   	push   %ebp
    967d:	89 e5                	mov    %esp,%ebp
    967f:	fa                   	cli    
    9680:	0f 01 1d 00 c0 00 00 	lidtl  0xc000
    9687:	90                   	nop
    9688:	fb                   	sti    
    9689:	90                   	nop
    968a:	5d                   	pop    %ebp
    968b:	c3                   	ret    

0000968c <set_intr_gate>:
    968c:	55                   	push   %ebp
    968d:	89 e5                	mov    %esp,%ebp
    968f:	83 ec 38             	sub    $0x38,%esp
    9692:	8b 45 08             	mov    0x8(%ebp),%eax
    9695:	83 c0 30             	add    $0x30,%eax
    9698:	89 45 f4             	mov    %eax,-0xc(%ebp)
    969b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    969e:	c1 e0 03             	shl    $0x3,%eax
    96a1:	8d 90 20 c0 00 00    	lea    0xc020(%eax),%edx
    96a7:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    96ae:	00 
    96af:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    96b6:	00 
    96b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    96ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    96be:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
    96c5:	00 
    96c6:	89 14 24             	mov    %edx,(%esp)
    96c9:	e8 72 ff ff ff       	call   9640 <set_gate>
    96ce:	8b 45 08             	mov    0x8(%ebp),%eax
    96d1:	89 04 24             	mov    %eax,(%esp)
    96d4:	e8 4f fe ff ff       	call   9528 <enable_irq>
    96d9:	c9                   	leave  
    96da:	c3                   	ret    
    96db:	90                   	nop

000096dc <outb>:
    96dc:	55                   	push   %ebp
    96dd:	89 e5                	mov    %esp,%ebp
    96df:	83 ec 08             	sub    $0x8,%esp
    96e2:	8b 55 08             	mov    0x8(%ebp),%edx
    96e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    96e8:	88 55 fc             	mov    %dl,-0x4(%ebp)
    96eb:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    96ef:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    96f3:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    96f7:	ee                   	out    %al,(%dx)
    96f8:	c9                   	leave  
    96f9:	c3                   	ret    

000096fa <inb>:
    96fa:	55                   	push   %ebp
    96fb:	89 e5                	mov    %esp,%ebp
    96fd:	83 ec 14             	sub    $0x14,%esp
    9700:	8b 45 08             	mov    0x8(%ebp),%eax
    9703:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    9707:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    970b:	89 c2                	mov    %eax,%edx
    970d:	ec                   	in     (%dx),%al
    970e:	88 45 ff             	mov    %al,-0x1(%ebp)
    9711:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9715:	c9                   	leave  
    9716:	c3                   	ret    

00009717 <io_delay>:
    9717:	55                   	push   %ebp
    9718:	89 e5                	mov    %esp,%ebp
    971a:	83 ec 10             	sub    $0x10,%esp
    971d:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    9723:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    9727:	89 c2                	mov    %eax,%edx
    9729:	ee                   	out    %al,(%dx)
    972a:	c9                   	leave  
    972b:	c3                   	ret    

0000972c <inb_pic>:
    972c:	55                   	push   %ebp
    972d:	89 e5                	mov    %esp,%ebp
    972f:	83 ec 14             	sub    $0x14,%esp
    9732:	8b 45 08             	mov    0x8(%ebp),%eax
    9735:	0f b7 c0             	movzwl %ax,%eax
    9738:	89 04 24             	mov    %eax,(%esp)
    973b:	e8 ba ff ff ff       	call   96fa <inb>
    9740:	88 45 ff             	mov    %al,-0x1(%ebp)
    9743:	e8 cf ff ff ff       	call   9717 <io_delay>
    9748:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    974c:	c9                   	leave  
    974d:	c3                   	ret    

0000974e <outb_pic>:
    974e:	55                   	push   %ebp
    974f:	89 e5                	mov    %esp,%ebp
    9751:	83 ec 0c             	sub    $0xc,%esp
    9754:	8b 45 08             	mov    0x8(%ebp),%eax
    9757:	88 45 fc             	mov    %al,-0x4(%ebp)
    975a:	8b 45 0c             	mov    0xc(%ebp),%eax
    975d:	0f b7 d0             	movzwl %ax,%edx
    9760:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    9764:	89 54 24 04          	mov    %edx,0x4(%esp)
    9768:	89 04 24             	mov    %eax,(%esp)
    976b:	e8 6c ff ff ff       	call   96dc <outb>
    9770:	e8 a2 ff ff ff       	call   9717 <io_delay>
    9775:	c9                   	leave  
    9776:	c3                   	ret    

00009777 <port_read>:
    9777:	55                   	push   %ebp
    9778:	89 e5                	mov    %esp,%ebp
    977a:	57                   	push   %edi
    977b:	53                   	push   %ebx
    977c:	83 ec 04             	sub    $0x4,%esp
    977f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9782:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    9786:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    978a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    978d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9790:	89 c2                	mov    %eax,%edx
    9792:	89 df                	mov    %ebx,%edi
    9794:	fc                   	cld    
    9795:	d1 e9                	shr    %ecx
    9797:	66 f3 6d             	rep insw (%dx),%es:(%edi)
    979a:	83 c4 04             	add    $0x4,%esp
    979d:	5b                   	pop    %ebx
    979e:	5f                   	pop    %edi
    979f:	5d                   	pop    %ebp
    97a0:	c3                   	ret    

000097a1 <port_write>:
    97a1:	55                   	push   %ebp
    97a2:	89 e5                	mov    %esp,%ebp
    97a4:	56                   	push   %esi
    97a5:	53                   	push   %ebx
    97a6:	83 ec 04             	sub    $0x4,%esp
    97a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    97ac:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    97b0:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    97b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    97b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    97ba:	89 c2                	mov    %eax,%edx
    97bc:	89 de                	mov    %ebx,%esi
    97be:	fc                   	cld    
    97bf:	d1 e9                	shr    %ecx
    97c1:	66 f3 6f             	rep outsw %ds:(%esi),(%dx)
    97c4:	83 c4 04             	add    $0x4,%esp
    97c7:	5b                   	pop    %ebx
    97c8:	5e                   	pop    %esi
    97c9:	5d                   	pop    %ebp
    97ca:	c3                   	ret    

000097cb <hd_cmd_out>:
    97cb:	55                   	push   %ebp
    97cc:	89 e5                	mov    %esp,%ebp
    97ce:	83 ec 08             	sub    $0x8,%esp
    97d1:	90                   	nop
    97d2:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    97d9:	e8 4e ff ff ff       	call   972c <inb_pic>
    97de:	84 c0                	test   %al,%al
    97e0:	78 f0                	js     97d2 <hd_cmd_out+0x7>
    97e2:	c7 44 24 04 f6 03 00 	movl   $0x3f6,0x4(%esp)
    97e9:	00 
    97ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    97f1:	e8 58 ff ff ff       	call   974e <outb_pic>
    97f6:	8b 45 08             	mov    0x8(%ebp),%eax
    97f9:	0f b6 00             	movzbl (%eax),%eax
    97fc:	0f b6 c0             	movzbl %al,%eax
    97ff:	c7 44 24 04 f1 01 00 	movl   $0x1f1,0x4(%esp)
    9806:	00 
    9807:	89 04 24             	mov    %eax,(%esp)
    980a:	e8 3f ff ff ff       	call   974e <outb_pic>
    980f:	8b 45 08             	mov    0x8(%ebp),%eax
    9812:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    9816:	0f b6 c0             	movzbl %al,%eax
    9819:	c7 44 24 04 f2 01 00 	movl   $0x1f2,0x4(%esp)
    9820:	00 
    9821:	89 04 24             	mov    %eax,(%esp)
    9824:	e8 25 ff ff ff       	call   974e <outb_pic>
    9829:	8b 45 08             	mov    0x8(%ebp),%eax
    982c:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    9830:	0f b6 c0             	movzbl %al,%eax
    9833:	c7 44 24 04 f3 01 00 	movl   $0x1f3,0x4(%esp)
    983a:	00 
    983b:	89 04 24             	mov    %eax,(%esp)
    983e:	e8 0b ff ff ff       	call   974e <outb_pic>
    9843:	8b 45 08             	mov    0x8(%ebp),%eax
    9846:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    984a:	0f b6 c0             	movzbl %al,%eax
    984d:	c7 44 24 04 f4 01 00 	movl   $0x1f4,0x4(%esp)
    9854:	00 
    9855:	89 04 24             	mov    %eax,(%esp)
    9858:	e8 f1 fe ff ff       	call   974e <outb_pic>
    985d:	8b 45 08             	mov    0x8(%ebp),%eax
    9860:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9864:	0f b6 c0             	movzbl %al,%eax
    9867:	c7 44 24 04 f5 01 00 	movl   $0x1f5,0x4(%esp)
    986e:	00 
    986f:	89 04 24             	mov    %eax,(%esp)
    9872:	e8 d7 fe ff ff       	call   974e <outb_pic>
    9877:	8b 45 08             	mov    0x8(%ebp),%eax
    987a:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    987e:	0f b6 c0             	movzbl %al,%eax
    9881:	c7 44 24 04 f6 01 00 	movl   $0x1f6,0x4(%esp)
    9888:	00 
    9889:	89 04 24             	mov    %eax,(%esp)
    988c:	e8 bd fe ff ff       	call   974e <outb_pic>
    9891:	8b 45 08             	mov    0x8(%ebp),%eax
    9894:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    9898:	0f b6 c0             	movzbl %al,%eax
    989b:	c7 44 24 04 f7 01 00 	movl   $0x1f7,0x4(%esp)
    98a2:	00 
    98a3:	89 04 24             	mov    %eax,(%esp)
    98a6:	e8 a3 fe ff ff       	call   974e <outb_pic>
    98ab:	c9                   	leave  
    98ac:	c3                   	ret    

000098ad <hd_handler>:
    98ad:	55                   	push   %ebp
    98ae:	89 e5                	mov    %esp,%ebp
    98b0:	83 ec 18             	sub    $0x18,%esp
    98b3:	a1 20 c8 00 00       	mov    0xc820,%eax
    98b8:	83 f8 30             	cmp    $0x30,%eax
    98bb:	74 30                	je     98ed <hd_handler+0x40>
    98bd:	3d ec 00 00 00       	cmp    $0xec,%eax
    98c2:	74 05                	je     98c9 <hd_handler+0x1c>
    98c4:	83 f8 20             	cmp    $0x20,%eax
    98c7:	75 25                	jne    98ee <hd_handler+0x41>
    98c9:	8b 15 2c c8 00 00    	mov    0xc82c,%edx
    98cf:	a1 30 c8 00 00       	mov    0xc830,%eax
    98d4:	0f b7 c0             	movzwl %ax,%eax
    98d7:	89 54 24 08          	mov    %edx,0x8(%esp)
    98db:	89 44 24 04          	mov    %eax,0x4(%esp)
    98df:	c7 04 24 38 c8 00 00 	movl   $0xc838,(%esp)
    98e6:	e8 8c fe ff ff       	call   9777 <port_read>
    98eb:	eb 01                	jmp    98ee <hd_handler+0x41>
    98ed:	90                   	nop
    98ee:	c7 05 20 c8 00 00 00 	movl   $0x0,0xc820
    98f5:	00 00 00 
    98f8:	e8 10 fd ff ff       	call   960d <EOI_slave>
    98fd:	90                   	nop
    98fe:	c9                   	leave  
    98ff:	c3                   	ret    

00009900 <hd_identify>:
    9900:	55                   	push   %ebp
    9901:	89 e5                	mov    %esp,%ebp
    9903:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9909:	c6 85 f6 fd ff ff e0 	movb   $0xe0,-0x20a(%ebp)
    9910:	c6 85 f7 fd ff ff ec 	movb   $0xec,-0x209(%ebp)
    9917:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    991d:	a3 28 c8 00 00       	mov    %eax,0xc828
    9922:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    9929:	0f b6 c0             	movzbl %al,%eax
    992c:	a3 20 c8 00 00       	mov    %eax,0xc820
    9931:	c7 05 24 c8 00 00 77 	movl   $0x9777,0xc824
    9938:	97 00 00 
    993b:	c7 05 2c c8 00 00 00 	movl   $0x200,0xc82c
    9942:	02 00 00 
    9945:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    994c:	01 00 00 
    994f:	c7 05 34 c8 00 00 01 	movl   $0x1,0xc834
    9956:	00 00 00 
    9959:	8d 85 f1 fd ff ff    	lea    -0x20f(%ebp),%eax
    995f:	89 04 24             	mov    %eax,(%esp)
    9962:	e8 64 fe ff ff       	call   97cb <hd_cmd_out>
    9967:	90                   	nop
    9968:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    996e:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    9975:	0f b6 c0             	movzbl %al,%eax
    9978:	39 c2                	cmp    %eax,%edx
    997a:	74 ec                	je     9968 <hd_identify+0x68>
    997c:	a1 2c c8 00 00       	mov    0xc82c,%eax
    9981:	89 44 24 08          	mov    %eax,0x8(%esp)
    9985:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    998c:	00 
    998d:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    9993:	89 04 24             	mov    %eax,(%esp)
    9996:	e8 39 02 00 00       	call   9bd4 <memcpy>
    999b:	90                   	nop
    999c:	c9                   	leave  
    999d:	c3                   	ret    

0000999e <hd_read>:
    999e:	55                   	push   %ebp
    999f:	89 e5                	mov    %esp,%ebp
    99a1:	83 ec 28             	sub    $0x28,%esp
    99a4:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
    99a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    99ab:	88 45 ee             	mov    %al,-0x12(%ebp)
    99ae:	8b 45 08             	mov    0x8(%ebp),%eax
    99b1:	88 45 ef             	mov    %al,-0x11(%ebp)
    99b4:	8b 45 08             	mov    0x8(%ebp),%eax
    99b7:	c1 e8 08             	shr    $0x8,%eax
    99ba:	88 45 f0             	mov    %al,-0x10(%ebp)
    99bd:	8b 45 08             	mov    0x8(%ebp),%eax
    99c0:	c1 e8 10             	shr    $0x10,%eax
    99c3:	88 45 f1             	mov    %al,-0xf(%ebp)
    99c6:	8b 45 08             	mov    0x8(%ebp),%eax
    99c9:	c1 e8 18             	shr    $0x18,%eax
    99cc:	83 e0 0f             	and    $0xf,%eax
    99cf:	83 c8 e0             	or     $0xffffffe0,%eax
    99d2:	88 45 f2             	mov    %al,-0xe(%ebp)
    99d5:	c6 45 f3 20          	movb   $0x20,-0xd(%ebp)
    99d9:	8b 45 10             	mov    0x10(%ebp),%eax
    99dc:	a3 28 c8 00 00       	mov    %eax,0xc828
    99e1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    99e5:	0f b6 c0             	movzbl %al,%eax
    99e8:	a3 20 c8 00 00       	mov    %eax,0xc820
    99ed:	c7 05 24 c8 00 00 77 	movl   $0x9777,0xc824
    99f4:	97 00 00 
    99f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    99fa:	a3 34 c8 00 00       	mov    %eax,0xc834
    99ff:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9a06:	01 00 00 
    9a09:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a0c:	c1 e0 09             	shl    $0x9,%eax
    9a0f:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9a14:	8d 45 ed             	lea    -0x13(%ebp),%eax
    9a17:	89 04 24             	mov    %eax,(%esp)
    9a1a:	e8 ac fd ff ff       	call   97cb <hd_cmd_out>
    9a1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9a26:	eb 09                	jmp    9a31 <hd_read+0x93>
    9a28:	e8 ea fc ff ff       	call   9717 <io_delay>
    9a2d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a31:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    9a38:	7e ee                	jle    9a28 <hd_read+0x8a>
    9a3a:	90                   	nop
    9a3b:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9a41:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    9a45:	0f b6 c0             	movzbl %al,%eax
    9a48:	39 c2                	cmp    %eax,%edx
    9a4a:	74 ef                	je     9a3b <hd_read+0x9d>
    9a4c:	a1 2c c8 00 00       	mov    0xc82c,%eax
    9a51:	89 44 24 08          	mov    %eax,0x8(%esp)
    9a55:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    9a5c:	00 
    9a5d:	8b 45 10             	mov    0x10(%ebp),%eax
    9a60:	89 04 24             	mov    %eax,(%esp)
    9a63:	e8 6c 01 00 00       	call   9bd4 <memcpy>
    9a68:	90                   	nop
    9a69:	c9                   	leave  
    9a6a:	c3                   	ret    

00009a6b <hd_write>:
    9a6b:	55                   	push   %ebp
    9a6c:	89 e5                	mov    %esp,%ebp
    9a6e:	83 ec 1c             	sub    $0x1c,%esp
    9a71:	c6 45 f9 00          	movb   $0x0,-0x7(%ebp)
    9a75:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a78:	88 45 fa             	mov    %al,-0x6(%ebp)
    9a7b:	8b 45 08             	mov    0x8(%ebp),%eax
    9a7e:	88 45 fb             	mov    %al,-0x5(%ebp)
    9a81:	8b 45 08             	mov    0x8(%ebp),%eax
    9a84:	c1 e8 08             	shr    $0x8,%eax
    9a87:	88 45 fc             	mov    %al,-0x4(%ebp)
    9a8a:	8b 45 08             	mov    0x8(%ebp),%eax
    9a8d:	c1 e8 10             	shr    $0x10,%eax
    9a90:	88 45 fd             	mov    %al,-0x3(%ebp)
    9a93:	8b 45 08             	mov    0x8(%ebp),%eax
    9a96:	c1 e8 18             	shr    $0x18,%eax
    9a99:	83 e0 0f             	and    $0xf,%eax
    9a9c:	83 c8 e0             	or     $0xffffffe0,%eax
    9a9f:	88 45 fe             	mov    %al,-0x2(%ebp)
    9aa2:	c6 45 ff 30          	movb   $0x30,-0x1(%ebp)
    9aa6:	8b 45 10             	mov    0x10(%ebp),%eax
    9aa9:	a3 28 c8 00 00       	mov    %eax,0xc828
    9aae:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9ab2:	0f b6 c0             	movzbl %al,%eax
    9ab5:	a3 20 c8 00 00       	mov    %eax,0xc820
    9aba:	c7 05 24 c8 00 00 a1 	movl   $0x97a1,0xc824
    9ac1:	97 00 00 
    9ac4:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9acb:	01 00 00 
    9ace:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ad1:	c1 e0 09             	shl    $0x9,%eax
    9ad4:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9ad9:	8d 45 f9             	lea    -0x7(%ebp),%eax
    9adc:	89 04 24             	mov    %eax,(%esp)
    9adf:	e8 e7 fc ff ff       	call   97cb <hd_cmd_out>
    9ae4:	90                   	nop
    9ae5:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    9aec:	e8 3b fc ff ff       	call   972c <inb_pic>
    9af1:	0f b6 c0             	movzbl %al,%eax
    9af4:	83 e0 08             	and    $0x8,%eax
    9af7:	85 c0                	test   %eax,%eax
    9af9:	74 ea                	je     9ae5 <hd_write+0x7a>
    9afb:	8b 0d 2c c8 00 00    	mov    0xc82c,%ecx
    9b01:	a1 30 c8 00 00       	mov    0xc830,%eax
    9b06:	0f b7 d0             	movzwl %ax,%edx
    9b09:	a1 28 c8 00 00       	mov    0xc828,%eax
    9b0e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    9b12:	89 54 24 04          	mov    %edx,0x4(%esp)
    9b16:	89 04 24             	mov    %eax,(%esp)
    9b19:	e8 83 fc ff ff       	call   97a1 <port_write>
    9b1e:	90                   	nop
    9b1f:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9b25:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9b29:	0f b6 c0             	movzbl %al,%eax
    9b2c:	39 c2                	cmp    %eax,%edx
    9b2e:	74 ef                	je     9b1f <hd_write+0xb4>
    9b30:	90                   	nop
    9b31:	c9                   	leave  
    9b32:	c3                   	ret    

00009b33 <init_hd>:
    9b33:	55                   	push   %ebp
    9b34:	89 e5                	mov    %esp,%ebp
    9b36:	83 ec 18             	sub    $0x18,%esp
    9b39:	c7 05 18 dc 00 00 ad 	movl   $0x98ad,0xdc18
    9b40:	98 00 00 
    9b43:	c7 44 24 04 67 a7 00 	movl   $0xa767,0x4(%esp)
    9b4a:	00 
    9b4b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9b52:	e8 35 fb ff ff       	call   968c <set_intr_gate>
    9b57:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9b5e:	e8 c5 f9 ff ff       	call   9528 <enable_irq>
    9b63:	c9                   	leave  
    9b64:	c3                   	ret    
    9b65:	66 90                	xchg   %ax,%ax
    9b67:	90                   	nop

00009b68 <timer_handler>:
    9b68:	55                   	push   %ebp
    9b69:	89 e5                	mov    %esp,%ebp
    9b6b:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9b72:	3c 7a                	cmp    $0x7a,%al
    9b74:	75 07                	jne    9b7d <timer_handler+0x15>
    9b76:	c6 05 08 c0 00 00 41 	movb   $0x41,0xc008
    9b7d:	b4 0c                	mov    $0xc,%ah
    9b7f:	a0 08 c0 00 00       	mov    0xc008,%al
    9b84:	65 66 a3 00 0f 00 00 	mov    %ax,%gs:0xf00
    9b8b:	b0 20                	mov    $0x20,%al
    9b8d:	e6 20                	out    %al,$0x20
    9b8f:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9b96:	83 c0 01             	add    $0x1,%eax
    9b99:	a2 08 c0 00 00       	mov    %al,0xc008
    9b9e:	90                   	nop
    9b9f:	5d                   	pop    %ebp
    9ba0:	c3                   	ret    

00009ba1 <init_timer>:
    9ba1:	55                   	push   %ebp
    9ba2:	89 e5                	mov    %esp,%ebp
    9ba4:	83 ec 18             	sub    $0x18,%esp
    9ba7:	c7 05 e0 db 00 00 68 	movl   $0x9b68,0xdbe0
    9bae:	9b 00 00 
    9bb1:	c7 44 24 04 28 a7 00 	movl   $0xa728,0x4(%esp)
    9bb8:	00 
    9bb9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bc0:	e8 c7 fa ff ff       	call   968c <set_intr_gate>
    9bc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bcc:	e8 57 f9 ff ff       	call   9528 <enable_irq>
    9bd1:	c9                   	leave  
    9bd2:	c3                   	ret    
    9bd3:	90                   	nop

00009bd4 <memcpy>:
    9bd4:	55                   	push   %ebp
    9bd5:	89 e5                	mov    %esp,%ebp
    9bd7:	83 ec 10             	sub    $0x10,%esp
    9bda:	8b 45 08             	mov    0x8(%ebp),%eax
    9bdd:	89 45 fc             	mov    %eax,-0x4(%ebp)
    9be0:	8b 45 0c             	mov    0xc(%ebp),%eax
    9be3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9be6:	eb 17                	jmp    9bff <memcpy+0x2b>
    9be8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9beb:	8d 50 01             	lea    0x1(%eax),%edx
    9bee:	89 55 fc             	mov    %edx,-0x4(%ebp)
    9bf1:	8b 55 f8             	mov    -0x8(%ebp),%edx
    9bf4:	8d 4a 01             	lea    0x1(%edx),%ecx
    9bf7:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    9bfa:	0f b6 12             	movzbl (%edx),%edx
    9bfd:	88 10                	mov    %dl,(%eax)
    9bff:	8b 45 10             	mov    0x10(%ebp),%eax
    9c02:	8d 50 ff             	lea    -0x1(%eax),%edx
    9c05:	89 55 10             	mov    %edx,0x10(%ebp)
    9c08:	85 c0                	test   %eax,%eax
    9c0a:	75 dc                	jne    9be8 <memcpy+0x14>
    9c0c:	8b 45 08             	mov    0x8(%ebp),%eax
    9c0f:	c9                   	leave  
    9c10:	c3                   	ret    

00009c11 <strlen>:
    9c11:	55                   	push   %ebp
    9c12:	89 e5                	mov    %esp,%ebp
    9c14:	83 ec 10             	sub    $0x10,%esp
    9c17:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c1e:	8b 45 08             	mov    0x8(%ebp),%eax
    9c21:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9c24:	eb 08                	jmp    9c2e <strlen+0x1d>
    9c26:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    9c2a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9c2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9c31:	0f b6 00             	movzbl (%eax),%eax
    9c34:	84 c0                	test   %al,%al
    9c36:	75 ee                	jne    9c26 <strlen+0x15>
    9c38:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9c3b:	c9                   	leave  
    9c3c:	c3                   	ret    

00009c3d <strcmp>:
    9c3d:	55                   	push   %ebp
    9c3e:	89 e5                	mov    %esp,%ebp
    9c40:	eb 0c                	jmp    9c4e <strcmp+0x11>
    9c42:	8b 45 08             	mov    0x8(%ebp),%eax
    9c45:	0f b6 00             	movzbl (%eax),%eax
    9c48:	84 c0                	test   %al,%al
    9c4a:	75 02                	jne    9c4e <strcmp+0x11>
    9c4c:	eb 1c                	jmp    9c6a <strcmp+0x2d>
    9c4e:	8b 45 08             	mov    0x8(%ebp),%eax
    9c51:	8d 50 01             	lea    0x1(%eax),%edx
    9c54:	89 55 08             	mov    %edx,0x8(%ebp)
    9c57:	0f b6 08             	movzbl (%eax),%ecx
    9c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c5d:	8d 50 01             	lea    0x1(%eax),%edx
    9c60:	89 55 0c             	mov    %edx,0xc(%ebp)
    9c63:	0f b6 00             	movzbl (%eax),%eax
    9c66:	38 c1                	cmp    %al,%cl
    9c68:	74 d8                	je     9c42 <strcmp+0x5>
    9c6a:	8b 45 08             	mov    0x8(%ebp),%eax
    9c6d:	0f b6 00             	movzbl (%eax),%eax
    9c70:	0f be d0             	movsbl %al,%edx
    9c73:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c76:	0f b6 00             	movzbl (%eax),%eax
    9c79:	0f be c0             	movsbl %al,%eax
    9c7c:	29 c2                	sub    %eax,%edx
    9c7e:	89 d0                	mov    %edx,%eax
    9c80:	5d                   	pop    %ebp
    9c81:	c3                   	ret    

00009c82 <memset>:
    9c82:	55                   	push   %ebp
    9c83:	89 e5                	mov    %esp,%ebp
    9c85:	83 ec 10             	sub    $0x10,%esp
    9c88:	8b 45 08             	mov    0x8(%ebp),%eax
    9c8b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9c8e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c95:	eb 12                	jmp    9ca9 <memset+0x27>
    9c97:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9c9a:	8d 50 01             	lea    0x1(%eax),%edx
    9c9d:	89 55 f8             	mov    %edx,-0x8(%ebp)
    9ca0:	8b 55 0c             	mov    0xc(%ebp),%edx
    9ca3:	88 10                	mov    %dl,(%eax)
    9ca5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9ca9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9cac:	3b 45 10             	cmp    0x10(%ebp),%eax
    9caf:	72 e6                	jb     9c97 <memset+0x15>
    9cb1:	8b 45 08             	mov    0x8(%ebp),%eax
    9cb4:	c9                   	leave  
    9cb5:	c3                   	ret    
    9cb6:	66 90                	xchg   %ax,%ax

00009cb8 <get_part_information>:
    9cb8:	55                   	push   %ebp
    9cb9:	89 e5                	mov    %esp,%ebp
    9cbb:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9cc1:	c7 45 f4 be 01 00 00 	movl   $0x1be,-0xc(%ebp)
    9cc8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ccf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cd6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9cdc:	89 44 24 08          	mov    %eax,0x8(%esp)
    9ce0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9ce7:	00 
    9ce8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9cef:	e8 aa fc ff ff       	call   999e <hd_read>
    9cf4:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9cfd:	01 d0                	add    %edx,%eax
    9cff:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d02:	eb 74                	jmp    9d78 <get_part_information+0xc0>
    9d04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d07:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d0b:	3c 05                	cmp    $0x5,%al
    9d0d:	75 29                	jne    9d38 <get_part_information+0x80>
    9d0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d12:	c1 e0 04             	shl    $0x4,%eax
    9d15:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9d1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d1e:	8b 08                	mov    (%eax),%ecx
    9d20:	89 0a                	mov    %ecx,(%edx)
    9d22:	8b 48 04             	mov    0x4(%eax),%ecx
    9d25:	89 4a 04             	mov    %ecx,0x4(%edx)
    9d28:	8b 48 08             	mov    0x8(%eax),%ecx
    9d2b:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d2e:	8b 40 0c             	mov    0xc(%eax),%eax
    9d31:	89 42 0c             	mov    %eax,0xc(%edx)
    9d34:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d38:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d3b:	c1 e0 04             	shl    $0x4,%eax
    9d3e:	8d 90 60 d5 00 00    	lea    0xd560(%eax),%edx
    9d44:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d47:	8b 08                	mov    (%eax),%ecx
    9d49:	89 0a                	mov    %ecx,(%edx)
    9d4b:	8b 48 04             	mov    0x4(%eax),%ecx
    9d4e:	89 4a 04             	mov    %ecx,0x4(%edx)
    9d51:	8b 48 08             	mov    0x8(%eax),%ecx
    9d54:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d57:	8b 40 0c             	mov    0xc(%eax),%eax
    9d5a:	89 42 0c             	mov    %eax,0xc(%edx)
    9d5d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9d61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d64:	83 c0 10             	add    $0x10,%eax
    9d67:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9d6a:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d73:	01 d0                	add    %edx,%eax
    9d75:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d78:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d7b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d7f:	84 c0                	test   %al,%al
    9d81:	74 0d                	je     9d90 <get_part_information+0xd8>
    9d83:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    9d8a:	0f 8e 74 ff ff ff    	jle    9d04 <get_part_information+0x4c>
    9d90:	c7 45 f0 40 cc 00 00 	movl   $0xcc40,-0x10(%ebp)
    9d97:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d9a:	8b 40 08             	mov    0x8(%eax),%eax
    9d9d:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9da3:	89 54 24 08          	mov    %edx,0x8(%esp)
    9da7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9dae:	00 
    9daf:	89 04 24             	mov    %eax,(%esp)
    9db2:	e8 e7 fb ff ff       	call   999e <hd_read>
    9db7:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9dbd:	05 be 01 00 00       	add    $0x1be,%eax
    9dc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9dc5:	e9 b2 00 00 00       	jmp    9e7c <get_part_information+0x1c4>
    9dca:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9dd0:	05 be 01 00 00       	add    $0x1be,%eax
    9dd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9dd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ddb:	c1 e0 04             	shl    $0x4,%eax
    9dde:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9de4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9de7:	8b 08                	mov    (%eax),%ecx
    9de9:	89 0a                	mov    %ecx,(%edx)
    9deb:	8b 48 04             	mov    0x4(%eax),%ecx
    9dee:	89 4a 04             	mov    %ecx,0x4(%edx)
    9df1:	8b 48 08             	mov    0x8(%eax),%ecx
    9df4:	89 4a 08             	mov    %ecx,0x8(%edx)
    9df7:	8b 40 0c             	mov    0xc(%eax),%eax
    9dfa:	89 42 0c             	mov    %eax,0xc(%edx)
    9dfd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9e01:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e07:	05 ce 01 00 00       	add    $0x1ce,%eax
    9e0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9e0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e12:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9e16:	84 c0                	test   %al,%al
    9e18:	74 60                	je     9e7a <get_part_information+0x1c2>
    9e1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9e1d:	c1 e0 04             	shl    $0x4,%eax
    9e20:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9e26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e29:	8b 08                	mov    (%eax),%ecx
    9e2b:	89 0a                	mov    %ecx,(%edx)
    9e2d:	8b 48 04             	mov    0x4(%eax),%ecx
    9e30:	89 4a 04             	mov    %ecx,0x4(%edx)
    9e33:	8b 48 08             	mov    0x8(%eax),%ecx
    9e36:	89 4a 08             	mov    %ecx,0x8(%edx)
    9e39:	8b 40 0c             	mov    0xc(%eax),%eax
    9e3c:	89 42 0c             	mov    %eax,0xc(%edx)
    9e3f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e46:	8b 50 08             	mov    0x8(%eax),%edx
    9e49:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9e4e:	01 c2                	add    %eax,%edx
    9e50:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e56:	89 44 24 08          	mov    %eax,0x8(%esp)
    9e5a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9e61:	00 
    9e62:	89 14 24             	mov    %edx,(%esp)
    9e65:	e8 34 fb ff ff       	call   999e <hd_read>
    9e6a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e70:	05 be 01 00 00       	add    $0x1be,%eax
    9e75:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9e78:	eb 02                	jmp    9e7c <get_part_information+0x1c4>
    9e7a:	eb 0f                	jmp    9e8b <get_part_information+0x1d3>
    9e7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e7f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9e83:	84 c0                	test   %al,%al
    9e85:	0f 85 3f ff ff ff    	jne    9dca <get_part_information+0x112>
    9e8b:	c9                   	leave  
    9e8c:	c3                   	ret    

00009e8d <make_fs>:
    9e8d:	55                   	push   %ebp
    9e8e:	89 e5                	mov    %esp,%ebp
    9e90:	81 ec 78 02 00 00    	sub    $0x278,%esp
    9e96:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e9d:	eb 26                	jmp    9ec5 <make_fs+0x38>
    9e9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ea2:	c1 e0 04             	shl    $0x4,%eax
    9ea5:	05 64 d5 00 00       	add    $0xd564,%eax
    9eaa:	0f b6 00             	movzbl (%eax),%eax
    9ead:	3c 0d                	cmp    $0xd,%al
    9eaf:	75 10                	jne    9ec1 <make_fs+0x34>
    9eb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9eb4:	c1 e0 04             	shl    $0x4,%eax
    9eb7:	05 60 d5 00 00       	add    $0xd560,%eax
    9ebc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9ebf:	eb 0a                	jmp    9ecb <make_fs+0x3e>
    9ec1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9ec5:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9ec9:	7e d4                	jle    9e9f <make_fs+0x12>
    9ecb:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9ed0:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9ed5:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9ed9:	0f 8e 81 00 00 00    	jle    9f60 <make_fs+0xd3>
    9edf:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9ee6:	84 c0                	test   %al,%al
    9ee8:	74 76                	je     9f60 <make_fs+0xd3>
    9eea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9ef1:	eb 67                	jmp    9f5a <make_fs+0xcd>
    9ef3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ef6:	c1 e0 04             	shl    $0x4,%eax
    9ef9:	05 44 cc 00 00       	add    $0xcc44,%eax
    9efe:	0f b6 00             	movzbl (%eax),%eax
    9f01:	3c 0d                	cmp    $0xd,%al
    9f03:	75 51                	jne    9f56 <make_fs+0xc9>
    9f05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f08:	c1 e0 04             	shl    $0x4,%eax
    9f0b:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f10:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9f13:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f16:	83 e8 01             	sub    $0x1,%eax
    9f19:	c1 e0 04             	shl    $0x4,%eax
    9f1c:	05 44 cc 00 00       	add    $0xcc44,%eax
    9f21:	0f b6 10             	movzbl (%eax),%edx
    9f24:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9f2b:	38 c2                	cmp    %al,%dl
    9f2d:	75 25                	jne    9f54 <make_fs+0xc7>
    9f2f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9f33:	74 1f                	je     9f54 <make_fs+0xc7>
    9f35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f38:	83 e8 01             	sub    $0x1,%eax
    9f3b:	c1 e0 04             	shl    $0x4,%eax
    9f3e:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f43:	8b 50 08             	mov    0x8(%eax),%edx
    9f46:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9f4b:	01 d0                	add    %edx,%eax
    9f4d:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9f52:	eb 0c                	jmp    9f60 <make_fs+0xd3>
    9f54:	eb 0a                	jmp    9f60 <make_fs+0xd3>
    9f56:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f5a:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f5e:	7e 93                	jle    9ef3 <make_fs+0x66>
    9f60:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f64:	7e 4a                	jle    9fb0 <make_fs+0x123>
    9f66:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f6d:	00 
    9f6e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f75:	00 
    9f76:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    9f7d:	00 
    9f7e:	c7 04 24 8c a8 00 00 	movl   $0xa88c,(%esp)
    9f85:	e8 2e f3 ff ff       	call   92b8 <dis_str>
    9f8a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f91:	00 
    9f92:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f99:	00 
    9f9a:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    9fa1:	00 
    9fa2:	c7 04 24 94 a8 00 00 	movl   $0xa894,(%esp)
    9fa9:	e8 0a f3 ff ff       	call   92b8 <dis_str>
    9fae:	eb fe                	jmp    9fae <make_fs+0x121>
    9fb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fb3:	8b 50 08             	mov    0x8(%eax),%edx
    9fb6:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9fbb:	01 d0                	add    %edx,%eax
    9fbd:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9fc2:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9fc7:	8d 50 01             	lea    0x1(%eax),%edx
    9fca:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9fd0:	89 44 24 08          	mov    %eax,0x8(%esp)
    9fd4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9fdb:	00 
    9fdc:	89 14 24             	mov    %edx,(%esp)
    9fdf:	e8 ba f9 ff ff       	call   999e <hd_read>
    9fe4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9fea:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9fed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ff0:	8b 00                	mov    (%eax),%eax
    9ff2:	3d 8f 9a 08 00       	cmp    $0x89a8f,%eax
    9ff7:	75 0a                	jne    a003 <make_fs+0x176>
    9ff9:	b8 00 00 00 00       	mov    $0x0,%eax
    9ffe:	e9 aa 03 00 00       	jmp    a3ad <make_fs+0x520>
    a003:	c7 85 ac fd ff ff 8f 	movl   $0x89a8f,-0x254(%ebp)
    a00a:	9a 08 00 
    a00d:	c7 85 b0 fd ff ff 64 	movl   $0x64,-0x250(%ebp)
    a014:	00 00 00 
    a017:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a01a:	8b 40 0c             	mov    0xc(%eax),%eax
    a01d:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    a023:	c7 85 b8 fd ff ff 01 	movl   $0x1,-0x248(%ebp)
    a02a:	00 00 00 
    a02d:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a032:	83 c0 02             	add    $0x2,%eax
    a035:	89 85 bc fd ff ff    	mov    %eax,-0x244(%ebp)
    a03b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a03e:	8b 40 0c             	mov    0xc(%eax),%eax
    a041:	c1 e8 0c             	shr    $0xc,%eax
    a044:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%ebp)
    a04a:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a050:	83 c0 01             	add    $0x1,%eax
    a053:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
    a059:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
    a05f:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a065:	01 d0                	add    %edx,%eax
    a067:	89 85 c8 fd ff ff    	mov    %eax,-0x238(%ebp)
    a06d:	c7 85 d0 fd ff ff 03 	movl   $0x3,-0x230(%ebp)
    a074:	00 00 00 
    a077:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a07d:	83 c0 01             	add    $0x1,%eax
    a080:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%ebp)
    a086:	c7 85 e0 fd ff ff 10 	movl   $0x10,-0x220(%ebp)
    a08d:	00 00 00 
    a090:	c7 85 d8 fd ff ff 00 	movl   $0x0,-0x228(%ebp)
    a097:	00 00 00 
    a09a:	8b 95 c8 fd ff ff    	mov    -0x238(%ebp),%edx
    a0a0:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a0a6:	01 d0                	add    %edx,%eax
    a0a8:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%ebp)
    a0ae:	c7 85 dc fd ff ff 03 	movl   $0x3,-0x224(%ebp)
    a0b5:	00 00 00 
    a0b8:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a0be:	83 c0 01             	add    $0x1,%eax
    a0c1:	89 85 dc fd ff ff    	mov    %eax,-0x224(%ebp)
    a0c7:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
    a0cd:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a0d3:	01 d0                	add    %edx,%eax
    a0d5:	89 85 cc fd ff ff    	mov    %eax,-0x234(%ebp)
    a0db:	c7 85 e4 fd ff ff 10 	movl   $0x10,-0x21c(%ebp)
    a0e2:	00 00 00 
    a0e5:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a0ec:	00 
    a0ed:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a0f4:	00 
    a0f5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a0fb:	89 04 24             	mov    %eax,(%esp)
    a0fe:	e8 7f fb ff ff       	call   9c82 <memset>
    a103:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
    a109:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a10f:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
    a115:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a11b:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
    a121:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a127:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
    a12d:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a133:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a139:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%ebp)
    a13f:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a145:	89 85 fc fd ff ff    	mov    %eax,-0x204(%ebp)
    a14b:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
    a151:	89 85 00 fe ff ff    	mov    %eax,-0x200(%ebp)
    a157:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a15d:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%ebp)
    a163:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
    a169:	89 85 08 fe ff ff    	mov    %eax,-0x1f8(%ebp)
    a16f:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a175:	89 85 0c fe ff ff    	mov    %eax,-0x1f4(%ebp)
    a17b:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a181:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%ebp)
    a187:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a18d:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%ebp)
    a193:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a199:	89 85 18 fe ff ff    	mov    %eax,-0x1e8(%ebp)
    a19f:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
    a1a5:	89 85 1c fe ff ff    	mov    %eax,-0x1e4(%ebp)
    a1ab:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
    a1b1:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%ebp)
    a1b7:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a1bc:	8d 50 01             	lea    0x1(%eax),%edx
    a1bf:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
    a1c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    a1c9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a1d0:	00 
    a1d1:	89 14 24             	mov    %edx,(%esp)
    a1d4:	e8 92 f8 ff ff       	call   9a6b <hd_write>
    a1d9:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a1e0:	00 
    a1e1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a1e8:	00 
    a1e9:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a1ef:	89 04 24             	mov    %eax,(%esp)
    a1f2:	e8 8b fa ff ff       	call   9c82 <memset>
    a1f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a1fe:	eb 29                	jmp    a229 <make_fs+0x39c>
    a200:	8b 95 c8 fd ff ff    	mov    -0x238(%ebp),%edx
    a206:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a209:	01 c2                	add    %eax,%edx
    a20b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a211:	89 44 24 08          	mov    %eax,0x8(%esp)
    a215:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a21c:	00 
    a21d:	89 14 24             	mov    %edx,(%esp)
    a220:	e8 46 f8 ff ff       	call   9a6b <hd_write>
    a225:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a229:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a22c:	83 f8 03             	cmp    $0x3,%eax
    a22f:	76 cf                	jbe    a200 <make_fs+0x373>
    a231:	c7 85 9c fd ff ff 02 	movl   $0x2,-0x264(%ebp)
    a238:	00 00 00 
    a23b:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a241:	c1 e0 09             	shl    $0x9,%eax
    a244:	89 85 a0 fd ff ff    	mov    %eax,-0x260(%ebp)
    a24a:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a250:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
    a256:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a25c:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    a262:	8b 85 9c fd ff ff    	mov    -0x264(%ebp),%eax
    a268:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a26e:	8b 85 a0 fd ff ff    	mov    -0x260(%ebp),%eax
    a274:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a27a:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
    a280:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a286:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    a28c:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a292:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a298:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    a29e:	89 54 24 08          	mov    %edx,0x8(%esp)
    a2a2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2a9:	00 
    a2aa:	89 04 24             	mov    %eax,(%esp)
    a2ad:	e8 b9 f7 ff ff       	call   9a6b <hd_write>
    a2b2:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a2b9:	00 
    a2ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a2c1:	00 
    a2c2:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a2c8:	89 04 24             	mov    %eax,(%esp)
    a2cb:	e8 b2 f9 ff ff       	call   9c82 <memset>
    a2d0:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a2d6:	c6 84 05 e8 fd ff ff 	movb   $0x1,-0x218(%ebp,%eax,1)
    a2dd:	01 
    a2de:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a2e4:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    a2ea:	89 54 24 08          	mov    %edx,0x8(%esp)
    a2ee:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2f5:	00 
    a2f6:	89 04 24             	mov    %eax,(%esp)
    a2f9:	e8 6d f7 ff ff       	call   9a6b <hd_write>
    a2fe:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a304:	c6 84 05 e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%eax,1)
    a30b:	00 
    a30c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a313:	eb 29                	jmp    a33e <make_fs+0x4b1>
    a315:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
    a31b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a31e:	01 c2                	add    %eax,%edx
    a320:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a326:	89 44 24 08          	mov    %eax,0x8(%esp)
    a32a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a331:	00 
    a332:	89 14 24             	mov    %edx,(%esp)
    a335:	e8 31 f7 ff ff       	call   9a6b <hd_write>
    a33a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a33e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a341:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a347:	39 c2                	cmp    %eax,%edx
    a349:	72 ca                	jb     a315 <make_fs+0x488>
    a34b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a352:	00 
    a353:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a35a:	00 
    a35b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a361:	89 04 24             	mov    %eax,(%esp)
    a364:	e8 19 f9 ff ff       	call   9c82 <memset>
    a369:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a370:	eb 29                	jmp    a39b <make_fs+0x50e>
    a372:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
    a378:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a37b:	01 c2                	add    %eax,%edx
    a37d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a383:	89 44 24 08          	mov    %eax,0x8(%esp)
    a387:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a38e:	00 
    a38f:	89 14 24             	mov    %edx,(%esp)
    a392:	e8 d4 f6 ff ff       	call   9a6b <hd_write>
    a397:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a39b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a39e:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a3a4:	39 c2                	cmp    %eax,%edx
    a3a6:	72 ca                	jb     a372 <make_fs+0x4e5>
    a3a8:	b8 01 00 00 00       	mov    $0x1,%eax
    a3ad:	c9                   	leave  
    a3ae:	c3                   	ret    

0000a3af <get_sector>:
    a3af:	55                   	push   %ebp
    a3b0:	89 e5                	mov    %esp,%ebp
    a3b2:	83 ec 18             	sub    $0x18,%esp
    a3b5:	8b 45 08             	mov    0x8(%ebp),%eax
    a3b8:	8b 55 0c             	mov    0xc(%ebp),%edx
    a3bb:	89 54 24 08          	mov    %edx,0x8(%esp)
    a3bf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a3c6:	00 
    a3c7:	89 04 24             	mov    %eax,(%esp)
    a3ca:	e8 cf f5 ff ff       	call   999e <hd_read>
    a3cf:	c9                   	leave  
    a3d0:	c3                   	ret    

0000a3d1 <get_super_block>:
    a3d1:	55                   	push   %ebp
    a3d2:	89 e5                	mov    %esp,%ebp
    a3d4:	83 ec 18             	sub    $0x18,%esp
    a3d7:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a3dc:	83 c0 01             	add    $0x1,%eax
    a3df:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a3e6:	00 
    a3e7:	89 04 24             	mov    %eax,(%esp)
    a3ea:	e8 c0 ff ff ff       	call   a3af <get_sector>
    a3ef:	a1 e0 cc 00 00       	mov    0xcce0,%eax
    a3f4:	a3 e0 ce 00 00       	mov    %eax,0xcee0
    a3f9:	a1 e4 cc 00 00       	mov    0xcce4,%eax
    a3fe:	a3 e4 ce 00 00       	mov    %eax,0xcee4
    a403:	a1 e8 cc 00 00       	mov    0xcce8,%eax
    a408:	a3 e8 ce 00 00       	mov    %eax,0xcee8
    a40d:	a1 ec cc 00 00       	mov    0xccec,%eax
    a412:	a3 ec ce 00 00       	mov    %eax,0xceec
    a417:	a1 f0 cc 00 00       	mov    0xccf0,%eax
    a41c:	a3 f0 ce 00 00       	mov    %eax,0xcef0
    a421:	a1 f4 cc 00 00       	mov    0xccf4,%eax
    a426:	a3 f4 ce 00 00       	mov    %eax,0xcef4
    a42b:	a1 f8 cc 00 00       	mov    0xccf8,%eax
    a430:	a3 f8 ce 00 00       	mov    %eax,0xcef8
    a435:	a1 fc cc 00 00       	mov    0xccfc,%eax
    a43a:	a3 fc ce 00 00       	mov    %eax,0xcefc
    a43f:	a1 00 cd 00 00       	mov    0xcd00,%eax
    a444:	a3 00 cf 00 00       	mov    %eax,0xcf00
    a449:	a1 04 cd 00 00       	mov    0xcd04,%eax
    a44e:	a3 04 cf 00 00       	mov    %eax,0xcf04
    a453:	a1 08 cd 00 00       	mov    0xcd08,%eax
    a458:	a3 08 cf 00 00       	mov    %eax,0xcf08
    a45d:	a1 0c cd 00 00       	mov    0xcd0c,%eax
    a462:	a3 0c cf 00 00       	mov    %eax,0xcf0c
    a467:	a1 10 cd 00 00       	mov    0xcd10,%eax
    a46c:	a3 10 cf 00 00       	mov    %eax,0xcf10
    a471:	a1 14 cd 00 00       	mov    0xcd14,%eax
    a476:	a3 14 cf 00 00       	mov    %eax,0xcf14
    a47b:	a1 18 cd 00 00       	mov    0xcd18,%eax
    a480:	a3 18 cf 00 00       	mov    %eax,0xcf18
    a485:	90                   	nop
    a486:	c9                   	leave  
    a487:	c3                   	ret    

0000a488 <get_root_area>:
    a488:	55                   	push   %ebp
    a489:	89 e5                	mov    %esp,%ebp
    a48b:	83 ec 28             	sub    $0x28,%esp
    a48e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a495:	eb 68                	jmp    a4ff <get_root_area+0x77>
    a497:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a49a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    a49e:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
    a4a5:	00 
    a4a6:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    a4ad:	00 
    a4ae:	c7 04 24 c0 a8 00 00 	movl   $0xa8c0,(%esp)
    a4b5:	e8 fe ed ff ff       	call   92b8 <dis_str>
    a4ba:	8b 15 08 cf 00 00    	mov    0xcf08,%edx
    a4c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4c3:	01 d0                	add    %edx,%eax
    a4c5:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a4cc:	00 
    a4cd:	89 04 24             	mov    %eax,(%esp)
    a4d0:	e8 da fe ff ff       	call   a3af <get_sector>
    a4d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4d8:	c1 e0 05             	shl    $0x5,%eax
    a4db:	c1 e0 04             	shl    $0x4,%eax
    a4de:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a4e3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a4ea:	00 
    a4eb:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a4f2:	00 
    a4f3:	89 04 24             	mov    %eax,(%esp)
    a4f6:	e8 d9 f6 ff ff       	call   9bd4 <memcpy>
    a4fb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a4ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a502:	8b 15 10 cf 00 00    	mov    0xcf10,%edx
    a508:	83 ea 01             	sub    $0x1,%edx
    a50b:	39 d0                	cmp    %edx,%eax
    a50d:	72 88                	jb     a497 <get_root_area+0xf>
    a50f:	90                   	nop
    a510:	c9                   	leave  
    a511:	c3                   	ret    

0000a512 <get_inode_array>:
    a512:	55                   	push   %ebp
    a513:	89 e5                	mov    %esp,%ebp
    a515:	83 ec 28             	sub    $0x28,%esp
    a518:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a51f:	eb 45                	jmp    a566 <get_inode_array+0x54>
    a521:	8b 15 fc ce 00 00    	mov    0xcefc,%edx
    a527:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a52a:	01 d0                	add    %edx,%eax
    a52c:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a533:	00 
    a534:	89 04 24             	mov    %eax,(%esp)
    a537:	e8 73 fe ff ff       	call   a3af <get_sector>
    a53c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a53f:	c1 e0 05             	shl    $0x5,%eax
    a542:	c1 e0 04             	shl    $0x4,%eax
    a545:	05 20 cf 00 00       	add    $0xcf20,%eax
    a54a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a551:	00 
    a552:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a559:	00 
    a55a:	89 04 24             	mov    %eax,(%esp)
    a55d:	e8 72 f6 ff ff       	call   9bd4 <memcpy>
    a562:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a566:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a569:	a1 04 cf 00 00       	mov    0xcf04,%eax
    a56e:	39 c2                	cmp    %eax,%edx
    a570:	72 af                	jb     a521 <get_inode_array+0xf>
    a572:	c9                   	leave  
    a573:	c3                   	ret    

0000a574 <find_file_in_root>:
    a574:	55                   	push   %ebp
    a575:	89 e5                	mov    %esp,%ebp
    a577:	83 ec 28             	sub    $0x28,%esp
    a57a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a581:	eb 32                	jmp    a5b5 <find_file_in_root+0x41>
    a583:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a586:	c1 e0 04             	shl    $0x4,%eax
    a589:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a58e:	83 c0 04             	add    $0x4,%eax
    a591:	89 44 24 04          	mov    %eax,0x4(%esp)
    a595:	8b 45 08             	mov    0x8(%ebp),%eax
    a598:	89 04 24             	mov    %eax,(%esp)
    a59b:	e8 9d f6 ff ff       	call   9c3d <strcmp>
    a5a0:	85 c0                	test   %eax,%eax
    a5a2:	75 0d                	jne    a5b1 <find_file_in_root+0x3d>
    a5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5a7:	c1 e0 04             	shl    $0x4,%eax
    a5aa:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a5af:	eb 0f                	jmp    a5c0 <find_file_in_root+0x4c>
    a5b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a5b5:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    a5b9:	7e c8                	jle    a583 <find_file_in_root+0xf>
    a5bb:	b8 00 00 00 00       	mov    $0x0,%eax
    a5c0:	c9                   	leave  
    a5c1:	c3                   	ret    

0000a5c2 <loader_kernel>:
    a5c2:	55                   	push   %ebp
    a5c3:	89 e5                	mov    %esp,%ebp
    a5c5:	57                   	push   %edi
    a5c6:	56                   	push   %esi
    a5c7:	53                   	push   %ebx
    a5c8:	83 ec 2c             	sub    $0x2c,%esp
    a5cb:	c7 45 e0 00 00 10 00 	movl   $0x100000,-0x20(%ebp)
    a5d2:	c7 04 24 c2 a8 00 00 	movl   $0xa8c2,(%esp)
    a5d9:	e8 96 ff ff ff       	call   a574 <find_file_in_root>
    a5de:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a5e1:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    a5e5:	75 4a                	jne    a631 <loader_kernel+0x6f>
    a5e7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    a5ee:	00 
    a5ef:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    a5f6:	00 
    a5f7:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    a5fe:	00 
    a5ff:	c7 04 24 8c a8 00 00 	movl   $0xa88c,(%esp)
    a606:	e8 ad ec ff ff       	call   92b8 <dis_str>
    a60b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    a612:	00 
    a613:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    a61a:	00 
    a61b:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    a622:	00 
    a623:	c7 04 24 cf a8 00 00 	movl   $0xa8cf,(%esp)
    a62a:	e8 89 ec ff ff       	call   92b8 <dis_str>
    a62f:	eb fe                	jmp    a62f <loader_kernel+0x6d>
    a631:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a634:	8b 00                	mov    (%eax),%eax
    a636:	c1 e0 04             	shl    $0x4,%eax
    a639:	05 20 cf 00 00       	add    $0xcf20,%eax
    a63e:	89 45 d8             	mov    %eax,-0x28(%ebp)
    a641:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a648:	e9 c1 00 00 00       	jmp    a70e <loader_kernel+0x14c>
    a64d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a650:	8b 40 08             	mov    0x8(%eax),%eax
    a653:	c7 44 24 08 e0 cc 00 	movl   $0xcce0,0x8(%esp)
    a65a:	00 
    a65b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a662:	00 
    a663:	89 04 24             	mov    %eax,(%esp)
    a666:	e8 33 f3 ff ff       	call   999e <hd_read>
    a66b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a66e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    a672:	c7 44 24 08 09 00 00 	movl   $0x9,0x8(%esp)
    a679:	00 
    a67a:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    a681:	00 
    a682:	c7 04 24 c0 a8 00 00 	movl   $0xa8c0,(%esp)
    a689:	e8 2a ec ff ff       	call   92b8 <dis_str>
    a68e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a691:	c1 e0 09             	shl    $0x9,%eax
    a694:	89 c2                	mov    %eax,%edx
    a696:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a699:	01 d0                	add    %edx,%eax
    a69b:	ba e0 cc 00 00       	mov    $0xcce0,%edx
    a6a0:	bb 00 02 00 00       	mov    $0x200,%ebx
    a6a5:	89 c1                	mov    %eax,%ecx
    a6a7:	83 e1 01             	and    $0x1,%ecx
    a6aa:	85 c9                	test   %ecx,%ecx
    a6ac:	74 0e                	je     a6bc <loader_kernel+0xfa>
    a6ae:	0f b6 0a             	movzbl (%edx),%ecx
    a6b1:	88 08                	mov    %cl,(%eax)
    a6b3:	83 c0 01             	add    $0x1,%eax
    a6b6:	83 c2 01             	add    $0x1,%edx
    a6b9:	83 eb 01             	sub    $0x1,%ebx
    a6bc:	89 c1                	mov    %eax,%ecx
    a6be:	83 e1 02             	and    $0x2,%ecx
    a6c1:	85 c9                	test   %ecx,%ecx
    a6c3:	74 0f                	je     a6d4 <loader_kernel+0x112>
    a6c5:	0f b7 0a             	movzwl (%edx),%ecx
    a6c8:	66 89 08             	mov    %cx,(%eax)
    a6cb:	83 c0 02             	add    $0x2,%eax
    a6ce:	83 c2 02             	add    $0x2,%edx
    a6d1:	83 eb 02             	sub    $0x2,%ebx
    a6d4:	89 d9                	mov    %ebx,%ecx
    a6d6:	c1 e9 02             	shr    $0x2,%ecx
    a6d9:	89 c7                	mov    %eax,%edi
    a6db:	89 d6                	mov    %edx,%esi
    a6dd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    a6df:	89 f2                	mov    %esi,%edx
    a6e1:	89 f8                	mov    %edi,%eax
    a6e3:	b9 00 00 00 00       	mov    $0x0,%ecx
    a6e8:	89 de                	mov    %ebx,%esi
    a6ea:	83 e6 02             	and    $0x2,%esi
    a6ed:	85 f6                	test   %esi,%esi
    a6ef:	74 0b                	je     a6fc <loader_kernel+0x13a>
    a6f1:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    a6f5:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    a6f9:	83 c1 02             	add    $0x2,%ecx
    a6fc:	83 e3 01             	and    $0x1,%ebx
    a6ff:	85 db                	test   %ebx,%ebx
    a701:	74 07                	je     a70a <loader_kernel+0x148>
    a703:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    a707:	88 14 08             	mov    %dl,(%eax,%ecx,1)
    a70a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a70e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a711:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a714:	8b 40 0c             	mov    0xc(%eax),%eax
    a717:	39 c2                	cmp    %eax,%edx
    a719:	0f 82 2e ff ff ff    	jb     a64d <loader_kernel+0x8b>
    a71f:	90                   	nop
    a720:	83 c4 2c             	add    $0x2c,%esp
    a723:	5b                   	pop    %ebx
    a724:	5e                   	pop    %esi
    a725:	5f                   	pop    %edi
    a726:	5d                   	pop    %ebp
    a727:	c3                   	ret    

0000a728 <irq00_handler>:
    a728:	55                   	push   %ebp
    a729:	89 e5                	mov    %esp,%ebp
    a72b:	53                   	push   %ebx
    a72c:	50                   	push   %eax
    a72d:	53                   	push   %ebx
    a72e:	b8 01 00 00 00       	mov    $0x1,%eax
    a733:	89 c3                	mov    %eax,%ebx
    a735:	e4 21                	in     $0x21,%al
    a737:	08 d8                	or     %bl,%al
    a739:	e6 21                	out    %al,$0x21
    a73b:	b0 20                	mov    $0x20,%al
    a73d:	e6 20                	out    %al,$0x20
    a73f:	fb                   	sti    
    a740:	a1 e0 db 00 00       	mov    0xdbe0,%eax
    a745:	ba 00 00 00 00       	mov    $0x0,%edx
    a74a:	89 d3                	mov    %edx,%ebx
    a74c:	53                   	push   %ebx
    a74d:	ff d0                	call   *%eax
    a74f:	5b                   	pop    %ebx
    a750:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    a755:	89 c3                	mov    %eax,%ebx
    a757:	fa                   	cli    
    a758:	e4 21                	in     $0x21,%al
    a75a:	20 d8                	and    %bl,%al
    a75c:	e6 21                	out    %al,$0x21
    a75e:	5b                   	pop    %ebx
    a75f:	58                   	pop    %eax
    a760:	5b                   	pop    %ebx
    a761:	5d                   	pop    %ebp
    a762:	fb                   	sti    
    a763:	cf                   	iret   
    a764:	5b                   	pop    %ebx
    a765:	5d                   	pop    %ebp
    a766:	c3                   	ret    

0000a767 <irq14_handler>:
    a767:	55                   	push   %ebp
    a768:	89 e5                	mov    %esp,%ebp
    a76a:	53                   	push   %ebx
    a76b:	50                   	push   %eax
    a76c:	53                   	push   %ebx
    a76d:	b8 00 40 00 00       	mov    $0x4000,%eax
    a772:	89 c3                	mov    %eax,%ebx
    a774:	e4 21                	in     $0x21,%al
    a776:	08 d8                	or     %bl,%al
    a778:	e6 21                	out    %al,$0x21
    a77a:	b0 20                	mov    $0x20,%al
    a77c:	e6 20                	out    %al,$0x20
    a77e:	fb                   	sti    
    a77f:	a1 18 dc 00 00       	mov    0xdc18,%eax
    a784:	ba 0e 00 00 00       	mov    $0xe,%edx
    a789:	89 d3                	mov    %edx,%ebx
    a78b:	53                   	push   %ebx
    a78c:	ff d0                	call   *%eax
    a78e:	5b                   	pop    %ebx
    a78f:	b8 ff bf ff ff       	mov    $0xffffbfff,%eax
    a794:	89 c3                	mov    %eax,%ebx
    a796:	fa                   	cli    
    a797:	e4 21                	in     $0x21,%al
    a799:	20 d8                	and    %bl,%al
    a79b:	e6 21                	out    %al,$0x21
    a79d:	5b                   	pop    %ebx
    a79e:	58                   	pop    %eax
    a79f:	5b                   	pop    %ebx
    a7a0:	5d                   	pop    %ebp
    a7a1:	fb                   	sti    
    a7a2:	cf                   	iret   
    a7a3:	5b                   	pop    %ebx
    a7a4:	5d                   	pop    %ebp
    a7a5:	c3                   	ret    
