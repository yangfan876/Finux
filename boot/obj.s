
loader:     file format elf32-i386


Disassembly of section .text:

00009000 <loader_start>:
    9000:	8c c8                	mov    %cs,%eax
    9002:	8e d8                	mov    %eax,%ds
    9004:	8e c0                	mov    %eax,%es
    9006:	e8 26 00 0f 01       	call   10f9031 <_end+0x10ec2d1>
    900b:	16                   	push   %ss
    900c:	fa                   	cli    
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
    9067:	e8 03 00 eb fe       	call   feeb906f <_end+0xfeeac30f>

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
    908d:	72 79                	jb     9108 <Cstart+0x8>
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
    90b0:	66 b8 18 00          	mov    $0x18,%ax
    90b4:	8e e8                	mov    %eax,%gs
    90b6:	bc ff 7b 00 00       	mov    $0x7bff,%esp
    90bb:	e9 40 00 00 00       	jmp    9100 <Cstart>

000090c0 <JMP_TO_REAL>:
    90c0:	66 31 c0             	xor    %ax,%ax
    90c3:	8e d8                	mov    %eax,%ds
    90c5:	8e c0                	mov    %eax,%es
    90c7:	8e e0                	mov    %eax,%fs
    90c9:	8e e8                	mov    %eax,%gs
    90cb:	0f 20 c0             	mov    %cr0,%eax
    90ce:	24 fe                	and    $0xfe,%al
    90d0:	0f 22 c0             	mov    %eax,%cr0
    90d3:	ea 23 90 00 00 00 00 	ljmp   $0x0,$0x9023

000090da <GDT>:
	...
    90e2:	ff                   	(bad)  
    90e3:	ff 00                	incl   (%eax)
    90e5:	00 00                	add    %al,(%eax)
    90e7:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    90ee:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    90f4:	00 80 0b 93 00 00    	add    %al,0x930b(%eax)

000090fa <GDTPTR>:
    90fa:	1f                   	pop    %ds
    90fb:	00 da                	add    %bl,%dl
    90fd:	90                   	nop
	...

00009100 <Cstart>:
    9100:	55                   	push   %ebp
    9101:	89 e5                	mov    %esp,%ebp
    9103:	83 ec 18             	sub    $0x18,%esp
    9106:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    910d:	00 
    910e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9115:	00 
    9116:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    911d:	00 
    911e:	c7 04 24 80 a3 00 00 	movl   $0xa380,(%esp)
    9125:	e8 ba 00 00 00       	call   91e4 <dis_str>
    912a:	e8 54 02 00 00       	call   9383 <Init_8259A>
    912f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9136:	00 
    9137:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    913e:	00 
    913f:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9146:	00 
    9147:	c7 04 24 95 a3 00 00 	movl   $0xa395,(%esp)
    914e:	e8 91 00 00 00       	call   91e4 <dis_str>
    9153:	e8 50 04 00 00       	call   95a8 <init_idt>
    9158:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    915f:	00 
    9160:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    9167:	00 
    9168:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    916f:	00 
    9170:	c7 04 24 a8 a3 00 00 	movl   $0xa3a8,(%esp)
    9177:	e8 68 00 00 00       	call   91e4 <dis_str>
    917c:	e8 30 09 00 00       	call   9ab1 <init_timer>
    9181:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9188:	00 
    9189:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    9190:	00 
    9191:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    9198:	00 
    9199:	c7 04 24 bd a3 00 00 	movl   $0xa3bd,(%esp)
    91a0:	e8 3f 00 00 00       	call   91e4 <dis_str>
    91a5:	e8 9a 08 00 00       	call   9a44 <init_hd>
    91aa:	e8 7d 06 00 00       	call   982c <hd_identify>
    91af:	e8 d0 09 00 00       	call   9b84 <get_part_information>
    91b4:	e8 bb 0c 00 00       	call   9e74 <make_fs>
    91b9:	85 c0                	test   %eax,%eax
    91bb:	74 24                	je     91e1 <Cstart+0xe1>
    91bd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    91c4:	00 
    91c5:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    91cc:	00 
    91cd:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    91d4:	00 
    91d5:	c7 04 24 d0 a3 00 00 	movl   $0xa3d0,(%esp)
    91dc:	e8 03 00 00 00       	call   91e4 <dis_str>
    91e1:	eb fe                	jmp    91e1 <Cstart+0xe1>
    91e3:	90                   	nop

000091e4 <dis_str>:
    91e4:	55                   	push   %ebp
    91e5:	89 e5                	mov    %esp,%ebp
    91e7:	57                   	push   %edi
    91e8:	53                   	push   %ebx
    91e9:	83 ec 30             	sub    $0x30,%esp
    91ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    91ef:	88 45 d4             	mov    %al,-0x2c(%ebp)
    91f2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    91f9:	8b 55 10             	mov    0x10(%ebp),%edx
    91fc:	89 d0                	mov    %edx,%eax
    91fe:	c1 e0 02             	shl    $0x2,%eax
    9201:	01 d0                	add    %edx,%eax
    9203:	c1 e0 04             	shl    $0x4,%eax
    9206:	89 c2                	mov    %eax,%edx
    9208:	8b 45 14             	mov    0x14(%ebp),%eax
    920b:	01 d0                	add    %edx,%eax
    920d:	01 c0                	add    %eax,%eax
    920f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9212:	8b 45 08             	mov    0x8(%ebp),%eax
    9215:	89 45 ec             	mov    %eax,-0x14(%ebp)
    9218:	8b 45 08             	mov    0x8(%ebp),%eax
    921b:	89 04 24             	mov    %eax,(%esp)
    921e:	e8 fe 08 00 00       	call   9b21 <strlen>
    9223:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9226:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    922d:	eb 2e                	jmp    925d <dis_str+0x79>
    922f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9232:	8d 50 01             	lea    0x1(%eax),%edx
    9235:	89 55 ec             	mov    %edx,-0x14(%ebp)
    9238:	0f b6 00             	movzbl (%eax),%eax
    923b:	88 45 e7             	mov    %al,-0x19(%ebp)
    923e:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
    9242:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
    9246:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9249:	89 d3                	mov    %edx,%ebx
    924b:	89 cf                	mov    %ecx,%edi
    924d:	88 c4                	mov    %al,%ah
    924f:	88 d8                	mov    %bl,%al
    9251:	65 66 89 07          	mov    %ax,%gs:(%edi)
    9255:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    9259:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    925d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9260:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9263:	7c ca                	jl     922f <dis_str+0x4b>
    9265:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9268:	83 c4 30             	add    $0x30,%esp
    926b:	5b                   	pop    %ebx
    926c:	5f                   	pop    %edi
    926d:	5d                   	pop    %ebp
    926e:	c3                   	ret    

0000926f <dis_nchar>:
    926f:	55                   	push   %ebp
    9270:	89 e5                	mov    %esp,%ebp
    9272:	57                   	push   %edi
    9273:	53                   	push   %ebx
    9274:	83 ec 14             	sub    $0x14,%esp
    9277:	8b 45 0c             	mov    0xc(%ebp),%eax
    927a:	88 45 e4             	mov    %al,-0x1c(%ebp)
    927d:	8b 55 14             	mov    0x14(%ebp),%edx
    9280:	89 d0                	mov    %edx,%eax
    9282:	c1 e0 02             	shl    $0x2,%eax
    9285:	01 d0                	add    %edx,%eax
    9287:	c1 e0 04             	shl    $0x4,%eax
    928a:	89 c2                	mov    %eax,%edx
    928c:	8b 45 18             	mov    0x18(%ebp),%eax
    928f:	01 d0                	add    %edx,%eax
    9291:	01 c0                	add    %eax,%eax
    9293:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9296:	8b 45 08             	mov    0x8(%ebp),%eax
    9299:	89 45 ec             	mov    %eax,-0x14(%ebp)
    929c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    92a3:	eb 2e                	jmp    92d3 <dis_nchar+0x64>
    92a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92a8:	8d 50 01             	lea    0x1(%eax),%edx
    92ab:	89 55 ec             	mov    %edx,-0x14(%ebp)
    92ae:	0f b6 00             	movzbl (%eax),%eax
    92b1:	88 45 eb             	mov    %al,-0x15(%ebp)
    92b4:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    92b8:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    92bc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    92bf:	89 d3                	mov    %edx,%ebx
    92c1:	89 cf                	mov    %ecx,%edi
    92c3:	88 c4                	mov    %al,%ah
    92c5:	88 d8                	mov    %bl,%al
    92c7:	65 66 89 07          	mov    %ax,%gs:(%edi)
    92cb:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
    92cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    92d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92d6:	3b 45 10             	cmp    0x10(%ebp),%eax
    92d9:	7c ca                	jl     92a5 <dis_nchar+0x36>
    92db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92de:	83 c4 14             	add    $0x14,%esp
    92e1:	5b                   	pop    %ebx
    92e2:	5f                   	pop    %edi
    92e3:	5d                   	pop    %ebp
    92e4:	c3                   	ret    
    92e5:	66 90                	xchg   %ax,%ax
    92e7:	90                   	nop

