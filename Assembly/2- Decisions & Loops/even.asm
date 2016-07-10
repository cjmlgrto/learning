		.data
str1:	.asciiz "Enter int: "
str2:	.asciiz " is even."
str3:	.asciiz " is odd."
n:		.word 0

		.text

		# print str1
		la		$a0, str1
		li		$v0, 4
		syscall

		# store input into n
		li		$v0, 5
		syscall
		sw		$v0, n

		# calculate remainder for n/2
		lw		$t0, n
		li		$t1, 2
		rem		$t0, $t0, $t1

		# print n
		lw		$a0, n
		li		$v0, 1
		syscall

		# if remainder != 0 goto else
		bne		$t0, $0, else

		# print str2 (even)
		la		$a0, str2
		li		$v0, 4
		syscall
		j		exit

		# print str3 (odd)
else:	la		$a0, str3
		li		$v0, 4
		syscall

		# exit
exit:	li		$v0, 10
		syscall

