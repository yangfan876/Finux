
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
    9122:	c7 04 24 a4 a7 00 00 	movl   $0xa7a4,(%esp)
    9129:	e8 86 01 00 00       	call   92b4 <dis_str>
    912e:	e8 20 03 00 00       	call   9453 <Init_8259A>
    9133:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    913a:	00 
    913b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    9142:	00 
    9143:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    914a:	00 
    914b:	c7 04 24 b9 a7 00 00 	movl   $0xa7b9,(%esp)
    9152:	e8 5d 01 00 00       	call   92b4 <dis_str>
    9157:	e8 1c 05 00 00       	call   9678 <init_idt>
    915c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9163:	00 
    9164:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    916b:	00 
    916c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9173:	00 
    9174:	c7 04 24 cc a7 00 00 	movl   $0xa7cc,(%esp)
    917b:	e8 34 01 00 00       	call   92b4 <dis_str>
    9180:	e8 18 0a 00 00       	call   9b9d <init_timer>
    9185:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    918c:	00 
    918d:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    9194:	00 
    9195:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    919c:	00 
    919d:	c7 04 24 e1 a7 00 00 	movl   $0xa7e1,(%esp)
    91a4:	e8 0b 01 00 00       	call   92b4 <dis_str>
    91a9:	e8 81 09 00 00       	call   9b2f <init_hd>
    91ae:	e8 49 07 00 00       	call   98fc <hd_identify>
    91b3:	e8 fc 0a 00 00       	call   9cb4 <get_part_information>
    91b8:	e8 cc 0c 00 00       	call   9e89 <make_fs>
    91bd:	85 c0                	test   %eax,%eax
    91bf:	74 4a                	je     920b <Cstart+0x107>
    91c1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91c8:	00 
    91c9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    91d0:	00 
    91d1:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    91d8:	00 
    91d9:	c7 04 24 f4 a7 00 00 	movl   $0xa7f4,(%esp)
    91e0:	e8 cf 00 00 00       	call   92b4 <dis_str>
    91e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91ec:	00 
    91ed:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    91f4:	00 
    91f5:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    91fc:	00 
    91fd:	c7 04 24 fc a7 00 00 	movl   $0xa7fc,(%esp)
    9204:	e8 ab 00 00 00       	call   92b4 <dis_str>
    9209:	eb fe                	jmp    9209 <Cstart+0x105>
    920b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9212:	00 
    9213:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    921a:	00 
    921b:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9222:	00 
    9223:	c7 04 24 3d a8 00 00 	movl   $0xa83d,(%esp)
    922a:	e8 85 00 00 00       	call   92b4 <dis_str>
    922f:	e8 99 11 00 00       	call   a3cd <get_super_block>
    9234:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    923b:	00 
    923c:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    9243:	00 
    9244:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    924b:	00 
    924c:	c7 04 24 50 a8 00 00 	movl   $0xa850,(%esp)
    9253:	e8 5c 00 00 00       	call   92b4 <dis_str>
    9258:	e8 b1 12 00 00       	call   a50e <get_inode_array>
    925d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9264:	00 
    9265:	c7 44 24 08 06 00 00 	movl   $0x6,0x8(%esp)
    926c:	00 
    926d:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9274:	00 
    9275:	c7 04 24 63 a8 00 00 	movl   $0xa863,(%esp)
    927c:	e8 33 00 00 00       	call   92b4 <dis_str>
    9281:	e8 fe 11 00 00       	call   a484 <get_root_area>
    9286:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    928d:	00 
    928e:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    9295:	00 
    9296:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    929d:	00 
    929e:	c7 04 24 74 a8 00 00 	movl   $0xa874,(%esp)
    92a5:	e8 0a 00 00 00       	call   92b4 <dis_str>
    92aa:	e8 0f 13 00 00       	call   a5be <loader_kernel>
    92af:	eb fe                	jmp    92af <Cstart+0x1ab>
    92b1:	66 90                	xchg   %ax,%ax
    92b3:	90                   	nop

000092b4 <dis_str>:
    92b4:	55                   	push   %ebp
    92b5:	89 e5                	mov    %esp,%ebp
    92b7:	57                   	push   %edi
    92b8:	53                   	push   %ebx
    92b9:	83 ec 30             	sub    $0x30,%esp
    92bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    92bf:	88 45 d4             	mov    %al,-0x2c(%ebp)
    92c2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    92c9:	8b 55 10             	mov    0x10(%ebp),%edx
    92cc:	89 d0                	mov    %edx,%eax
    92ce:	c1 e0 02             	shl    $0x2,%eax
    92d1:	01 d0                	add    %edx,%eax
    92d3:	c1 e0 04             	shl    $0x4,%eax
    92d6:	89 c2                	mov    %eax,%edx
    92d8:	8b 45 14             	mov    0x14(%ebp),%eax
    92db:	01 d0                	add    %edx,%eax
    92dd:	01 c0                	add    %eax,%eax
    92df:	89 45 f0             	mov    %eax,-0x10(%ebp)
    92e2:	8b 45 08             	mov    0x8(%ebp),%eax
    92e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    92e8:	8b 45 08             	mov    0x8(%ebp),%eax
    92eb:	89 04 24             	mov    %eax,(%esp)
    92ee:	e8 1a 09 00 00       	call   9c0d <strlen>
    92f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    92f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    92fd:	eb 2e                	jmp    932d <dis_str+0x79>
    92ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9302:	8d 50 01             	lea    0x1(%eax),%edx
    9305:	89 55 ec             	mov    %edx,-0x14(%ebp)
    9308:	0f b6 00             	movzbl (%eax),%eax
    930b:	88 45 e7             	mov    %al,-0x19(%ebp)
    930e:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
    9312:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
    9316:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9319:	89 d3                	mov    %edx,%ebx
    931b:	89 cf                	mov    %ecx,%edi
    931d:	88 c4                	mov    %al,%ah
    931f:	88 d8                	mov    %bl,%al
    9321:	65 66 89 07          	mov    %ax,%gs:(%edi)
    9325:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    9329:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    932d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9330:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9333:	7c ca                	jl     92ff <dis_str+0x4b>
    9335:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9338:	83 c4 30             	add    $0x30,%esp
    933b:	5b                   	pop    %ebx
    933c:	5f                   	pop    %edi
    933d:	5d                   	pop    %ebp
    933e:	c3                   	ret    

0000933f <dis_nchar>:
    933f:	55                   	push   %ebp
    9340:	89 e5                	mov    %esp,%ebp
    9342:	57                   	push   %edi
    9343:	53                   	push   %ebx
    9344:	83 ec 14             	sub    $0x14,%esp
    9347:	8b 45 0c             	mov    0xc(%ebp),%eax
    934a:	88 45 e4             	mov    %al,-0x1c(%ebp)
    934d:	8b 55 14             	mov    0x14(%ebp),%edx
    9350:	89 d0                	mov    %edx,%eax
    9352:	c1 e0 02             	shl    $0x2,%eax
    9355:	01 d0                	add    %edx,%eax
    9357:	c1 e0 04             	shl    $0x4,%eax
    935a:	89 c2                	mov    %eax,%edx
    935c:	8b 45 18             	mov    0x18(%ebp),%eax
    935f:	01 d0                	add    %edx,%eax
    9361:	01 c0                	add    %eax,%eax
    9363:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9366:	8b 45 08             	mov    0x8(%ebp),%eax
    9369:	89 45 ec             	mov    %eax,-0x14(%ebp)
    936c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9373:	eb 2e                	jmp    93a3 <dis_nchar+0x64>
    9375:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9378:	8d 50 01             	lea    0x1(%eax),%edx
    937b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    937e:	0f b6 00             	movzbl (%eax),%eax
    9381:	88 45 eb             	mov    %al,-0x15(%ebp)
    9384:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    9388:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    938c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    938f:	89 d3                	mov    %edx,%ebx
    9391:	89 cf                	mov    %ecx,%edi
    9393:	88 c4                	mov    %al,%ah
    9395:	88 d8                	mov    %bl,%al
    9397:	65 66 89 07          	mov    %ax,%gs:(%edi)
    939b:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    939f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    93a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93a6:	3b 45 10             	cmp    0x10(%ebp),%eax
    93a9:	7c ca                	jl     9375 <dis_nchar+0x36>
    93ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93ae:	83 c4 14             	add    $0x14,%esp
    93b1:	5b                   	pop    %ebx
    93b2:	5f                   	pop    %edi
    93b3:	5d                   	pop    %ebp
    93b4:	c3                   	ret    
    93b5:	66 90                	xchg   %ax,%ax
    93b7:	90                   	nop

000093b8 <outb>:
    93b8:	55                   	push   %ebp
    93b9:	89 e5                	mov    %esp,%ebp
    93bb:	83 ec 08             	sub    $0x8,%esp
    93be:	8b 55 08             	mov    0x8(%ebp),%edx
    93c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    93c4:	88 55 fc             	mov    %dl,-0x4(%ebp)
    93c7:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    93cb:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    93cf:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    93d3:	ee                   	out    %al,(%dx)
    93d4:	c9                   	leave  
    93d5:	c3                   	ret    

000093d6 <inb>:
    93d6:	55                   	push   %ebp
    93d7:	89 e5                	mov    %esp,%ebp
    93d9:	83 ec 14             	sub    $0x14,%esp
    93dc:	8b 45 08             	mov    0x8(%ebp),%eax
    93df:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    93e3:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    93e7:	89 c2                	mov    %eax,%edx
    93e9:	ec                   	in     (%dx),%al
    93ea:	88 45 ff             	mov    %al,-0x1(%ebp)
    93ed:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    93f1:	c9                   	leave  
    93f2:	c3                   	ret    

000093f3 <io_delay>:
    93f3:	55                   	push   %ebp
    93f4:	89 e5                	mov    %esp,%ebp
    93f6:	83 ec 10             	sub    $0x10,%esp
    93f9:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    93ff:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    9403:	89 c2                	mov    %eax,%edx
    9405:	ee                   	out    %al,(%dx)
    9406:	c9                   	leave  
    9407:	c3                   	ret    

