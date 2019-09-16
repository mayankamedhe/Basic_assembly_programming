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

li $v0, 5 # read keyboard into $v0 (number x is number to test) 
syscall 
move $t1,$v0 # first number in $t1 

li $t3, 1 # t3 is counter (i)
loop:

beq $t3, $t0, end # if t3 == t0 end loop
li $v0, 5 # read keyboard into $v0 (number x is number to test) 
syscall 
move $t2,$v0 # second number in $t2 
bge $t1, $t2, CMP2 
move $t1, $t2 # largest number in $t1 
CMP2: 
addi $t3, $t3, 1 # add 1 to t3
j loop # jump back to top

end: 
li $v0, 4 # print answer 
la $a0, answer 
syscall 

li $v0, 1 # print integer function call 1 
move $a0, $t1 # integer to print 
syscall 

li $v0, 10
syscall

.data 

prompt1: .asciiz "Enter count(number of integers to be input): " 
prompt2: .asciiz "Enter integers:" 
answer: .asciiz "Largest integer is: "
endl: .asciiz "\n"