000092e8 <outb>:
    92e8:	55                   	push   %ebp
    92e9:	89 e5                	mov    %esp,%ebp
    92eb:	83 ec 08             	sub    $0x8,%esp
    92ee:	8b 55 08             	mov    0x8(%ebp),%edx
    92f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    92f4:	88 55 fc             	mov    %dl,-0x4(%ebp)
    92f7:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    92fb:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    92ff:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    9303:	ee                   	out    %al,(%dx)
    9304:	c9                   	leave  
    9305:	c3                   	ret    

00009306 <inb>:
    9306:	55                   	push   %ebp
    9307:	89 e5                	mov    %esp,%ebp
    9309:	83 ec 14             	sub    $0x14,%esp
    930c:	8b 45 08             	mov    0x8(%ebp),%eax
    930f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    9313:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    9317:	89 c2                	mov    %eax,%edx
    9319:	ec                   	in     (%dx),%al
    931a:	88 45 ff             	mov    %al,-0x1(%ebp)
    931d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9321:	c9                   	leave  
    9322:	c3                   	ret    

00009323 <io_delay>:
    9323:	55                   	push   %ebp
    9324:	89 e5                	mov    %esp,%ebp
    9326:	83 ec 10             	sub    $0x10,%esp
    9329:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    932f:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    9333:	89 c2                	mov    %eax,%edx
    9335:	ee                   	out    %al,(%dx)
    9336:	c9                   	leave  
    9337:	c3                   	ret    

00009338 <outb_pic>:
    9338:	55                   	push   %ebp
    9339:	89 e5                	mov    %esp,%ebp
    933b:	83 ec 0c             	sub    $0xc,%esp
    933e:	8b 45 08             	mov    0x8(%ebp),%eax
    9341:	88 45 fc             	mov    %al,-0x4(%ebp)
    9344:	8b 45 0c             	mov    0xc(%ebp),%eax
    9347:	0f b7 d0             	movzwl %ax,%edx
    934a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    934e:	89 54 24 04          	mov    %edx,0x4(%esp)
    9352:	89 04 24             	mov    %eax,(%esp)
    9355:	e8 8e ff ff ff       	call   92e8 <outb>
    935a:	e8 c4 ff ff ff       	call   9323 <io_delay>
    935f:	c9                   	leave  
    9360:	c3                   	ret    

00009361 <inb_pic>:
    9361:	55                   	push   %ebp
    9362:	89 e5                	mov    %esp,%ebp
    9364:	83 ec 14             	sub    $0x14,%esp
    9367:	8b 45 08             	mov    0x8(%ebp),%eax
    936a:	0f b7 c0             	movzwl %ax,%eax
    936d:	89 04 24             	mov    %eax,(%esp)
    9370:	e8 91 ff ff ff       	call   9306 <inb>
    9375:	88 45 ff             	mov    %al,-0x1(%ebp)
    9378:	e8 a6 ff ff ff       	call   9323 <io_delay>
    937d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9381:	c9                   	leave  
    9382:	c3                   	ret    

00009383 <Init_8259A>:
    9383:	55                   	push   %ebp
    9384:	89 e5                	mov    %esp,%ebp
    9386:	83 ec 08             	sub    $0x8,%esp
    9389:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9390:	00 
    9391:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    9398:	e8 9b ff ff ff       	call   9338 <outb_pic>
    939d:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    93a4:	00 
    93a5:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
    93ac:	e8 87 ff ff ff       	call   9338 <outb_pic>
    93b1:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    93b8:	00 
    93b9:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    93c0:	e8 73 ff ff ff       	call   9338 <outb_pic>
    93c5:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    93cc:	00 
    93cd:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
    93d4:	e8 5f ff ff ff       	call   9338 <outb_pic>
    93d9:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    93e0:	00 
    93e1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    93e8:	e8 4b ff ff ff       	call   9338 <outb_pic>
    93ed:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    93f4:	00 
    93f5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    93fc:	e8 37 ff ff ff       	call   9338 <outb_pic>
    9401:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9408:	00 
    9409:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    9410:	e8 23 ff ff ff       	call   9338 <outb_pic>
    9415:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    941c:	00 
    941d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    9424:	e8 0f ff ff ff       	call   9338 <outb_pic>
    9429:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    9430:	00 
    9431:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    9438:	e8 fb fe ff ff       	call   9338 <outb_pic>
    943d:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    9444:	00 
    9445:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
    944c:	e8 e7 fe ff ff       	call   9338 <outb_pic>
    9451:	90                   	nop
    9452:	c9                   	leave  
    9453:	c3                   	ret    

00009454 <enable_irq>:
    9454:	55                   	push   %ebp
    9455:	89 e5                	mov    %esp,%ebp
    9457:	83 ec 18             	sub    $0x18,%esp
    945a:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
    945e:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
    9462:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
    9469:	e8 f3 fe ff ff       	call   9361 <inb_pic>
    946e:	88 45 fd             	mov    %al,-0x3(%ebp)
    9471:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
    9478:	e8 e4 fe ff ff       	call   9361 <inb_pic>
    947d:	88 45 fc             	mov    %al,-0x4(%ebp)
    9480:	fa                   	cli    
    9481:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
    9485:	7f 35                	jg     94bc <enable_irq+0x68>
    9487:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    948b:	74 2f                	je     94bc <enable_irq+0x68>
    948d:	8b 45 08             	mov    0x8(%ebp),%eax
    9490:	ba 01 00 00 00       	mov    $0x1,%edx
    9495:	89 c1                	mov    %eax,%ecx
    9497:	d3 e2                	shl    %cl,%edx
    9499:	89 d0                	mov    %edx,%eax
    949b:	f7 d0                	not    %eax
    949d:	89 c2                	mov    %eax,%edx
    949f:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    94a3:	21 d0                	and    %edx,%eax
    94a5:	88 45 ff             	mov    %al,-0x1(%ebp)
    94a8:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    94ac:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94b3:	00 
    94b4:	89 04 24             	mov    %eax,(%esp)
    94b7:	e8 7c fe ff ff       	call   9338 <outb_pic>
    94bc:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
    94c0:	7e 56                	jle    9518 <enable_irq+0xc4>
    94c2:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
    94c6:	7f 50                	jg     9518 <enable_irq+0xc4>
    94c8:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
    94cc:	83 e0 fb             	and    $0xfffffffb,%eax
    94cf:	88 45 ff             	mov    %al,-0x1(%ebp)
    94d2:	8b 45 08             	mov    0x8(%ebp),%eax
    94d5:	83 e8 08             	sub    $0x8,%eax
    94d8:	ba 01 00 00 00       	mov    $0x1,%edx
    94dd:	89 c1                	mov    %eax,%ecx
    94df:	d3 e2                	shl    %cl,%edx
    94e1:	89 d0                	mov    %edx,%eax
    94e3:	f7 d0                	not    %eax
    94e5:	89 c2                	mov    %eax,%edx
    94e7:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    94eb:	21 d0                	and    %edx,%eax
    94ed:	88 45 fe             	mov    %al,-0x2(%ebp)
    94f0:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    94f4:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
    94fb:	00 
    94fc:	89 04 24             	mov    %eax,(%esp)
    94ff:	e8 34 fe ff ff       	call   9338 <outb_pic>
    9504:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
    9508:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
    950f:	00 
    9510:	89 04 24             	mov    %eax,(%esp)
    9513:	e8 20 fe ff ff       	call   9338 <outb_pic>
    9518:	fb                   	sti    
    9519:	90                   	nop
    951a:	c9                   	leave  
    951b:	c3                   	ret    

0000951c <EOI_master>:
    951c:	55                   	push   %ebp
    951d:	89 e5                	mov    %esp,%ebp
    951f:	83 ec 08             	sub    $0x8,%esp
    9522:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9529:	00 
    952a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9531:	e8 02 fe ff ff       	call   9338 <outb_pic>
    9536:	fb                   	sti    
    9537:	c9                   	leave  
    9538:	c3                   	ret    

00009539 <EOI_slave>:
    9539:	55                   	push   %ebp
    953a:	89 e5                	mov    %esp,%ebp
    953c:	83 ec 08             	sub    $0x8,%esp
    953f:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    9546:	00 
    9547:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    954e:	e8 e5 fd ff ff       	call   9338 <outb_pic>
    9553:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
    955a:	00 
    955b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    9562:	e8 d1 fd ff ff       	call   9338 <outb_pic>
    9567:	fb                   	sti    
    9568:	c9                   	leave  
    9569:	c3                   	ret    
    956a:	66 90                	xchg   %ax,%ax

0000956c <set_gate>:
    956c:	55                   	push   %ebp
    956d:	89 e5                	mov    %esp,%ebp
    956f:	8b 45 18             	mov    0x18(%ebp),%eax
    9572:	c1 e0 10             	shl    $0x10,%eax
    9575:	89 c2                	mov    %eax,%edx
    9577:	8b 45 10             	mov    0x10(%ebp),%eax
    957a:	0f b7 c0             	movzwl %ax,%eax
    957d:	09 c2                	or     %eax,%edx
    957f:	8b 45 08             	mov    0x8(%ebp),%eax
    9582:	89 10                	mov    %edx,(%eax)
    9584:	8b 45 10             	mov    0x10(%ebp),%eax
    9587:	66 b8 00 00          	mov    $0x0,%ax
    958b:	89 c2                	mov    %eax,%edx
    958d:	8b 45 14             	mov    0x14(%ebp),%eax
    9590:	c1 e0 05             	shl    $0x5,%eax
    9593:	0b 45 0c             	or     0xc(%ebp),%eax
    9596:	0f b6 c0             	movzbl %al,%eax
    9599:	0c 80                	or     $0x80,%al
    959b:	c1 e0 08             	shl    $0x8,%eax
    959e:	09 c2                	or     %eax,%edx
    95a0:	8b 45 08             	mov    0x8(%ebp),%eax
    95a3:	89 50 04             	mov    %edx,0x4(%eax)
    95a6:	5d                   	pop    %ebp
    95a7:	c3                   	ret    

