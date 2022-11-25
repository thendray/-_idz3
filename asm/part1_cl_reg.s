	.file	"part1_a.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomX
	.type	getRandomX, @function
getRandomX:
	endbr64
	push	rax
	xor	edi, edi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, QWORD PTR .LC1[rip]
	subsd	xmm0, QWORD PTR .LC2[rip]
	pop	rdx
	ret
	.size	getRandomX, .-getRandomX
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"%lf"
.LC5:
	.string	"r"
.LC6:
	.string	"Input is incorrect"
.LC12:
	.string	"w"
.LC13:
	.string	"Program working time: %lld ns\n"
.LC14:
	.string	"Program result: %.20lf\n"
.LC16:
	.string	"Precision: %.20lf %%"
.LC17:
	.string	"Precision: %.20lf %%\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15			#сохранение регситра r15
	push	r14			#сохранение регистра r14
	push	r13			#сохранение регистра r13
	push	r12			#сохранение регистра r12
	push	rbp
	mov	ebp, edi
	push	rbx
	mov	rbx, rsi		#rbx := rsi
	sub	rsp, 88
	cmp	edi, 2
	jne	.L4
	mov	rax, QWORD PTR 8[rsi]
	mov	al, BYTE PTR [rax]
	cmp	al, 99
	jne	.L5
	lea	rsi, 40[rsp]
	lea	rdi, .LC4[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	jmp	.L6
.L5:
	cmp	al, 114
	jne	.L7
	xor	eax, eax
	call	getRandomX
	movsd	QWORD PTR 40[rsp], xmm0
	jmp	.L6
.L4:
	cmp	edi, 4
	jne	.L7
	mov	rax, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rax], 102
	jne	.L7
	mov	rdi, QWORD PTR 16[rsi]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	lea	rdx, 40[rsp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	jmp	.L6
.L7:
	lea	rsi, .LC6[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L8
.L6:
	movsd	xmm0, QWORD PTR 40[rsp]
	xorps	xmm0, XMMWORD PTR .LC7[rip]
	mov	r13d, 1000				#r13d := 1000
	call	exp@PLT
	lea	rsi, 48[rsp]
	mov	edi, 1
	movsd	QWORD PTR 8[rsp], xmm0
	call	clock_gettime@PLT
.L9:
	mov	QWORD PTR [rsp], 0x000000000
	xor	r12d, r12d				#r12d &= r12d
.L13:
	cvtsi2sd	xmm1, r12d			#r12d в вещественный xmm1
	movsd	xmm0, QWORD PTR .LC8[rip]
	movsd	QWORD PTR 24[rsp], xmm1
	call	pow@PLT
	movsd	xmm1, QWORD PTR 24[rsp]
	movsd	QWORD PTR 16[rsp], xmm0
	movsd	xmm0, QWORD PTR 40[rsp]
	call	pow@PLT
	movsd	xmm1, QWORD PTR 16[rsp]
	mov	edi, r12d				#edi := r12d
	mulsd	xmm1, xmm0
	movsd	QWORD PTR 16[rsp], xmm1
	call	factorial@PLT
	movsd	xmm1, QWORD PTR 16[rsp]
	divsd	xmm1, xmm0
	movaps	xmm2, xmm1
	andps	xmm2, XMMWORD PTR .LC9[rip]
	movaps	xmm0, xmm1
	xorps	xmm1, xmm1
	comisd	xmm2, xmm1
	jbe	.L10
	addsd	xmm0, QWORD PTR [rsp]
	movsd	xmm1, QWORD PTR .LC10[rip]
	comisd	xmm1, xmm0
	jb	.L10
	inc	r12d
	movsd	QWORD PTR [rsp], xmm0
	cmp	r12d, 1000			#compare r12d && 1000
	jne	.L13
.L10:
	dec	r13d
	jne	.L9
	lea	rsi, 64[rsp]
	mov	edi, 1
	lea	r13, .LC13[rip]			#r13 := &.LC13
	call	clock_gettime@PLT
	cvtsi2sd	xmm0, QWORD PTR 64[rsp]
	movsd	xmm3, QWORD PTR [rsp]
	cmp	ebp, 4
	movsd	xmm2, QWORD PTR .LC11[rip]
	cvtsi2sd	xmm1, QWORD PTR 72[rsp]
	lea	r12, .LC14[rip]
	subsd	xmm3, QWORD PTR 8[rsp]
	mulsd	xmm0, xmm2	
	movq	r15, xmm3			#r15 := xmm3
	addsd	xmm0, xmm1	
	cvtsi2sd	xmm1, QWORD PTR 48[rsp]
	mulsd	xmm1, xmm2
	subsd	xmm0, xmm1
	cvtsi2sd	xmm1, QWORD PTR 56[rsp]
	subsd	xmm0, xmm1
	cvttsd2si	r14, xmm0
	jne	.L15
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC12[rip]
	call	fopen@PLT
	mov	rcx, r14
	mov	rdx, r13
	mov	esi, 1
	mov	rbp, rax
	mov	rdi, rax
	xor	eax, eax
	call	__fprintf_chk@PLT
	movsd	xmm0, QWORD PTR [rsp]
	mov	rdx, r12			#rdx := r12
	mov	rdi, rbp
	mov	esi, 1
	mov	al, 1
	call	__fprintf_chk@PLT
	movq	xmm0, r15			#xmm0 := r15
	mov	rdi, rbp
	mov	al, 1
	andps	xmm0, XMMWORD PTR .LC9[rip]
	divsd	xmm0, QWORD PTR 8[rsp]
	mov	esi, 1
	lea	rdx, .LC16[rip]
	mulsd	xmm0, QWORD PTR .LC15[rip]
	call	__fprintf_chk@PLT
	jmp	.L8
.L15:
	mov	rdx, r14			#rdx := r14
	mov	rsi, r13			#rsi := r13
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR [rsp]
	mov	rsi, r12			#rsi := r12
	mov	al, 1
	mov	edi, 1
	call	__printf_chk@PLT
	movq	xmm0, r15
	andps	xmm0, XMMWORD PTR .LC9[rip]
	mov	al, 1
	divsd	xmm0, QWORD PTR 8[rsp]
	mulsd	xmm0, QWORD PTR .LC15[rip]
	mov	edi, 1
	lea	rsi, .LC17[rip]
	call	__printf_chk@PLT
.L8:
	add	rsp, 88
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
	.align 8
.LC1:
	.long	0
	.long	1080000512
	.align 8
.LC2:
	.long	0
	.long	1079738368
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	-1074790400
	.section	.rodata.cst16
	.align 16
.LC9:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	-1
	.long	2146435071
	.align 8
.LC11:
	.long	0
	.long	1104006501
	.align 8
.LC15:
	.long	0
	.long	1079574528

