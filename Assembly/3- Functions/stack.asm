		.text

		addi	$t0, $0, 0
		add 	$t1, $0, 3

input:	beq		$t0, $t1, print
		
		li		$v0, 5
		syscall

		addi	$sp, $sp, -4
		sw		$v0, ($sp)

		addi	$t0, $t0, 1
		j		input

print:	beq		$t0, $0, end

		lw		$a0, ($sp)
		li		$v0, 1
		syscall
		addi	$sp, $sp, 4

		addi	$t0, $t0, -1
		j		print

end:	li		$v0, 10
		syscall