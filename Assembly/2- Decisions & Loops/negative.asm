		.data
str1:	.asciiz "Enter int: "
str2:	.asciiz "Negative"
var1:	.word 0

		.text

		# print str1
		la		$a0, str1
		li		$v0, 4
		syscall

		# read input as var1
		li		$v0, 5
		syscall
		sw		$v0, var1

		# selection
		lw		$t1, var1
		slti 	$t0, $t1, 0

		# branch
		bne		$t0, $0, print
		j		exit

print:	la		$a0, str2
		li		$v0, 4
		syscall
		j		exit

exit:	li		$v0, 10
		syscall
 