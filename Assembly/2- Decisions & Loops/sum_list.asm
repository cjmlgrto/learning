		.data
str1:	.asciiz "Enter the number of values: "
str2:	.asciiz "Add to list: "
str3:	.asciiz "The sum is: "
size:	.word 0
sum:	.word 0
list:	.word 0
i:		.word 0

		.text

		# print(str1)
		la		$a0, str1
		li 		$v0, 4
		syscall

		# size = input()
		li 		$v0, 5
		syscall
		sw		$v0, size

		# $t0 = size
		# $t1 = 4
		# $t2 = 4 * size
		# $a0 = $t1 + $t2
		# list.memory = syscall(allocate, $a0 bytes)
		# list[0] =  list.location_in_memory
		lw		$t0, size
		li 		$t1, 4
		mult	$t1, $t0
		mflo	$t2
		add 	$a0, $t2, $t1
		li 		$v0, 9
		syscall
		sw		$v0, list
		sw		$t0, ($v0)

		# $t0 = i
		# $t1 = size
		# if $t0 < $t1: $t2 = 1 ? 0
		# (basically, if i < size, don't branch to calc)
input:	lw		$t0, i
		lw		$t1, size
		slt		$t2, $t0, $t1
		beq		$t2, $0, end

		# print(str2)
		la		$a0, str2
		li 		$v0, 4
		syscall

		# $v0 = input()
		li 		$v0, 5
		syscall

		# sum = sum + $v0
		lw		$t5, sum
		add 	$t5, $t5, $v0
		sw		$t5, sum

		# $t2 = list
		# $t3 = 4
		# $t4 = $t2 * $t3
		# $t4 = $t4 + $t3
		# $t4 = $t4 + $t2
		# ^ ????????
		# list[$t4] = $v0
		lw		$t2, list
		li 		$t3, 4
		mult 	$t3, $t0
		mflo 	$t4
		add 	$t4, $t4, $t3
		add  	$t4, $t4, $t2
		sw		$v0, ($t4)

		# i += 1
		addi	$t0, $t0, 1
		sw		$t0, i

		# repeat
		j 		input

		# print str3
end:	la 		$a0, str3
		li 		$v0, 4
		syscall

		# print sum
		lw		$a0, sum
		li 		$v0, 1
		syscall

		# exit
		li 		$v0, 10
		syscall
