#-------------------------------------------------------------------------------------
# Timothy Hitchener
#
#
#
#
#
#
#-------------------------------------------------------------------------------------

.data

.text

main:
		
subprogram1:
	
lower_upper_bound:
	blt $a0, 103, lower_lower_bound
	j fail

lower_lower_bound:
	bgt $a0, 96, store_low_val 
	j upper_upper_bound

store_low_val:
	addi $v0, $a0, -87
	jr $ra
	
upper_upper_bound:
	blt $a0, 71, upper_lower_bound
	j fail

upper_lower_bound:
	bgt $a0, 64, store_up_val
	j num_upper_bound

store_up_val:
	addi $v0, $a0, -55
	jr $ra

num_upper_bound:
	blt $a0, 58, num_lower_bound
	j fail
	
num_lower_bound:
	bgt $a0, 47, store_num_val
	j fail

store_num_val: 
	addi $v0, $a0, -48
	jr $ra

	

subprogram2:





subprogram3: