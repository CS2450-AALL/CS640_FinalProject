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
additionmsg: .asciiz "Your sum is: "
subtractmsg: .asciiz "Your difference is: "
multiplymsg: .asciiz "Your product is: "
dividemsg: .asciiz "Your quotient is: "
options: .asciiz "\n1) Add \n2)Subtract \n3) Multiply\n4) Divide \nPlease select arithmetic option: "
equalNumber: .asciiz "The first numbers are equal ."
notEqualNumber: .asciiz "The first numbers are equal ."


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
        #print out the options to the user
        li $v0, 4
        la $a0, options
        syscall

        #get option selection from user
        li $v0, 5
        syscall
        move $s2, $v0 #store the desired arithmetic option in $s2

         #get the result based off the desired arithmetic option for the two integers
         #branch if s2 is 1, then go to addition label 

         beq $s2, 1, Addition
         beq $s2, 2, Subtraction
         beq $s2, 3, Multiplication
         beq $s2, 4, Division

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

        li $v0, 10
        syscall #ends program

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

        li $v0, 10
        syscall #ends program
        
Multiplication:
        #multiply the two user numbers
        move $t0, $s0   #changes our input $s0 to $t0
        move $t1, $s1
        mult $t2, $t1, $t0 #multiplies both inputs

        li $v0, 4
        la $a0, multiplymsg #prints multiply message
        syscall

        li $v0, 1
        la $a0, ($t2)   #gets our product and executes to screen
        syscall

        li $v0, 10
        syscall #ends program
        
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

        li $v0, 10
        syscall #ends program
        
       
       
#task3
#In this final task, you will practice how to do conditions in Assembly:
# a)If the two user inputs from Task 1 are equal to each other, output "User inputs are the same"
# b) If the two user inputs from Task 1 are not equal to each other, output "User inputs are different"

#compare the user inputs 
	bge $s0, $s1, exactlyEqual #they are equal
	bgt $s0, $s1, notEqual #they are not equal 
	
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