000095a8 <init_idt>:
    95a8:	55                   	push   %ebp
    95a9:	89 e5                	mov    %esp,%ebp
    95ab:	fa                   	cli    
    95ac:	0f 01 1d 00 c0 00 00 	lidtl  0xc000
    95b3:	90                   	nop
    95b4:	fb                   	sti    
    95b5:	90                   	nop
    95b6:	5d                   	pop    %ebp
    95b7:	c3                   	ret    

000095b8 <set_intr_gate>:
    95b8:	55                   	push   %ebp
    95b9:	89 e5                	mov    %esp,%ebp
    95bb:	83 ec 38             	sub    $0x38,%esp
    95be:	8b 45 08             	mov    0x8(%ebp),%eax
    95c1:	83 c0 30             	add    $0x30,%eax
    95c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    95c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95ca:	c1 e0 03             	shl    $0x3,%eax
    95cd:	8d 90 20 c0 00 00    	lea    0xc020(%eax),%edx
    95d3:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    95da:	00 
    95db:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    95e2:	00 
    95e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    95e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    95ea:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
    95f1:	00 
    95f2:	89 14 24             	mov    %edx,(%esp)
    95f5:	e8 72 ff ff ff       	call   956c <set_gate>
    95fa:	8b 45 08             	mov    0x8(%ebp),%eax
    95fd:	89 04 24             	mov    %eax,(%esp)
    9600:	e8 4f fe ff ff       	call   9454 <enable_irq>
    9605:	c9                   	leave  
    9606:	c3                   	ret    
    9607:	90                   	nop

00009608 <outb>:
    9608:	55                   	push   %ebp
    9609:	89 e5                	mov    %esp,%ebp
    960b:	83 ec 08             	sub    $0x8,%esp
    960e:	8b 55 08             	mov    0x8(%ebp),%edx
    9611:	8b 45 0c             	mov    0xc(%ebp),%eax
    9614:	88 55 fc             	mov    %dl,-0x4(%ebp)
    9617:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
    961b:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    961f:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
    9623:	ee                   	out    %al,(%dx)
    9624:	c9                   	leave  
    9625:	c3                   	ret    

00009626 <inb>:
    9626:	55                   	push   %ebp
    9627:	89 e5                	mov    %esp,%ebp
    9629:	83 ec 14             	sub    $0x14,%esp
    962c:	8b 45 08             	mov    0x8(%ebp),%eax
    962f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    9633:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
    9637:	89 c2                	mov    %eax,%edx
    9639:	ec                   	in     (%dx),%al
    963a:	88 45 ff             	mov    %al,-0x1(%ebp)
    963d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9641:	c9                   	leave  
    9642:	c3                   	ret    

00009643 <io_delay>:
    9643:	55                   	push   %ebp
    9644:	89 e5                	mov    %esp,%ebp
    9646:	83 ec 10             	sub    $0x10,%esp
    9649:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
    964f:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
    9653:	89 c2                	mov    %eax,%edx
    9655:	ee                   	out    %al,(%dx)
    9656:	c9                   	leave  
    9657:	c3                   	ret    

00009658 <inb_pic>:
    9658:	55                   	push   %ebp
    9659:	89 e5                	mov    %esp,%ebp
    965b:	83 ec 14             	sub    $0x14,%esp
    965e:	8b 45 08             	mov    0x8(%ebp),%eax
    9661:	0f b7 c0             	movzwl %ax,%eax
    9664:	89 04 24             	mov    %eax,(%esp)
    9667:	e8 ba ff ff ff       	call   9626 <inb>
    966c:	88 45 ff             	mov    %al,-0x1(%ebp)
    966f:	e8 cf ff ff ff       	call   9643 <io_delay>
    9674:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9678:	c9                   	leave  
    9679:	c3                   	ret    

0000967a <outb_pic>:
    967a:	55                   	push   %ebp
    967b:	89 e5                	mov    %esp,%ebp
    967d:	83 ec 0c             	sub    $0xc,%esp
    9680:	8b 45 08             	mov    0x8(%ebp),%eax
    9683:	88 45 fc             	mov    %al,-0x4(%ebp)
    9686:	8b 45 0c             	mov    0xc(%ebp),%eax
    9689:	0f b7 d0             	movzwl %ax,%edx
    968c:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
    9690:	89 54 24 04          	mov    %edx,0x4(%esp)
    9694:	89 04 24             	mov    %eax,(%esp)
    9697:	e8 6c ff ff ff       	call   9608 <outb>
    969c:	e8 a2 ff ff ff       	call   9643 <io_delay>
    96a1:	c9                   	leave  
    96a2:	c3                   	ret    

000096a3 <port_read>:
    96a3:	55                   	push   %ebp
    96a4:	89 e5                	mov    %esp,%ebp
    96a6:	57                   	push   %edi
    96a7:	53                   	push   %ebx
    96a8:	83 ec 04             	sub    $0x4,%esp
    96ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    96ae:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    96b2:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    96b6:	8b 5d 08             	mov    0x8(%ebp),%ebx
    96b9:	8b 4d 10             	mov    0x10(%ebp),%ecx
    96bc:	89 c2                	mov    %eax,%edx
    96be:	89 df                	mov    %ebx,%edi
    96c0:	fc                   	cld    
    96c1:	d1 e9                	shr    %ecx
    96c3:	66 f3 6d             	rep insw (%dx),%es:(%edi)
    96c6:	83 c4 04             	add    $0x4,%esp
    96c9:	5b                   	pop    %ebx
    96ca:	5f                   	pop    %edi
    96cb:	5d                   	pop    %ebp
    96cc:	c3                   	ret    

000096cd <port_write>:
    96cd:	55                   	push   %ebp
    96ce:	89 e5                	mov    %esp,%ebp
    96d0:	56                   	push   %esi
    96d1:	53                   	push   %ebx
    96d2:	83 ec 04             	sub    $0x4,%esp
    96d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    96d8:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    96dc:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
    96e0:	8b 5d 08             	mov    0x8(%ebp),%ebx
    96e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    96e6:	89 c2                	mov    %eax,%edx
    96e8:	89 de                	mov    %ebx,%esi
    96ea:	fc                   	cld    
    96eb:	d1 e9                	shr    %ecx
    96ed:	66 f3 6f             	rep outsw %ds:(%esi),(%dx)
    96f0:	83 c4 04             	add    $0x4,%esp
    96f3:	5b                   	pop    %ebx
    96f4:	5e                   	pop    %esi
    96f5:	5d                   	pop    %ebp
    96f6:	c3                   	ret    

000096f7 <hd_cmd_out>:
    96f7:	55                   	push   %ebp
    96f8:	89 e5                	mov    %esp,%ebp
    96fa:	83 ec 08             	sub    $0x8,%esp
    96fd:	90                   	nop
    96fe:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    9705:	e8 4e ff ff ff       	call   9658 <inb_pic>
    970a:	84 c0                	test   %al,%al
    970c:	78 f0                	js     96fe <hd_cmd_out+0x7>
    970e:	c7 44 24 04 f6 03 00 	movl   $0x3f6,0x4(%esp)
    9715:	00 
    9716:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    971d:	e8 58 ff ff ff       	call   967a <outb_pic>
    9722:	8b 45 08             	mov    0x8(%ebp),%eax
    9725:	0f b6 00             	movzbl (%eax),%eax
    9728:	0f b6 c0             	movzbl %al,%eax
    972b:	c7 44 24 04 f1 01 00 	movl   $0x1f1,0x4(%esp)
    9732:	00 
    9733:	89 04 24             	mov    %eax,(%esp)
    9736:	e8 3f ff ff ff       	call   967a <outb_pic>
    973b:	8b 45 08             	mov    0x8(%ebp),%eax
    973e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    9742:	0f b6 c0             	movzbl %al,%eax
    9745:	c7 44 24 04 f2 01 00 	movl   $0x1f2,0x4(%esp)
    974c:	00 
    974d:	89 04 24             	mov    %eax,(%esp)
    9750:	e8 25 ff ff ff       	call   967a <outb_pic>
    9755:	8b 45 08             	mov    0x8(%ebp),%eax
    9758:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    975c:	0f b6 c0             	movzbl %al,%eax
    975f:	c7 44 24 04 f3 01 00 	movl   $0x1f3,0x4(%esp)
    9766:	00 
    9767:	89 04 24             	mov    %eax,(%esp)
    976a:	e8 0b ff ff ff       	call   967a <outb_pic>
    976f:	8b 45 08             	mov    0x8(%ebp),%eax
    9772:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    9776:	0f b6 c0             	movzbl %al,%eax
    9779:	c7 44 24 04 f4 01 00 	movl   $0x1f4,0x4(%esp)
    9780:	00 
    9781:	89 04 24             	mov    %eax,(%esp)
    9784:	e8 f1 fe ff ff       	call   967a <outb_pic>
    9789:	8b 45 08             	mov    0x8(%ebp),%eax
    978c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9790:	0f b6 c0             	movzbl %al,%eax
    9793:	c7 44 24 04 f5 01 00 	movl   $0x1f5,0x4(%esp)
    979a:	00 
    979b:	89 04 24             	mov    %eax,(%esp)
    979e:	e8 d7 fe ff ff       	call   967a <outb_pic>
    97a3:	8b 45 08             	mov    0x8(%ebp),%eax
    97a6:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    97aa:	0f b6 c0             	movzbl %al,%eax
    97ad:	c7 44 24 04 f6 01 00 	movl   $0x1f6,0x4(%esp)
    97b4:	00 
    97b5:	89 04 24             	mov    %eax,(%esp)
    97b8:	e8 bd fe ff ff       	call   967a <outb_pic>
    97bd:	8b 45 08             	mov    0x8(%ebp),%eax
    97c0:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    97c4:	0f b6 c0             	movzbl %al,%eax
    97c7:	c7 44 24 04 f7 01 00 	movl   $0x1f7,0x4(%esp)
    97ce:	00 
    97cf:	89 04 24             	mov    %eax,(%esp)
    97d2:	e8 a3 fe ff ff       	call   967a <outb_pic>
    97d7:	c9                   	leave  
    97d8:	c3                   	ret    