00009408 <outb_pic>:
    9408:	55                   	push   %ebp
    9409:	89 e5                	mov    %esp,%ebp
    940b:	83 ec 0c             	sub    $0xc,%esp
    940e:	8b 45 08             	mov    0x8(%ebp),%eax
    9411:	88 45 fc             	mov    %al,-0x4(%ebp)
    9414:	8b 45 0c             	mov    0xc(%ebp),%eax
    9417:	0f b7 d0             	movzwl %ax,%edx
    941a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    941e:	89 54 24 04          	mov    %edx,0x4(%esp)
    9422:	89 04 24             	mov    %eax,(%esp)
    9425:	e8 8e ff ff ff       	call   93b8 <outb>
    942a:	e8 c4 ff ff ff       	call   93f3 <io_delay>
    942f:	c9                   	leave  
    9430:	c3                   	ret    

00009431 <inb_pic>:
    9431:	55                   	push   %ebp
    9432:	89 e5                	mov    %esp,%ebp
    9434:	83 ec 14             	sub    $0x14,%esp
    9437:	8b 45 08             	mov    0x8(%ebp),%eax
    943a:	0f b7 c0             	movzwl %ax,%eax
    943d:	89 04 24             	mov    %eax,(%esp)
    9440:	e8 91 ff ff ff       	call   93d6 <inb>
    9445:	88 45 ff             	mov    %al,-0x1(%ebp)
    9448:	e8 a6 ff ff ff       	call   93f3 <io_delay>
    944d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9451:	c9                   	leave  
    9452:	c3                   	ret    

00009453 <Init_8259A>:
    9453:	55                   	push   %ebp
    9454:	89 e5                	mov    %esp,%ebp
    9456:	83 ec 08             	sub    $0x8,%esp
    9459:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9460:	00 
    9461:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    9468:	e8 9b ff ff ff       	call   9408 <outb_pic>
    946d:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    9474:	00 
    9475:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    947c:	e8 87 ff ff ff       	call   9408 <outb_pic>
    9481:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9488:	00 
    9489:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    9490:	e8 73 ff ff ff       	call   9408 <outb_pic>
    9495:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    949c:	00 
    949d:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
    94a4:	e8 5f ff ff ff       	call   9408 <outb_pic>
    94a9:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94b0:	00 
    94b1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    94b8:	e8 4b ff ff ff       	call   9408 <outb_pic>
    94bd:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94c4:	00 
    94c5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    94cc:	e8 37 ff ff ff       	call   9408 <outb_pic>
    94d1:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94d8:	00 
    94d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    94e0:	e8 23 ff ff ff       	call   9408 <outb_pic>
    94e5:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94ec:	00 
    94ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    94f4:	e8 0f ff ff ff       	call   9408 <outb_pic>
    94f9:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9500:	00 
    9501:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    9508:	e8 fb fe ff ff       	call   9408 <outb_pic>
    950d:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    9514:	00 
    9515:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    951c:	e8 e7 fe ff ff       	call   9408 <outb_pic>
    9521:	90                   	nop
    9522:	c9                   	leave  
    9523:	c3                   	ret    

00009524 <enable_irq>:
    9524:	55                   	push   %ebp
    9525:	89 e5                	mov    %esp,%ebp
    9527:	83 ec 18             	sub    $0x18,%esp
    952a:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
    952e:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
    9532:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
    9539:	e8 f3 fe ff ff       	call   9431 <inb_pic>
    953e:	88 45 fd             	mov    %al,-0x3(%ebp)
    9541:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
    9548:	e8 e4 fe ff ff       	call   9431 <inb_pic>
    954d:	88 45 fc             	mov    %al,-0x4(%ebp)
    9550:	fa                   	cli    
    9551:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
    9555:	7f 35                	jg     958c <enable_irq+0x68>
    9557:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    955b:	74 2f                	je     958c <enable_irq+0x68>
    955d:	8b 45 08             	mov    0x8(%ebp),%eax
    9560:	ba 01 00 00 00       	mov    $0x1,%edx
    9565:	89 c1                	mov    %eax,%ecx
    9567:	d3 e2                	shl    %cl,%edx
    9569:	89 d0                	mov    %edx,%eax
    956b:	f7 d0                	not    %eax
    956d:	89 c2                	mov    %eax,%edx
    956f:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    9573:	21 d0                	and    %edx,%eax
    9575:	88 45 ff             	mov    %al,-0x1(%ebp)
    9578:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    957c:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9583:	00 
    9584:	89 04 24             	mov    %eax,(%esp)
    9587:	e8 7c fe ff ff       	call   9408 <outb_pic>
    958c:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
    9590:	7e 56                	jle    95e8 <enable_irq+0xc4>
    9592:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
    9596:	7f 50                	jg     95e8 <enable_irq+0xc4>
    9598:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    959c:	83 e0 fb             	and    $0xfffffffb,%eax
    959f:	88 45 ff             	mov    %al,-0x1(%ebp)
    95a2:	8b 45 08             	mov    0x8(%ebp),%eax
    95a5:	83 e8 08             	sub    $0x8,%eax
    95a8:	ba 01 00 00 00       	mov    $0x1,%edx
    95ad:	89 c1                	mov    %eax,%ecx
    95af:	d3 e2                	shl    %cl,%edx
    95b1:	89 d0                	mov    %edx,%eax
    95b3:	f7 d0                	not    %eax
    95b5:	89 c2                	mov    %eax,%edx
    95b7:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    95bb:	21 d0                	and    %edx,%eax
    95bd:	88 45 fe             	mov    %al,-0x2(%ebp)
    95c0:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    95c4:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    95cb:	00 
    95cc:	89 04 24             	mov    %eax,(%esp)
    95cf:	e8 34 fe ff ff       	call   9408 <outb_pic>
    95d4:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
    95d8:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    95df:	00 
    95e0:	89 04 24             	mov    %eax,(%esp)
    95e3:	e8 20 fe ff ff       	call   9408 <outb_pic>
    95e8:	fb                   	sti    
    95e9:	90                   	nop
    95ea:	c9                   	leave  
    95eb:	c3                   	ret    

000095ec <EOI_master>:
    95ec:	55                   	push   %ebp
    95ed:	89 e5                	mov    %esp,%ebp
    95ef:	83 ec 08             	sub    $0x8,%esp
    95f2:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    95f9:	00 
    95fa:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9601:	e8 02 fe ff ff       	call   9408 <outb_pic>
    9606:	fb                   	sti    
    9607:	c9                   	leave  
    9608:	c3                   	ret    

00009609 <EOI_slave>:
    9609:	55                   	push   %ebp
    960a:	89 e5                	mov    %esp,%ebp
    960c:	83 ec 08             	sub    $0x8,%esp
    960f:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9616:	00 
    9617:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    961e:	e8 e5 fd ff ff       	call   9408 <outb_pic>
    9623:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    962a:	00 
    962b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9632:	e8 d1 fd ff ff       	call   9408 <outb_pic>
    9637:	fb                   	sti    
    9638:	c9                   	leave  
    9639:	c3                   	ret    
    963a:	66 90                	xchg   %ax,%ax

0000963c <set_gate>:
    963c:	55                   	push   %ebp
    963d:	89 e5                	mov    %esp,%ebp
    963f:	8b 45 18             	mov    0x18(%ebp),%eax
    9642:	c1 e0 10             	shl    $0x10,%eax
    9645:	89 c2                	mov    %eax,%edx
    9647:	8b 45 10             	mov    0x10(%ebp),%eax
    964a:	0f b7 c0             	movzwl %ax,%eax
    964d:	09 c2                	or     %eax,%edx
    964f:	8b 45 08             	mov    0x8(%ebp),%eax
    9652:	89 10                	mov    %edx,(%eax)
    9654:	8b 45 10             	mov    0x10(%ebp),%eax
    9657:	66 b8 00 00          	mov    $0x0,%ax
    965b:	89 c2                	mov    %eax,%edx
    965d:	8b 45 14             	mov    0x14(%ebp),%eax
    9660:	c1 e0 05             	shl    $0x5,%eax
    9663:	0b 45 0c             	or     0xc(%ebp),%eax
    9666:	0f b6 c0             	movzbl %al,%eax
    9669:	0c 80                	or     $0x80,%al
    966b:	c1 e0 08             	shl    $0x8,%eax
    966e:	09 c2                	or     %eax,%edx
    9670:	8b 45 08             	mov    0x8(%ebp),%eax
    9673:	89 50 04             	mov    %edx,0x4(%eax)
    9676:	5d                   	pop    %ebp
    9677:	c3                   	ret    

00009678 <init_idt>:
    9678:	55                   	push   %ebp
    9679:	89 e5                	mov    %esp,%ebp
    967b:	fa                   	cli    
    967c:	0f 01 1d 00 c0 00 00 	lidtl  0xc000
    9683:	90                   	nop
    9684:	fb                   	sti    
    9685:	90                   	nop
    9686:	5d                   	pop    %ebp
    9687:	c3                   	ret    

00009688 <set_intr_gate>:
    9688:	55                   	push   %ebp
    9689:	89 e5                	mov    %esp,%ebp
    968b:	83 ec 38             	sub    $0x38,%esp
    968e:	8b 45 08             	mov    0x8(%ebp),%eax
    9691:	83 c0 30             	add    $0x30,%eax
    9694:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9697:	8b 45 f4             	mov    -0xc(%ebp),%eax
    969a:	c1 e0 03             	shl    $0x3,%eax
    969d:	8d 90 20 c0 00 00    	lea    0xc020(%eax),%edx
    96a3:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    96aa:	00 
    96ab:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    96b2:	00 
    96b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    96b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    96ba:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
    96c1:	00 
    96c2:	89 14 24             	mov    %edx,(%esp)
    96c5:	e8 72 ff ff ff       	call   963c <set_gate>
    96ca:	8b 45 08             	mov    0x8(%ebp),%eax
    96cd:	89 04 24             	mov    %eax,(%esp)
    96d0:	e8 4f fe ff ff       	call   9524 <enable_irq>
    96d5:	c9                   	leave  
    96d6:	c3                   	ret    
    96d7:	90                   	nop

000096d8 <outb>:
    96d8:	55                   	push   %ebp
    96d9:	89 e5                	mov    %esp,%ebp
    96db:	83 ec 08             	sub    $0x8,%esp
    96de:	8b 55 08             	mov    0x8(%ebp),%edx
    96e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    96e4:	88 55 fc             	mov    %dl,-0x4(%ebp)
    96e7:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    96eb:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    96ef:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    96f3:	ee                   	out    %al,(%dx)
    96f4:	c9                   	leave  
    96f5:	c3                   	ret    

