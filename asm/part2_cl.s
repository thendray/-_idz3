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
	pxor	xmm1, xmm1			# xmm1 & xmm1 - побитовое исключающее или для 64 разрядных операндов
	cvtsi2sd	xmm1, DWORD PTR -4[rbp]	# преобразование -4[rpb] в вещественное
	movsd	QWORD PTR -16[rbp], xmm1	# xmm1 := -16[rbp]
	mov	eax, DWORD PTR -4[rbp]		# eax := -4[rbp]
	sub	eax, 1				# eax -= 1
	mov	edi, eax			# edi := eax
	call	factorial			# вызов factorial
	mulsd	xmm0, QWORD PTR -16[rbp]	# -16[rbp] * xmm0
.L4:
	movq	rax, xmm0
	movq	xmm0, rax
	leave					# эпилог
	ret
	.size	factorial, .-factorial
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
