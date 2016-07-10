		.text

main:
		# intialise stack frame
		# 2 * 4 = 8 bytes frame size
		addi	$fp, $sp, 0
		addi	$sp, $sp, -8

		# initialise local variables into stack
		sw		$0, -8($fp) 			# n = 0
		sw		$0, -4($fp)				# ans = 0

		# input n
		li		$v0, 5
		syscall
		sw		$v0, -8($fp)

		# push n into stack as argument
		# 1 * 4 = 4 bytes of arguments
		addi	$sp, $sp, -4

		# push n
		lw		$t0, -8($fp)
		sw		$t0, 0($sp)

		jal		factorial

		# remove argument n
		addi	$sp, $sp, 4

		# store return value into stack
		sw		$v0, -4($fp)

		# print result
		lw		$a0, -4($fp)
		li		$v0, 1
		syscall

		# exit
		li		$v0, 10
		syscall

factorial:
		# initialise stack frame for $ra and $fp
		# 2 * 4 = 8 bytes
		addi	$sp, $sp, -8

		# push $ra
		sw		$ra, 4($sp)

		# push $fp
		sw		$fp, 0($sp)

		# new frame pointer for function
		addi	$fp, $sp, 0

		