000096f6 <inb>:
    96f6:	55                   	push   %ebp
    96f7:	89 e5                	mov    %esp,%ebp
    96f9:	83 ec 14             	sub    $0x14,%esp
    96fc:	8b 45 08             	mov    0x8(%ebp),%eax
    96ff:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    9703:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    9707:	89 c2                	mov    %eax,%edx
    9709:	ec                   	in     (%dx),%al
    970a:	88 45 ff             	mov    %al,-0x1(%ebp)
    970d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9711:	c9                   	leave  
    9712:	c3                   	ret    

00009713 <io_delay>:
    9713:	55                   	push   %ebp
    9714:	89 e5                	mov    %esp,%ebp
    9716:	83 ec 10             	sub    $0x10,%esp
    9719:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    971f:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    9723:	89 c2                	mov    %eax,%edx
    9725:	ee                   	out    %al,(%dx)
    9726:	c9                   	leave  
    9727:	c3                   	ret    

00009728 <inb_pic>:
    9728:	55                   	push   %ebp
    9729:	89 e5                	mov    %esp,%ebp
    972b:	83 ec 14             	sub    $0x14,%esp
    972e:	8b 45 08             	mov    0x8(%ebp),%eax
    9731:	0f b7 c0             	movzwl %ax,%eax
    9734:	89 04 24             	mov    %eax,(%esp)
    9737:	e8 ba ff ff ff       	call   96f6 <inb>
    973c:	88 45 ff             	mov    %al,-0x1(%ebp)
    973f:	e8 cf ff ff ff       	call   9713 <io_delay>
    9744:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9748:	c9                   	leave  
    9749:	c3                   	ret    

0000974a <outb_pic>:
    974a:	55                   	push   %ebp
    974b:	89 e5                	mov    %esp,%ebp
    974d:	83 ec 0c             	sub    $0xc,%esp
    9750:	8b 45 08             	mov    0x8(%ebp),%eax
    9753:	88 45 fc             	mov    %al,-0x4(%ebp)
    9756:	8b 45 0c             	mov    0xc(%ebp),%eax
    9759:	0f b7 d0             	movzwl %ax,%edx
    975c:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    9760:	89 54 24 04          	mov    %edx,0x4(%esp)
    9764:	89 04 24             	mov    %eax,(%esp)
    9767:	e8 6c ff ff ff       	call   96d8 <outb>
    976c:	e8 a2 ff ff ff       	call   9713 <io_delay>
    9771:	c9                   	leave  
    9772:	c3                   	ret    

00009773 <port_read>:
    9773:	55                   	push   %ebp
    9774:	89 e5                	mov    %esp,%ebp
    9776:	57                   	push   %edi
    9777:	53                   	push   %ebx
    9778:	83 ec 04             	sub    $0x4,%esp
    977b:	8b 45 0c             	mov    0xc(%ebp),%eax
    977e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    9782:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    9786:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9789:	8b 4d 10             	mov    0x10(%ebp),%ecx
    978c:	89 c2                	mov    %eax,%edx
    978e:	89 df                	mov    %ebx,%edi
    9790:	fc                   	cld    
    9791:	d1 e9                	shr    %ecx
    9793:	66 f3 6d             	rep insw (%dx),%es:(%edi)
    9796:	83 c4 04             	add    $0x4,%esp
    9799:	5b                   	pop    %ebx
    979a:	5f                   	pop    %edi
    979b:	5d                   	pop    %ebp
    979c:	c3                   	ret    

0000979d <port_write>:
    979d:	55                   	push   %ebp
    979e:	89 e5                	mov    %esp,%ebp
    97a0:	56                   	push   %esi
    97a1:	53                   	push   %ebx
    97a2:	83 ec 04             	sub    $0x4,%esp
    97a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    97a8:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    97ac:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    97b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
    97b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    97b6:	89 c2                	mov    %eax,%edx
    97b8:	89 de                	mov    %ebx,%esi
    97ba:	fc                   	cld    
    97bb:	d1 e9                	shr    %ecx
    97bd:	66 f3 6f             	rep outsw %ds:(%esi),(%dx)
    97c0:	83 c4 04             	add    $0x4,%esp
    97c3:	5b                   	pop    %ebx
    97c4:	5e                   	pop    %esi
    97c5:	5d                   	pop    %ebp
    97c6:	c3                   	ret    

000097c7 <hd_cmd_out>:
    97c7:	55                   	push   %ebp
    97c8:	89 e5                	mov    %esp,%ebp
    97ca:	83 ec 08             	sub    $0x8,%esp
    97cd:	90                   	nop
    97ce:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    97d5:	e8 4e ff ff ff       	call   9728 <inb_pic>
    97da:	84 c0                	test   %al,%al
    97dc:	78 f0                	js     97ce <hd_cmd_out+0x7>
    97de:	c7 44 24 04 f6 03 00 	movl   $0x3f6,0x4(%esp)
    97e5:	00 
    97e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    97ed:	e8 58 ff ff ff       	call   974a <outb_pic>
    97f2:	8b 45 08             	mov    0x8(%ebp),%eax
    97f5:	0f b6 00             	movzbl (%eax),%eax
    97f8:	0f b6 c0             	movzbl %al,%eax
    97fb:	c7 44 24 04 f1 01 00 	movl   $0x1f1,0x4(%esp)
    9802:	00 
    9803:	89 04 24             	mov    %eax,(%esp)
    9806:	e8 3f ff ff ff       	call   974a <outb_pic>
    980b:	8b 45 08             	mov    0x8(%ebp),%eax
    980e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    9812:	0f b6 c0             	movzbl %al,%eax
    9815:	c7 44 24 04 f2 01 00 	movl   $0x1f2,0x4(%esp)
    981c:	00 
    981d:	89 04 24             	mov    %eax,(%esp)
    9820:	e8 25 ff ff ff       	call   974a <outb_pic>
    9825:	8b 45 08             	mov    0x8(%ebp),%eax
    9828:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    982c:	0f b6 c0             	movzbl %al,%eax
    982f:	c7 44 24 04 f3 01 00 	movl   $0x1f3,0x4(%esp)
    9836:	00 
    9837:	89 04 24             	mov    %eax,(%esp)
    983a:	e8 0b ff ff ff       	call   974a <outb_pic>
    983f:	8b 45 08             	mov    0x8(%ebp),%eax
    9842:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    9846:	0f b6 c0             	movzbl %al,%eax
    9849:	c7 44 24 04 f4 01 00 	movl   $0x1f4,0x4(%esp)
    9850:	00 
    9851:	89 04 24             	mov    %eax,(%esp)
    9854:	e8 f1 fe ff ff       	call   974a <outb_pic>
    9859:	8b 45 08             	mov    0x8(%ebp),%eax
    985c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9860:	0f b6 c0             	movzbl %al,%eax
    9863:	c7 44 24 04 f5 01 00 	movl   $0x1f5,0x4(%esp)
    986a:	00 
    986b:	89 04 24             	mov    %eax,(%esp)
    986e:	e8 d7 fe ff ff       	call   974a <outb_pic>
    9873:	8b 45 08             	mov    0x8(%ebp),%eax
    9876:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    987a:	0f b6 c0             	movzbl %al,%eax
    987d:	c7 44 24 04 f6 01 00 	movl   $0x1f6,0x4(%esp)
    9884:	00 
    9885:	89 04 24             	mov    %eax,(%esp)
    9888:	e8 bd fe ff ff       	call   974a <outb_pic>
    988d:	8b 45 08             	mov    0x8(%ebp),%eax
    9890:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    9894:	0f b6 c0             	movzbl %al,%eax
    9897:	c7 44 24 04 f7 01 00 	movl   $0x1f7,0x4(%esp)
    989e:	00 
    989f:	89 04 24             	mov    %eax,(%esp)
    98a2:	e8 a3 fe ff ff       	call   974a <outb_pic>
    98a7:	c9                   	leave  
    98a8:	c3                   	ret    

000098a9 <hd_handler>:
    98a9:	55                   	push   %ebp
    98aa:	89 e5                	mov    %esp,%ebp
    98ac:	83 ec 18             	sub    $0x18,%esp
    98af:	a1 20 c8 00 00       	mov    0xc820,%eax
    98b4:	83 f8 30             	cmp    $0x30,%eax
    98b7:	74 30                	je     98e9 <hd_handler+0x40>
    98b9:	3d ec 00 00 00       	cmp    $0xec,%eax
    98be:	74 05                	je     98c5 <hd_handler+0x1c>
    98c0:	83 f8 20             	cmp    $0x20,%eax
    98c3:	75 25                	jne    98ea <hd_handler+0x41>
    98c5:	8b 15 2c c8 00 00    	mov    0xc82c,%edx
    98cb:	a1 30 c8 00 00       	mov    0xc830,%eax
    98d0:	0f b7 c0             	movzwl %ax,%eax
    98d3:	89 54 24 08          	mov    %edx,0x8(%esp)
    98d7:	89 44 24 04          	mov    %eax,0x4(%esp)
    98db:	c7 04 24 38 c8 00 00 	movl   $0xc838,(%esp)
    98e2:	e8 8c fe ff ff       	call   9773 <port_read>
    98e7:	eb 01                	jmp    98ea <hd_handler+0x41>
    98e9:	90                   	nop
    98ea:	c7 05 20 c8 00 00 00 	movl   $0x0,0xc820
    98f1:	00 00 00 
    98f4:	e8 10 fd ff ff       	call   9609 <EOI_slave>
    98f9:	90                   	nop
    98fa:	c9                   	leave  
    98fb:	c3                   	ret    