000097d9 <hd_handler>:
    97d9:	55                   	push   %ebp
    97da:	89 e5                	mov    %esp,%ebp
    97dc:	83 ec 18             	sub    $0x18,%esp
    97df:	a1 20 c8 00 00       	mov    0xc820,%eax
    97e4:	83 f8 30             	cmp    $0x30,%eax
    97e7:	74 30                	je     9819 <hd_handler+0x40>
    97e9:	3d ec 00 00 00       	cmp    $0xec,%eax
    97ee:	74 05                	je     97f5 <hd_handler+0x1c>
    97f0:	83 f8 20             	cmp    $0x20,%eax
    97f3:	75 25                	jne    981a <hd_handler+0x41>
    97f5:	8b 15 2c c8 00 00    	mov    0xc82c,%edx
    97fb:	a1 30 c8 00 00       	mov    0xc830,%eax
    9800:	0f b7 c0             	movzwl %ax,%eax
    9803:	89 54 24 08          	mov    %edx,0x8(%esp)
    9807:	89 44 24 04          	mov    %eax,0x4(%esp)
    980b:	c7 04 24 38 c8 00 00 	movl   $0xc838,(%esp)
    9812:	e8 8c fe ff ff       	call   96a3 <port_read>
    9817:	eb 01                	jmp    981a <hd_handler+0x41>
    9819:	90                   	nop
    981a:	c7 05 20 c8 00 00 00 	movl   $0x0,0xc820
    9821:	00 00 00 
    9824:	e8 10 fd ff ff       	call   9539 <EOI_slave>
    9829:	90                   	nop
    982a:	c9                   	leave  
    982b:	c3                   	ret    

0000982c <hd_identify>:
    982c:	55                   	push   %ebp
    982d:	89 e5                	mov    %esp,%ebp
    982f:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9835:	c6 85 f6 fd ff ff e0 	movb   $0xe0,-0x20a(%ebp)
    983c:	c6 85 f7 fd ff ff ec 	movb   $0xec,-0x209(%ebp)
    9843:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    9849:	a3 28 c8 00 00       	mov    %eax,0xc828
    984e:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    9855:	0f b6 c0             	movzbl %al,%eax
    9858:	a3 20 c8 00 00       	mov    %eax,0xc820
    985d:	c7 05 24 c8 00 00 a3 	movl   $0x96a3,0xc824
    9864:	96 00 00 
    9867:	c7 05 2c c8 00 00 00 	movl   $0x200,0xc82c
    986e:	02 00 00 
    9871:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9878:	01 00 00 
    987b:	c7 05 34 c8 00 00 01 	movl   $0x1,0xc834
    9882:	00 00 00 
    9885:	8d 85 f1 fd ff ff    	lea    -0x20f(%ebp),%eax
    988b:	89 04 24             	mov    %eax,(%esp)
    988e:	e8 64 fe ff ff       	call   96f7 <hd_cmd_out>
    9893:	90                   	nop
    9894:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    989a:	0f b6 85 f7 fd ff ff 	movzbl -0x209(%ebp),%eax
    98a1:	0f b6 c0             	movzbl %al,%eax
    98a4:	39 c2                	cmp    %eax,%edx
    98a6:	74 ec                	je     9894 <hd_identify+0x68>
    98a8:	a1 2c c8 00 00       	mov    0xc82c,%eax
    98ad:	89 44 24 08          	mov    %eax,0x8(%esp)
    98b1:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    98b8:	00 
    98b9:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
    98bf:	89 04 24             	mov    %eax,(%esp)
    98c2:	e8 1d 02 00 00       	call   9ae4 <memcpy>
    98c7:	90                   	nop
    98c8:	c9                   	leave  
    98c9:	c3                   	ret    

000098ca <hd_read>:
    98ca:	55                   	push   %ebp
    98cb:	89 e5                	mov    %esp,%ebp
    98cd:	83 ec 28             	sub    $0x28,%esp
    98d0:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    98d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    98d7:	88 45 f2             	mov    %al,-0xe(%ebp)
    98da:	8b 45 08             	mov    0x8(%ebp),%eax
    98dd:	88 45 f3             	mov    %al,-0xd(%ebp)
    98e0:	8b 45 08             	mov    0x8(%ebp),%eax
    98e3:	c1 e8 08             	shr    $0x8,%eax
    98e6:	88 45 f4             	mov    %al,-0xc(%ebp)
    98e9:	8b 45 08             	mov    0x8(%ebp),%eax
    98ec:	c1 e8 10             	shr    $0x10,%eax
    98ef:	88 45 f5             	mov    %al,-0xb(%ebp)
    98f2:	8b 45 08             	mov    0x8(%ebp),%eax
    98f5:	c1 e8 18             	shr    $0x18,%eax
    98f8:	83 e0 0f             	and    $0xf,%eax
    98fb:	83 c8 e0             	or     $0xffffffe0,%eax
    98fe:	88 45 f6             	mov    %al,-0xa(%ebp)
    9901:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
    9905:	8b 45 10             	mov    0x10(%ebp),%eax
    9908:	a3 28 c8 00 00       	mov    %eax,0xc828
    990d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    9911:	0f b6 c0             	movzbl %al,%eax
    9914:	a3 20 c8 00 00       	mov    %eax,0xc820
    9919:	c7 05 24 c8 00 00 a3 	movl   $0x96a3,0xc824
    9920:	96 00 00 
    9923:	8b 45 0c             	mov    0xc(%ebp),%eax
    9926:	a3 34 c8 00 00       	mov    %eax,0xc834
    992b:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    9932:	01 00 00 
    9935:	8b 45 0c             	mov    0xc(%ebp),%eax
    9938:	c1 e0 09             	shl    $0x9,%eax
    993b:	a3 2c c8 00 00       	mov    %eax,0xc82c
    9940:	8d 45 f1             	lea    -0xf(%ebp),%eax
    9943:	89 04 24             	mov    %eax,(%esp)
    9946:	e8 ac fd ff ff       	call   96f7 <hd_cmd_out>
    994b:	90                   	nop
    994c:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9952:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    9956:	0f b6 c0             	movzbl %al,%eax
    9959:	39 c2                	cmp    %eax,%edx
    995b:	74 ef                	je     994c <hd_read+0x82>
    995d:	a1 2c c8 00 00       	mov    0xc82c,%eax
    9962:	89 44 24 08          	mov    %eax,0x8(%esp)
    9966:	c7 44 24 04 38 c8 00 	movl   $0xc838,0x4(%esp)
    996d:	00 
    996e:	8b 45 10             	mov    0x10(%ebp),%eax
    9971:	89 04 24             	mov    %eax,(%esp)
    9974:	e8 6b 01 00 00       	call   9ae4 <memcpy>
    9979:	90                   	nop
    997a:	c9                   	leave  
    997b:	c3                   	ret    

