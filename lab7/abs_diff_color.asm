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
# # according to MIPS convention, we should always allocate space on the stack for 
# # the callee to save its arguments on the stack (if it needs to call another function)
# # and allocate space to save $ra
# addi $sp, $sp, -28	# make place for 7 values on the stack (6 arguments + return address)
# sw $t0, 20($sp)		# store the last two arguments on the stack
# sw $t1, 24($sp)		# the first four are passed via registers
# jal abs_diff

abs_diff:
	sw $ra, 0($sp)		# store the return address on the stack
	sw $a0, 4($sp) 		# store the arguments $a0 to $a3 on the stack
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $a3, 16($sp)
	
	move $a1, $a3		# copy second argument from $a3 (R2) 
	jal abs_diff_helper	# call subroutine (first argument is still in a0 - R1)
	move $t6, $v0		# store result from abs_diff_helper in t6
	
	lw $a0, 8($sp)		# load arguments 2 and 5 from stack
	lw $a1, 20($sp)
	jal abs_diff_helper	# call subroutine
	add $t6, $t6, $v0 	# add result from abs_diff_helper to t6
	
	lw $a0, 12($sp)		# load arguments 3 and 6 from stack
	lw $a1, 24($sp)
	jal abs_diff_helper	# call subroutine
	add $t6, $t6, $v0 	# add result from abs_diff_helper to t6
	
	move $v0, $t6		# store result in v0
	lw $ra, 0($sp)		# restore return address
	addi $sp, $sp, 28	# reset stack pointer as space is no longer needed
	jr $ra			# exit function

abs_diff_helper:		# we use abs_diff_helper as a subroutine that behaves just like the original abs_diff
	sub $t1, $a0, $a1
	sra $t2,$t1,31   
	xor $t1,$t1,$t2   
	sub $v0,$t1,$t2    

	jr $ra
