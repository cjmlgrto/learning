		.data
str1:	.asciiz "Enter an int: "
str2:	.asciiz " * "
str3:	.asciiz " = "
n1:		.word 0
n2:		.word 0
n3:		.word 0
str4:	.asciiz "DEBUG"

		.text

		# print(str1)
		la		$a0, str1
		li		$v0, 4
		syscall

		# n1 = input()
		li		$v0, 5
		syscall
		sw		$v0, n1

		# print(str1)
		la		$a0, str1
		li		$v0, 4
		syscall

		# n2 = input
		li		$v0, 5
		syscall
		sw		$v0, n2

		jal		multiply

		# print(n1 ^ n2 = n3)
		lw		$a0, n1
		li		$v0, 1
		syscall
		la		$a0, str2
		li		$v0, 4
		syscall
		lw		$a0, n2
		li		$v0, 1
		syscall
		la		$a0, str3
		li		$v0, 4
		syscall
		lw		$a0, n3
		li		$v0, 1
		syscall

		# exit
		li		$v0, 10
		syscall

multiply:
		lw		$t0, n1
		lw		$t1, n2
		mult	$t0, $t1
		mflo	$t3
		sw		$t3, n3

		jr		$ra

