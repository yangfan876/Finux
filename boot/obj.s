
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
    9122:	c7 04 24 e4 a7 00 00 	movl   $0xa7e4,(%esp)
    9129:	e8 8e 01 00 00       	call   92bc <dis_str>
    912e:	e8 28 03 00 00       	call   945b <Init_8259A>
    9133:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    913a:	00 
    913b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    9142:	00 
    9143:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    914a:	00 
    914b:	c7 04 24 f9 a7 00 00 	movl   $0xa7f9,(%esp)
    9152:	e8 65 01 00 00       	call   92bc <dis_str>
    9157:	e8 24 05 00 00       	call   9680 <init_idt>
    915c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9163:	00 
    9164:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    916b:	00 
    916c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9173:	00 
    9174:	c7 04 24 0c a8 00 00 	movl   $0xa80c,(%esp)
    917b:	e8 3c 01 00 00       	call   92bc <dis_str>
    9180:	e8 20 0a 00 00       	call   9ba5 <init_timer>
    9185:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    918c:	00 
    918d:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    9194:	00 
    9195:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    919c:	00 
    919d:	c7 04 24 21 a8 00 00 	movl   $0xa821,(%esp)
    91a4:	e8 13 01 00 00       	call   92bc <dis_str>
    91a9:	e8 89 09 00 00       	call   9b37 <init_hd>
    91ae:	e8 51 07 00 00       	call   9904 <hd_identify>
    91b3:	e8 04 0b 00 00       	call   9cbc <get_part_information>
    91b8:	e8 d4 0c 00 00       	call   9e91 <make_fs>
    91bd:	85 c0                	test   %eax,%eax
    91bf:	74 4a                	je     920b <Cstart+0x107>
    91c1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91c8:	00 
    91c9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    91d0:	00 
    91d1:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    91d8:	00 
    91d9:	c7 04 24 34 a8 00 00 	movl   $0xa834,(%esp)
    91e0:	e8 d7 00 00 00       	call   92bc <dis_str>
    91e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91ec:	00 
    91ed:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    91f4:	00 
    91f5:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    91fc:	00 
    91fd:	c7 04 24 3c a8 00 00 	movl   $0xa83c,(%esp)
    9204:	e8 b3 00 00 00       	call   92bc <dis_str>
    9209:	eb fe                	jmp    9209 <Cstart+0x105>
    920b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9212:	00 
    9213:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    921a:	00 
    921b:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9222:	00 
    9223:	c7 04 24 7d a8 00 00 	movl   $0xa87d,(%esp)
    922a:	e8 8d 00 00 00       	call   92bc <dis_str>
    922f:	e8 a1 11 00 00       	call   a3d5 <get_super_block>
    9234:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    923b:	00 
    923c:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    9243:	00 
    9244:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    924b:	00 
    924c:	c7 04 24 90 a8 00 00 	movl   $0xa890,(%esp)
    9253:	e8 64 00 00 00       	call   92bc <dis_str>
    9258:	e8 b9 12 00 00       	call   a516 <get_inode_array>
    925d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9264:	00 
    9265:	c7 44 24 08 06 00 00 	movl   $0x6,0x8(%esp)
    926c:	00 
    926d:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9274:	00 
    9275:	c7 04 24 a3 a8 00 00 	movl   $0xa8a3,(%esp)
    927c:	e8 3b 00 00 00       	call   92bc <dis_str>
    9281:	e8 06 12 00 00       	call   a48c <get_root_area>
    9286:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    928d:	00 
    928e:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    9295:	00 
    9296:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    929d:	00 
    929e:	c7 04 24 b4 a8 00 00 	movl   $0xa8b4,(%esp)
    92a5:	e8 12 00 00 00       	call   92bc <dis_str>
    92aa:	e8 17 13 00 00       	call   a5c6 <loader_kernel>
    92af:	fa                   	cli    
    92b0:	b8 00 00 20 00       	mov    $0x200000,%eax
    92b5:	ff e0                	jmp    *%eax
    92b7:	c9                   	leave  
    92b8:	c3                   	ret    
    92b9:	66 90                	xchg   %ax,%ax
    92bb:	90                   	nop

000092bc <dis_str>:
    92bc:	55                   	push   %ebp
    92bd:	89 e5                	mov    %esp,%ebp
    92bf:	57                   	push   %edi
    92c0:	53                   	push   %ebx
    92c1:	83 ec 30             	sub    $0x30,%esp
    92c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    92c7:	88 45 d4             	mov    %al,-0x2c(%ebp)
    92ca:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    92d1:	8b 55 10             	mov    0x10(%ebp),%edx
    92d4:	89 d0                	mov    %edx,%eax
    92d6:	c1 e0 02             	shl    $0x2,%eax
    92d9:	01 d0                	add    %edx,%eax
    92db:	c1 e0 04             	shl    $0x4,%eax
    92de:	89 c2                	mov    %eax,%edx
    92e0:	8b 45 14             	mov    0x14(%ebp),%eax
    92e3:	01 d0                	add    %edx,%eax
    92e5:	01 c0                	add    %eax,%eax
    92e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    92ea:	8b 45 08             	mov    0x8(%ebp),%eax
    92ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
    92f0:	8b 45 08             	mov    0x8(%ebp),%eax
    92f3:	89 04 24             	mov    %eax,(%esp)
    92f6:	e8 1a 09 00 00       	call   9c15 <strlen>
    92fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    92fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9305:	eb 2e                	jmp    9335 <dis_str+0x79>
    9307:	8b 45 ec             	mov    -0x14(%ebp),%eax
    930a:	8d 50 01             	lea    0x1(%eax),%edx
    930d:	89 55 ec             	mov    %edx,-0x14(%ebp)
    9310:	0f b6 00             	movzbl (%eax),%eax
    9313:	88 45 e7             	mov    %al,-0x19(%ebp)
    9316:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
    931a:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
    931e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9321:	89 d3                	mov    %edx,%ebx
    9323:	89 cf                	mov    %ecx,%edi
    9325:	88 c4                	mov    %al,%ah
    9327:	88 d8                	mov    %bl,%al
    9329:	65 66 89 07          	mov    %ax,%gs:(%edi)
    932d:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    9331:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9335:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9338:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    933b:	7c ca                	jl     9307 <dis_str+0x4b>
    933d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9340:	83 c4 30             	add    $0x30,%esp
    9343:	5b                   	pop    %ebx
    9344:	5f                   	pop    %edi
    9345:	5d                   	pop    %ebp
    9346:	c3                   	ret    

00009347 <dis_nchar>:
    9347:	55                   	push   %ebp
    9348:	89 e5                	mov    %esp,%ebp
    934a:	57                   	push   %edi
    934b:	53                   	push   %ebx
    934c:	83 ec 14             	sub    $0x14,%esp
    934f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9352:	88 45 e4             	mov    %al,-0x1c(%ebp)
    9355:	8b 55 14             	mov    0x14(%ebp),%edx
    9358:	89 d0                	mov    %edx,%eax
    935a:	c1 e0 02             	shl    $0x2,%eax
    935d:	01 d0                	add    %edx,%eax
    935f:	c1 e0 04             	shl    $0x4,%eax
    9362:	89 c2                	mov    %eax,%edx
    9364:	8b 45 18             	mov    0x18(%ebp),%eax
    9367:	01 d0                	add    %edx,%eax
    9369:	01 c0                	add    %eax,%eax
    936b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    936e:	8b 45 08             	mov    0x8(%ebp),%eax
    9371:	89 45 ec             	mov    %eax,-0x14(%ebp)
    9374:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    937b:	eb 2e                	jmp    93ab <dis_nchar+0x64>
    937d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9380:	8d 50 01             	lea    0x1(%eax),%edx
    9383:	89 55 ec             	mov    %edx,-0x14(%ebp)
    9386:	0f b6 00             	movzbl (%eax),%eax
    9389:	88 45 eb             	mov    %al,-0x15(%ebp)
    938c:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    9390:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    9394:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9397:	89 d3                	mov    %edx,%ebx
    9399:	89 cf                	mov    %ecx,%edi
    939b:	88 c4                	mov    %al,%ah
    939d:	88 d8                	mov    %bl,%al
    939f:	65 66 89 07          	mov    %ax,%gs:(%edi)
    93a3:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    93a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    93ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93ae:	3b 45 10             	cmp    0x10(%ebp),%eax
    93b1:	7c ca                	jl     937d <dis_nchar+0x36>
    93b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93b6:	83 c4 14             	add    $0x14,%esp
    93b9:	5b                   	pop    %ebx
    93ba:	5f                   	pop    %edi
    93bb:	5d                   	pop    %ebp
    93bc:	c3                   	ret    
    93bd:	66 90                	xchg   %ax,%ax
    93bf:	90                   	nop

000093c0 <outb>:
    93c0:	55                   	push   %ebp
    93c1:	89 e5                	mov    %esp,%ebp
    93c3:	83 ec 08             	sub    $0x8,%esp
    93c6:	8b 55 08             	mov    0x8(%ebp),%edx
    93c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    93cc:	88 55 fc             	mov    %dl,-0x4(%ebp)
    93cf:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    93d3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    93d7:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    93db:	ee                   	out    %al,(%dx)
    93dc:	c9                   	leave  
    93dd:	c3                   	ret    

000093de <inb>:
    93de:	55                   	push   %ebp
    93df:	89 e5                	mov    %esp,%ebp
    93e1:	83 ec 14             	sub    $0x14,%esp
    93e4:	8b 45 08             	mov    0x8(%ebp),%eax
    93e7:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    93eb:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    93ef:	89 c2                	mov    %eax,%edx
    93f1:	ec                   	in     (%dx),%al
    93f2:	88 45 ff             	mov    %al,-0x1(%ebp)
    93f5:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    93f9:	c9                   	leave  
    93fa:	c3                   	ret    

000093fb <io_delay>:
    93fb:	55                   	push   %ebp
    93fc:	89 e5                	mov    %esp,%ebp
    93fe:	83 ec 10             	sub    $0x10,%esp
    9401:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    9407:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    940b:	89 c2                	mov    %eax,%edx
    940d:	ee                   	out    %al,(%dx)
    940e:	c9                   	leave  
    940f:	c3                   	ret    

