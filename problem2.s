.text 
.align 2 
.globl main 

main: # this program prints out the largest two of three numbers input 
	
	li $v0, 4 
	la $a0, prompt1 
	syscall 

	li $v0, 5 # read keyboard into $v0 (number x is number to test) 
	syscall 
	move $t0,$v0 # number of iterations
	
	li $v0, 4 
	la $a0, prompt2 
	syscall 

	la $a0, endl
	li $v0, 4
	syscall

	# li $v0, 5 # read keyboard into $v0 (number x is number to test) 
	# syscall 
	# move $t1,$v0 # first number in $t1 

	li $t2, 0 # t2 is counter (i)

	li $t3, -2147483648
	li $t4, -2147483648
	li $t5, -2147483648
	li $t6, -2147483648
	

	# move $t3, $var
	# move $t4, $var
	# move $t5, $var
	# move $t6, $var

loop:
	beq $t2, $t0, end

	addi $t2, $t2, 1
	
	li $v0, 5
	syscall
	move $t1, $v0

	bge $t1, $t6, if1
	bge $t1, $t5, if2
	bge $t1, $t4, if3
	bge $t1, $t3, if4
	ble $t1, $t3, if5

if1:
	move $t3, $t4
	move $t4, $t5
	move $t5, $t6
	move $t6, $t1
	j loop

if2:
	move $t3, $t4
	move $t4, $t5
	move $t5, $t1
	j loop

if3:
	move $t3, $t4
	move $t4, $t1
	j loop

if4:
	move $t3, $t1
	j loop

if5:
	beq $t3, $t4, assign
	j loop

assign:
	move $t3, $t1

	j loop 
end:
	
	li $v0, 4 
	la $a0, prompt3 
	syscall 

	li $v0, 5 # read keyboard into $v0 (number x is number to test) 
	syscall 
	move $t7,$v0 # k in $t7
	bge $t7, $t0, error 

	la $a0, answer
	li $v0, 4
	syscall

	beq $t7, 1, print1
	beq $t7, 2, print2
	beq $t7, 3, print3
	beq $t7, 4, print4		

print1:
	li $v0, 1
	move $a0, $t6
	syscall

	li $v0, 10
	syscall

print2:
	li $v0, 1
	move $a0, $t5
	syscall

	li $v0, 10
	syscall

print3:
	li $v0, 1
	move $a0, $t4
	syscall

	li $v0, 10
	syscall

print4:
	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10
	syscall


error:
	la $a0, error_statement
	li $v0, 4
	syscall

	li $v0, 10
	syscall

.data 

	prompt1: .asciiz "Enter count(number of integers to be input): " 
	prompt2: .asciiz "Enter integers:" 
	prompt3: .asciiz "Enter k: "
	answer: .asciiz "kth largest integer is: "
	error_statement: .asciiz "Error"
	endl: .asciiz "\n"