	.file	"part2_a.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64					#пролог
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16				#выдеоение стека
	mov	DWORD PTR -4[rbp], edi		#-4[rbp] := edi (1ый передаваемый аргумент (n))
	cmp	DWORD PTR -4[rbp], 1		# сравнение n с 1
	je	.L2
	cmp	DWORD PTR -4[rbp], 0		#сравнение n с 0
	jne	.L3
.L2:
	movsd	xmm0, QWORD PTR .LC0[rip]	#запись возвращаемого значения в xmm0
	jmp	.L4
.L3:
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -4[rbp]
	movsd	QWORD PTR -16[rbp], xmm1
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	mov	edi, eax
	call	factorial
	mulsd	xmm0, QWORD PTR -16[rbp]
.L4:
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	factorial, .-factorial
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