00009410 <outb_pic>:
    9410:	55                   	push   %ebp
    9411:	89 e5                	mov    %esp,%ebp
    9413:	83 ec 0c             	sub    $0xc,%esp
    9416:	8b 45 08             	mov    0x8(%ebp),%eax
    9419:	88 45 fc             	mov    %al,-0x4(%ebp)
    941c:	8b 45 0c             	mov    0xc(%ebp),%eax
    941f:	0f b7 d0             	movzwl %ax,%edx
    9422:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    9426:	89 54 24 04          	mov    %edx,0x4(%esp)
    942a:	89 04 24             	mov    %eax,(%esp)
    942d:	e8 8e ff ff ff       	call   93c0 <outb>
    9432:	e8 c4 ff ff ff       	call   93fb <io_delay>
    9437:	c9                   	leave  
    9438:	c3                   	ret    

00009439 <inb_pic>:
    9439:	55                   	push   %ebp
    943a:	89 e5                	mov    %esp,%ebp
    943c:	83 ec 14             	sub    $0x14,%esp
    943f:	8b 45 08             	mov    0x8(%ebp),%eax
    9442:	0f b7 c0             	movzwl %ax,%eax
    9445:	89 04 24             	mov    %eax,(%esp)
    9448:	e8 91 ff ff ff       	call   93de <inb>
    944d:	88 45 ff             	mov    %al,-0x1(%ebp)
    9450:	e8 a6 ff ff ff       	call   93fb <io_delay>
    9455:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9459:	c9                   	leave  
    945a:	c3                   	ret    

0000945b <Init_8259A>:
    945b:	55                   	push   %ebp
    945c:	89 e5                	mov    %esp,%ebp
    945e:	83 ec 08             	sub    $0x8,%esp
    9461:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9468:	00 
    9469:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    9470:	e8 9b ff ff ff       	call   9410 <outb_pic>
    9475:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    947c:	00 
    947d:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    9484:	e8 87 ff ff ff       	call   9410 <outb_pic>
    9489:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9490:	00 
    9491:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    9498:	e8 73 ff ff ff       	call   9410 <outb_pic>
    949d:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94a4:	00 
    94a5:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
    94ac:	e8 5f ff ff ff       	call   9410 <outb_pic>
    94b1:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94b8:	00 
    94b9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    94c0:	e8 4b ff ff ff       	call   9410 <outb_pic>
    94c5:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94cc:	00 
    94cd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    94d4:	e8 37 ff ff ff       	call   9410 <outb_pic>
    94d9:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94e0:	00 
    94e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    94e8:	e8 23 ff ff ff       	call   9410 <outb_pic>
    94ed:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    94f4:	00 
    94f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    94fc:	e8 0f ff ff ff       	call   9410 <outb_pic>
    9501:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9508:	00 
    9509:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    9510:	e8 fb fe ff ff       	call   9410 <outb_pic>
    9515:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    951c:	00 
    951d:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    9524:	e8 e7 fe ff ff       	call   9410 <outb_pic>
    9529:	90                   	nop
    952a:	c9                   	leave  
    952b:	c3                   	ret    

0000952c <enable_irq>:
    952c:	55                   	push   %ebp
    952d:	89 e5                	mov    %esp,%ebp
    952f:	83 ec 18             	sub    $0x18,%esp
    9532:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
    9536:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
    953a:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
    9541:	e8 f3 fe ff ff       	call   9439 <inb_pic>
    9546:	88 45 fd             	mov    %al,-0x3(%ebp)
    9549:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
    9550:	e8 e4 fe ff ff       	call   9439 <inb_pic>
    9555:	88 45 fc             	mov    %al,-0x4(%ebp)
    9558:	fa                   	cli    
    9559:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
    955d:	7f 35                	jg     9594 <enable_irq+0x68>
    955f:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    9563:	74 2f                	je     9594 <enable_irq+0x68>
    9565:	8b 45 08             	mov    0x8(%ebp),%eax
    9568:	ba 01 00 00 00       	mov    $0x1,%edx
    956d:	89 c1                	mov    %eax,%ecx
    956f:	d3 e2                	shl    %cl,%edx
    9571:	89 d0                	mov    %edx,%eax
    9573:	f7 d0                	not    %eax
    9575:	89 c2                	mov    %eax,%edx
    9577:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    957b:	21 d0                	and    %edx,%eax
    957d:	88 45 ff             	mov    %al,-0x1(%ebp)
    9580:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9584:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    958b:	00 
    958c:	89 04 24             	mov    %eax,(%esp)
    958f:	e8 7c fe ff ff       	call   9410 <outb_pic>
    9594:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
    9598:	7e 56                	jle    95f0 <enable_irq+0xc4>
    959a:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
    959e:	7f 50                	jg     95f0 <enable_irq+0xc4>
    95a0:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    95a4:	83 e0 fb             	and    $0xfffffffb,%eax
    95a7:	88 45 ff             	mov    %al,-0x1(%ebp)
    95aa:	8b 45 08             	mov    0x8(%ebp),%eax
    95ad:	83 e8 08             	sub    $0x8,%eax
    95b0:	ba 01 00 00 00       	mov    $0x1,%edx
    95b5:	89 c1                	mov    %eax,%ecx
    95b7:	d3 e2                	shl    %cl,%edx
    95b9:	89 d0                	mov    %edx,%eax
    95bb:	f7 d0                	not    %eax
    95bd:	89 c2                	mov    %eax,%edx
    95bf:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    95c3:	21 d0                	and    %edx,%eax
    95c5:	88 45 fe             	mov    %al,-0x2(%ebp)
    95c8:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    95cc:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    95d3:	00 
    95d4:	89 04 24             	mov    %eax,(%esp)
    95d7:	e8 34 fe ff ff       	call   9410 <outb_pic>
    95dc:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
    95e0:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    95e7:	00 
    95e8:	89 04 24             	mov    %eax,(%esp)
    95eb:	e8 20 fe ff ff       	call   9410 <outb_pic>
    95f0:	fb                   	sti    
    95f1:	90                   	nop
    95f2:	c9                   	leave  
    95f3:	c3                   	ret    

000095f4 <EOI_master>:
    95f4:	55                   	push   %ebp
    95f5:	89 e5                	mov    %esp,%ebp
    95f7:	83 ec 08             	sub    $0x8,%esp
    95fa:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9601:	00 
    9602:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9609:	e8 02 fe ff ff       	call   9410 <outb_pic>
    960e:	fb                   	sti    
    960f:	c9                   	leave  
    9610:	c3                   	ret    

00009611 <EOI_slave>:
    9611:	55                   	push   %ebp
    9612:	89 e5                	mov    %esp,%ebp
    9614:	83 ec 08             	sub    $0x8,%esp
    9617:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    961e:	00 
    961f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9626:	e8 e5 fd ff ff       	call   9410 <outb_pic>
    962b:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    9632:	00 
    9633:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    963a:	e8 d1 fd ff ff       	call   9410 <outb_pic>
    963f:	fb                   	sti    
    9640:	c9                   	leave  
    9641:	c3                   	ret    
    9642:	66 90                	xchg   %ax,%ax

00009644 <set_gate>:
    9644:	55                   	push   %ebp
    9645:	89 e5                	mov    %esp,%ebp
    9647:	8b 45 18             	mov    0x18(%ebp),%eax
    964a:	c1 e0 10             	shl    $0x10,%eax
    964d:	89 c2                	mov    %eax,%edx
    964f:	8b 45 10             	mov    0x10(%ebp),%eax
    9652:	0f b7 c0             	movzwl %ax,%eax
    9655:	09 c2                	or     %eax,%edx
    9657:	8b 45 08             	mov    0x8(%ebp),%eax
    965a:	89 10                	mov    %edx,(%eax)
    965c:	8b 45 10             	mov    0x10(%ebp),%eax
    965f:	66 b8 00 00          	mov    $0x0,%ax
    9663:	89 c2                	mov    %eax,%edx
    9665:	8b 45 14             	mov    0x14(%ebp),%eax
    9668:	c1 e0 05             	shl    $0x5,%eax
    966b:	0b 45 0c             	or     0xc(%ebp),%eax
    966e:	0f b6 c0             	movzbl %al,%eax
    9671:	0c 80                	or     $0x80,%al
    9673:	c1 e0 08             	shl    $0x8,%eax
    9676:	09 c2                	or     %eax,%edx
    9678:	8b 45 08             	mov    0x8(%ebp),%eax
    967b:	89 50 04             	mov    %edx,0x4(%eax)
    967e:	5d                   	pop    %ebp
    967f:	c3                   	ret    

00009680 <init_idt>:
    9680:	55                   	push   %ebp
    9681:	89 e5                	mov    %esp,%ebp
    9683:	fa                   	cli    
    9684:	0f 01 1d 00 c0 00 00 	lidtl  0xc000
    968b:	90                   	nop
    968c:	fb                   	sti    
    968d:	90                   	nop
    968e:	5d                   	pop    %ebp
    968f:	c3                   	ret    

00009690 <set_intr_gate>:
    9690:	55                   	push   %ebp
    9691:	89 e5                	mov    %esp,%ebp
    9693:	83 ec 38             	sub    $0x38,%esp
    9696:	8b 45 08             	mov    0x8(%ebp),%eax
    9699:	83 c0 30             	add    $0x30,%eax
    969c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    969f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96a2:	c1 e0 03             	shl    $0x3,%eax
    96a5:	8d 90 20 c0 00 00    	lea    0xc020(%eax),%edx
    96ab:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    96b2:	00 
    96b3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    96ba:	00 
    96bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    96be:	89 44 24 08          	mov    %eax,0x8(%esp)
    96c2:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
    96c9:	00 
    96ca:	89 14 24             	mov    %edx,(%esp)
    96cd:	e8 72 ff ff ff       	call   9644 <set_gate>
    96d2:	8b 45 08             	mov    0x8(%ebp),%eax
    96d5:	89 04 24             	mov    %eax,(%esp)
    96d8:	e8 4f fe ff ff       	call   952c <enable_irq>
    96dd:	c9                   	leave  
    96de:	c3                   	ret    
    96df:	90                   	nop

000096e0 <outb>:
    96e0:	55                   	push   %ebp
    96e1:	89 e5                	mov    %esp,%ebp
    96e3:	83 ec 08             	sub    $0x8,%esp
    96e6:	8b 55 08             	mov    0x8(%ebp),%edx
    96e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    96ec:	88 55 fc             	mov    %dl,-0x4(%ebp)
    96ef:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    96f3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    96f7:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    96fb:	ee                   	out    %al,(%dx)
    96fc:	c9                   	leave  
    96fd:	c3                   	ret    