0000997c <hd_write>:
    997c:	55                   	push   %ebp
    997d:	89 e5                	mov    %esp,%ebp
    997f:	83 ec 1c             	sub    $0x1c,%esp
    9982:	c6 45 f9 00          	movb   $0x0,-0x7(%ebp)
    9986:	8b 45 0c             	mov    0xc(%ebp),%eax
    9989:	88 45 fa             	mov    %al,-0x6(%ebp)
    998c:	8b 45 08             	mov    0x8(%ebp),%eax
    998f:	88 45 fb             	mov    %al,-0x5(%ebp)
    9992:	8b 45 08             	mov    0x8(%ebp),%eax
    9995:	c1 e8 08             	shr    $0x8,%eax
    9998:	88 45 fc             	mov    %al,-0x4(%ebp)
    999b:	8b 45 08             	mov    0x8(%ebp),%eax
    999e:	c1 e8 10             	shr    $0x10,%eax
    99a1:	88 45 fd             	mov    %al,-0x3(%ebp)
    99a4:	8b 45 08             	mov    0x8(%ebp),%eax
    99a7:	c1 e8 18             	shr    $0x18,%eax
    99aa:	83 e0 0f             	and    $0xf,%eax
    99ad:	83 c8 e0             	or     $0xffffffe0,%eax
    99b0:	88 45 fe             	mov    %al,-0x2(%ebp)
    99b3:	c6 45 ff 30          	movb   $0x30,-0x1(%ebp)
    99b7:	8b 45 10             	mov    0x10(%ebp),%eax
    99ba:	a3 28 c8 00 00       	mov    %eax,0xc828
    99bf:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    99c3:	0f b6 c0             	movzbl %al,%eax
    99c6:	a3 20 c8 00 00       	mov    %eax,0xc820
    99cb:	c7 05 24 c8 00 00 cd 	movl   $0x96cd,0xc824
    99d2:	96 00 00 
    99d5:	c7 05 30 c8 00 00 f0 	movl   $0x1f0,0xc830
    99dc:	01 00 00 
    99df:	8b 45 0c             	mov    0xc(%ebp),%eax
    99e2:	c1 e0 09             	shl    $0x9,%eax
    99e5:	a3 2c c8 00 00       	mov    %eax,0xc82c
    99ea:	8d 45 f9             	lea    -0x7(%ebp),%eax
    99ed:	89 04 24             	mov    %eax,(%esp)
    99f0:	e8 02 fd ff ff       	call   96f7 <hd_cmd_out>
    99f5:	90                   	nop
    99f6:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
    99fd:	e8 56 fc ff ff       	call   9658 <inb_pic>
    9a02:	0f b6 c0             	movzbl %al,%eax
    9a05:	83 e0 08             	and    $0x8,%eax
    9a08:	85 c0                	test   %eax,%eax
    9a0a:	74 ea                	je     99f6 <hd_write+0x7a>
    9a0c:	8b 0d 2c c8 00 00    	mov    0xc82c,%ecx
    9a12:	a1 30 c8 00 00       	mov    0xc830,%eax
    9a17:	0f b7 d0             	movzwl %ax,%edx
    9a1a:	a1 28 c8 00 00       	mov    0xc828,%eax
    9a1f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    9a23:	89 54 24 04          	mov    %edx,0x4(%esp)
    9a27:	89 04 24             	mov    %eax,(%esp)
    9a2a:	e8 9e fc ff ff       	call   96cd <port_write>
    9a2f:	90                   	nop
    9a30:	8b 15 20 c8 00 00    	mov    0xc820,%edx
    9a36:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
    9a3a:	0f b6 c0             	movzbl %al,%eax
    9a3d:	39 c2                	cmp    %eax,%edx
    9a3f:	74 ef                	je     9a30 <hd_write+0xb4>
    9a41:	90                   	nop
    9a42:	c9                   	leave  
    9a43:	c3                   	ret    

00009a44 <init_hd>:
    9a44:	55                   	push   %ebp
    9a45:	89 e5                	mov    %esp,%ebp
    9a47:	83 ec 18             	sub    $0x18,%esp
    9a4a:	c7 05 58 cd 00 00 d9 	movl   $0x97d9,0xcd58
    9a51:	97 00 00 
    9a54:	c7 44 24 04 3f a3 00 	movl   $0xa33f,0x4(%esp)
    9a5b:	00 
    9a5c:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9a63:	e8 50 fb ff ff       	call   95b8 <set_intr_gate>
    9a68:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    9a6f:	e8 e0 f9 ff ff       	call   9454 <enable_irq>
    9a74:	c9                   	leave  
    9a75:	c3                   	ret    
    9a76:	66 90                	xchg   %ax,%ax

00009a78 <timer_handler>:
    9a78:	55                   	push   %ebp
    9a79:	89 e5                	mov    %esp,%ebp
    9a7b:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9a82:	3c 7a                	cmp    $0x7a,%al
    9a84:	75 07                	jne    9a8d <timer_handler+0x15>
    9a86:	c6 05 08 c0 00 00 41 	movb   $0x41,0xc008
    9a8d:	b4 0c                	mov    $0xc,%ah
    9a8f:	a0 08 c0 00 00       	mov    0xc008,%al
    9a94:	65 66 a3 00 0f 00 00 	mov    %ax,%gs:0xf00
    9a9b:	b0 20                	mov    $0x20,%al
    9a9d:	e6 20                	out    %al,$0x20
    9a9f:	0f b6 05 08 c0 00 00 	movzbl 0xc008,%eax
    9aa6:	83 c0 01             	add    $0x1,%eax
    9aa9:	a2 08 c0 00 00       	mov    %al,0xc008
    9aae:	90                   	nop
    9aaf:	5d                   	pop    %ebp
    9ab0:	c3                   	ret    

00009ab1 <init_timer>:
    9ab1:	55                   	push   %ebp
    9ab2:	89 e5                	mov    %esp,%ebp
    9ab4:	83 ec 18             	sub    $0x18,%esp
    9ab7:	c7 05 20 cd 00 00 78 	movl   $0x9a78,0xcd20
    9abe:	9a 00 00 
    9ac1:	c7 44 24 04 00 a3 00 	movl   $0xa300,0x4(%esp)
    9ac8:	00 
    9ac9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9ad0:	e8 e3 fa ff ff       	call   95b8 <set_intr_gate>
    9ad5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9adc:	e8 73 f9 ff ff       	call   9454 <enable_irq>
    9ae1:	c9                   	leave  
    9ae2:	c3                   	ret    
    9ae3:	90                   	nop

00009ae4 <memcpy>:
    9ae4:	55                   	push   %ebp
    9ae5:	89 e5                	mov    %esp,%ebp
    9ae7:	83 ec 10             	sub    $0x10,%esp
    9aea:	8b 45 08             	mov    0x8(%ebp),%eax
    9aed:	89 45 fc             	mov    %eax,-0x4(%ebp)
    9af0:	8b 45 0c             	mov    0xc(%ebp),%eax
    9af3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9af6:	eb 17                	jmp    9b0f <memcpy+0x2b>
    9af8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9afb:	8d 50 01             	lea    0x1(%eax),%edx
    9afe:	89 55 fc             	mov    %edx,-0x4(%ebp)
    9b01:	8b 55 f8             	mov    -0x8(%ebp),%edx
    9b04:	8d 4a 01             	lea    0x1(%edx),%ecx
    9b07:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    9b0a:	0f b6 12             	movzbl (%edx),%edx
    9b0d:	88 10                	mov    %dl,(%eax)
    9b0f:	8b 45 10             	mov    0x10(%ebp),%eax
    9b12:	8d 50 ff             	lea    -0x1(%eax),%edx
    9b15:	89 55 10             	mov    %edx,0x10(%ebp)
    9b18:	85 c0                	test   %eax,%eax
    9b1a:	75 dc                	jne    9af8 <memcpy+0x14>
    9b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    9b1f:	c9                   	leave  
    9b20:	c3                   	ret    

00009b21 <strlen>:
    9b21:	55                   	push   %ebp
    9b22:	89 e5                	mov    %esp,%ebp
    9b24:	83 ec 10             	sub    $0x10,%esp
    9b27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9b2e:	8b 45 08             	mov    0x8(%ebp),%eax
    9b31:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9b34:	eb 08                	jmp    9b3e <strlen+0x1d>
    9b36:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    9b3a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9b3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9b41:	0f b6 00             	movzbl (%eax),%eax
    9b44:	84 c0                	test   %al,%al
    9b46:	75 ee                	jne    9b36 <strlen+0x15>
    9b48:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9b4b:	c9                   	leave  
    9b4c:	c3                   	ret    

00009b4d <memset>:
    9b4d:	55                   	push   %ebp
    9b4e:	89 e5                	mov    %esp,%ebp
    9b50:	83 ec 10             	sub    $0x10,%esp
    9b53:	8b 45 08             	mov    0x8(%ebp),%eax
    9b56:	89 45 f8             	mov    %eax,-0x8(%ebp)
    9b59:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9b60:	eb 12                	jmp    9b74 <memset+0x27>
    9b62:	8b 45 f8             	mov    -0x8(%ebp),%eax
    9b65:	8d 50 01             	lea    0x1(%eax),%edx
    9b68:	89 55 f8             	mov    %edx,-0x8(%ebp)
    9b6b:	8b 55 0c             	mov    0xc(%ebp),%edx
    9b6e:	88 10                	mov    %dl,(%eax)
    9b70:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9b74:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9b77:	3b 45 10             	cmp    0x10(%ebp),%eax
    9b7a:	72 e6                	jb     9b62 <memset+0x15>
    9b7c:	8b 45 08             	mov    0x8(%ebp),%eax
    9b7f:	c9                   	leave  
    9b80:	c3                   	ret    
    9b81:	66 90                	xchg   %ax,%ax
    9b83:	90                   	nop

