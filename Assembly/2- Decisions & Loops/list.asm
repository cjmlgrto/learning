		.data
str1:	.asciiz "Enter the number of values: "
str2:	.asciiz "Value: "
size:	.word 0
list:	.word 0
i:		.word 0

		.text

		# print str1
		la		$a0, str1
		li 		$v0, 4
		syscall

		# input size into 'size'
		li 		$v0, 5
		syscall
		sw		$v0, size

		# ------- MEMORY ALLOCATION FOR LISTS -------

		# allocate enough memory to store 'size' ints
		# $t2 = size * 4
		lw		$t0, size
		li 		$t1, 4
		mult	$t1, $t0
		mflo	$t2
		# a0 = $t2 (which is 4*size) + $t1 (which is 4)
		add		$a0, $t2, $t1

		# allocate $a0 bytes
		li 		$v0, 9
		syscall

		# use this new allocated memory address ($v0) for list
		sw		$v0, list

		# store the size of $t0 (which is the size of the list) into 0($v0), the 0th item of the memory allocation
		sw		$t0, ($v0)

		# ------- END -------

		# i = 0
		sw		$0, i


loop:	# while (i < size):
		lw		$t0, i
		lw		$t1, size
		# if i < size, $t2 = 1, else 0
		slt		$t2, $t0, $t1
		beq		$t2, $0, endloop

		# print str2
		la		$a0, str2
		li 		$v0, 4
		syscall

		# store input (via default, into $v0)
		li 		$v0, 5
		syscall

		lw		$t2, list
		# $t4 = i * 4 + 4
		li 		$t3, 4
		mult	$t3, $t0
		mflo	$t4
		add 	$t4, $t4, $t3
		# $t4 points to next location on the list
		add 	$t4, $t4, $t2
		# store the value
		sw		$v0, ($t4)

		addi	$t0, $t0, 1
		sw		$t0, i

		j 		loop

endloop:	
		sw		$0, i

		j 		display

display:
		lw		$t0, i
		lw		$t1, size
		slt		$t2, $t0, $t1
		beq		$t2, $0, exit

		lw		$t2, list

		li 		$t3, 4
		mult	$t3, $t0
		mflo	$t4
		add 	$t4, $t4, $t3
		add 	$t4, $t4, $t2
		lw		$a0, ($t4)

		li 		$v0, 1
		syscall
		li 		$a0, 32
		li 		$v0, 11
		syscall

		addi	$t0, $t0, 1
		sw		$t0, i

		j 		display

exit:
		li 		$v0, 10
		syscall