000096fe <inb>:
    96fe:	55                   	push   %ebp
    96ff:	89 e5                	mov    %esp,%ebp
    9701:	83 ec 14             	sub    $0x14,%esp
    9704:	8b 45 08             	mov    0x8(%ebp),%eax
    9707:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    970b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    970f:	89 c2                	mov    %eax,%edx
    9711:	ec                   	in     (%dx),%al
    9712:	88 45 ff             	mov    %al,-0x1(%ebp)
    9715:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9719:	c9                   	leave  
    971a:	c3                   	ret    

0000971b <io_delay>:
    971b:	55                   	push   %ebp
    971c:	89 e5                	mov    %esp,%ebp
    971e:	83 ec 10             	sub    $0x10,%esp
    9721:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    9727:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    972b:	89 c2                	mov    %eax,%edx
    972d:	ee                   	out    %al,(%dx)
    972e:	c9                   	leave  
    972f:	c3                   	ret    

00009730 <inb_pic>:
    9730:	55                   	push   %ebp
    9731:	89 e5                	mov    %esp,%ebp
    9733:	83 ec 14             	sub    $0x14,%esp
    9736:	8b 45 08             	mov    0x8(%ebp),%eax
    9739:	0f b7 c0             	movzwl %ax,%eax
    973c:	89 04 24             	mov    %eax,(%esp)
    973f:	e8 ba ff ff ff       	call   96fe <inb>
    9744:	88 45 ff             	mov    %al,-0x1(%ebp)
    9747:	e8 cf ff ff ff       	call   971b <io_delay>
    974c:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9750:	c9                   	leave  
    9751:	c3                   	ret    

00009752 <outb_pic>:
    9752:	55                   	push   %ebp
    9753:	89 e5                	mov    %esp,%ebp
    9755:	83 ec 0c             	sub    $0xc,%esp
    9758:	8b 45 08             	mov    0x8(%ebp),%eax
    975b:	88 45 fc             	mov    %al,-0x4(%ebp)
    975e:	8b 45 0c             	mov    0xc(%ebp),%eax
    9761:	0f b7 d0             	movzwl %ax,%edx
    9764:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    9768:	89 54 24 04          	mov    %edx,0x4(%esp)
    976c:	89 04 24             	mov    %eax,(%esp)
    976f:	e8 6c ff ff ff       	call   96e0 <outb>
    9774:	e8 a2 ff ff ff       	call   971b <io_delay>
    9779:	c9                   	leave  
    977a:	c3                   	ret    

0000977b <port_read>:
    977b:	55                   	push   %ebp
    977c:	89 e5                	mov    %esp,%ebp
    977e:	57                   	push   %edi
    977f:	53                   	push   %ebx
    9780:	83 ec 04             	sub    $0x4,%esp
    9783:	8b 45 0c             	mov    0xc(%ebp),%eax
    9786:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    978a:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    978e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9791:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9794:	89 c2                	mov    %eax,%edx
    9796:	89 df                	mov    %ebx,%edi
    9798:	fc                   	cld    
    9799:	d1 e9                	shr    %ecx
    979b:	66 f3 6d             	rep insw (%dx),%es:(%edi)
    979e:	83 c4 04             	add    $0x4,%esp
    97a1:	5b                   	pop    %ebx
    97a2:	5f                   	pop    %edi
    97a3:	5d                   	pop    %ebp
    97a4:	c3                   	ret    

000097a5 <port_write>:
    97a5:	55                   	push   %ebp
    97a6:	89 e5                	mov    %esp,%ebp
    97a8:	56                   	push   %esi
    97a9:	53                   	push   %ebx
    97aa:	83 ec 04             	sub    $0x4,%esp
    97ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    97b0:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    97b4:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    97b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    97bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    97be:	89 c2                	mov    %eax,%edx
    97c0:	89 de                	mov    %ebx,%esi
    97c2:	fc                   	cld    
    97c3:	d1 e9                	shr    %ecx
    97c5:	66 f3 6f             	rep outsw %ds:(%esi),(%dx)
    97c8:	83 c4 04             	add    $0x4,%esp
    97cb:	5b                   	pop    %ebx
    97cc:	5e                   	pop    %esi
    97cd:	5d                   	pop    %ebp
    97ce:	c3                   	ret    

000097cf <hd_cmd_out>:
    97cf:	55                   	push   %ebp
    97d0:	89 e5                	mov    %esp,%ebp
    97d2:	83 ec 08             	sub    $0x8,%esp
    97d5:	90                   	nop
    97d6:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    97dd:	e8 4e ff ff ff       	call   9730 <inb_pic>
    97e2:	84 c0                	test   %al,%al
    97e4:	78 f0                	js     97d6 <hd_cmd_out+0x7>
    97e6:	c7 44 24 04 f6 03 00 	movl   $0x3f6,0x4(%esp)
    97ed:	00 
    97ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    97f5:	e8 58 ff ff ff       	call   9752 <outb_pic>
    97fa:	8b 45 08             	mov    0x8(%ebp),%eax
    97fd:	0f b6 00             	movzbl (%eax),%eax
    9800:	0f b6 c0             	movzbl %al,%eax
    9803:	c7 44 24 04 f1 01 00 	movl   $0x1f1,0x4(%esp)
    980a:	00 
    980b:	89 04 24             	mov    %eax,(%esp)
    980e:	e8 3f ff ff ff       	call   9752 <outb_pic>
    9813:	8b 45 08             	mov    0x8(%ebp),%eax
    9816:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    981a:	0f b6 c0             	movzbl %al,%eax
    981d:	c7 44 24 04 f2 01 00 	movl   $0x1f2,0x4(%esp)
    9824:	00 
    9825:	89 04 24             	mov    %eax,(%esp)
    9828:	e8 25 ff ff ff       	call   9752 <outb_pic>
    982d:	8b 45 08             	mov    0x8(%ebp),%eax
    9830:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    9834:	0f b6 c0             	movzbl %al,%eax
    9837:	c7 44 24 04 f3 01 00 	movl   $0x1f3,0x4(%esp)
    983e:	00 
    983f:	89 04 24             	mov    %eax,(%esp)
    9842:	e8 0b ff ff ff       	call   9752 <outb_pic>
    9847:	8b 45 08             	mov    0x8(%ebp),%eax
    984a:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    984e:	0f b6 c0             	movzbl %al,%eax
    9851:	c7 44 24 04 f4 01 00 	movl   $0x1f4,0x4(%esp)
    9858:	00 
    9859:	89 04 24             	mov    %eax,(%esp)
    985c:	e8 f1 fe ff ff       	call   9752 <outb_pic>
    9861:	8b 45 08             	mov    0x8(%ebp),%eax
    9864:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9868:	0f b6 c0             	movzbl %al,%eax
    986b:	c7 44 24 04 f5 01 00 	movl   $0x1f5,0x4(%esp)
    9872:	00 
    9873:	89 04 24             	mov    %eax,(%esp)
    9876:	e8 d7 fe ff ff       	call   9752 <outb_pic>
    987b:	8b 45 08             	mov    0x8(%ebp),%eax
    987e:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    9882:	0f b6 c0             	movzbl %al,%eax
    9885:	c7 44 24 04 f6 01 00 	movl   $0x1f6,0x4(%esp)
    988c:	00 
    988d:	89 04 24             	mov    %eax,(%esp)
    9890:	e8 bd fe ff ff       	call   9752 <outb_pic>
    9895:	8b 45 08             	mov    0x8(%ebp),%eax
    9898:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    989c:	0f b6 c0             	movzbl %al,%eax
    989f:	c7 44 24 04 f7 01 00 	movl   $0x1f7,0x4(%esp)
    98a6:	00 
    98a7:	89 04 24             	mov    %eax,(%esp)
    98aa:	e8 a3 fe ff ff       	call   9752 <outb_pic>
    98af:	c9                   	leave  
    98b0:	c3                   	ret    

000098b1 <hd_handler>:
    98b1:	55                   	push   %ebp
    98b2:	89 e5                	mov    %esp,%ebp
    98b4:	83 ec 18             	sub    $0x18,%esp
    98b7:	a1 20 c8 00 00       	mov    0xc820,%eax
    98bc:	83 f8 30             	cmp    $0x30,%eax
    98bf:	74 30                	je     98f1 <hd_handler+0x40>
    98c1:	3d ec 00 00 00       	cmp    $0xec,%eax
    98c6:	74 05                	je     98cd <hd_handler+0x1c>
    98c8:	83 f8 20             	cmp    $0x20,%eax
    98cb:	75 25                	jne    98f2 <hd_handler+0x41>
    98cd:	8b 15 2c c8 00 00    	mov    0xc82c,%edx
    98d3:	a1 30 c8 00 00       	mov    0xc830,%eax
    98d8:	0f b7 c0             	movzwl %ax,%eax
    98db:	89 54 24 08          	mov    %edx,0x8(%esp)
    98df:	89 44 24 04          	mov    %eax,0x4(%esp)
    98e3:	c7 04 24 38 c8 00 00 	movl   $0xc838,(%esp)
    98ea:	e8 8c fe ff ff       	call   977b <port_read>
    98ef:	eb 01                	jmp    98f2 <hd_handler+0x41>
    98f1:	90                   	nop
    98f2:	c7 05 20 c8 00 00 00 	movl   $0x0,0xc820
    98f9:	00 00 00 
    98fc:	e8 10 fd ff ff       	call   9611 <EOI_slave>
    9901:	90                   	nop
    9902:	c9                   	leave  
    9903:	c3                   	ret    

00009904 <hd_identify>:
    9904:	55                   	push   %ebp
    9905:	89 e5                	mov    %esp,%ebp
    9907:	81 ec 28 02 00 00    	sub    $0x228,%esp
    990d:	c6 85 f6 fd ff ff e0 	movb   $0xe0,-0x20a(%ebp)
    9914:	c6 85 f7 fd ff ff ec 	movb   $0xec,-0x209(%ebp)
    991b:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    9921:	a3 28 c8 00 00       	mov    %eax,0xc828
    9926:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    992d:	0f b6 c0             	movzbl %al,%eax
    9930:	a3 20 c8 00 00       	mov    %eax,0xc820
    9935:	c7 05 24 c8 00 00 7b 	movl   $0x977b,0xc824
    993c:	97 00 00 
    993f:	c7 05 2c c8 00 00 00 	movl   $0x200,0xc82c
    9946:	02 00 00 
    9949:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9950:	01 00 00 
    9953:	c7 05 34 c8 00 00 01 	movl   $0x1,0xc834
    995a:	00 00 00 
    995d:	8d 85 f1 fd ff ff    	lea    -0x20f(%ebp),%eax
    9963:	89 04 24             	mov    %eax,(%esp)
    9966:	e8 64 fe ff ff       	call   97cf <hd_cmd_out>
    996b:	90                   	nop
    996c:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9972:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    9979:	0f b6 c0             	movzbl %al,%eax
    997c:	39 c2                	cmp    %eax,%edx
    997e:	74 ec                	je     996c <hd_identify+0x68>
    9980:	a1 2c c8 00 00       	mov    0xc82c,%eax
    9985:	89 44 24 08          	mov    %eax,0x8(%esp)
    9989:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    9990:	00 
    9991:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    9997:	89 04 24             	mov    %eax,(%esp)
    999a:	e8 39 02 00 00       	call   9bd8 <memcpy>
    999f:	90                   	nop
    99a0:	c9                   	leave  
    99a1:	c3                   	ret    

