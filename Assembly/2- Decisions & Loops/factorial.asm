		.data
prompt:	.asciiz "Enter int: "
n:		.word 0
f:		.word 1

		.text

		# print prompt
		la		$a0, prompt
		li		$v0, 4
		syscall

		# store input as n
		li		$v0, 5
		syscall
		sw		$v0, n

		# iterate until n <= 0
loop:	lw		$t0, n
		ble		$t0, $0, end

		# f = f * n
		lw		$t1, f
		mul		$t1, $t1, $t0
		sw		$t1, f

		# n = n - 1
		addi	$t0, $t0, -1
		sw		$t0, n

		j		loop

		# print f
end:	lw		$a0, f
		li		$v0, 1
		syscall

		# exit
		li		$v0, 10
		syscall




