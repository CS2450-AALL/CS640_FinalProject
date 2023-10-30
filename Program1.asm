#CS2640
#Oct. 27, 2023
#write a program that takes in two numbers from a user
#output the users input
#have the user select from an output mean of 4 arithmetic options
#display the result in the output to the user

.data
prompt1: .asciiz "Please enter first integer:"
prompt2: .asciiz "Please enter second integer:"
inputs: .asciiz "Your inputs are: "
comma: .asciiz ","
additionmsg: .asciiz "\nYour sum is: "
subtractmsg: .asciiz "\nYour difference is: "
multiplymsg: .asciiz "\nYour product is: "
dividemsg: .asciiz "\nYour quotient is: "
equalNumber: .asciiz "\nUser inputs are the same."
notEqualNumber: .asciiz "\nUser inputs are different."

.text
main:

#task 1:
        #print out prompt1 and get first integer
        li $v0, 4       #tells computer to print out a string
        la $a0, prompt1 #computer gets what string to print and executes it, gets prompt 1
        syscall
        li $v0, 5
        syscall
        move $s0, $v0 #stores the user's first integer in $s0

        #print out prompt2
        li $v0, 4
        la $a0, prompt2
        syscall
        li $v0, 5
        syscall
        move $s1, $v0 #stores the user's second integer in $s1

        #print user's inputs
        li $v0, 4
        la $a0, inputs
        syscall

        li $v0, 1
        move $a0, $s0
        syscall

        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        move $a0, $s1
        syscall
        
        
        



#task 2

Addition:
        #add the two user numbers
        move $t0, $s0   #changes our input $s0 to $t0
        move $t1, $s1
        add $t2, $t1, $t0 #adds both inputs

        li $v0, 4
        la $a0, additionmsg #prints add message
        syscall

        li $v0, 1
        la $a0, ($t2)   #gets our sum and executes to screen
        syscall


Subtraction:
        #subtract two user numbers
        move $t0, $s0
        move $t1, $s1
        sub  $t2, $t0, $t1

        li $v0, 4
        la $a0, subtractmsg
        syscall

        li $v0, 1
        la $a0, ($t2)
        syscall

        
Multiplication:
        #multiply the two user numbers
        move $t0, $s0   #changes our input $s0 to $t0
        move $t1, $s1
        mul $t2, $t1, $t0 #multiplies both inputs

        li $v0, 4
        la $a0, multiplymsg #prints multiply message
        syscall

        li $v0, 1
        la $a0, ($t2)   #gets our product and executes to screen
        syscall

        
Division:
        #divide the two user numbers
        move $t0, $s0   #changes our input $s0 to $t0
        move $t1, $s1
        div $t2, $t1, $t0 #divides both inputs

        li $v0, 4
        la $a0, dividemsg #prints divide message
        syscall

        li $v0, 1
        la $a0, ($t2)   #gets our quotient and executes to screen
        syscall


#task3
        beq $s0, $s1, exactlyEqual #they are equal
	bne $s0, $s1, notEqual #they are not equal 
	
exactlyEqual:	
	#if $s0 and $s1 are exactly equal, print equalNumber
	li $v0, 4
	la $a0, equalNumber
	syscall
	
	j exit
	
notEqual:
	#if $s0 and $s1 are not equal, print notEqualNumber
	li $v0, 4
	la $a0, notEqualNumber
	syscall
        
	li $v0, 10
        syscall #ends program
        
exit:
	li $v0, 10
	syscall #end program 