000099a2 <hd_read>:
    99a2:	55                   	push   %ebp
    99a3:	89 e5                	mov    %esp,%ebp
    99a5:	83 ec 28             	sub    $0x28,%esp
    99a8:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
    99ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    99af:	88 45 ee             	mov    %al,-0x12(%ebp)
    99b2:	8b 45 08             	mov    0x8(%ebp),%eax
    99b5:	88 45 ef             	mov    %al,-0x11(%ebp)
    99b8:	8b 45 08             	mov    0x8(%ebp),%eax
    99bb:	c1 e8 08             	shr    $0x8,%eax
    99be:	88 45 f0             	mov    %al,-0x10(%ebp)
    99c1:	8b 45 08             	mov    0x8(%ebp),%eax
    99c4:	c1 e8 10             	shr    $0x10,%eax
    99c7:	88 45 f1             	mov    %al,-0xf(%ebp)
    99ca:	8b 45 08             	mov    0x8(%ebp),%eax
    99cd:	c1 e8 18             	shr    $0x18,%eax
    99d0:	83 e0 0f             	and    $0xf,%eax
    99d3:	83 c8 e0             	or     $0xffffffe0,%eax
    99d6:	88 45 f2             	mov    %al,-0xe(%ebp)
    99d9:	c6 45 f3 20          	movb   $0x20,-0xd(%ebp)
    99dd:	8b 45 10             	mov    0x10(%ebp),%eax
    99e0:	a3 28 c8 00 00       	mov    %eax,0xc828
    99e5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    99e9:	0f b6 c0             	movzbl %al,%eax
    99ec:	a3 20 c8 00 00       	mov    %eax,0xc820
    99f1:	c7 05 24 c8 00 00 7b 	movl   $0x977b,0xc824
    99f8:	97 00 00 
    99fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    99fe:	a3 34 c8 00 00       	mov    %eax,0xc834
    9a03:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9a0a:	01 00 00 
    9a0d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a10:	c1 e0 09             	shl    $0x9,%eax
    9a13:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9a18:	8d 45 ed             	lea    -0x13(%ebp),%eax
    9a1b:	89 04 24             	mov    %eax,(%esp)
    9a1e:	e8 ac fd ff ff       	call   97cf <hd_cmd_out>
    9a23:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9a2a:	eb 09                	jmp    9a35 <hd_read+0x93>
    9a2c:	e8 ea fc ff ff       	call   971b <io_delay>
    9a31:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a35:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    9a3c:	7e ee                	jle    9a2c <hd_read+0x8a>
    9a3e:	90                   	nop
    9a3f:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9a45:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    9a49:	0f b6 c0             	movzbl %al,%eax
    9a4c:	39 c2                	cmp    %eax,%edx
    9a4e:	74 ef                	je     9a3f <hd_read+0x9d>
    9a50:	a1 2c c8 00 00       	mov    0xc82c,%eax
    9a55:	89 44 24 08          	mov    %eax,0x8(%esp)
    9a59:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    9a60:	00 
    9a61:	8b 45 10             	mov    0x10(%ebp),%eax
    9a64:	89 04 24             	mov    %eax,(%esp)
    9a67:	e8 6c 01 00 00       	call   9bd8 <memcpy>
    9a6c:	90                   	nop
    9a6d:	c9                   	leave  
    9a6e:	c3                   	ret    

00009a6f <hd_write>:
    9a6f:	55                   	push   %ebp
    9a70:	89 e5                	mov    %esp,%ebp
    9a72:	83 ec 1c             	sub    $0x1c,%esp
    9a75:	c6 45 f9 00          	movb   $0x0,-0x7(%ebp)
    9a79:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a7c:	88 45 fa             	mov    %al,-0x6(%ebp)
    9a7f:	8b 45 08             	mov    0x8(%ebp),%eax
    9a82:	88 45 fb             	mov    %al,-0x5(%ebp)
    9a85:	8b 45 08             	mov    0x8(%ebp),%eax
    9a88:	c1 e8 08             	shr    $0x8,%eax
    9a8b:	88 45 fc             	mov    %al,-0x4(%ebp)
    9a8e:	8b 45 08             	mov    0x8(%ebp),%eax
    9a91:	c1 e8 10             	shr    $0x10,%eax
    9a94:	88 45 fd             	mov    %al,-0x3(%ebp)
    9a97:	8b 45 08             	mov    0x8(%ebp),%eax
    9a9a:	c1 e8 18             	shr    $0x18,%eax
    9a9d:	83 e0 0f             	and    $0xf,%eax
    9aa0:	83 c8 e0             	or     $0xffffffe0,%eax
    9aa3:	88 45 fe             	mov    %al,-0x2(%ebp)
    9aa6:	c6 45 ff 30          	movb   $0x30,-0x1(%ebp)
    9aaa:	8b 45 10             	mov    0x10(%ebp),%eax
    9aad:	a3 28 c8 00 00       	mov    %eax,0xc828
    9ab2:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9ab6:	0f b6 c0             	movzbl %al,%eax
    9ab9:	a3 20 c8 00 00       	mov    %eax,0xc820
    9abe:	c7 05 24 c8 00 00 a5 	movl   $0x97a5,0xc824
    9ac5:	97 00 00 
    9ac8:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9acf:	01 00 00 
    9ad2:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ad5:	c1 e0 09             	shl    $0x9,%eax
    9ad8:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9add:	8d 45 f9             	lea    -0x7(%ebp),%eax
    9ae0:	89 04 24             	mov    %eax,(%esp)
    9ae3:	e8 e7 fc ff ff       	call   97cf <hd_cmd_out>
    9ae8:	90                   	nop
    9ae9:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    9af0:	e8 3b fc ff ff       	call   9730 <inb_pic>
    9af5:	0f b6 c0             	movzbl %al,%eax
    9af8:	83 e0 08             	and    $0x8,%eax
    9afb:	85 c0                	test   %eax,%eax
    9afd:	74 ea                	je     9ae9 <hd_write+0x7a>
    9aff:	8b 0d 2c c8 00 00    	mov    0xc82c,%ecx
    9b05:	a1 30 c8 00 00       	mov    0xc830,%eax
    9b0a:	0f b7 d0             	movzwl %ax,%edx
    9b0d:	a1 28 c8 00 00       	mov    0xc828,%eax
    9b12:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    9b16:	89 54 24 04          	mov    %edx,0x4(%esp)
    9b1a:	89 04 24             	mov    %eax,(%esp)
    9b1d:	e8 83 fc ff ff       	call   97a5 <port_write>
    9b22:	90                   	nop
    9b23:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9b29:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9b2d:	0f b6 c0             	movzbl %al,%eax
    9b30:	39 c2                	cmp    %eax,%edx
    9b32:	74 ef                	je     9b23 <hd_write+0xb4>
    9b34:	90                   	nop
    9b35:	c9                   	leave  
    9b36:	c3                   	ret    

00009b37 <init_hd>:
    9b37:	55                   	push   %ebp
    9b38:	89 e5                	mov    %esp,%ebp
    9b3a:	83 ec 18             	sub    $0x18,%esp
    9b3d:	c7 05 18 dc 00 00 b1 	movl   $0x98b1,0xdc18
    9b44:	98 00 00 
    9b47:	c7 44 24 04 a3 a7 00 	movl   $0xa7a3,0x4(%esp)
    9b4e:	00 
    9b4f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9b56:	e8 35 fb ff ff       	call   9690 <set_intr_gate>
    9b5b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9b62:	e8 c5 f9 ff ff       	call   952c <enable_irq>
    9b67:	c9                   	leave  
    9b68:	c3                   	ret    
    9b69:	66 90                	xchg   %ax,%ax
    9b6b:	90                   	nop

00009b6c <timer_handler>:
    9b6c:	55                   	push   %ebp
    9b6d:	89 e5                	mov    %esp,%ebp
    9b6f:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9b76:	3c 7a                	cmp    $0x7a,%al
    9b78:	75 07                	jne    9b81 <timer_handler+0x15>
    9b7a:	c6 05 08 c0 00 00 41 	movb   $0x41,0xc008
    9b81:	b4 0c                	mov    $0xc,%ah
    9b83:	a0 08 c0 00 00       	mov    0xc008,%al
    9b88:	65 66 a3 00 0f 00 00 	mov    %ax,%gs:0xf00
    9b8f:	b0 20                	mov    $0x20,%al
    9b91:	e6 20                	out    %al,$0x20
    9b93:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9b9a:	83 c0 01             	add    $0x1,%eax
    9b9d:	a2 08 c0 00 00       	mov    %al,0xc008
    9ba2:	90                   	nop
    9ba3:	5d                   	pop    %ebp
    9ba4:	c3                   	ret    

00009ba5 <init_timer>:
    9ba5:	55                   	push   %ebp
    9ba6:	89 e5                	mov    %esp,%ebp
    9ba8:	83 ec 18             	sub    $0x18,%esp
    9bab:	c7 05 e0 db 00 00 6c 	movl   $0x9b6c,0xdbe0
    9bb2:	9b 00 00 
    9bb5:	c7 44 24 04 64 a7 00 	movl   $0xa764,0x4(%esp)
    9bbc:	00 
    9bbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bc4:	e8 c7 fa ff ff       	call   9690 <set_intr_gate>
    9bc9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bd0:	e8 57 f9 ff ff       	call   952c <enable_irq>
    9bd5:	c9                   	leave  
    9bd6:	c3                   	ret    
    9bd7:	90                   	nop

