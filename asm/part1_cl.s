	.file	"part1_a.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomX
	.type	getRandomX, @function
getRandomX:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC2[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	getRandomX, .-getRandomX
	.section	.rodata
.LC3:
	.string	"%lf"
.LC4:
	.string	"r"
.LC5:
	.string	"Input is incorrect"
.LC12:
	.string	"w"
	.align 8
.LC13:
	.string	"Program working time: %lld ns\n"
.LC14:
	.string	"Program result: %.20lf\n"
.LC16:
	.string	"Precision: %.20lf %%"
.LC17:
	.string	"Precision: %.20lf %%\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	DWORD PTR -20[rbp], 1000
	cmp	DWORD PTR -116[rbp], 2
	jne	.L4
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 99
	jne	.L4
	lea	rax, -72[rbp]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L5
.L4:
	cmp	DWORD PTR -116[rbp], 2
	jne	.L6
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 114
	jne	.L6
	mov	eax, 0
	call	getRandomX
	movq	rax, xmm0
	mov	QWORD PTR -72[rbp], rax
	jmp	.L5
.L6:
	cmp	DWORD PTR -116[rbp], 4
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 102
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	jmp	.L5
.L7:
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L8
.L5:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	movq	xmm1, QWORD PTR .LC7[rip]
	xorpd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	call	exp@PLT
	movq	rax, xmm0
	mov	QWORD PTR -40[rbp], rax
	lea	rax, -96[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	DWORD PTR -12[rbp], 0
	jmp	.L9
.L15:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -16[rbp], 0
	jmp	.L10
.L14:
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR .LC8[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -136[rbp], xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movapd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR -136[rbp]
	movsd	QWORD PTR -136[rbp], xmm3
	mov	eax, DWORD PTR -16[rbp]
	mov	edi, eax
	call	factorial@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -136[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0
	movsd	xmm0, QWORD PTR -64[rbp]
	movq	xmm1, QWORD PTR .LC9[rip]
	andpd	xmm0, xmm1
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1
	jbe	.L11
	movsd	xmm0, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC10[rip]
	comisd	xmm0, xmm1
	jb	.L11
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -64[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -16[rbp], 1
.L10:
	cmp	DWORD PTR -16[rbp], 999
	jle	.L14
.L11:
	add	DWORD PTR -12[rbp], 1
.L9:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L15
	lea	rax, -112[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -104[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	mov	rax, QWORD PTR -112[rbp]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, rax
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR -96[rbp]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	mulsd	xmm1, xmm2
	subsd	xmm0, xmm1
	mov	rax, QWORD PTR -88[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	subsd	xmm0, xmm1
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -48[rbp], rax
	cmp	DWORD PTR -116[rbp], 4
	jne	.L16
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC13[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC14[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC9[rip]
	andpd	xmm0, xmm1
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC15[rip]
	mulsd	xmm1, xmm0
	movq	rdx, xmm1
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC16[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	jmp	.L17
.L16:
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	lea	rax, .LC14[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC9[rip]
	andpd	xmm0, xmm1
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC15[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	lea	rax, .LC17[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
.L17:
	mov	eax, 0
.L8:
	leave
	ret
	.size	main, .-main
	.section	.rodata
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
	.align 16
.LC7:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC8:
	.long	0
	.long	-1074790400
	.align 16
.LC9:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
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
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
