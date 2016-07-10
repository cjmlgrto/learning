		.data
one:	.asciiz "one"
two:	.asciiz "two"
three:	.asciiz "three"
four:	.asciiz	"four"

		.text

		la		$a0, one
		li		$v0, 4
		syscall
		j		apple

orange:	la		$a0, three
		li		$v0, 4
		syscall
		j		banana

banana:	la		$a0, four
		li		$v0, 4
		syscall
		li		$v0, 10
		syscall	

apple:	la		$a0, two
		li		$v0, 4
		syscall
		j		orange