00009bd8 <memcpy>:
    9bd8:	55                   	push   %ebp
    9bd9:	89 e5                	mov    %esp,%ebp
    9bdb:	83 ec 10             	sub    $0x10,%esp
    9bde:	8b 45 08             	mov    0x8(%ebp),%eax
    9be1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    9be4:	8b 45 0c             	mov    0xc(%ebp),%eax
    9be7:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9bea:	eb 17                	jmp    9c03 <memcpy+0x2b>
    9bec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9bef:	8d 50 01             	lea    0x1(%eax),%edx
    9bf2:	89 55 fc             	mov    %edx,-0x4(%ebp)
    9bf5:	8b 55 f8             	mov    -0x8(%ebp),%edx
    9bf8:	8d 4a 01             	lea    0x1(%edx),%ecx
    9bfb:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    9bfe:	0f b6 12             	movzbl (%edx),%edx
    9c01:	88 10                	mov    %dl,(%eax)
    9c03:	8b 45 10             	mov    0x10(%ebp),%eax
    9c06:	8d 50 ff             	lea    -0x1(%eax),%edx
    9c09:	89 55 10             	mov    %edx,0x10(%ebp)
    9c0c:	85 c0                	test   %eax,%eax
    9c0e:	75 dc                	jne    9bec <memcpy+0x14>
    9c10:	8b 45 08             	mov    0x8(%ebp),%eax
    9c13:	c9                   	leave  
    9c14:	c3                   	ret    

00009c15 <strlen>:
    9c15:	55                   	push   %ebp
    9c16:	89 e5                	mov    %esp,%ebp
    9c18:	83 ec 10             	sub    $0x10,%esp
    9c1b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c22:	8b 45 08             	mov    0x8(%ebp),%eax
    9c25:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9c28:	eb 08                	jmp    9c32 <strlen+0x1d>
    9c2a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    9c2e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9c32:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9c35:	0f b6 00             	movzbl (%eax),%eax
    9c38:	84 c0                	test   %al,%al
    9c3a:	75 ee                	jne    9c2a <strlen+0x15>
    9c3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9c3f:	c9                   	leave  
    9c40:	c3                   	ret    

00009c41 <strcmp>:
    9c41:	55                   	push   %ebp
    9c42:	89 e5                	mov    %esp,%ebp
    9c44:	eb 0c                	jmp    9c52 <strcmp+0x11>
    9c46:	8b 45 08             	mov    0x8(%ebp),%eax
    9c49:	0f b6 00             	movzbl (%eax),%eax
    9c4c:	84 c0                	test   %al,%al
    9c4e:	75 02                	jne    9c52 <strcmp+0x11>
    9c50:	eb 1c                	jmp    9c6e <strcmp+0x2d>
    9c52:	8b 45 08             	mov    0x8(%ebp),%eax
    9c55:	8d 50 01             	lea    0x1(%eax),%edx
    9c58:	89 55 08             	mov    %edx,0x8(%ebp)
    9c5b:	0f b6 08             	movzbl (%eax),%ecx
    9c5e:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c61:	8d 50 01             	lea    0x1(%eax),%edx
    9c64:	89 55 0c             	mov    %edx,0xc(%ebp)
    9c67:	0f b6 00             	movzbl (%eax),%eax
    9c6a:	38 c1                	cmp    %al,%cl
    9c6c:	74 d8                	je     9c46 <strcmp+0x5>
    9c6e:	8b 45 08             	mov    0x8(%ebp),%eax
    9c71:	0f b6 00             	movzbl (%eax),%eax
    9c74:	0f be d0             	movsbl %al,%edx
    9c77:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c7a:	0f b6 00             	movzbl (%eax),%eax
    9c7d:	0f be c0             	movsbl %al,%eax
    9c80:	29 c2                	sub    %eax,%edx
    9c82:	89 d0                	mov    %edx,%eax
    9c84:	5d                   	pop    %ebp
    9c85:	c3                   	ret    

00009c86 <memset>:
    9c86:	55                   	push   %ebp
    9c87:	89 e5                	mov    %esp,%ebp
    9c89:	83 ec 10             	sub    $0x10,%esp
    9c8c:	8b 45 08             	mov    0x8(%ebp),%eax
    9c8f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9c92:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c99:	eb 12                	jmp    9cad <memset+0x27>
    9c9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9c9e:	8d 50 01             	lea    0x1(%eax),%edx
    9ca1:	89 55 f8             	mov    %edx,-0x8(%ebp)
    9ca4:	8b 55 0c             	mov    0xc(%ebp),%edx
    9ca7:	88 10                	mov    %dl,(%eax)
    9ca9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9cad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9cb0:	3b 45 10             	cmp    0x10(%ebp),%eax
    9cb3:	72 e6                	jb     9c9b <memset+0x15>
    9cb5:	8b 45 08             	mov    0x8(%ebp),%eax
    9cb8:	c9                   	leave  
    9cb9:	c3                   	ret    
    9cba:	66 90                	xchg   %ax,%ax

00009cbc <get_part_information>:
    9cbc:	55                   	push   %ebp
    9cbd:	89 e5                	mov    %esp,%ebp
    9cbf:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9cc5:	c7 45 f4 be 01 00 00 	movl   $0x1be,-0xc(%ebp)
    9ccc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9cd3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cda:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9ce0:	89 44 24 08          	mov    %eax,0x8(%esp)
    9ce4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9ceb:	00 
    9cec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9cf3:	e8 aa fc ff ff       	call   99a2 <hd_read>
    9cf8:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9cfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d01:	01 d0                	add    %edx,%eax
    9d03:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d06:	eb 74                	jmp    9d7c <get_part_information+0xc0>
    9d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d0b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d0f:	3c 05                	cmp    $0x5,%al
    9d11:	75 29                	jne    9d3c <get_part_information+0x80>
    9d13:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d16:	c1 e0 04             	shl    $0x4,%eax
    9d19:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9d1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d22:	8b 08                	mov    (%eax),%ecx
    9d24:	89 0a                	mov    %ecx,(%edx)
    9d26:	8b 48 04             	mov    0x4(%eax),%ecx
    9d29:	89 4a 04             	mov    %ecx,0x4(%edx)
    9d2c:	8b 48 08             	mov    0x8(%eax),%ecx
    9d2f:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d32:	8b 40 0c             	mov    0xc(%eax),%eax
    9d35:	89 42 0c             	mov    %eax,0xc(%edx)
    9d38:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d3f:	c1 e0 04             	shl    $0x4,%eax
    9d42:	8d 90 60 d5 00 00    	lea    0xd560(%eax),%edx
    9d48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d4b:	8b 08                	mov    (%eax),%ecx
    9d4d:	89 0a                	mov    %ecx,(%edx)
    9d4f:	8b 48 04             	mov    0x4(%eax),%ecx
    9d52:	89 4a 04             	mov    %ecx,0x4(%edx)
    9d55:	8b 48 08             	mov    0x8(%eax),%ecx
    9d58:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d5b:	8b 40 0c             	mov    0xc(%eax),%eax
    9d5e:	89 42 0c             	mov    %eax,0xc(%edx)
    9d61:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9d65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d68:	83 c0 10             	add    $0x10,%eax
    9d6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9d6e:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9d74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d77:	01 d0                	add    %edx,%eax
    9d79:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d7f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d83:	84 c0                	test   %al,%al
    9d85:	74 0d                	je     9d94 <get_part_information+0xd8>
    9d87:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    9d8e:	0f 8e 74 ff ff ff    	jle    9d08 <get_part_information+0x4c>
    9d94:	c7 45 f0 40 cc 00 00 	movl   $0xcc40,-0x10(%ebp)
    9d9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d9e:	8b 40 08             	mov    0x8(%eax),%eax
    9da1:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9da7:	89 54 24 08          	mov    %edx,0x8(%esp)
    9dab:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9db2:	00 
    9db3:	89 04 24             	mov    %eax,(%esp)
    9db6:	e8 e7 fb ff ff       	call   99a2 <hd_read>
    9dbb:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9dc1:	05 be 01 00 00       	add    $0x1be,%eax
    9dc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9dc9:	e9 b2 00 00 00       	jmp    9e80 <get_part_information+0x1c4>
    9dce:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9dd4:	05 be 01 00 00       	add    $0x1be,%eax
    9dd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9ddc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ddf:	c1 e0 04             	shl    $0x4,%eax
    9de2:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9de8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9deb:	8b 08                	mov    (%eax),%ecx
    9ded:	89 0a                	mov    %ecx,(%edx)
    9def:	8b 48 04             	mov    0x4(%eax),%ecx
    9df2:	89 4a 04             	mov    %ecx,0x4(%edx)
    9df5:	8b 48 08             	mov    0x8(%eax),%ecx
    9df8:	89 4a 08             	mov    %ecx,0x8(%edx)
    9dfb:	8b 40 0c             	mov    0xc(%eax),%eax
    9dfe:	89 42 0c             	mov    %eax,0xc(%edx)
    9e01:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9e05:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e0b:	05 ce 01 00 00       	add    $0x1ce,%eax
    9e10:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9e13:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e16:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9e1a:	84 c0                	test   %al,%al
    9e1c:	74 60                	je     9e7e <get_part_information+0x1c2>
    9e1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9e21:	c1 e0 04             	shl    $0x4,%eax
    9e24:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9e2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e2d:	8b 08                	mov    (%eax),%ecx
    9e2f:	89 0a                	mov    %ecx,(%edx)
    9e31:	8b 48 04             	mov    0x4(%eax),%ecx
    9e34:	89 4a 04             	mov    %ecx,0x4(%edx)
    9e37:	8b 48 08             	mov    0x8(%eax),%ecx
    9e3a:	89 4a 08             	mov    %ecx,0x8(%edx)
    9e3d:	8b 40 0c             	mov    0xc(%eax),%eax
    9e40:	89 42 0c             	mov    %eax,0xc(%edx)
    9e43:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9e47:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e4a:	8b 50 08             	mov    0x8(%eax),%edx
    9e4d:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9e52:	01 c2                	add    %eax,%edx
    9e54:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e5a:	89 44 24 08          	mov    %eax,0x8(%esp)
    9e5e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9e65:	00 
    9e66:	89 14 24             	mov    %edx,(%esp)
    9e69:	e8 34 fb ff ff       	call   99a2 <hd_read>
    9e6e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9e74:	05 be 01 00 00       	add    $0x1be,%eax
    9e79:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9e7c:	eb 02                	jmp    9e80 <get_part_information+0x1c4>
    9e7e:	eb 0f                	jmp    9e8f <get_part_information+0x1d3>
    9e80:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e83:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9e87:	84 c0                	test   %al,%al
    9e89:	0f 85 3f ff ff ff    	jne    9dce <get_part_information+0x112>
    9e8f:	c9                   	leave  
    9e90:	c3                   	ret    

