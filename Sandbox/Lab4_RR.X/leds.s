/* leds.S
Written <date> by <your_name>@hmc.edu
Test PIC by turning on LEDs */

# #include <P32xxxx.h>

# Define constants
#define LEDS 0xA5


# Define functions
.global main

# Compiler instructions
.text # store the code in the main program section of RAM
.set noreorder # do not let the compiler reorganize your code

.ent main
main:
addi $sp, $sp, -20 # make space for five registers on the stack

addi $s0, $0, 4 # set s0 = 4
sw $s0, 16($sp) #save s0 on the stack

addi $s1, $0, 2 # set s1 = 2
sw $s1, 12($sp) #save s1 on the stack

addi $s2, $0, 4 # set s2 = 4
sw $s2, 8($sp) #save s2 on the stack

addi $s3, $0, 0 # set s3 = 0
sw $s3, 4($sp) #save s3 on the stack

addi $s4, $0, -4 # set s4 = -4
sw $s4, 0($sp) #save s4 on the stack

addi $s6, $0, 0 #set the counter for the loopIN at 0
addi $s5, $0, 0 #set the counter for the loopOUT at 0
addi $s0, $sp, 0 # set t2= sp.
addi $s7, $0, 4 # the number of elements to be sorted

#This register will act as a "fake stack pointer" so we don't have
#to move the real one

#loopOUT:
loopIN:
lw $s1, 4($s0) #find the 1st number to compare
lw $s2, 0($s0) #find the 2nd number to compare

slt $t3, $s1, $s2 # compare s1, and s2. Store the result in t3
bne $t3, $zero, else # if 1st < 2nd,then t3 = 1. No swtiching needs to be done
nop
sw $s1, 0($s0) #swap position of two numbers if the first is greater
sw $s2, 4($s0) #than the second

else:
addi $s0, $s0, 4 # move the fake stack pointer down to the next number

addi $s6, $s6, 1 #for the inner loop, n = n+1

slt $t4,$s6, $s7 #see if you should loop again (is n<5?)
bne $t4, $0, loopIN # if n<5, then t4=1. if so, we want to continue looping
nop

addi $sp, $sp, 20 #reset the stack

.end main


# Write Init

.ent writeinit # Start function block

writeinit:
la $t0, TRISD 	# Load the address of TRISD into $t0
addi $t1, $0, 0xFF00
sw $t1, 0($t0) 	# TRISD = 0xF00 (bottom 8 bits outputs)
addi $t1, $zero, 0x0A 	# $t1 = LEDS (LEDS + 0)

write: 			# This is a label you can jump to
la $t0, PORTD 	# Load the address of PORTD into $t0
sw $t1, 0($t0) 	# PORTD = $t1
j write 		# Jump back to write
nop

.end writeinit # End function block