000098fc <hd_identify>:
    98fc:	55                   	push   %ebp
    98fd:	89 e5                	mov    %esp,%ebp
    98ff:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9905:	c6 85 f6 fd ff ff e0 	movb   $0xe0,-0x20a(%ebp)
    990c:	c6 85 f7 fd ff ff ec 	movb   $0xec,-0x209(%ebp)
    9913:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    9919:	a3 28 c8 00 00       	mov    %eax,0xc828
    991e:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    9925:	0f b6 c0             	movzbl %al,%eax
    9928:	a3 20 c8 00 00       	mov    %eax,0xc820
    992d:	c7 05 24 c8 00 00 73 	movl   $0x9773,0xc824
    9934:	97 00 00 
    9937:	c7 05 2c c8 00 00 00 	movl   $0x200,0xc82c
    993e:	02 00 00 
    9941:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9948:	01 00 00 
    994b:	c7 05 34 c8 00 00 01 	movl   $0x1,0xc834
    9952:	00 00 00 
    9955:	8d 85 f1 fd ff ff    	lea    -0x20f(%ebp),%eax
    995b:	89 04 24             	mov    %eax,(%esp)
    995e:	e8 64 fe ff ff       	call   97c7 <hd_cmd_out>
    9963:	90                   	nop
    9964:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    996a:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    9971:	0f b6 c0             	movzbl %al,%eax
    9974:	39 c2                	cmp    %eax,%edx
    9976:	74 ec                	je     9964 <hd_identify+0x68>
    9978:	a1 2c c8 00 00       	mov    0xc82c,%eax
    997d:	89 44 24 08          	mov    %eax,0x8(%esp)
    9981:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    9988:	00 
    9989:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    998f:	89 04 24             	mov    %eax,(%esp)
    9992:	e8 39 02 00 00       	call   9bd0 <memcpy>
    9997:	90                   	nop
    9998:	c9                   	leave  
    9999:	c3                   	ret    

0000999a <hd_read>:
    999a:	55                   	push   %ebp
    999b:	89 e5                	mov    %esp,%ebp
    999d:	83 ec 28             	sub    $0x28,%esp
    99a0:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
    99a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    99a7:	88 45 ee             	mov    %al,-0x12(%ebp)
    99aa:	8b 45 08             	mov    0x8(%ebp),%eax
    99ad:	88 45 ef             	mov    %al,-0x11(%ebp)
    99b0:	8b 45 08             	mov    0x8(%ebp),%eax
    99b3:	c1 e8 08             	shr    $0x8,%eax
    99b6:	88 45 f0             	mov    %al,-0x10(%ebp)
    99b9:	8b 45 08             	mov    0x8(%ebp),%eax
    99bc:	c1 e8 10             	shr    $0x10,%eax
    99bf:	88 45 f1             	mov    %al,-0xf(%ebp)
    99c2:	8b 45 08             	mov    0x8(%ebp),%eax
    99c5:	c1 e8 18             	shr    $0x18,%eax
    99c8:	83 e0 0f             	and    $0xf,%eax
    99cb:	83 c8 e0             	or     $0xffffffe0,%eax
    99ce:	88 45 f2             	mov    %al,-0xe(%ebp)
    99d1:	c6 45 f3 20          	movb   $0x20,-0xd(%ebp)
    99d5:	8b 45 10             	mov    0x10(%ebp),%eax
    99d8:	a3 28 c8 00 00       	mov    %eax,0xc828
    99dd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    99e1:	0f b6 c0             	movzbl %al,%eax
    99e4:	a3 20 c8 00 00       	mov    %eax,0xc820
    99e9:	c7 05 24 c8 00 00 73 	movl   $0x9773,0xc824
    99f0:	97 00 00 
    99f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    99f6:	a3 34 c8 00 00       	mov    %eax,0xc834
    99fb:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9a02:	01 00 00 
    9a05:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a08:	c1 e0 09             	shl    $0x9,%eax
    9a0b:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9a10:	8d 45 ed             	lea    -0x13(%ebp),%eax
    9a13:	89 04 24             	mov    %eax,(%esp)
    9a16:	e8 ac fd ff ff       	call   97c7 <hd_cmd_out>
    9a1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9a22:	eb 09                	jmp    9a2d <hd_read+0x93>
    9a24:	e8 ea fc ff ff       	call   9713 <io_delay>
    9a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a2d:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    9a34:	7e ee                	jle    9a24 <hd_read+0x8a>
    9a36:	90                   	nop
    9a37:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9a3d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    9a41:	0f b6 c0             	movzbl %al,%eax
    9a44:	39 c2                	cmp    %eax,%edx
    9a46:	74 ef                	je     9a37 <hd_read+0x9d>
    9a48:	a1 2c c8 00 00       	mov    0xc82c,%eax
    9a4d:	89 44 24 08          	mov    %eax,0x8(%esp)
    9a51:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    9a58:	00 
    9a59:	8b 45 10             	mov    0x10(%ebp),%eax
    9a5c:	89 04 24             	mov    %eax,(%esp)
    9a5f:	e8 6c 01 00 00       	call   9bd0 <memcpy>
    9a64:	90                   	nop
    9a65:	c9                   	leave  
    9a66:	c3                   	ret    

00009a67 <hd_write>:
    9a67:	55                   	push   %ebp
    9a68:	89 e5                	mov    %esp,%ebp
    9a6a:	83 ec 1c             	sub    $0x1c,%esp
    9a6d:	c6 45 f9 00          	movb   $0x0,-0x7(%ebp)
    9a71:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a74:	88 45 fa             	mov    %al,-0x6(%ebp)
    9a77:	8b 45 08             	mov    0x8(%ebp),%eax
    9a7a:	88 45 fb             	mov    %al,-0x5(%ebp)
    9a7d:	8b 45 08             	mov    0x8(%ebp),%eax
    9a80:	c1 e8 08             	shr    $0x8,%eax
    9a83:	88 45 fc             	mov    %al,-0x4(%ebp)
    9a86:	8b 45 08             	mov    0x8(%ebp),%eax
    9a89:	c1 e8 10             	shr    $0x10,%eax
    9a8c:	88 45 fd             	mov    %al,-0x3(%ebp)
    9a8f:	8b 45 08             	mov    0x8(%ebp),%eax
    9a92:	c1 e8 18             	shr    $0x18,%eax
    9a95:	83 e0 0f             	and    $0xf,%eax
    9a98:	83 c8 e0             	or     $0xffffffe0,%eax
    9a9b:	88 45 fe             	mov    %al,-0x2(%ebp)
    9a9e:	c6 45 ff 30          	movb   $0x30,-0x1(%ebp)
    9aa2:	8b 45 10             	mov    0x10(%ebp),%eax
    9aa5:	a3 28 c8 00 00       	mov    %eax,0xc828
    9aaa:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9aae:	0f b6 c0             	movzbl %al,%eax
    9ab1:	a3 20 c8 00 00       	mov    %eax,0xc820
    9ab6:	c7 05 24 c8 00 00 9d 	movl   $0x979d,0xc824
    9abd:	97 00 00 
    9ac0:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9ac7:	01 00 00 
    9aca:	8b 45 0c             	mov    0xc(%ebp),%eax
    9acd:	c1 e0 09             	shl    $0x9,%eax
    9ad0:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9ad5:	8d 45 f9             	lea    -0x7(%ebp),%eax
    9ad8:	89 04 24             	mov    %eax,(%esp)
    9adb:	e8 e7 fc ff ff       	call   97c7 <hd_cmd_out>
    9ae0:	90                   	nop
    9ae1:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    9ae8:	e8 3b fc ff ff       	call   9728 <inb_pic>
    9aed:	0f b6 c0             	movzbl %al,%eax
    9af0:	83 e0 08             	and    $0x8,%eax
    9af3:	85 c0                	test   %eax,%eax
    9af5:	74 ea                	je     9ae1 <hd_write+0x7a>
    9af7:	8b 0d 2c c8 00 00    	mov    0xc82c,%ecx
    9afd:	a1 30 c8 00 00       	mov    0xc830,%eax
    9b02:	0f b7 d0             	movzwl %ax,%edx
    9b05:	a1 28 c8 00 00       	mov    0xc828,%eax
    9b0a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    9b0e:	89 54 24 04          	mov    %edx,0x4(%esp)
    9b12:	89 04 24             	mov    %eax,(%esp)
    9b15:	e8 83 fc ff ff       	call   979d <port_write>
    9b1a:	90                   	nop
    9b1b:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9b21:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9b25:	0f b6 c0             	movzbl %al,%eax
    9b28:	39 c2                	cmp    %eax,%edx
    9b2a:	74 ef                	je     9b1b <hd_write+0xb4>
    9b2c:	90                   	nop
    9b2d:	c9                   	leave  
    9b2e:	c3                   	ret    

00009b2f <init_hd>:
    9b2f:	55                   	push   %ebp
    9b30:	89 e5                	mov    %esp,%ebp
    9b32:	83 ec 18             	sub    $0x18,%esp
    9b35:	c7 05 18 dc 00 00 a9 	movl   $0x98a9,0xdc18
    9b3c:	98 00 00 
    9b3f:	c7 44 24 04 63 a7 00 	movl   $0xa763,0x4(%esp)
    9b46:	00 
    9b47:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9b4e:	e8 35 fb ff ff       	call   9688 <set_intr_gate>
    9b53:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9b5a:	e8 c5 f9 ff ff       	call   9524 <enable_irq>
    9b5f:	c9                   	leave  
    9b60:	c3                   	ret    
    9b61:	66 90                	xchg   %ax,%ax
    9b63:	90                   	nop

00009b64 <timer_handler>:
    9b64:	55                   	push   %ebp
    9b65:	89 e5                	mov    %esp,%ebp
    9b67:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9b6e:	3c 7a                	cmp    $0x7a,%al
    9b70:	75 07                	jne    9b79 <timer_handler+0x15>
    9b72:	c6 05 08 c0 00 00 41 	movb   $0x41,0xc008
    9b79:	b4 0c                	mov    $0xc,%ah
    9b7b:	a0 08 c0 00 00       	mov    0xc008,%al
    9b80:	65 66 a3 00 0f 00 00 	mov    %ax,%gs:0xf00
    9b87:	b0 20                	mov    $0x20,%al
    9b89:	e6 20                	out    %al,$0x20
    9b8b:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9b92:	83 c0 01             	add    $0x1,%eax
    9b95:	a2 08 c0 00 00       	mov    %al,0xc008
    9b9a:	90                   	nop
    9b9b:	5d                   	pop    %ebp
    9b9c:	c3                   	ret    