00009e91 <make_fs>:
    9e91:	55                   	push   %ebp
    9e92:	89 e5                	mov    %esp,%ebp
    9e94:	81 ec 78 02 00 00    	sub    $0x278,%esp
    9e9a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9ea1:	eb 26                	jmp    9ec9 <make_fs+0x38>
    9ea3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ea6:	c1 e0 04             	shl    $0x4,%eax
    9ea9:	05 64 d5 00 00       	add    $0xd564,%eax
    9eae:	0f b6 00             	movzbl (%eax),%eax
    9eb1:	3c 0d                	cmp    $0xd,%al
    9eb3:	75 10                	jne    9ec5 <make_fs+0x34>
    9eb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9eb8:	c1 e0 04             	shl    $0x4,%eax
    9ebb:	05 60 d5 00 00       	add    $0xd560,%eax
    9ec0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9ec3:	eb 0a                	jmp    9ecf <make_fs+0x3e>
    9ec5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9ec9:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9ecd:	7e d4                	jle    9ea3 <make_fs+0x12>
    9ecf:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9ed4:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9ed9:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9edd:	0f 8e 81 00 00 00    	jle    9f64 <make_fs+0xd3>
    9ee3:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9eea:	84 c0                	test   %al,%al
    9eec:	74 76                	je     9f64 <make_fs+0xd3>
    9eee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9ef5:	eb 67                	jmp    9f5e <make_fs+0xcd>
    9ef7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9efa:	c1 e0 04             	shl    $0x4,%eax
    9efd:	05 44 cc 00 00       	add    $0xcc44,%eax
    9f02:	0f b6 00             	movzbl (%eax),%eax
    9f05:	3c 0d                	cmp    $0xd,%al
    9f07:	75 51                	jne    9f5a <make_fs+0xc9>
    9f09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f0c:	c1 e0 04             	shl    $0x4,%eax
    9f0f:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f14:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9f17:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f1a:	83 e8 01             	sub    $0x1,%eax
    9f1d:	c1 e0 04             	shl    $0x4,%eax
    9f20:	05 44 cc 00 00       	add    $0xcc44,%eax
    9f25:	0f b6 10             	movzbl (%eax),%edx
    9f28:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9f2f:	38 c2                	cmp    %al,%dl
    9f31:	75 25                	jne    9f58 <make_fs+0xc7>
    9f33:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9f37:	74 1f                	je     9f58 <make_fs+0xc7>
    9f39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f3c:	83 e8 01             	sub    $0x1,%eax
    9f3f:	c1 e0 04             	shl    $0x4,%eax
    9f42:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f47:	8b 50 08             	mov    0x8(%eax),%edx
    9f4a:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9f4f:	01 d0                	add    %edx,%eax
    9f51:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9f56:	eb 0c                	jmp    9f64 <make_fs+0xd3>
    9f58:	eb 0a                	jmp    9f64 <make_fs+0xd3>
    9f5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f5e:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f62:	7e 93                	jle    9ef7 <make_fs+0x66>
    9f64:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f68:	7e 4a                	jle    9fb4 <make_fs+0x123>
    9f6a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f71:	00 
    9f72:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f79:	00 
    9f7a:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    9f81:	00 
    9f82:	c7 04 24 c8 a8 00 00 	movl   $0xa8c8,(%esp)
    9f89:	e8 2e f3 ff ff       	call   92bc <dis_str>
    9f8e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f95:	00 
    9f96:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f9d:	00 
    9f9e:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    9fa5:	00 
    9fa6:	c7 04 24 d0 a8 00 00 	movl   $0xa8d0,(%esp)
    9fad:	e8 0a f3 ff ff       	call   92bc <dis_str>
    9fb2:	eb fe                	jmp    9fb2 <make_fs+0x121>
    9fb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fb7:	8b 50 08             	mov    0x8(%eax),%edx
    9fba:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9fbf:	01 d0                	add    %edx,%eax
    9fc1:	a3 0c c0 00 00       	mov    %eax,0xc00c
    9fc6:	a1 0c c0 00 00       	mov    0xc00c,%eax
    9fcb:	8d 50 01             	lea    0x1(%eax),%edx
    9fce:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9fd4:	89 44 24 08          	mov    %eax,0x8(%esp)
    9fd8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9fdf:	00 
    9fe0:	89 14 24             	mov    %edx,(%esp)
    9fe3:	e8 ba f9 ff ff       	call   99a2 <hd_read>
    9fe8:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9fee:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9ff1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ff4:	8b 00                	mov    (%eax),%eax
    9ff6:	3d 8f 9a 08 00       	cmp    $0x89a8f,%eax
    9ffb:	75 0a                	jne    a007 <make_fs+0x176>
    9ffd:	b8 00 00 00 00       	mov    $0x0,%eax
    a002:	e9 aa 03 00 00       	jmp    a3b1 <make_fs+0x520>
    a007:	c7 85 ac fd ff ff 8f 	movl   $0x89a8f,-0x254(%ebp)
    a00e:	9a 08 00 
    a011:	c7 85 b0 fd ff ff 64 	movl   $0x64,-0x250(%ebp)
    a018:	00 00 00 
    a01b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a01e:	8b 40 0c             	mov    0xc(%eax),%eax
    a021:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    a027:	c7 85 b8 fd ff ff 01 	movl   $0x1,-0x248(%ebp)
    a02e:	00 00 00 
    a031:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a036:	83 c0 02             	add    $0x2,%eax
    a039:	89 85 bc fd ff ff    	mov    %eax,-0x244(%ebp)
    a03f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a042:	8b 40 0c             	mov    0xc(%eax),%eax
    a045:	c1 e8 0c             	shr    $0xc,%eax
    a048:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%ebp)
    a04e:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a054:	83 c0 01             	add    $0x1,%eax
    a057:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
    a05d:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
    a063:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a069:	01 d0                	add    %edx,%eax
    a06b:	89 85 c8 fd ff ff    	mov    %eax,-0x238(%ebp)
    a071:	c7 85 d0 fd ff ff 03 	movl   $0x3,-0x230(%ebp)
    a078:	00 00 00 
    a07b:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a081:	83 c0 01             	add    $0x1,%eax
    a084:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%ebp)
    a08a:	c7 85 e0 fd ff ff 10 	movl   $0x10,-0x220(%ebp)
    a091:	00 00 00 
    a094:	c7 85 d8 fd ff ff 00 	movl   $0x0,-0x228(%ebp)
    a09b:	00 00 00 
    a09e:	8b 95 c8 fd ff ff    	mov    -0x238(%ebp),%edx
    a0a4:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a0aa:	01 d0                	add    %edx,%eax
    a0ac:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%ebp)
    a0b2:	c7 85 dc fd ff ff 03 	movl   $0x3,-0x224(%ebp)
    a0b9:	00 00 00 
    a0bc:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a0c2:	83 c0 01             	add    $0x1,%eax
    a0c5:	89 85 dc fd ff ff    	mov    %eax,-0x224(%ebp)
    a0cb:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
    a0d1:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a0d7:	01 d0                	add    %edx,%eax
    a0d9:	89 85 cc fd ff ff    	mov    %eax,-0x234(%ebp)
    a0df:	c7 85 e4 fd ff ff 10 	movl   $0x10,-0x21c(%ebp)
    a0e6:	00 00 00 
    a0e9:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a0f0:	00 
    a0f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a0f8:	00 
    a0f9:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a0ff:	89 04 24             	mov    %eax,(%esp)
    a102:	e8 7f fb ff ff       	call   9c86 <memset>
    a107:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
    a10d:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a113:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
    a119:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a11f:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
    a125:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a12b:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
    a131:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a137:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a13d:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%ebp)
    a143:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a149:	89 85 fc fd ff ff    	mov    %eax,-0x204(%ebp)
    a14f:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
    a155:	89 85 00 fe ff ff    	mov    %eax,-0x200(%ebp)
    a15b:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a161:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%ebp)
    a167:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
    a16d:	89 85 08 fe ff ff    	mov    %eax,-0x1f8(%ebp)
    a173:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a179:	89 85 0c fe ff ff    	mov    %eax,-0x1f4(%ebp)
    a17f:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a185:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%ebp)
    a18b:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a191:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%ebp)
    a197:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a19d:	89 85 18 fe ff ff    	mov    %eax,-0x1e8(%ebp)
    a1a3:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
    a1a9:	89 85 1c fe ff ff    	mov    %eax,-0x1e4(%ebp)
    a1af:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
    a1b5:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%ebp)
    a1bb:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a1c0:	8d 50 01             	lea    0x1(%eax),%edx
    a1c3:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
    a1c9:	89 44 24 08          	mov    %eax,0x8(%esp)
    a1cd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a1d4:	00 
    a1d5:	89 14 24             	mov    %edx,(%esp)
    a1d8:	e8 92 f8 ff ff       	call   9a6f <hd_write>
    a1dd:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a1e4:	00 
    a1e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a1ec:	00 
    a1ed:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a1f3:	89 04 24             	mov    %eax,(%esp)
    a1f6:	e8 8b fa ff ff       	call   9c86 <memset>
    a1fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a202:	eb 29                	jmp    a22d <make_fs+0x39c>
    a204:	8b 95 c8 fd ff ff    	mov    -0x238(%ebp),%edx
    a20a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a20d:	01 c2                	add    %eax,%edx
    a20f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a215:	89 44 24 08          	mov    %eax,0x8(%esp)
    a219:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a220:	00 
    a221:	89 14 24             	mov    %edx,(%esp)
    a224:	e8 46 f8 ff ff       	call   9a6f <hd_write>
    a229:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a22d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a230:	83 f8 03             	cmp    $0x3,%eax
    a233:	76 cf                	jbe    a204 <make_fs+0x373>
    a235:	c7 85 9c fd ff ff 02 	movl   $0x2,-0x264(%ebp)
    a23c:	00 00 00 
    a23f:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a245:	c1 e0 09             	shl    $0x9,%eax
    a248:	89 85 a0 fd ff ff    	mov    %eax,-0x260(%ebp)
    a24e:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a254:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
    a25a:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a260:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    a266:	8b 85 9c fd ff ff    	mov    -0x264(%ebp),%eax
    a26c:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a272:	8b 85 a0 fd ff ff    	mov    -0x260(%ebp),%eax
    a278:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a27e:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
    a284:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a28a:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    a290:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a296:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a29c:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    a2a2:	89 54 24 08          	mov    %edx,0x8(%esp)
    a2a6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2ad:	00 
    a2ae:	89 04 24             	mov    %eax,(%esp)
    a2b1:	e8 b9 f7 ff ff       	call   9a6f <hd_write>
    a2b6:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a2bd:	00 
    a2be:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a2c5:	00 
    a2c6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a2cc:	89 04 24             	mov    %eax,(%esp)
    a2cf:	e8 b2 f9 ff ff       	call   9c86 <memset>
    a2d4:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a2da:	c6 84 05 e8 fd ff ff 	movb   $0x1,-0x218(%ebp,%eax,1)
    a2e1:	01 
    a2e2:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a2e8:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    a2ee:	89 54 24 08          	mov    %edx,0x8(%esp)
    a2f2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2f9:	00 
    a2fa:	89 04 24             	mov    %eax,(%esp)
    a2fd:	e8 6d f7 ff ff       	call   9a6f <hd_write>
    a302:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a308:	c6 84 05 e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%eax,1)
    a30f:	00 
    a310:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a317:	eb 29                	jmp    a342 <make_fs+0x4b1>
    a319:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
    a31f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a322:	01 c2                	add    %eax,%edx
    a324:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a32a:	89 44 24 08          	mov    %eax,0x8(%esp)
    a32e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a335:	00 
    a336:	89 14 24             	mov    %edx,(%esp)
    a339:	e8 31 f7 ff ff       	call   9a6f <hd_write>
    a33e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a342:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a345:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a34b:	39 c2                	cmp    %eax,%edx
    a34d:	72 ca                	jb     a319 <make_fs+0x488>
    a34f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a356:	00 
    a357:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a35e:	00 
    a35f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a365:	89 04 24             	mov    %eax,(%esp)
    a368:	e8 19 f9 ff ff       	call   9c86 <memset>
    a36d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a374:	eb 29                	jmp    a39f <make_fs+0x50e>
    a376:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
    a37c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a37f:	01 c2                	add    %eax,%edx
    a381:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    a387:	89 44 24 08          	mov    %eax,0x8(%esp)
    a38b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a392:	00 
    a393:	89 14 24             	mov    %edx,(%esp)
    a396:	e8 d4 f6 ff ff       	call   9a6f <hd_write>
    a39b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a39f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a3a2:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a3a8:	39 c2                	cmp    %eax,%edx
    a3aa:	72 ca                	jb     a376 <make_fs+0x4e5>
    a3ac:	b8 01 00 00 00       	mov    $0x1,%eax
    a3b1:	c9                   	leave  
    a3b2:	c3                   	ret    

