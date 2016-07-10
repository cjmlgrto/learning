		.text

		# store input as a0
		li		$v0, 5
		syscall
		add		$a0, $0, $v0
		
		# store input as a1
		li		$v0, 5
		syscall
		add		$a1, $0, $v0

		# gcd(a0,a1) return as v0
		jal		gcd

		# print(v0)
		add		$a0, $0, $v0
		li		$v0, 1
		syscall

		# exit
		li		$v0, 10
		syscall

		# loop
gcd:	beq		$a1, $0, end		# while a1 != 0
		div		$a0, $a1			# r = k % m
		add		$a0, $0, $a1		# k = m
		mfhi	$a1					# m = r
		j 		gcd

end:	add		$v0, $0, $a0		# v0 = k
		jr		$ra					# return to jal