00009b84 <get_part_information>:
    9b84:	55                   	push   %ebp
    9b85:	89 e5                	mov    %esp,%ebp
    9b87:	81 ec 28 02 00 00    	sub    $0x228,%esp
    9b8d:	c7 45 f4 be 01 00 00 	movl   $0x1be,-0xc(%ebp)
    9b94:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9b9b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9ba2:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9ba8:	89 44 24 08          	mov    %eax,0x8(%esp)
    9bac:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9bb3:	00 
    9bb4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9bbb:	e8 0a fd ff ff       	call   98ca <hd_read>
    9bc0:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9bc9:	01 d0                	add    %edx,%eax
    9bcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9bce:	eb 74                	jmp    9c44 <get_part_information+0xc0>
    9bd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9bd3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9bd7:	3c 05                	cmp    $0x5,%al
    9bd9:	75 29                	jne    9c04 <get_part_information+0x80>
    9bdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9bde:	c1 e0 04             	shl    $0x4,%eax
    9be1:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9be7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9bea:	8b 08                	mov    (%eax),%ecx
    9bec:	89 0a                	mov    %ecx,(%edx)
    9bee:	8b 48 04             	mov    0x4(%eax),%ecx
    9bf1:	89 4a 04             	mov    %ecx,0x4(%edx)
    9bf4:	8b 48 08             	mov    0x8(%eax),%ecx
    9bf7:	89 4a 08             	mov    %ecx,0x8(%edx)
    9bfa:	8b 40 0c             	mov    0xc(%eax),%eax
    9bfd:	89 42 0c             	mov    %eax,0xc(%edx)
    9c00:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9c04:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c07:	c1 e0 04             	shl    $0x4,%eax
    9c0a:	8d 90 e0 cc 00 00    	lea    0xcce0(%eax),%edx
    9c10:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c13:	8b 08                	mov    (%eax),%ecx
    9c15:	89 0a                	mov    %ecx,(%edx)
    9c17:	8b 48 04             	mov    0x4(%eax),%ecx
    9c1a:	89 4a 04             	mov    %ecx,0x4(%edx)
    9c1d:	8b 48 08             	mov    0x8(%eax),%ecx
    9c20:	89 4a 08             	mov    %ecx,0x8(%edx)
    9c23:	8b 40 0c             	mov    0xc(%eax),%eax
    9c26:	89 42 0c             	mov    %eax,0xc(%edx)
    9c29:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c30:	83 c0 10             	add    $0x10,%eax
    9c33:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9c36:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c3f:	01 d0                	add    %edx,%eax
    9c41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9c44:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c47:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9c4b:	84 c0                	test   %al,%al
    9c4d:	74 0d                	je     9c5c <get_part_information+0xd8>
    9c4f:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    9c56:	0f 8e 74 ff ff ff    	jle    9bd0 <get_part_information+0x4c>
    9c5c:	c7 45 f0 40 cc 00 00 	movl   $0xcc40,-0x10(%ebp)
    9c63:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c66:	8b 40 08             	mov    0x8(%eax),%eax
    9c69:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    9c6f:	89 54 24 08          	mov    %edx,0x8(%esp)
    9c73:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9c7a:	00 
    9c7b:	89 04 24             	mov    %eax,(%esp)
    9c7e:	e8 47 fc ff ff       	call   98ca <hd_read>
    9c83:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9c89:	05 be 01 00 00       	add    $0x1be,%eax
    9c8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9c91:	e9 b2 00 00 00       	jmp    9d48 <get_part_information+0x1c4>
    9c96:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9c9c:	05 be 01 00 00       	add    $0x1be,%eax
    9ca1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9ca4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ca7:	c1 e0 04             	shl    $0x4,%eax
    9caa:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9cb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9cb3:	8b 08                	mov    (%eax),%ecx
    9cb5:	89 0a                	mov    %ecx,(%edx)
    9cb7:	8b 48 04             	mov    0x4(%eax),%ecx
    9cba:	89 4a 04             	mov    %ecx,0x4(%edx)
    9cbd:	8b 48 08             	mov    0x8(%eax),%ecx
    9cc0:	89 4a 08             	mov    %ecx,0x8(%edx)
    9cc3:	8b 40 0c             	mov    0xc(%eax),%eax
    9cc6:	89 42 0c             	mov    %eax,0xc(%edx)
    9cc9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9ccd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9cd3:	05 ce 01 00 00       	add    $0x1ce,%eax
    9cd8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9cdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9cde:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9ce2:	84 c0                	test   %al,%al
    9ce4:	74 60                	je     9d46 <get_part_information+0x1c2>
    9ce6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ce9:	c1 e0 04             	shl    $0x4,%eax
    9cec:	8d 90 40 cc 00 00    	lea    0xcc40(%eax),%edx
    9cf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9cf5:	8b 08                	mov    (%eax),%ecx
    9cf7:	89 0a                	mov    %ecx,(%edx)
    9cf9:	8b 48 04             	mov    0x4(%eax),%ecx
    9cfc:	89 4a 04             	mov    %ecx,0x4(%edx)
    9cff:	8b 48 08             	mov    0x8(%eax),%ecx
    9d02:	89 4a 08             	mov    %ecx,0x8(%edx)
    9d05:	8b 40 0c             	mov    0xc(%eax),%eax
    9d08:	89 42 0c             	mov    %eax,0xc(%edx)
    9d0b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d12:	8b 50 08             	mov    0x8(%eax),%edx
    9d15:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9d1a:	01 c2                	add    %eax,%edx
    9d1c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9d22:	89 44 24 08          	mov    %eax,0x8(%esp)
    9d26:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9d2d:	00 
    9d2e:	89 14 24             	mov    %edx,(%esp)
    9d31:	e8 94 fb ff ff       	call   98ca <hd_read>
    9d36:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    9d3c:	05 be 01 00 00       	add    $0x1be,%eax
    9d41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d44:	eb 02                	jmp    9d48 <get_part_information+0x1c4>
    9d46:	eb 0f                	jmp    9d57 <get_part_information+0x1d3>
    9d48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d4b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    9d4f:	84 c0                	test   %al,%al
    9d51:	0f 85 3f ff ff ff    	jne    9c96 <get_part_information+0x112>
    9d57:	c9                   	leave  
    9d58:	c3                   	ret    

00009d59 <set_sector_map>:
    9d59:	55                   	push   %ebp
    9d5a:	89 e5                	mov    %esp,%ebp
    9d5c:	56                   	push   %esi
    9d5d:	53                   	push   %ebx
    9d5e:	83 ec 20             	sub    $0x20,%esp
    9d61:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9d68:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d6f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9d76:	8b 45 08             	mov    0x8(%ebp),%eax
    9d79:	99                   	cltd   
    9d7a:	c1 ea 17             	shr    $0x17,%edx
    9d7d:	01 d0                	add    %edx,%eax
    9d7f:	25 ff 01 00 00       	and    $0x1ff,%eax
    9d84:	29 d0                	sub    %edx,%eax
    9d86:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9d89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d8c:	8d 50 07             	lea    0x7(%eax),%edx
    9d8f:	85 c0                	test   %eax,%eax
    9d91:	0f 48 c2             	cmovs  %edx,%eax
    9d94:	c1 f8 03             	sar    $0x3,%eax
    9d97:	89 45 f0             	mov    %eax,-0x10(%ebp)
    9d9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d9d:	99                   	cltd   
    9d9e:	c1 ea 1d             	shr    $0x1d,%edx
    9da1:	01 d0                	add    %edx,%eax
    9da3:	83 e0 07             	and    $0x7,%eax
    9da6:	29 d0                	sub    %edx,%eax
    9da8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    9dab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9dae:	8b 45 0c             	mov    0xc(%ebp),%eax
    9db1:	01 d0                	add    %edx,%eax
    9db3:	0f b6 00             	movzbl (%eax),%eax
    9db6:	0f b6 d0             	movzbl %al,%edx
    9db9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9dbc:	bb 01 00 00 00       	mov    $0x1,%ebx
    9dc1:	89 c1                	mov    %eax,%ecx
    9dc3:	d3 e3                	shl    %cl,%ebx
    9dc5:	89 d8                	mov    %ebx,%eax
    9dc7:	21 d0                	and    %edx,%eax
    9dc9:	3b 45 10             	cmp    0x10(%ebp),%eax
    9dcc:	75 0a                	jne    9dd8 <set_sector_map+0x7f>
    9dce:	b8 00 00 00 00       	mov    $0x0,%eax
    9dd3:	e9 95 00 00 00       	jmp    9e6d <set_sector_map+0x114>
    9dd8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    9ddc:	75 30                	jne    9e0e <set_sector_map+0xb5>
    9dde:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9de1:	8b 45 0c             	mov    0xc(%ebp),%eax
    9de4:	01 c2                	add    %eax,%edx
    9de6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9de9:	8b 45 0c             	mov    0xc(%ebp),%eax
    9dec:	01 c8                	add    %ecx,%eax
    9dee:	0f b6 00             	movzbl (%eax),%eax
    9df1:	89 c3                	mov    %eax,%ebx
    9df3:	b8 07 00 00 00       	mov    $0x7,%eax
    9df8:	2b 45 ec             	sub    -0x14(%ebp),%eax
    9dfb:	be 01 00 00 00       	mov    $0x1,%esi
    9e00:	89 c1                	mov    %eax,%ecx
    9e02:	d3 e6                	shl    %cl,%esi
    9e04:	89 f0                	mov    %esi,%eax
    9e06:	f7 d0                	not    %eax
    9e08:	21 d8                	and    %ebx,%eax
    9e0a:	88 02                	mov    %al,(%edx)
    9e0c:	eb 5a                	jmp    9e68 <set_sector_map+0x10f>
    9e0e:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    9e12:	75 2e                	jne    9e42 <set_sector_map+0xe9>
    9e14:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e17:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e1a:	01 c2                	add    %eax,%edx
    9e1c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9e1f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e22:	01 c8                	add    %ecx,%eax
    9e24:	0f b6 00             	movzbl (%eax),%eax
    9e27:	89 c3                	mov    %eax,%ebx
    9e29:	b8 07 00 00 00       	mov    $0x7,%eax
    9e2e:	2b 45 ec             	sub    -0x14(%ebp),%eax
    9e31:	be 01 00 00 00       	mov    $0x1,%esi
    9e36:	89 c1                	mov    %eax,%ecx
    9e38:	d3 e6                	shl    %cl,%esi
    9e3a:	89 f0                	mov    %esi,%eax
    9e3c:	09 d8                	or     %ebx,%eax
    9e3e:	88 02                	mov    %al,(%edx)
    9e40:	eb 26                	jmp    9e68 <set_sector_map+0x10f>
    9e42:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9e49:	00 
    9e4a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9e51:	00 
    9e52:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    9e59:	00 
    9e5a:	c7 04 24 14 a4 00 00 	movl   $0xa414,(%esp)
    9e61:	e8 7e f3 ff ff       	call   91e4 <dis_str>
    9e66:	eb fe                	jmp    9e66 <set_sector_map+0x10d>
    9e68:	b8 01 00 00 00       	mov    $0x1,%eax
    9e6d:	83 c4 20             	add    $0x20,%esp
    9e70:	5b                   	pop    %ebx
    9e71:	5e                   	pop    %esi
    9e72:	5d                   	pop    %ebp
    9e73:	c3                   	ret    