0000a3b3 <get_sector>:
    a3b3:	55                   	push   %ebp
    a3b4:	89 e5                	mov    %esp,%ebp
    a3b6:	83 ec 18             	sub    $0x18,%esp
    a3b9:	8b 45 08             	mov    0x8(%ebp),%eax
    a3bc:	8b 55 0c             	mov    0xc(%ebp),%edx
    a3bf:	89 54 24 08          	mov    %edx,0x8(%esp)
    a3c3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a3ca:	00 
    a3cb:	89 04 24             	mov    %eax,(%esp)
    a3ce:	e8 cf f5 ff ff       	call   99a2 <hd_read>
    a3d3:	c9                   	leave  
    a3d4:	c3                   	ret    

0000a3d5 <get_super_block>:
    a3d5:	55                   	push   %ebp
    a3d6:	89 e5                	mov    %esp,%ebp
    a3d8:	83 ec 18             	sub    $0x18,%esp
    a3db:	a1 0c c0 00 00       	mov    0xc00c,%eax
    a3e0:	83 c0 01             	add    $0x1,%eax
    a3e3:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a3ea:	00 
    a3eb:	89 04 24             	mov    %eax,(%esp)
    a3ee:	e8 c0 ff ff ff       	call   a3b3 <get_sector>
    a3f3:	a1 e0 cc 00 00       	mov    0xcce0,%eax
    a3f8:	a3 e0 ce 00 00       	mov    %eax,0xcee0
    a3fd:	a1 e4 cc 00 00       	mov    0xcce4,%eax
    a402:	a3 e4 ce 00 00       	mov    %eax,0xcee4
    a407:	a1 e8 cc 00 00       	mov    0xcce8,%eax
    a40c:	a3 e8 ce 00 00       	mov    %eax,0xcee8
    a411:	a1 ec cc 00 00       	mov    0xccec,%eax
    a416:	a3 ec ce 00 00       	mov    %eax,0xceec
    a41b:	a1 f0 cc 00 00       	mov    0xccf0,%eax
    a420:	a3 f0 ce 00 00       	mov    %eax,0xcef0
    a425:	a1 f4 cc 00 00       	mov    0xccf4,%eax
    a42a:	a3 f4 ce 00 00       	mov    %eax,0xcef4
    a42f:	a1 f8 cc 00 00       	mov    0xccf8,%eax
    a434:	a3 f8 ce 00 00       	mov    %eax,0xcef8
    a439:	a1 fc cc 00 00       	mov    0xccfc,%eax
    a43e:	a3 fc ce 00 00       	mov    %eax,0xcefc
    a443:	a1 00 cd 00 00       	mov    0xcd00,%eax
    a448:	a3 00 cf 00 00       	mov    %eax,0xcf00
    a44d:	a1 04 cd 00 00       	mov    0xcd04,%eax
    a452:	a3 04 cf 00 00       	mov    %eax,0xcf04
    a457:	a1 08 cd 00 00       	mov    0xcd08,%eax
    a45c:	a3 08 cf 00 00       	mov    %eax,0xcf08
    a461:	a1 0c cd 00 00       	mov    0xcd0c,%eax
    a466:	a3 0c cf 00 00       	mov    %eax,0xcf0c
    a46b:	a1 10 cd 00 00       	mov    0xcd10,%eax
    a470:	a3 10 cf 00 00       	mov    %eax,0xcf10
    a475:	a1 14 cd 00 00       	mov    0xcd14,%eax
    a47a:	a3 14 cf 00 00       	mov    %eax,0xcf14
    a47f:	a1 18 cd 00 00       	mov    0xcd18,%eax
    a484:	a3 18 cf 00 00       	mov    %eax,0xcf18
    a489:	90                   	nop
    a48a:	c9                   	leave  
    a48b:	c3                   	ret    

0000a48c <get_root_area>:
    a48c:	55                   	push   %ebp
    a48d:	89 e5                	mov    %esp,%ebp
    a48f:	83 ec 28             	sub    $0x28,%esp
    a492:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a499:	eb 68                	jmp    a503 <get_root_area+0x77>
    a49b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a49e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    a4a2:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
    a4a9:	00 
    a4aa:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    a4b1:	00 
    a4b2:	c7 04 24 fc a8 00 00 	movl   $0xa8fc,(%esp)
    a4b9:	e8 fe ed ff ff       	call   92bc <dis_str>
    a4be:	8b 15 08 cf 00 00    	mov    0xcf08,%edx
    a4c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4c7:	01 d0                	add    %edx,%eax
    a4c9:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a4d0:	00 
    a4d1:	89 04 24             	mov    %eax,(%esp)
    a4d4:	e8 da fe ff ff       	call   a3b3 <get_sector>
    a4d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4dc:	c1 e0 05             	shl    $0x5,%eax
    a4df:	c1 e0 04             	shl    $0x4,%eax
    a4e2:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a4e7:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a4ee:	00 
    a4ef:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a4f6:	00 
    a4f7:	89 04 24             	mov    %eax,(%esp)
    a4fa:	e8 d9 f6 ff ff       	call   9bd8 <memcpy>
    a4ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a503:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a506:	8b 15 10 cf 00 00    	mov    0xcf10,%edx
    a50c:	83 ea 03             	sub    $0x3,%edx
    a50f:	39 d0                	cmp    %edx,%eax
    a511:	72 88                	jb     a49b <get_root_area+0xf>
    a513:	90                   	nop
    a514:	c9                   	leave  
    a515:	c3                   	ret    

0000a516 <get_inode_array>:
    a516:	55                   	push   %ebp
    a517:	89 e5                	mov    %esp,%ebp
    a519:	83 ec 28             	sub    $0x28,%esp
    a51c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a523:	eb 45                	jmp    a56a <get_inode_array+0x54>
    a525:	8b 15 fc ce 00 00    	mov    0xcefc,%edx
    a52b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a52e:	01 d0                	add    %edx,%eax
    a530:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a537:	00 
    a538:	89 04 24             	mov    %eax,(%esp)
    a53b:	e8 73 fe ff ff       	call   a3b3 <get_sector>
    a540:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a543:	c1 e0 05             	shl    $0x5,%eax
    a546:	c1 e0 04             	shl    $0x4,%eax
    a549:	05 20 cf 00 00       	add    $0xcf20,%eax
    a54e:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a555:	00 
    a556:	c7 44 24 04 e0 cc 00 	movl   $0xcce0,0x4(%esp)
    a55d:	00 
    a55e:	89 04 24             	mov    %eax,(%esp)
    a561:	e8 72 f6 ff ff       	call   9bd8 <memcpy>
    a566:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a56a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a56d:	a1 04 cf 00 00       	mov    0xcf04,%eax
    a572:	39 c2                	cmp    %eax,%edx
    a574:	72 af                	jb     a525 <get_inode_array+0xf>
    a576:	c9                   	leave  
    a577:	c3                   	ret    

0000a578 <find_file_in_root>:
    a578:	55                   	push   %ebp
    a579:	89 e5                	mov    %esp,%ebp
    a57b:	83 ec 28             	sub    $0x28,%esp
    a57e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a585:	eb 32                	jmp    a5b9 <find_file_in_root+0x41>
    a587:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a58a:	c1 e0 04             	shl    $0x4,%eax
    a58d:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a592:	83 c0 04             	add    $0x4,%eax
    a595:	89 44 24 04          	mov    %eax,0x4(%esp)
    a599:	8b 45 08             	mov    0x8(%ebp),%eax
    a59c:	89 04 24             	mov    %eax,(%esp)
    a59f:	e8 9d f6 ff ff       	call   9c41 <strcmp>
    a5a4:	85 c0                	test   %eax,%eax
    a5a6:	75 0d                	jne    a5b5 <find_file_in_root+0x3d>
    a5a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5ab:	c1 e0 04             	shl    $0x4,%eax
    a5ae:	05 a0 d5 00 00       	add    $0xd5a0,%eax
    a5b3:	eb 0f                	jmp    a5c4 <find_file_in_root+0x4c>
    a5b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a5b9:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    a5bd:	7e c8                	jle    a587 <find_file_in_root+0xf>
    a5bf:	b8 00 00 00 00       	mov    $0x0,%eax
    a5c4:	c9                   	leave  
    a5c5:	c3                   	ret    