00009b9d <init_timer>:
    9b9d:	55                   	push   %ebp
    9b9e:	89 e5                	mov    %esp,%ebp
    9ba0:	83 ec 18             	sub    $0x18,%esp
    9ba3:	c7 05 e0 db 00 00 64 	movl   $0x9b64,0xdbe0
    9baa:	9b 00 00 
    9bad:	c7 44 24 04 24 a7 00 	movl   $0xa724,0x4(%esp)
    9bb4:	00 
    9bb5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bbc:	e8 c7 fa ff ff       	call   9688 <set_intr_gate>
    9bc1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bc8:	e8 57 f9 ff ff       	call   9524 <enable_irq>
    9bcd:	c9                   	leave  
    9bce:	c3                   	ret    
    9bcf:	90                   	nop

00009bd0 <memcpy>:
    9bd0:	55                   	push   %ebp
    9bd1:	89 e5                	mov    %esp,%ebp
    9bd3:	83 ec 10             	sub    $0x10,%esp
    9bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    9bd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    9bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
    9bdf:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9be2:	eb 17                	jmp    9bfb <memcpy+0x2b>
    9be4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9be7:	8d 50 01             	lea    0x1(%eax),%edx
    9bea:	89 55 fc             	mov    %edx,-0x4(%ebp)
    9bed:	8b 55 f8             	mov    -0x8(%ebp),%edx
    9bf0:	8d 4a 01             	lea    0x1(%edx),%ecx
    9bf3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    9bf6:	0f b6 12             	movzbl (%edx),%edx
    9bf9:	88 10                	mov    %dl,(%eax)
    9bfb:	8b 45 10             	mov    0x10(%ebp),%eax
    9bfe:	8d 50 ff             	lea    -0x1(%eax),%edx
    9c01:	89 55 10             	mov    %edx,0x10(%ebp)
    9c04:	85 c0                	test   %eax,%eax
    9c06:	75 dc                	jne    9be4 <memcpy+0x14>
    9c08:	8b 45 08             	mov    0x8(%ebp),%eax
    9c0b:	c9                   	leave  
    9c0c:	c3                   	ret    

00009c0d <strlen>:
    9c0d:	55                   	push   %ebp
    9c0e:	89 e5                	mov    %esp,%ebp
    9c10:	83 ec 10             	sub    $0x10,%esp
    9c13:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c1a:	8b 45 08             	mov    0x8(%ebp),%eax
    9c1d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9c20:	eb 08                	jmp    9c2a <strlen+0x1d>
    9c22:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    9c26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9c2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9c2d:	0f b6 00             	movzbl (%eax),%eax
    9c30:	84 c0                	test   %al,%al
    9c32:	75 ee                	jne    9c22 <strlen+0x15>
    9c34:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9c37:	c9                   	leave  
    9c38:	c3                   	ret    

00009c39 <strcmp>:
    9c39:	55                   	push   %ebp
    9c3a:	89 e5                	mov    %esp,%ebp
    9c3c:	eb 0c                	jmp    9c4a <strcmp+0x11>
    9c3e:	8b 45 08             	mov    0x8(%ebp),%eax
    9c41:	0f b6 00             	movzbl (%eax),%eax
    9c44:	84 c0                	test   %al,%al
    9c46:	75 02                	jne    9c4a <strcmp+0x11>
    9c48:	eb 1c                	jmp    9c66 <strcmp+0x2d>
    9c4a:	8b 45 08             	mov    0x8(%ebp),%eax
    9c4d:	8d 50 01             	lea    0x1(%eax),%edx
    9c50:	89 55 08             	mov    %edx,0x8(%ebp)
    9c53:	0f b6 08             	movzbl (%eax),%ecx
    9c56:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c59:	8d 50 01             	lea    0x1(%eax),%edx
    9c5c:	89 55 0c             	mov    %edx,0xc(%ebp)
    9c5f:	0f b6 00             	movzbl (%eax),%eax
    9c62:	38 c1                	cmp    %al,%cl
    9c64:	74 d8                	je     9c3e <strcmp+0x5>
    9c66:	8b 45 08             	mov    0x8(%ebp),%eax
    9c69:	0f b6 00             	movzbl (%eax),%eax
    9c6c:	0f be d0             	movsbl %al,%edx
    9c6f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c72:	0f b6 00             	movzbl (%eax),%eax
    9c75:	0f be c0             	movsbl %al,%eax
    9c78:	29 c2                	sub    %eax,%edx
    9c7a:	89 d0                	mov    %edx,%eax
    9c7c:	5d                   	pop    %ebp
    9c7d:	c3                   	ret    

00009c7e <memset>:
    9c7e:	55                   	push   %ebp
    9c7f:	89 e5                	mov    %esp,%ebp
    9c81:	83 ec 10             	sub    $0x10,%esp
    9c84:	8b 45 08             	mov    0x8(%ebp),%eax
    9c87:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9c8a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c91:	eb 12                	jmp    9ca5 <memset+0x27>
    9c93:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9c96:	8d 50 01             	lea    0x1(%eax),%edx
    9c99:	89 55 f8             	mov    %edx,-0x8(%ebp)
    9c9c:	8b 55 0c             	mov    0xc(%ebp),%edx
    9c9f:	88 10                	mov    %dl,(%eax)
    9ca1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9ca5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9ca8:	3b 45 10             	cmp    0x10(%ebp),%eax
    9cab:	72 e6                	jb     9c93 <memset+0x15>
    9cad:	8b 45 08             	mov    0x8(%ebp),%eax
    9cb0:	c9                   	leave  
    9cb1:	c3                   	ret    
    9cb2:	66 90                	xchg   %ax,%ax

00009cb4 <get_part_information>:
    9cb4:	55                   	push   %ebp
    9cb5:	89 e5                	mov    %esp,%ebp
    9cb7:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9cbd:	c7 45 f4 be 01 00 00 	movl   $0x1be,-0xc(%ebp)
    9cc4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ccb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cd2:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9cd8:	89 44 24 08          	mov    %eax,0x8(%esp)
    9cdc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9ce3:	00 
    9ce4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9ceb:	e8 aa fc ff ff       	call   999a <hd_read>
    9cf0:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9cf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9cf9:	01 d0                	add    %edx,%eax
    9cfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9cfe:	eb 74                	jmp    9d74 <get_part_information+0xc0>
    9d00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d03:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d07:	3c 05                	cmp    $0x5,%al
    9d09:	75 29                	jne    9d34 <get_part_information+0x80>
    9d0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d0e:	c1 e0 04             	shl    $0x4,%eax
    9d11:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9d17:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d1a:	8b 08                	mov    (%eax),%ecx
    9d1c:	89 0a                	mov    %ecx,(%edx)
    9d1e:	8b 48 04             	mov    0x4(%eax),%ecx
    9d21:	89 4a 04             	mov    %ecx,0x4(%edx)
    9d24:	8b 48 08             	mov    0x8(%eax),%ecx
    9d27:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d2a:	8b 40 0c             	mov    0xc(%eax),%eax
    9d2d:	89 42 0c             	mov    %eax,0xc(%edx)
    9d30:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d34:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d37:	c1 e0 04             	shl    $0x4,%eax
    9d3a:	8d 90 60 d5 00 00    	lea    0xd560(%eax),%edx
    9d40:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d43:	8b 08                	mov    (%eax),%ecx
    9d45:	89 0a                	mov    %ecx,(%edx)
    9d47:	8b 48 04             	mov    0x4(%eax),%ecx
    9d4a:	89 4a 04             	mov    %ecx,0x4(%edx)
    9d4d:	8b 48 08             	mov    0x8(%eax),%ecx
    9d50:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d53:	8b 40 0c             	mov    0xc(%eax),%eax
    9d56:	89 42 0c             	mov    %eax,0xc(%edx)
    9d59:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d60:	83 c0 10             	add    $0x10,%eax
    9d63:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9d66:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d6f:	01 d0                	add    %edx,%eax
    9d71:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d77:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d7b:	84 c0                	test   %al,%al
    9d7d:	74 0d                	je     9d8c <get_part_information+0xd8>
    9d7f:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    9d86:	0f 8e 74 ff ff ff    	jle    9d00 <get_part_information+0x4c>
    9d8c:	c7 45 f0 40 cc 00 00 	movl   $0xcc40,-0x10(%ebp)
    9d93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d96:	8b 40 08             	mov    0x8(%eax),%eax
    9d99:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9d9f:	89 54 24 08          	mov    %edx,0x8(%esp)
    9da3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9daa:	00 
    9dab:	89 04 24             	mov    %eax,(%esp)
    9dae:	e8 e7 fb ff ff       	call   999a <hd_read>
    9db3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9db9:	05 be 01 00 00       	add    $0x1be,%eax
    9dbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9dc1:	e9 b2 00 00 00       	jmp    9e78 <get_part_information+0x1c4>
    9dc6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9dcc:	05 be 01 00 00       	add    $0x1be,%eax
    9dd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9dd4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9dd7:	c1 e0 04             	shl    $0x4,%eax
    9dda:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9de0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9de3:	8b 08                	mov    (%eax),%ecx
    9de5:	89 0a                	mov    %ecx,(%edx)
    9de7:	8b 48 04             	mov    0x4(%eax),%ecx
    9dea:	89 4a 04             	mov    %ecx,0x4(%edx)
    9ded:	8b 48 08             	mov    0x8(%eax),%ecx
    9df0:	89 4a 08             	mov    %ecx,0x8(%edx)
    9df3:	8b 40 0c             	mov    0xc(%eax),%eax
    9df6:	89 42 0c             	mov    %eax,0xc(%edx)
    9df9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9dfd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e03:	05 ce 01 00 00       	add    $0x1ce,%eax
    9e08:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9e0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e0e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9e12:	84 c0                	test   %al,%al
    9e14:	74 60                	je     9e76 <get_part_information+0x1c2>
    9e16:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9e19:	c1 e0 04             	shl    $0x4,%eax
    9e1c:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9e22:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e25:	8b 08                	mov    (%eax),%ecx
    9e27:	89 0a                	mov    %ecx,(%edx)
    9e29:	8b 48 04             	mov    0x4(%eax),%ecx
    9e2c:	89 4a 04             	mov    %ecx,0x4(%edx)
    9e2f:	8b 48 08             	mov    0x8(%eax),%ecx
    9e32:	89 4a 08             	mov    %ecx,0x8(%edx)
    9e35:	8b 40 0c             	mov    0xc(%eax),%eax
    9e38:	89 42 0c             	mov    %eax,0xc(%edx)
    9e3b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9e3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e42:	8b 50 08             	mov    0x8(%eax),%edx
    9e45:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9e4a:	01 c2                	add    %eax,%edx
    9e4c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e52:	89 44 24 08          	mov    %eax,0x8(%esp)
    9e56:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9e5d:	00 
    9e5e:	89 14 24             	mov    %edx,(%esp)
    9e61:	e8 34 fb ff ff       	call   999a <hd_read>
    9e66:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e6c:	05 be 01 00 00       	add    $0x1be,%eax
    9e71:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9e74:	eb 02                	jmp    9e78 <get_part_information+0x1c4>
    9e76:	eb 0f                	jmp    9e87 <get_part_information+0x1d3>
    9e78:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e7b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9e7f:	84 c0                	test   %al,%al
    9e81:	0f 85 3f ff ff ff    	jne    9dc6 <get_part_information+0x112>
    9e87:	c9                   	leave  
    9e88:	c3                   	ret    