00009e74 <make_fs>:
    9e74:	55                   	push   %ebp
    9e75:	89 e5                	mov    %esp,%ebp
    9e77:	81 ec 88 02 00 00    	sub    $0x288,%esp
    9e7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e84:	eb 26                	jmp    9eac <make_fs+0x38>
    9e86:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e89:	c1 e0 04             	shl    $0x4,%eax
    9e8c:	05 e4 cc 00 00       	add    $0xcce4,%eax
    9e91:	0f b6 00             	movzbl (%eax),%eax
    9e94:	3c 0d                	cmp    $0xd,%al
    9e96:	75 10                	jne    9ea8 <make_fs+0x34>
    9e98:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e9b:	c1 e0 04             	shl    $0x4,%eax
    9e9e:	05 e0 cc 00 00       	add    $0xcce0,%eax
    9ea3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9ea6:	eb 0a                	jmp    9eb2 <make_fs+0x3e>
    9ea8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9eac:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9eb0:	7e d4                	jle    9e86 <make_fs+0x12>
    9eb2:	a1 48 cc 00 00       	mov    0xcc48,%eax
    9eb7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9eba:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    9ebe:	7e 78                	jle    9f38 <make_fs+0xc4>
    9ec0:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9ec7:	84 c0                	test   %al,%al
    9ec9:	74 6d                	je     9f38 <make_fs+0xc4>
    9ecb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9ed2:	eb 5e                	jmp    9f32 <make_fs+0xbe>
    9ed4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ed7:	c1 e0 04             	shl    $0x4,%eax
    9eda:	05 44 cc 00 00       	add    $0xcc44,%eax
    9edf:	0f b6 00             	movzbl (%eax),%eax
    9ee2:	3c 0d                	cmp    $0xd,%al
    9ee4:	75 48                	jne    9f2e <make_fs+0xba>
    9ee6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ee9:	c1 e0 04             	shl    $0x4,%eax
    9eec:	05 40 cc 00 00       	add    $0xcc40,%eax
    9ef1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9ef4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ef7:	83 e8 01             	sub    $0x1,%eax
    9efa:	c1 e0 04             	shl    $0x4,%eax
    9efd:	05 44 cc 00 00       	add    $0xcc44,%eax
    9f02:	0f b6 10             	movzbl (%eax),%edx
    9f05:	0f b6 05 44 cc 00 00 	movzbl 0xcc44,%eax
    9f0c:	38 c2                	cmp    %al,%dl
    9f0e:	75 1c                	jne    9f2c <make_fs+0xb8>
    9f10:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9f14:	74 16                	je     9f2c <make_fs+0xb8>
    9f16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f19:	83 e8 01             	sub    $0x1,%eax
    9f1c:	c1 e0 04             	shl    $0x4,%eax
    9f1f:	05 40 cc 00 00       	add    $0xcc40,%eax
    9f24:	8b 40 08             	mov    0x8(%eax),%eax
    9f27:	01 45 e8             	add    %eax,-0x18(%ebp)
    9f2a:	eb 0c                	jmp    9f38 <make_fs+0xc4>
    9f2c:	eb 0a                	jmp    9f38 <make_fs+0xc4>
    9f2e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f32:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f36:	7e 9c                	jle    9ed4 <make_fs+0x60>
    9f38:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    9f3c:	7e 26                	jle    9f64 <make_fs+0xf0>
    9f3e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    9f45:	00 
    9f46:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    9f4d:	00 
    9f4e:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    9f55:	00 
    9f56:	c7 04 24 38 a4 00 00 	movl   $0xa438,(%esp)
    9f5d:	e8 82 f2 ff ff       	call   91e4 <dis_str>
    9f62:	eb fe                	jmp    9f62 <make_fs+0xee>
    9f64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f67:	8b 40 08             	mov    0x8(%eax),%eax
    9f6a:	01 45 e8             	add    %eax,-0x18(%ebp)
    9f6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9f70:	8d 50 01             	lea    0x1(%eax),%edx
    9f73:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    9f79:	89 44 24 08          	mov    %eax,0x8(%esp)
    9f7d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    9f84:	00 
    9f85:	89 14 24             	mov    %edx,(%esp)
    9f88:	e8 3d f9 ff ff       	call   98ca <hd_read>
    9f8d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    9f93:	89 45 e0             	mov    %eax,-0x20(%ebp)
    9f96:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9f99:	8b 00                	mov    (%eax),%eax
    9f9b:	3d 8f 9a 08 00       	cmp    $0x89a8f,%eax
    9fa0:	75 0a                	jne    9fac <make_fs+0x138>
    9fa2:	b8 00 00 00 00       	mov    $0x0,%eax
    9fa7:	e9 51 03 00 00       	jmp    a2fd <make_fs+0x489>
    9fac:	c7 85 a4 fd ff ff 8f 	movl   $0x89a8f,-0x25c(%ebp)
    9fb3:	9a 08 00 
    9fb6:	c7 85 a8 fd ff ff 64 	movl   $0x64,-0x258(%ebp)
    9fbd:	00 00 00 
    9fc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fc3:	8b 40 0c             	mov    0xc(%eax),%eax
    9fc6:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
    9fcc:	c7 85 b0 fd ff ff 01 	movl   $0x1,-0x250(%ebp)
    9fd3:	00 00 00 
    9fd6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9fd9:	83 c0 02             	add    $0x2,%eax
    9fdc:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    9fe2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fe5:	8b 40 0c             	mov    0xc(%eax),%eax
    9fe8:	c1 e8 0c             	shr    $0xc,%eax
    9feb:	89 85 b8 fd ff ff    	mov    %eax,-0x248(%ebp)
    9ff1:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
    9ff7:	83 c0 01             	add    $0x1,%eax
    9ffa:	89 85 bc fd ff ff    	mov    %eax,-0x244(%ebp)
    a000:	8b 95 bc fd ff ff    	mov    -0x244(%ebp),%edx
    a006:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
    a00c:	01 d0                	add    %edx,%eax
    a00e:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%ebp)
    a014:	c7 85 c8 fd ff ff 03 	movl   $0x3,-0x238(%ebp)
    a01b:	00 00 00 
    a01e:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a024:	83 c0 01             	add    $0x1,%eax
    a027:	89 85 c8 fd ff ff    	mov    %eax,-0x238(%ebp)
    a02d:	c7 85 d8 fd ff ff 10 	movl   $0x10,-0x228(%ebp)
    a034:	00 00 00 
    a037:	c7 85 d0 fd ff ff 00 	movl   $0x0,-0x230(%ebp)
    a03e:	00 00 00 
    a041:	8b 95 c0 fd ff ff    	mov    -0x240(%ebp),%edx
    a047:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a04d:	01 d0                	add    %edx,%eax
    a04f:	89 85 cc fd ff ff    	mov    %eax,-0x234(%ebp)
    a055:	c7 85 d4 fd ff ff 03 	movl   $0x3,-0x22c(%ebp)
    a05c:	00 00 00 
    a05f:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a065:	83 c0 01             	add    $0x1,%eax
    a068:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%ebp)
    a06e:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
    a074:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a07a:	01 d0                	add    %edx,%eax
    a07c:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
    a082:	c7 85 dc fd ff ff 10 	movl   $0x10,-0x224(%ebp)
    a089:	00 00 00 
    a08c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a093:	00 
    a094:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a09b:	00 
    a09c:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    a0a2:	89 04 24             	mov    %eax,(%esp)
    a0a5:	e8 a3 fa ff ff       	call   9b4d <memset>
    a0aa:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
    a0b0:	89 85 e0 fd ff ff    	mov    %eax,-0x220(%ebp)
    a0b6:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    a0bc:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    a0c2:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
    a0c8:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%ebp)
    a0ce:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
    a0d4:	89 85 ec fd ff ff    	mov    %eax,-0x214(%ebp)
    a0da:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
    a0e0:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%ebp)
    a0e6:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
    a0ec:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%ebp)
    a0f2:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a0f8:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%ebp)
    a0fe:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a104:	89 85 fc fd ff ff    	mov    %eax,-0x204(%ebp)
    a10a:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
    a110:	89 85 00 fe ff ff    	mov    %eax,-0x200(%ebp)
    a116:	8b 85 c8 fd ff ff    	mov    -0x238(%ebp),%eax
    a11c:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%ebp)
    a122:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
    a128:	89 85 08 fe ff ff    	mov    %eax,-0x1f8(%ebp)
    a12e:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a134:	89 85 0c fe ff ff    	mov    %eax,-0x1f4(%ebp)
    a13a:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a140:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%ebp)
    a146:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
    a14c:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%ebp)
    a152:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    a158:	89 85 18 fe ff ff    	mov    %eax,-0x1e8(%ebp)
    a15e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a161:	8d 50 01             	lea    0x1(%eax),%edx
    a164:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    a16a:	89 44 24 08          	mov    %eax,0x8(%esp)
    a16e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a175:	00 
    a176:	89 14 24             	mov    %edx,(%esp)
    a179:	e8 fe f7 ff ff       	call   997c <hd_write>
    a17e:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    a185:	00 
    a186:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    a18d:	00 
    a18e:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    a194:	89 04 24             	mov    %eax,(%esp)
    a197:	e8 b1 f9 ff ff       	call   9b4d <memset>
    a19c:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    a1a3:	eb 29                	jmp    a1ce <make_fs+0x35a>
    a1a5:	8b 95 c0 fd ff ff    	mov    -0x240(%ebp),%edx
    a1ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a1ae:	01 c2                	add    %eax,%edx
    a1b0:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    a1b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    a1ba:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a1c1:	00 
    a1c2:	89 14 24             	mov    %edx,(%esp)
    a1c5:	e8 b2 f7 ff ff       	call   997c <hd_write>
    a1ca:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a1ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a1d1:	83 f8 03             	cmp    $0x3,%eax
    a1d4:	76 cf                	jbe    a1a5 <make_fs+0x331>
    a1d6:	c7 85 94 fd ff ff 02 	movl   $0x2,-0x26c(%ebp)
    a1dd:	00 00 00 
    a1e0:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a1e6:	c1 e0 09             	shl    $0x9,%eax
    a1e9:	89 85 98 fd ff ff    	mov    %eax,-0x268(%ebp)
    a1ef:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
    a1f5:	89 85 9c fd ff ff    	mov    %eax,-0x264(%ebp)
    a1fb:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
    a201:	89 85 a0 fd ff ff    	mov    %eax,-0x260(%ebp)
    a207:	8b 85 c0 fd ff ff    	mov    -0x240(%ebp),%eax
    a20d:	8d 95 94 fd ff ff    	lea    -0x26c(%ebp),%edx
    a213:	89 54 24 08          	mov    %edx,0x8(%esp)
    a217:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a21e:	00 
    a21f:	89 04 24             	mov    %eax,(%esp)
    a222:	e8 55 f7 ff ff       	call   997c <hd_write>
    a227:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a22d:	c6 84 05 e0 fd ff ff 	movb   $0x1,-0x220(%ebp,%eax,1)
    a234:	01 
    a235:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
    a23b:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
    a241:	89 54 24 08          	mov    %edx,0x8(%esp)
    a245:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a24c:	00 
    a24d:	89 04 24             	mov    %eax,(%esp)
    a250:	e8 27 f7 ff ff       	call   997c <hd_write>
    a255:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
    a25b:	c6 84 05 e0 fd ff ff 	movb   $0x0,-0x220(%ebp,%eax,1)
    a262:	00 
    a263:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a26a:	eb 29                	jmp    a295 <make_fs+0x421>
    a26c:	8b 95 bc fd ff ff    	mov    -0x244(%ebp),%edx
    a272:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a275:	01 c2                	add    %eax,%edx
    a277:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    a27d:	89 44 24 08          	mov    %eax,0x8(%esp)
    a281:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a288:	00 
    a289:	89 14 24             	mov    %edx,(%esp)
    a28c:	e8 eb f6 ff ff       	call   997c <hd_write>
    a291:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a295:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a298:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
    a29e:	39 c2                	cmp    %eax,%edx
    a2a0:	72 ca                	jb     a26c <make_fs+0x3f8>
    a2a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a2a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a2a8:	eb 21                	jmp    a2cb <make_fs+0x457>
    a2aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    a2b1:	00 
    a2b2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    a2b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    a2bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a2bf:	89 04 24             	mov    %eax,(%esp)
    a2c2:	e8 92 fa ff ff       	call   9d59 <set_sector_map>
    a2c7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a2cb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a2ce:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
    a2d4:	39 c2                	cmp    %eax,%edx
    a2d6:	72 d2                	jb     a2aa <make_fs+0x436>
    a2d8:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
    a2de:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
    a2e4:	89 54 24 08          	mov    %edx,0x8(%esp)
    a2e8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    a2ef:	00 
    a2f0:	89 04 24             	mov    %eax,(%esp)
    a2f3:	e8 84 f6 ff ff       	call   997c <hd_write>
    a2f8:	b8 01 00 00 00       	mov    $0x1,%eax
    a2fd:	c9                   	leave  
    a2fe:	c3                   	ret    
    a2ff:	90                   	nop

