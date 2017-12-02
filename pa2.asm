#-------------------------------------------------------------------------------------
# Timothy Hitchener
# Due: December 1, 2017
# 
# Registers:
#
#	
#
#
#
#
#
#-------------------------------------------------------------------------------------

.data
	inval_err: .asciiz "NaN" 		#output for invalid hex 
	size_err: .asciiz "too large"	
	newline: .asciiz "\n"			#stores new line for output
	input: .space 1001				#allocated space for characters

.text
main:
	jal input_data
	
loop:
	
	jal find_start_end
    
    add $s0, $zero, $v0               
    add $s1, $zero, $v1                
    
   
    add $a0, $zero, $v0                
    add $a1, $zero, $v1                
    
    jal validity_check
    
    
    add $s2, $zero, $v0                 
    add $s3, $zero, $v1                 
    
   
    add $a0, $zero, $s0                 
    add $a1, $zero, $s1                 
    add $a2, $zero, $s3                
    add $a3, $zero, $s2                
    jal subprogram2

    add $a0, $zero, $s2                 
    jal subprogram3                    
    
    addi $a0, $s1, 1                    
    j loop

end:
	li $v0, 10
	syscall


input_data:
    la $a0, input                
    li $v0, 4
    syscall           
                      
    la $a0, input                                                                                 
    li $a1, 1000                                                                
    li $v0, 8                                                                 
    syscall                             
    
    jr $ra


















































































		




	
