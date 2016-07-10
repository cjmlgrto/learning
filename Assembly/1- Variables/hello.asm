		.data
prompt:	.asciiz "Enter name(max 60 chars):  "
str:	.asciiz "Hello "
name:	.space 60

		.text
		la		$a0, prompt
		addi	$v0, $0, 4
		syscall

		la		$a0, name
		addi	$a1, $0, 60
		addi	$v0, $0, 8
		syscall

		la		$a0, str
		addi	$v0, $0, 4
		syscall

		la		$a0, name
		addi	$v0, $0, 4
		syscall

		addi	$v0, $0, 10
		syscall