0000a300 <irq00_handler>:
    a300:	55                   	push   %ebp
    a301:	89 e5                	mov    %esp,%ebp
    a303:	53                   	push   %ebx
    a304:	50                   	push   %eax
    a305:	53                   	push   %ebx
    a306:	b8 01 00 00 00       	mov    $0x1,%eax
    a30b:	89 c3                	mov    %eax,%ebx
    a30d:	e4 21                	in     $0x21,%al
    a30f:	08 d8                	or     %bl,%al
    a311:	e6 21                	out    %al,$0x21
    a313:	b0 20                	mov    $0x20,%al
    a315:	e6 20                	out    %al,$0x20
    a317:	fb                   	sti    
    a318:	a1 20 cd 00 00       	mov    0xcd20,%eax
    a31d:	ba 00 00 00 00       	mov    $0x0,%edx
    a322:	89 d3                	mov    %edx,%ebx
    a324:	53                   	push   %ebx
    a325:	ff d0                	call   *%eax
    a327:	5b                   	pop    %ebx
    a328:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    a32d:	89 c3                	mov    %eax,%ebx
    a32f:	fa                   	cli    
    a330:	e4 21                	in     $0x21,%al
    a332:	20 d8                	and    %bl,%al
    a334:	e6 21                	out    %al,$0x21
    a336:	5b                   	pop    %ebx
    a337:	58                   	pop    %eax
    a338:	5b                   	pop    %ebx
    a339:	5d                   	pop    %ebp
    a33a:	fb                   	sti    
    a33b:	cf                   	iret   
    a33c:	5b                   	pop    %ebx
    a33d:	5d                   	pop    %ebp
    a33e:	c3                   	ret    

0000a33f <irq14_handler>:
    a33f:	55                   	push   %ebp
    a340:	89 e5                	mov    %esp,%ebp
    a342:	53                   	push   %ebx
    a343:	50                   	push   %eax
    a344:	53                   	push   %ebx
    a345:	b8 00 40 00 00       	mov    $0x4000,%eax
    a34a:	89 c3                	mov    %eax,%ebx
    a34c:	e4 21                	in     $0x21,%al
    a34e:	08 d8                	or     %bl,%al
    a350:	e6 21                	out    %al,$0x21
    a352:	b0 20                	mov    $0x20,%al
    a354:	e6 20                	out    %al,$0x20
    a356:	fb                   	sti    
    a357:	a1 58 cd 00 00       	mov    0xcd58,%eax
    a35c:	ba 0e 00 00 00       	mov    $0xe,%edx
    a361:	89 d3                	mov    %edx,%ebx
    a363:	53                   	push   %ebx
    a364:	ff d0                	call   *%eax
    a366:	5b                   	pop    %ebx
    a367:	b8 ff bf ff ff       	mov    $0xffffbfff,%eax
    a36c:	89 c3                	mov    %eax,%ebx
    a36e:	fa                   	cli    
    a36f:	e4 21                	in     $0x21,%al
    a371:	20 d8                	and    %bl,%al
    a373:	e6 21                	out    %al,$0x21
    a375:	5b                   	pop    %ebx
    a376:	58                   	pop    %eax
    a377:	5b                   	pop    %ebx
    a378:	5d                   	pop    %ebp
    a379:	fb                   	sti    
    a37a:	cf                   	iret   
    a37b:	5b                   	pop    %ebx
    a37c:	5d                   	pop    %ebp
    a37d:	c3                   	ret    
