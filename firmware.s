
.pio/build/nucleo_f103rb/firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

0800010c <__do_global_dtors_aux>:
 800010c:	b510      	push	{r4, lr}
 800010e:	4c05      	ldr	r4, [pc, #20]	@ (8000124 <__do_global_dtors_aux+0x18>)
 8000110:	7823      	ldrb	r3, [r4, #0]
 8000112:	b933      	cbnz	r3, 8000122 <__do_global_dtors_aux+0x16>
 8000114:	4b04      	ldr	r3, [pc, #16]	@ (8000128 <__do_global_dtors_aux+0x1c>)
 8000116:	b113      	cbz	r3, 800011e <__do_global_dtors_aux+0x12>
 8000118:	4804      	ldr	r0, [pc, #16]	@ (800012c <__do_global_dtors_aux+0x20>)
 800011a:	f3af 8000 	nop.w
 800011e:	2301      	movs	r3, #1
 8000120:	7023      	strb	r3, [r4, #0]
 8000122:	bd10      	pop	{r4, pc}
 8000124:	20000000 	.word	0x20000000
 8000128:	00000000 	.word	0x00000000
 800012c:	0800023c 	.word	0x0800023c

08000130 <frame_dummy>:
 8000130:	b508      	push	{r3, lr}
 8000132:	4b03      	ldr	r3, [pc, #12]	@ (8000140 <frame_dummy+0x10>)
 8000134:	b11b      	cbz	r3, 800013e <frame_dummy+0xe>
 8000136:	4903      	ldr	r1, [pc, #12]	@ (8000144 <frame_dummy+0x14>)
 8000138:	4803      	ldr	r0, [pc, #12]	@ (8000148 <frame_dummy+0x18>)
 800013a:	f3af 8000 	nop.w
 800013e:	bd08      	pop	{r3, pc}
 8000140:	00000000 	.word	0x00000000
 8000144:	20000004 	.word	0x20000004
 8000148:	0800023c 	.word	0x0800023c

0800014c <Reset_Handler>:
 800014c:	f000 f823 	bl	8000196 <SystemInit>
 8000150:	480b      	ldr	r0, [pc, #44]	@ (8000180 <LoopFillZerobss+0xe>)
 8000152:	490c      	ldr	r1, [pc, #48]	@ (8000184 <LoopFillZerobss+0x12>)
 8000154:	4a0c      	ldr	r2, [pc, #48]	@ (8000188 <LoopFillZerobss+0x16>)
 8000156:	2300      	movs	r3, #0
 8000158:	e002      	b.n	8000160 <LoopCopyDataInit>

0800015a <CopyDataInit>:
 800015a:	58d4      	ldr	r4, [r2, r3]
 800015c:	50c4      	str	r4, [r0, r3]
 800015e:	3304      	adds	r3, #4

08000160 <LoopCopyDataInit>:
 8000160:	18c4      	adds	r4, r0, r3
 8000162:	428c      	cmp	r4, r1
 8000164:	d3f9      	bcc.n	800015a <CopyDataInit>
 8000166:	4a09      	ldr	r2, [pc, #36]	@ (800018c <LoopFillZerobss+0x1a>)
 8000168:	4c09      	ldr	r4, [pc, #36]	@ (8000190 <LoopFillZerobss+0x1e>)
 800016a:	2300      	movs	r3, #0
 800016c:	e001      	b.n	8000172 <LoopFillZerobss>

0800016e <FillZerobss>:
 800016e:	6013      	str	r3, [r2, #0]
 8000170:	3204      	adds	r2, #4

08000172 <LoopFillZerobss>:
 8000172:	42a2      	cmp	r2, r4
 8000174:	d3fb      	bcc.n	800016e <FillZerobss>
 8000176:	f000 f83d 	bl	80001f4 <__libc_init_array>
 800017a:	f000 f81d 	bl	80001b8 <main>
 800017e:	4770      	bx	lr
 8000180:	20000000 	.word	0x20000000
 8000184:	20000000 	.word	0x20000000
 8000188:	0800025c 	.word	0x0800025c
 800018c:	20000000 	.word	0x20000000
 8000190:	2000001c 	.word	0x2000001c

08000194 <ADC1_2_IRQHandler>:
 8000194:	e7fe      	b.n	8000194 <ADC1_2_IRQHandler>

08000196 <SystemInit>:
 8000196:	4770      	bx	lr

08000198 <delay>:
 8000198:	2300      	movs	r3, #0
 800019a:	b082      	sub	sp, #8
 800019c:	4a05      	ldr	r2, [pc, #20]	@ (80001b4 <delay+0x1c>)
 800019e:	9301      	str	r3, [sp, #4]
 80001a0:	9b01      	ldr	r3, [sp, #4]
 80001a2:	4293      	cmp	r3, r2
 80001a4:	d901      	bls.n	80001aa <delay+0x12>
 80001a6:	b002      	add	sp, #8
 80001a8:	4770      	bx	lr
 80001aa:	bf00      	nop
 80001ac:	9b01      	ldr	r3, [sp, #4]
 80001ae:	3301      	adds	r3, #1
 80001b0:	9301      	str	r3, [sp, #4]
 80001b2:	e7f5      	b.n	80001a0 <delay+0x8>
 80001b4:	0007a11f 	.word	0x0007a11f

080001b8 <main>:
 80001b8:	2420      	movs	r4, #32
 80001ba:	f44f 1000 	mov.w	r0, #2097152	@ 0x200000
 80001be:	4a0b      	ldr	r2, [pc, #44]	@ (80001ec <main+0x34>)
 80001c0:	b508      	push	{r3, lr}
 80001c2:	6993      	ldr	r3, [r2, #24]
 80001c4:	490a      	ldr	r1, [pc, #40]	@ (80001f0 <main+0x38>)
 80001c6:	f043 0304 	orr.w	r3, r3, #4
 80001ca:	6193      	str	r3, [r2, #24]
 80001cc:	680a      	ldr	r2, [r1, #0]
 80001ce:	f422 0270 	bic.w	r2, r2, #15728640	@ 0xf00000
 80001d2:	600a      	str	r2, [r1, #0]
 80001d4:	680a      	ldr	r2, [r1, #0]
 80001d6:	f442 1200 	orr.w	r2, r2, #2097152	@ 0x200000
 80001da:	600a      	str	r2, [r1, #0]
 80001dc:	610c      	str	r4, [r1, #16]
 80001de:	f7ff ffdb 	bl	8000198 <delay>
 80001e2:	6108      	str	r0, [r1, #16]
 80001e4:	f7ff ffd8 	bl	8000198 <delay>
 80001e8:	e7f8      	b.n	80001dc <main+0x24>
 80001ea:	bf00      	nop
 80001ec:	40021000 	.word	0x40021000
 80001f0:	40010800 	.word	0x40010800

080001f4 <__libc_init_array>:
 80001f4:	b570      	push	{r4, r5, r6, lr}
 80001f6:	2500      	movs	r5, #0
 80001f8:	4e0c      	ldr	r6, [pc, #48]	@ (800022c <__libc_init_array+0x38>)
 80001fa:	4c0d      	ldr	r4, [pc, #52]	@ (8000230 <__libc_init_array+0x3c>)
 80001fc:	1ba4      	subs	r4, r4, r6
 80001fe:	10a4      	asrs	r4, r4, #2
 8000200:	42a5      	cmp	r5, r4
 8000202:	d109      	bne.n	8000218 <__libc_init_array+0x24>
 8000204:	f000 f81a 	bl	800023c <_init>
 8000208:	2500      	movs	r5, #0
 800020a:	4e0a      	ldr	r6, [pc, #40]	@ (8000234 <__libc_init_array+0x40>)
 800020c:	4c0a      	ldr	r4, [pc, #40]	@ (8000238 <__libc_init_array+0x44>)
 800020e:	1ba4      	subs	r4, r4, r6
 8000210:	10a4      	asrs	r4, r4, #2
 8000212:	42a5      	cmp	r5, r4
 8000214:	d105      	bne.n	8000222 <__libc_init_array+0x2e>
 8000216:	bd70      	pop	{r4, r5, r6, pc}
 8000218:	f856 3025 	ldr.w	r3, [r6, r5, lsl #2]
 800021c:	4798      	blx	r3
 800021e:	3501      	adds	r5, #1
 8000220:	e7ee      	b.n	8000200 <__libc_init_array+0xc>
 8000222:	f856 3025 	ldr.w	r3, [r6, r5, lsl #2]
 8000226:	4798      	blx	r3
 8000228:	3501      	adds	r5, #1
 800022a:	e7f2      	b.n	8000212 <__libc_init_array+0x1e>
 800022c:	08000254 	.word	0x08000254
 8000230:	08000254 	.word	0x08000254
 8000234:	08000254 	.word	0x08000254
 8000238:	08000258 	.word	0x08000258

0800023c <_init>:
 800023c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800023e:	bf00      	nop
 8000240:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000242:	bc08      	pop	{r3}
 8000244:	469e      	mov	lr, r3
 8000246:	4770      	bx	lr

08000248 <_fini>:
 8000248:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800024a:	bf00      	nop
 800024c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800024e:	bc08      	pop	{r3}
 8000250:	469e      	mov	lr, r3
 8000252:	4770      	bx	lr