00009e89 <make_fs>:
    9e89:	55                   	push   %ebp
    9e8a:	89 e5                	mov    %esp,%ebp
    9e8c:	81 ec 78 02 00 00    	sub    $0x278,%esp
    9e92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e99:	eb 26                	jmp    9ec1 <make_fs+0x38>
    9e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e9e:	c1 e0 04             	shl    $0x4,%eax
    9ea1:	05 64 d5 00 00       	add    $0xd564,%eax
    9ea6:	0f b6 00             	movzbl (%eax),%eax
    9ea9:	3c 0d                	cmp    $0xd,%al
    9eab:	75 10                	jne    9ebd <make_fs+0x34>
    9ead:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9eb0:	c1 e0 04             	shl    $0x4,%eax
    9eb3:	05 60 d5 00 00       	add    $0xd560,%eax
    9eb8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9ebb:	eb 0a                	jmp    9ec7 <make_fs+0x3e>
    9ebd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9ec1:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9ec5:	7e d4                	jle    9e9b <make_fs+0x12>
    9ec7:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9ecc:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9ed1:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9ed5:	0f 8e 81 00 00 00    	jle    9f5c <make_fs+0xd3>
    9edb:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9ee2:	84 c0                	test   %al,%al
    9ee4:	74 76                	je     9f5c <make_fs+0xd3>
    9ee6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9eed:	eb 67                	jmp    9f56 <make_fs+0xcd>
    9eef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ef2:	c1 e0 04             	shl    $0x4,%eax
    9ef5:	05 44 cc 00 00       	add    $0xcc44,%eax
    9efa:	0f b6 00             	movzbl (%eax),%eax
    9efd:	3c 0d                	cmp    $0xd,%al
    9eff:	75 51                	jne    9f52 <make_fs+0xc9>
    9f01:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f04:	c1 e0 04             	shl    $0x4,%eax
    9f07:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9f0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f12:	83 e8 01             	sub    $0x1,%eax
    9f15:	c1 e0 04             	shl    $0x4,%eax
    9f18:	05 44 cc 00 00       	add    $0xcc44,%eax
    9f1d:	0f b6 10             	movzbl (%eax),%edx
    9f20:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9f27:	38 c2                	cmp    %al,%dl
    9f29:	75 25                	jne    9f50 <make_fs+0xc7>
    9f2b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9f2f:	74 1f                	je     9f50 <make_fs+0xc7>
    9f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f34:	83 e8 01             	sub    $0x1,%eax
    9f37:	c1 e0 04             	shl    $0x4,%eax
    9f3a:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f3f:	8b 50 08             	mov    0x8(%eax),%edx
    9f42:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9f47:	01 d0                	add    %edx,%eax
    9f49:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9f4e:	eb 0c                	jmp    9f5c <make_fs+0xd3>
    9f50:	eb 0a                	jmp    9f5c <make_fs+0xd3>
    9f52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f56:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f5a:	7e 93                	jle    9eef <make_fs+0x66>
    9f5c:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f60:	7e 4a                	jle    9fac <make_fs+0x123>
    9f62:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f69:	00 
    9f6a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f71:	00 
    9f72:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    9f79:	00 
    9f7a:	c7 04 24 88 a8 00 00 	movl   $0xa888,(%esp)
    9f81:	e8 2e f3 ff ff       	call   92b4 <dis_str>
    9f86:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f8d:	00 
    9f8e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f95:	00 
    9f96:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    9f9d:	00 
    9f9e:	c7 04 24 90 a8 00 00 	movl   $0xa890,(%esp)
    9fa5:	e8 0a f3 ff ff       	call   92b4 <dis_str>
    9faa:	eb fe                	jmp    9faa <make_fs+0x121>
    9fac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9faf:	8b 50 08             	mov    0x8(%eax),%edx
    9fb2:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9fb7:	01 d0                	add    %edx,%eax
    9fb9:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9fbe:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9fc3:	8d 50 01             	lea    0x1(%eax),%edx
    9fc6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9fcc:	89 44 24 08          	mov    %eax,0x8(%esp)
    9fd0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9fd7:	00 
    9fd8:	89 14 24             	mov    %edx,(%esp)
    9fdb:	e8 ba f9 ff ff       	call   999a <hd_read>
    9fe0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9fe6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9fe9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9fec:	8b 00                	mov    (%eax),%eax
    9fee:	3d 8f 9a 08 00       	cmp    $0x89a8f,%eax
    9ff3:	75 0a                	jne    9fff <make_fs+0x176>
    9ff5:	b8 00 00 00 00       	mov    $0x0,%eax
    9ffa:	e9 aa 03 00 00       	jmp    a3a9 <make_fs+0x520>
    9fff:	c7 85 ac fd ff ff 8f 	movl   $0x89a8f,-0x254(%ebp)
    a006:	9a 08 00 
    a009:	c7 85 b0 fd ff ff 64 	movl   $0x64,-0x250(%ebp)
    a010:	00 00 00 
    a013:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a016:	8b 40 0c             	mov    0xc(%eax),%eax
    a019:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    a01f:	c7 85 b8 fd ff ff 01 	movl   $0x1,-0x248(%ebp)
    a026:	00 00 00 
    a029:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a02e:	83 c0 02             	add    $0x2,%eax
    a031:	89 85 bc fd ff ff    	mov    %eax,-0x244(%ebp)
    a037:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a03a:	8b 40 0c             	mov    0xc(%eax),%eax
    a03d:	c1 e8 0c             	shr    $0xc,%eax
    a040:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%ebp)
    a046:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a04c:	83 c0 01             	add    $0x1,%eax
    a04f:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
    a055:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
    a05b:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a061:	01 d0                	add    %edx,%eax
    a063:	89 85 c8 fd ff ff    	mov    %eax,-0x238(%ebp)
    a069:	c7 85 d0 fd ff ff 03 	movl   $0x3,-0x230(%ebp)
    a070:	00 00 00 
    a073:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a079:	83 c0 01             	add    $0x1,%eax
    a07c:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%ebp)
    a082:	c7 85 e0 fd ff ff 10 	movl   $0x10,-0x220(%ebp)
    a089:	00 00 00 
    a08c:	c7 85 d8 fd ff ff 00 	movl   $0x0,-0x228(%ebp)
    a093:	00 00 00 
    a096:	8b 95 c8 fd ff ff    	mov    -0x238(%ebp),%edx
    a09c:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a0a2:	01 d0                	add    %edx,%eax
    a0a4:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%ebp)
    a0aa:	c7 85 dc fd ff ff 03 	movl   $0x3,-0x224(%ebp)
    a0b1:	00 00 00 
    a0b4:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a0ba:	83 c0 01             	add    $0x1,%eax
    a0bd:	89 85 dc fd ff ff    	mov    %eax,-0x224(%ebp)
    a0c3:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
    a0c9:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a0cf:	01 d0                	add    %edx,%eax
    a0d1:	89 85 cc fd ff ff    	mov    %eax,-0x234(%ebp)
    a0d7:	c7 85 e4 fd ff ff 10 	movl   $0x10,-0x21c(%ebp)
    a0de:	00 00 00 
    a0e1:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a0e8:	00 
    a0e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a0f0:	00 
    a0f1:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a0f7:	89 04 24             	mov    %eax,(%esp)
    a0fa:	e8 7f fb ff ff       	call   9c7e <memset>
    a0ff:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
    a105:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a10b:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
    a111:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a117:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
    a11d:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a123:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
    a129:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a12f:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a135:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%ebp)
    a13b:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a141:	89 85 fc fd ff ff    	mov    %eax,-0x204(%ebp)
    a147:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
    a14d:	89 85 00 fe ff ff    	mov    %eax,-0x200(%ebp)
    a153:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a159:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%ebp)
    a15f:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
    a165:	89 85 08 fe ff ff    	mov    %eax,-0x1f8(%ebp)
    a16b:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a171:	89 85 0c fe ff ff    	mov    %eax,-0x1f4(%ebp)
    a177:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a17d:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%ebp)
    a183:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a189:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%ebp)
    a18f:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a195:	89 85 18 fe ff ff    	mov    %eax,-0x1e8(%ebp)
    a19b:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
    a1a1:	89 85 1c fe ff ff    	mov    %eax,-0x1e4(%ebp)
    a1a7:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
    a1ad:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%ebp)
    a1b3:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a1b8:	8d 50 01             	lea    0x1(%eax),%edx
    a1bb:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
    a1c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    a1c5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a1cc:	00 
    a1cd:	89 14 24             	mov    %edx,(%esp)
    a1d0:	e8 92 f8 ff ff       	call   9a67 <hd_write>
    a1d5:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a1dc:	00 
    a1dd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a1e4:	00 
    a1e5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a1eb:	89 04 24             	mov    %eax,(%esp)
    a1ee:	e8 8b fa ff ff       	call   9c7e <memset>
    a1f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a1fa:	eb 29                	jmp    a225 <make_fs+0x39c>
    a1fc:	8b 95 c8 fd ff ff    	mov    -0x238(%ebp),%edx
    a202:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a205:	01 c2                	add    %eax,%edx
    a207:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a20d:	89 44 24 08          	mov    %eax,0x8(%esp)
    a211:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a218:	00 
    a219:	89 14 24             	mov    %edx,(%esp)
    a21c:	e8 46 f8 ff ff       	call   9a67 <hd_write>
    a221:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a225:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a228:	83 f8 03             	cmp    $0x3,%eax
    a22b:	76 cf                	jbe    a1fc <make_fs+0x373>
    a22d:	c7 85 9c fd ff ff 02 	movl   $0x2,-0x264(%ebp)
    a234:	00 00 00 
    a237:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a23d:	c1 e0 09             	shl    $0x9,%eax
    a240:	89 85 a0 fd ff ff    	mov    %eax,-0x260(%ebp)
    a246:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a24c:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
    a252:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a258:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    a25e:	8b 85 9c fd ff ff    	mov    -0x264(%ebp),%eax
    a264:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a26a:	8b 85 a0 fd ff ff    	mov    -0x260(%ebp),%eax
    a270:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a276:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
    a27c:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a282:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    a288:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a28e:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a294:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    a29a:	89 54 24 08          	mov    %edx,0x8(%esp)
    a29e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2a5:	00 
    a2a6:	89 04 24             	mov    %eax,(%esp)
    a2a9:	e8 b9 f7 ff ff       	call   9a67 <hd_write>
    a2ae:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a2b5:	00 
    a2b6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a2bd:	00 
    a2be:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a2c4:	89 04 24             	mov    %eax,(%esp)
    a2c7:	e8 b2 f9 ff ff       	call   9c7e <memset>
    a2cc:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a2d2:	c6 84 05 e8 fd ff ff 	movb   $0x1,-0x218(%ebp,%eax,1)
    a2d9:	01 
    a2da:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a2e0:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    a2e6:	89 54 24 08          	mov    %edx,0x8(%esp)
    a2ea:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2f1:	00 
    a2f2:	89 04 24             	mov    %eax,(%esp)
    a2f5:	e8 6d f7 ff ff       	call   9a67 <hd_write>
    a2fa:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a300:	c6 84 05 e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%eax,1)
    a307:	00 
    a308:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a30f:	eb 29                	jmp    a33a <make_fs+0x4b1>
    a311:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
    a317:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a31a:	01 c2                	add    %eax,%edx
    a31c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a322:	89 44 24 08          	mov    %eax,0x8(%esp)
    a326:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a32d:	00 
    a32e:	89 14 24             	mov    %edx,(%esp)
    a331:	e8 31 f7 ff ff       	call   9a67 <hd_write>
    a336:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a33a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a33d:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a343:	39 c2                	cmp    %eax,%edx
    a345:	72 ca                	jb     a311 <make_fs+0x488>
    a347:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a34e:	00 
    a34f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a356:	00 
    a357:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a35d:	89 04 24             	mov    %eax,(%esp)
    a360:	e8 19 f9 ff ff       	call   9c7e <memset>
    a365:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a36c:	eb 29                	jmp    a397 <make_fs+0x50e>
    a36e:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
    a374:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a377:	01 c2                	add    %eax,%edx
    a379:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a37f:	89 44 24 08          	mov    %eax,0x8(%esp)
    a383:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a38a:	00 
    a38b:	89 14 24             	mov    %edx,(%esp)
    a38e:	e8 d4 f6 ff ff       	call   9a67 <hd_write>
    a393:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a397:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a39a:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a3a0:	39 c2                	cmp    %eax,%edx
    a3a2:	72 ca                	jb     a36e <make_fs+0x4e5>
    a3a4:	b8 01 00 00 00       	mov    $0x1,%eax
    a3a9:	c9                   	leave  
    a3aa:	c3                   	ret    