0000a5c6 <loader_kernel>:
    a5c6:	55                   	push   %ebp
    a5c7:	89 e5                	mov    %esp,%ebp
    a5c9:	57                   	push   %edi
    a5ca:	56                   	push   %esi
    a5cb:	53                   	push   %ebx
    a5cc:	83 ec 3c             	sub    $0x3c,%esp
    a5cf:	c7 45 e0 00 00 20 00 	movl   $0x200000,-0x20(%ebp)
    a5d6:	c7 04 24 fe a8 00 00 	movl   $0xa8fe,(%esp)
    a5dd:	e8 96 ff ff ff       	call   a578 <find_file_in_root>
    a5e2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a5e5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    a5e9:	75 4a                	jne    a635 <loader_kernel+0x6f>
    a5eb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    a5f2:	00 
    a5f3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    a5fa:	00 
    a5fb:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    a602:	00 
    a603:	c7 04 24 c8 a8 00 00 	movl   $0xa8c8,(%esp)
    a60a:	e8 ad ec ff ff       	call   92bc <dis_str>
    a60f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    a616:	00 
    a617:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    a61e:	00 
    a61f:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    a626:	00 
    a627:	c7 04 24 0b a9 00 00 	movl   $0xa90b,(%esp)
    a62e:	e8 89 ec ff ff       	call   92bc <dis_str>
    a633:	eb fe                	jmp    a633 <loader_kernel+0x6d>
    a635:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a638:	8b 00                	mov    (%eax),%eax
    a63a:	c1 e0 04             	shl    $0x4,%eax
    a63d:	05 20 cf 00 00       	add    $0xcf20,%eax
    a642:	89 45 d8             	mov    %eax,-0x28(%ebp)
    a645:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a64c:	e9 c6 00 00 00       	jmp    a717 <loader_kernel+0x151>
    a651:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a654:	8b 50 08             	mov    0x8(%eax),%edx
    a657:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a65a:	01 d0                	add    %edx,%eax
    a65c:	c7 44 24 08 e0 cc 00 	movl   $0xcce0,0x8(%esp)
    a663:	00 
    a664:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a66b:	00 
    a66c:	89 04 24             	mov    %eax,(%esp)
    a66f:	e8 2e f3 ff ff       	call   99a2 <hd_read>
    a674:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a677:	89 44 24 0c          	mov    %eax,0xc(%esp)
    a67b:	c7 44 24 08 09 00 00 	movl   $0x9,0x8(%esp)
    a682:	00 
    a683:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    a68a:	00 
    a68b:	c7 04 24 fc a8 00 00 	movl   $0xa8fc,(%esp)
    a692:	e8 25 ec ff ff       	call   92bc <dis_str>
    a697:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a69a:	c1 e0 09             	shl    $0x9,%eax
    a69d:	89 c2                	mov    %eax,%edx
    a69f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a6a2:	01 d0                	add    %edx,%eax
    a6a4:	ba e0 cc 00 00       	mov    $0xcce0,%edx
    a6a9:	bb 00 02 00 00       	mov    $0x200,%ebx
    a6ae:	89 c1                	mov    %eax,%ecx
    a6b0:	83 e1 01             	and    $0x1,%ecx
    a6b3:	85 c9                	test   %ecx,%ecx
    a6b5:	74 0e                	je     a6c5 <loader_kernel+0xff>
    a6b7:	0f b6 0a             	movzbl (%edx),%ecx
    a6ba:	88 08                	mov    %cl,(%eax)
    a6bc:	83 c0 01             	add    $0x1,%eax
    a6bf:	83 c2 01             	add    $0x1,%edx
    a6c2:	83 eb 01             	sub    $0x1,%ebx
    a6c5:	89 c1                	mov    %eax,%ecx
    a6c7:	83 e1 02             	and    $0x2,%ecx
    a6ca:	85 c9                	test   %ecx,%ecx
    a6cc:	74 0f                	je     a6dd <loader_kernel+0x117>
    a6ce:	0f b7 0a             	movzwl (%edx),%ecx
    a6d1:	66 89 08             	mov    %cx,(%eax)
    a6d4:	83 c0 02             	add    $0x2,%eax
    a6d7:	83 c2 02             	add    $0x2,%edx
    a6da:	83 eb 02             	sub    $0x2,%ebx
    a6dd:	89 d9                	mov    %ebx,%ecx
    a6df:	c1 e9 02             	shr    $0x2,%ecx
    a6e2:	89 c7                	mov    %eax,%edi
    a6e4:	89 d6                	mov    %edx,%esi
    a6e6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    a6e8:	89 f2                	mov    %esi,%edx
    a6ea:	89 f8                	mov    %edi,%eax
    a6ec:	b9 00 00 00 00       	mov    $0x0,%ecx
    a6f1:	89 de                	mov    %ebx,%esi
    a6f3:	83 e6 02             	and    $0x2,%esi
    a6f6:	85 f6                	test   %esi,%esi
    a6f8:	74 0b                	je     a705 <loader_kernel+0x13f>
    a6fa:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    a6fe:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    a702:	83 c1 02             	add    $0x2,%ecx
    a705:	83 e3 01             	and    $0x1,%ebx
    a708:	85 db                	test   %ebx,%ebx
    a70a:	74 07                	je     a713 <loader_kernel+0x14d>
    a70c:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    a710:	88 14 08             	mov    %dl,(%eax,%ecx,1)
    a713:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a717:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a71a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a71d:	8b 40 0c             	mov    0xc(%eax),%eax
    a720:	39 c2                	cmp    %eax,%edx
    a722:	0f 82 29 ff ff ff    	jb     a651 <loader_kernel+0x8b>
    a728:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a72b:	8b 40 04             	mov    0x4(%eax),%eax
    a72e:	89 45 cc             	mov    %eax,-0x34(%ebp)
    a731:	c7 45 d0 00 00 20 00 	movl   $0x200000,-0x30(%ebp)
    a738:	a1 a0 90 00 00       	mov    0x90a0,%eax
    a73d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a740:	8b 45 cc             	mov    -0x34(%ebp),%eax
    a743:	a3 00 00 10 00       	mov    %eax,0x100000
    a748:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a74b:	a3 04 00 10 00       	mov    %eax,0x100004
    a750:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a753:	a3 08 00 10 00       	mov    %eax,0x100008
    a758:	90                   	nop
    a759:	83 c4 3c             	add    $0x3c,%esp
    a75c:	5b                   	pop    %ebx
    a75d:	5e                   	pop    %esi
    a75e:	5f                   	pop    %edi
    a75f:	5d                   	pop    %ebp
    a760:	c3                   	ret    
    a761:	66 90                	xchg   %ax,%ax
    a763:	90                   	nop

0000a764 <irq00_handler>:
    a764:	55                   	push   %ebp
    a765:	89 e5                	mov    %esp,%ebp
    a767:	53                   	push   %ebx
    a768:	50                   	push   %eax
    a769:	53                   	push   %ebx
    a76a:	b8 01 00 00 00       	mov    $0x1,%eax
    a76f:	89 c3                	mov    %eax,%ebx
    a771:	e4 21                	in     $0x21,%al
    a773:	08 d8                	or     %bl,%al
    a775:	e6 21                	out    %al,$0x21
    a777:	b0 20                	mov    $0x20,%al
    a779:	e6 20                	out    %al,$0x20
    a77b:	fb                   	sti    
    a77c:	a1 e0 db 00 00       	mov    0xdbe0,%eax
    a781:	ba 00 00 00 00       	mov    $0x0,%edx
    a786:	89 d3                	mov    %edx,%ebx
    a788:	53                   	push   %ebx
    a789:	ff d0                	call   *%eax
    a78b:	5b                   	pop    %ebx
    a78c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    a791:	89 c3                	mov    %eax,%ebx
    a793:	fa                   	cli    
    a794:	e4 21                	in     $0x21,%al
    a796:	20 d8                	and    %bl,%al
    a798:	e6 21                	out    %al,$0x21
    a79a:	5b                   	pop    %ebx
    a79b:	58                   	pop    %eax
    a79c:	5b                   	pop    %ebx
    a79d:	5d                   	pop    %ebp
    a79e:	fb                   	sti    
    a79f:	cf                   	iret   
    a7a0:	5b                   	pop    %ebx
    a7a1:	5d                   	pop    %ebp
    a7a2:	c3                   	ret    

0000a7a3 <irq14_handler>:
    a7a3:	55                   	push   %ebp
    a7a4:	89 e5                	mov    %esp,%ebp
    a7a6:	53                   	push   %ebx
    a7a7:	50                   	push   %eax
    a7a8:	53                   	push   %ebx
    a7a9:	b8 00 40 00 00       	mov    $0x4000,%eax
    a7ae:	89 c3                	mov    %eax,%ebx
    a7b0:	e4 21                	in     $0x21,%al
    a7b2:	08 d8                	or     %bl,%al
    a7b4:	e6 21                	out    %al,$0x21
    a7b6:	b0 20                	mov    $0x20,%al
    a7b8:	e6 20                	out    %al,$0x20
    a7ba:	fb                   	sti    
    a7bb:	a1 18 dc 00 00       	mov    0xdc18,%eax
    a7c0:	ba 0e 00 00 00       	mov    $0xe,%edx
    a7c5:	89 d3                	mov    %edx,%ebx
    a7c7:	53                   	push   %ebx
    a7c8:	ff d0                	call   *%eax
    a7ca:	5b                   	pop    %ebx
    a7cb:	b8 ff bf ff ff       	mov    $0xffffbfff,%eax
    a7d0:	89 c3                	mov    %eax,%ebx
    a7d2:	fa                   	cli    
    a7d3:	e4 21                	in     $0x21,%al
    a7d5:	20 d8                	and    %bl,%al
    a7d7:	e6 21                	out    %al,$0x21
    a7d9:	5b                   	pop    %ebx
    a7da:	58                   	pop    %eax
    a7db:	5b                   	pop    %ebx
    a7dc:	5d                   	pop    %ebp
    a7dd:	fb                   	sti    
    a7de:	cf                   	iret   
    a7df:	5b                   	pop    %ebx
    a7e0:	5d                   	pop    %ebp
    a7e1:	c3                   	ret    
