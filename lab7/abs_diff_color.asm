# IDEA: We store the first four arguments in $a0, ..., $a3 and the last two on the stack.
# We rename the original abs_diff function to abs_diff_helper and use it as a subroutine.
# In total there are three calls to abs_diff_helper, simulating the calls to abs(..) in 
# the C code.
#
# One would call our abs_diff routine with values 1, 2, 3, 4, 5, 6 as follows:
# li $a0, 1
# li $a1, 2
# li $a2, 3
# li $a3, 4
# li $t0, 5 
# li $t1, 6 
#
# addi $sp, $sp, -8
# sw $t0, 4($sp)
# sw $t1, 0($sp)
# jal abs_diff


abs_diff:
	add $t0, $a0, $0	# first store the arguments $a0 to $a3 in $t0..$t3
	add $t1, $a1, $0
	add $t2, $a2, $0
	add $t3, $a3, $0
	
	lw $t4, 4($sp)		# get the last two arguments from the stack
	lw $t5, 0($sp)
	
	addi $sp, $sp, 8	# increment stack pointer as the values are now in registers
	addi $v1, $0, 0		# result = 0
	
	add $a1, $t3, $0	# copy second argument from $t3 (R2) 
	jal abs_diff_helper	# call subroutine (first argument is still in a0 - R1)
	add $v1, $v1, $v0	# store result from abs_diff_helper in v1
	
	add $a0, $t1, $0	# copy arguments from $t1 and $t4 to $a0 and $a1
	add $a1, $t4, $0
	jal abs_diff_helper	# call subroutine
	add $v1, $v1, $v0 	# add result from abs_diff_helper to v1
	
	add $a0, $t2, $0	# copy arguments from $t2 and $t5 to $a0 and $a1
	add $a1, $t5, $0
	jal abs_diff_helper	# call subroutine
	add $v0, $v0, $v1	# add result from abs_diff_helper to v1 and store in v0

abs_diff_helper:		# we use abs_diff_helper as a subroutine that behaves just like the original abs_diff
	sub $t1, $a0, $a1
	sra $t2,$t1,31   
	xor $t1,$t1,$t2   
	sub $v0,$t1,$t2    

	jr $ra