0000a3ab <get_sector>:
    a3ab:	55                   	push   %ebp
    a3ac:	89 e5                	mov    %esp,%ebp
    a3ae:	83 ec 18             	sub    $0x18,%esp
    a3b1:	8b 45 08             	mov    0x8(%ebp),%eax
    a3b4:	8b 55 0c             	mov    0xc(%ebp),%edx
    a3b7:	89 54 24 08          	mov    %edx,0x8(%esp)
    a3bb:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a3c2:	00 
    a3c3:	89 04 24             	mov    %eax,(%esp)
    a3c6:	e8 cf f5 ff ff       	call   999a <hd_read>
    a3cb:	c9                   	leave  
    a3cc:	c3                   	ret    

0000a3cd <get_super_block>:
    a3cd:	55                   	push   %ebp
    a3ce:	89 e5                	mov    %esp,%ebp
    a3d0:	83 ec 18             	sub    $0x18,%esp
    a3d3:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a3d8:	83 c0 01             	add    $0x1,%eax
    a3db:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a3e2:	00 
    a3e3:	89 04 24             	mov    %eax,(%esp)
    a3e6:	e8 c0 ff ff ff       	call   a3ab <get_sector>
    a3eb:	a1 e0 cc 00 00       	mov    0xcce0,%eax
    a3f0:	a3 e0 ce 00 00       	mov    %eax,0xcee0
    a3f5:	a1 e4 cc 00 00       	mov    0xcce4,%eax
    a3fa:	a3 e4 ce 00 00       	mov    %eax,0xcee4
    a3ff:	a1 e8 cc 00 00       	mov    0xcce8,%eax
    a404:	a3 e8 ce 00 00       	mov    %eax,0xcee8
    a409:	a1 ec cc 00 00       	mov    0xccec,%eax
    a40e:	a3 ec ce 00 00       	mov    %eax,0xceec
    a413:	a1 f0 cc 00 00       	mov    0xccf0,%eax
    a418:	a3 f0 ce 00 00       	mov    %eax,0xcef0
    a41d:	a1 f4 cc 00 00       	mov    0xccf4,%eax
    a422:	a3 f4 ce 00 00       	mov    %eax,0xcef4
    a427:	a1 f8 cc 00 00       	mov    0xccf8,%eax
    a42c:	a3 f8 ce 00 00       	mov    %eax,0xcef8
    a431:	a1 fc cc 00 00       	mov    0xccfc,%eax
    a436:	a3 fc ce 00 00       	mov    %eax,0xcefc
    a43b:	a1 00 cd 00 00       	mov    0xcd00,%eax
    a440:	a3 00 cf 00 00       	mov    %eax,0xcf00
    a445:	a1 04 cd 00 00       	mov    0xcd04,%eax
    a44a:	a3 04 cf 00 00       	mov    %eax,0xcf04
    a44f:	a1 08 cd 00 00       	mov    0xcd08,%eax
    a454:	a3 08 cf 00 00       	mov    %eax,0xcf08
    a459:	a1 0c cd 00 00       	mov    0xcd0c,%eax
    a45e:	a3 0c cf 00 00       	mov    %eax,0xcf0c
    a463:	a1 10 cd 00 00       	mov    0xcd10,%eax
    a468:	a3 10 cf 00 00       	mov    %eax,0xcf10
    a46d:	a1 14 cd 00 00       	mov    0xcd14,%eax
    a472:	a3 14 cf 00 00       	mov    %eax,0xcf14
    a477:	a1 18 cd 00 00       	mov    0xcd18,%eax
    a47c:	a3 18 cf 00 00       	mov    %eax,0xcf18
    a481:	90                   	nop
    a482:	c9                   	leave  
    a483:	c3                   	ret    

0000a484 <get_root_area>:
    a484:	55                   	push   %ebp
    a485:	89 e5                	mov    %esp,%ebp
    a487:	83 ec 28             	sub    $0x28,%esp
    a48a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a491:	eb 68                	jmp    a4fb <get_root_area+0x77>
    a493:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a496:	89 44 24 0c          	mov    %eax,0xc(%esp)
    a49a:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
    a4a1:	00 
    a4a2:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    a4a9:	00 
    a4aa:	c7 04 24 bc a8 00 00 	movl   $0xa8bc,(%esp)
    a4b1:	e8 fe ed ff ff       	call   92b4 <dis_str>
    a4b6:	8b 15 08 cf 00 00    	mov    0xcf08,%edx
    a4bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4bf:	01 d0                	add    %edx,%eax
    a4c1:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a4c8:	00 
    a4c9:	89 04 24             	mov    %eax,(%esp)
    a4cc:	e8 da fe ff ff       	call   a3ab <get_sector>
    a4d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4d4:	c1 e0 05             	shl    $0x5,%eax
    a4d7:	c1 e0 04             	shl    $0x4,%eax
    a4da:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a4df:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a4e6:	00 
    a4e7:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a4ee:	00 
    a4ef:	89 04 24             	mov    %eax,(%esp)
    a4f2:	e8 d9 f6 ff ff       	call   9bd0 <memcpy>
    a4f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a4fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4fe:	8b 15 10 cf 00 00    	mov    0xcf10,%edx
    a504:	83 ea 01             	sub    $0x1,%edx
    a507:	39 d0                	cmp    %edx,%eax
    a509:	72 88                	jb     a493 <get_root_area+0xf>
    a50b:	90                   	nop
    a50c:	c9                   	leave  
    a50d:	c3                   	ret    

0000a50e <get_inode_array>:
    a50e:	55                   	push   %ebp
    a50f:	89 e5                	mov    %esp,%ebp
    a511:	83 ec 28             	sub    $0x28,%esp
    a514:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a51b:	eb 45                	jmp    a562 <get_inode_array+0x54>
    a51d:	8b 15 fc ce 00 00    	mov    0xcefc,%edx
    a523:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a526:	01 d0                	add    %edx,%eax
    a528:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a52f:	00 
    a530:	89 04 24             	mov    %eax,(%esp)
    a533:	e8 73 fe ff ff       	call   a3ab <get_sector>
    a538:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a53b:	c1 e0 05             	shl    $0x5,%eax
    a53e:	c1 e0 04             	shl    $0x4,%eax
    a541:	05 20 cf 00 00       	add    $0xcf20,%eax
    a546:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a54d:	00 
    a54e:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a555:	00 
    a556:	89 04 24             	mov    %eax,(%esp)
    a559:	e8 72 f6 ff ff       	call   9bd0 <memcpy>
    a55e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a562:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a565:	a1 04 cf 00 00       	mov    0xcf04,%eax
    a56a:	39 c2                	cmp    %eax,%edx
    a56c:	72 af                	jb     a51d <get_inode_array+0xf>
    a56e:	c9                   	leave  
    a56f:	c3                   	ret    

