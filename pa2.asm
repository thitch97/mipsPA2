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


find_start_end:
    add $t0, $zero, $a0                 

  start:  
    lb $t1, 0($t0)                      
    beq $t1, 10, end            
    beq $t1, 0, end            
    beq $t1, 32, incr_start_ptr
    beq $t1, 44, incr_start_ptr
  
    addi $t2, $t0, 1                    
    
  comma:
    lb $t1, 0($t2)                    
    beq $t1, 10, shift_left              
    beq $t1, 0, shift_left              
    bne $t1, 44, incr_last_ptr 
  
    addi $t2, $t2, -1                  
    
  shift_left:
    lb $t1, 0($t2)                     
    beq $t1, 32, decr_last_ptr         
    beq $t1, 0, decr_last_ptr 
    beq $t1, 10, decr_last_ptr 

    add $v0, $zero, $t0                 
    add $v1, $zero, $t2                 
    jr $ra

  incr_start_ptr:
    addi $t0, $t0, 1                    
    j start

  incr_last_ptr:
    addi $t2, $t2, 1                   
    j comma

  decr_last_ptr:
    addi $t2, $t2, -1                   
    j shift_left



validity_check:
    add $t2, $zero, $zero  
                

  is_valid:
     
    lb $t1, 0($t0)                    
     
 
    bge $t1, 103, not_a_number           
    bge $t1, 96, incrChar        
    bge $t1, 71, not_a_number          
    bge $t1, 64, incrChar         
    bge $t1, 58, not_a_number         
    bge $t1, 47, incrChar         
    j not_a_number

  incrChar:
    addi $t0, $t0, 1                    
    addi $t2, $t2, 1                  
    bgt $t0, $a1, valid               
    j is_valid
     
  not_a_number:
    addi $v0, $zero, 1                 
    addi $v1, $zero, 0                 
    jr $ra
     
  too_large:
    addi $v0, $zero, 2                  
    addi $v1, $zero, 0                 
    jr $ra
  
  valid:
    bgt $t2, 8, too_large      
    addi $v0, $zero, 3                  
    add $v1, $zero, $t2                 
    jr $ra
     
return:
    jr $ra  



subprogram1:
    addi $v0, $zero, 1                 
    addi $t3, $zero, 16                 

  ascii_to_hex:
    bge $a2, 96, lower                  
    bge $a2, 64, upper                
    bge $a2, 47, number                 

  lower:
    addi $t0, $a2, -87                  
    j calc_exp

  upper:
    addi $t0, $a2, -55                 
    j calc_exp

  number:
    addi $t0, $a2, -48                  
    j calc_exp

  calc_exp:
    sub $t1, $a0, $a1                  
    addi $t1, $t1, -1                   

  raise_to_exp:
    beq $t1, $zero, multiply            

    mult $v0, $t3                      
    mflo $v0                           

    addi $t1, $t1, -1                   
    j raise_to_exp

  multiply:
    mult $v0, $t0                     
    mflo $v0                            

    jr $ra          







































































		




	
