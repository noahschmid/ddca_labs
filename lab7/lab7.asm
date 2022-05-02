#
# Calculate sum from A to B.
#
# Authors: 
#	X Y, Z Q 
#
# Group: Julia Tonne, Levi Widmer, Noah Schmid
#

.text
main:
	
	addi $t0, $0, 100 	#A
	addi $t1, $0, 0		#B
	addi $t2, $0, 0		#result
	
	addi $t4, $t1, 1 	#B+1
	slt $t3, $t0, $t4	
	beq $t3, $0, end

loop:	beq $t0, $t1, exit 
	add $t2, $t2, $t0
	addi $t0, $t0, 1  
	j loop
	
exit:
	add $t2, $t2, $t1
	 
	# Put your sum S into register $t2
end:	
	j	end	# Infinite loop at the end of the program. 