0000a570 <find_file_in_root>:
    a570:	55                   	push   %ebp
    a571:	89 e5                	mov    %esp,%ebp
    a573:	83 ec 28             	sub    $0x28,%esp
    a576:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a57d:	eb 32                	jmp    a5b1 <find_file_in_root+0x41>
    a57f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a582:	c1 e0 04             	shl    $0x4,%eax
    a585:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a58a:	83 c0 04             	add    $0x4,%eax
    a58d:	89 44 24 04          	mov    %eax,0x4(%esp)
    a591:	8b 45 08             	mov    0x8(%ebp),%eax
    a594:	89 04 24             	mov    %eax,(%esp)
    a597:	e8 9d f6 ff ff       	call   9c39 <strcmp>
    a59c:	85 c0                	test   %eax,%eax
    a59e:	75 0d                	jne    a5ad <find_file_in_root+0x3d>
    a5a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5a3:	c1 e0 04             	shl    $0x4,%eax
    a5a6:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a5ab:	eb 0f                	jmp    a5bc <find_file_in_root+0x4c>
    a5ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a5b1:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    a5b5:	7e c8                	jle    a57f <find_file_in_root+0xf>
    a5b7:	b8 00 00 00 00       	mov    $0x0,%eax
    a5bc:	c9                   	leave  
    a5bd:	c3                   	ret    

0000a5be <loader_kernel>:
    a5be:	55                   	push   %ebp
    a5bf:	89 e5                	mov    %esp,%ebp
    a5c1:	57                   	push   %edi
    a5c2:	56                   	push   %esi
    a5c3:	53                   	push   %ebx
    a5c4:	83 ec 2c             	sub    $0x2c,%esp
    a5c7:	c7 45 e0 00 00 10 00 	movl   $0x100000,-0x20(%ebp)
    a5ce:	c7 04 24 be a8 00 00 	movl   $0xa8be,(%esp)
    a5d5:	e8 96 ff ff ff       	call   a570 <find_file_in_root>
    a5da:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a5dd:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    a5e1:	75 4a                	jne    a62d <loader_kernel+0x6f>
    a5e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    a5ea:	00 
    a5eb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    a5f2:	00 
    a5f3:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    a5fa:	00 
    a5fb:	c7 04 24 88 a8 00 00 	movl   $0xa888,(%esp)
    a602:	e8 ad ec ff ff       	call   92b4 <dis_str>
    a607:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    a60e:	00 
    a60f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    a616:	00 
    a617:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    a61e:	00 
    a61f:	c7 04 24 cb a8 00 00 	movl   $0xa8cb,(%esp)
    a626:	e8 89 ec ff ff       	call   92b4 <dis_str>
    a62b:	eb fe                	jmp    a62b <loader_kernel+0x6d>
    a62d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a630:	8b 00                	mov    (%eax),%eax
    a632:	c1 e0 04             	shl    $0x4,%eax
    a635:	05 20 cf 00 00       	add    $0xcf20,%eax
    a63a:	89 45 d8             	mov    %eax,-0x28(%ebp)
    a63d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a644:	e9 c1 00 00 00       	jmp    a70a <loader_kernel+0x14c>
    a649:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a64c:	8b 40 08             	mov    0x8(%eax),%eax
    a64f:	c7 44 24 08 e0 cc 00 	movl   $0xcce0,0x8(%esp)
    a656:	00 
    a657:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a65e:	00 
    a65f:	89 04 24             	mov    %eax,(%esp)
    a662:	e8 33 f3 ff ff       	call   999a <hd_read>
    a667:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a66a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    a66e:	c7 44 24 08 09 00 00 	movl   $0x9,0x8(%esp)
    a675:	00 
    a676:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    a67d:	00 
    a67e:	c7 04 24 bc a8 00 00 	movl   $0xa8bc,(%esp)
    a685:	e8 2a ec ff ff       	call   92b4 <dis_str>
    a68a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a68d:	c1 e0 09             	shl    $0x9,%eax
    a690:	89 c2                	mov    %eax,%edx
    a692:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a695:	01 d0                	add    %edx,%eax
    a697:	ba e0 cc 00 00       	mov    $0xcce0,%edx
    a69c:	bb 00 02 00 00       	mov    $0x200,%ebx
    a6a1:	89 c1                	mov    %eax,%ecx
    a6a3:	83 e1 01             	and    $0x1,%ecx
    a6a6:	85 c9                	test   %ecx,%ecx
    a6a8:	74 0e                	je     a6b8 <loader_kernel+0xfa>
    a6aa:	0f b6 0a             	movzbl (%edx),%ecx
    a6ad:	88 08                	mov    %cl,(%eax)
    a6af:	83 c0 01             	add    $0x1,%eax
    a6b2:	83 c2 01             	add    $0x1,%edx
    a6b5:	83 eb 01             	sub    $0x1,%ebx
    a6b8:	89 c1                	mov    %eax,%ecx
    a6ba:	83 e1 02             	and    $0x2,%ecx
    a6bd:	85 c9                	test   %ecx,%ecx
    a6bf:	74 0f                	je     a6d0 <loader_kernel+0x112>
    a6c1:	0f b7 0a             	movzwl (%edx),%ecx
    a6c4:	66 89 08             	mov    %cx,(%eax)
    a6c7:	83 c0 02             	add    $0x2,%eax
    a6ca:	83 c2 02             	add    $0x2,%edx
    a6cd:	83 eb 02             	sub    $0x2,%ebx
    a6d0:	89 d9                	mov    %ebx,%ecx
    a6d2:	c1 e9 02             	shr    $0x2,%ecx
    a6d5:	89 c7                	mov    %eax,%edi
    a6d7:	89 d6                	mov    %edx,%esi
    a6d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    a6db:	89 f2                	mov    %esi,%edx
    a6dd:	89 f8                	mov    %edi,%eax
    a6df:	b9 00 00 00 00       	mov    $0x0,%ecx
    a6e4:	89 de                	mov    %ebx,%esi
    a6e6:	83 e6 02             	and    $0x2,%esi
    a6e9:	85 f6                	test   %esi,%esi
    a6eb:	74 0b                	je     a6f8 <loader_kernel+0x13a>
    a6ed:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    a6f1:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    a6f5:	83 c1 02             	add    $0x2,%ecx
    a6f8:	83 e3 01             	and    $0x1,%ebx
    a6fb:	85 db                	test   %ebx,%ebx
    a6fd:	74 07                	je     a706 <loader_kernel+0x148>
    a6ff:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    a703:	88 14 08             	mov    %dl,(%eax,%ecx,1)
    a706:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a70a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a70d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a710:	8b 40 0c             	mov    0xc(%eax),%eax
    a713:	39 c2                	cmp    %eax,%edx
    a715:	0f 82 2e ff ff ff    	jb     a649 <loader_kernel+0x8b>
    a71b:	90                   	nop
    a71c:	83 c4 2c             	add    $0x2c,%esp
    a71f:	5b                   	pop    %ebx
    a720:	5e                   	pop    %esi
    a721:	5f                   	pop    %edi
    a722:	5d                   	pop    %ebp
    a723:	c3                   	ret    

0000a724 <irq00_handler>:
    a724:	55                   	push   %ebp
    a725:	89 e5                	mov    %esp,%ebp
    a727:	53                   	push   %ebx
    a728:	50                   	push   %eax
    a729:	53                   	push   %ebx
    a72a:	b8 01 00 00 00       	mov    $0x1,%eax
    a72f:	89 c3                	mov    %eax,%ebx
    a731:	e4 21                	in     $0x21,%al
    a733:	08 d8                	or     %bl,%al
    a735:	e6 21                	out    %al,$0x21
    a737:	b0 20                	mov    $0x20,%al
    a739:	e6 20                	out    %al,$0x20
    a73b:	fb                   	sti    
    a73c:	a1 e0 db 00 00       	mov    0xdbe0,%eax
    a741:	ba 00 00 00 00       	mov    $0x0,%edx
    a746:	89 d3                	mov    %edx,%ebx
    a748:	53                   	push   %ebx
    a749:	ff d0                	call   *%eax
    a74b:	5b                   	pop    %ebx
    a74c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    a751:	89 c3                	mov    %eax,%ebx
    a753:	fa                   	cli    
    a754:	e4 21                	in     $0x21,%al
    a756:	20 d8                	and    %bl,%al
    a758:	e6 21                	out    %al,$0x21
    a75a:	5b                   	pop    %ebx
    a75b:	58                   	pop    %eax
    a75c:	5b                   	pop    %ebx
    a75d:	5d                   	pop    %ebp
    a75e:	fb                   	sti    
    a75f:	cf                   	iret   
    a760:	5b                   	pop    %ebx
    a761:	5d                   	pop    %ebp
    a762:	c3                   	ret    

0000a763 <irq14_handler>:
    a763:	55                   	push   %ebp
    a764:	89 e5                	mov    %esp,%ebp
    a766:	53                   	push   %ebx
    a767:	50                   	push   %eax
    a768:	53                   	push   %ebx
    a769:	b8 00 40 00 00       	mov    $0x4000,%eax
    a76e:	89 c3                	mov    %eax,%ebx
    a770:	e4 21                	in     $0x21,%al
    a772:	08 d8                	or     %bl,%al
    a774:	e6 21                	out    %al,$0x21
    a776:	b0 20                	mov    $0x20,%al
    a778:	e6 20                	out    %al,$0x20
    a77a:	fb                   	sti    
    a77b:	a1 18 dc 00 00       	mov    0xdc18,%eax
    a780:	ba 0e 00 00 00       	mov    $0xe,%edx
    a785:	89 d3                	mov    %edx,%ebx
    a787:	53                   	push   %ebx
    a788:	ff d0                	call   *%eax
    a78a:	5b                   	pop    %ebx
    a78b:	b8 ff bf ff ff       	mov    $0xffffbfff,%eax
    a790:	89 c3                	mov    %eax,%ebx
    a792:	fa                   	cli    
    a793:	e4 21                	in     $0x21,%al
    a795:	20 d8                	and    %bl,%al
    a797:	e6 21                	out    %al,$0x21
    a799:	5b                   	pop    %ebx
    a79a:	58                   	pop    %eax
    a79b:	5b                   	pop    %ebx
    a79c:	5d                   	pop    %ebp
    a79d:	fb                   	sti    
    a79e:	cf                   	iret   
    a79f:	5b                   	pop    %ebx
    a7a0:	5d                   	pop    %ebp
    a7a1:	c3                   	ret    
