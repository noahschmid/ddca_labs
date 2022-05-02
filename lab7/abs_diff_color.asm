abs_diff:
	add $t0, $a0, $0
	add $t1, $a1, $0
	add $t2, $a2, $0
	add $t3, $a3, $0
	lw $t4, 4($sp)
	lw $t5, 0($sp)
	
	addi $sp, $sp, 8
	addi $v1, $0, 0		# result = 0
	
	add $a1, $t3, $0
	jal abs_diff_helper
	add $v1, $v1, $v0
	
	add $a0, $t1, $0
	add $a1, $t4, $0
	jal abs_diff_helper
	add $v1, $v1, $v0
	
	add $a0, $t2, $0
	add $a1, $t5, $0
	jal abs_diff_helper
	add $v0, $v1, $v0

abs_diff_helper:
	sub $t1, $a0, $a1
	sra $t2,$t1,31   
	xor $t1,$t1,$t2   
	sub $v0,$t1,$t2    

	jr $ra