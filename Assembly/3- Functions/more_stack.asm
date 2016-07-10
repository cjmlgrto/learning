		.text

main:
		# initialise stack frame
		# 4 * 4 = 16 bytes frame size
		addi	$fp, $sp, 0 			# $fp = $sp
		addi	$sp, $sp, -16			# $sp = 16 bytes up

		# initialise local variables into stack
		sw		$0, -16($fp)
		sw		$0, -12($fp)
		sw		$0, -8($fp)
		sw		$0, -4($fp)

		# input x
		li		$v0, 5
		syscall
		sw		$v0, -16($fp)

		# input y
		li		$v0, 5
		syscall
		sw		$v0, -12($fp)

		# input z
		li		$v0, 5
		syscall
		sw		$v0, -8($fp)

		# push x, y, z onto stack as arguments
		# 3 * 4 = 12 bytes of arguments
		addi	$sp, $sp, -12

		# push x
		lw		$t0, -16($fp)
		sw		$t0, 0($sp)

		# push y
		lw		$t0, -12($fp)
		sw		$t0, 4($sp)

		# push z
		lw		$t0, -8($fp)
		sw		$t0, 8($sp)

		jal		combine

		# remove arguments
		addi	$sp, $sp, 12
		sw		$v0, -4($fp)

		# use return value
		lw		$a0, -4($fp)
		li		$v0, 1
		syscall

		# exit
		li		$v0, 10
		syscall

combine:
		# push $ra and $fp onto stack
		# 2 * 4 = 8 bytes
		addi	$sp, $sp, -8
		sw		$ra, 4($sp)
		sw		$fp, 0($sp)

		# new frame pointer for this one
		addi	$fp, $sp, 0

		# allocate local variables
		# 1 * 4 = 4 bytes
		addi	$sp, $sp, -4

		# initialise local variables
		sw		$0, -4($fp)

		# load arguments
		lw		$t0, 16($fp)
		lw		$t1, 12($fp)
		lw		$t2, 8($fp)

		# $t0 + $t1 + $t2
		add 	$t0, $t0, $t1
		add 	$t0, $t0, $t2
		add 	$v0, $0, $t0

		# remove local variables
		addi	$sp, $sp, 4

		lw		$fp, 0($sp)
		lw		$ra, 4($sp)
		addi	$sp, $sp, 8

		jr		$ra

