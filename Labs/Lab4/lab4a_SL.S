
#include <P32xxxx.h>
.global main
# Compiler instructions
.text # store the code in the main program section of RAM
.set noreorder # do not let the compiler reorganize your code

# define globals
#define LST1 0x1
#define LST2 0x2
#define LST3 0x3
#define LST4 0x4
#define LST5 0x5


# Register use:
#	$t0 = counter (i)
# 	$t1 = i*4
# 	$t2 = slt results
# 	$t3 = lower number (n1)
#	$t4 = upper number (n2)
# 	$t5 = flag. 1 if list is sorted. 0 if not.
# 	$t6 = 4
# 	$t7 = stack pointer + i*4
# 	$t8 = address of leds
# 	$s0	= 
#   $s1 = number to load / store to memory

.ent main

main:
	# load 12 numbers into the stack
	addi 	s1, zero, LST1	# load a number in reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	addi 	s1, zero, LST2	# load a number in reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	addi 	s1, zero, LST3	# load a number in reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	addi 	s1, zero, LST4	# load a number in reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	addi 	s1, zero, LST5	# load a number in reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	
	add 	t5, zero, 0 	# start a flag that indicates if the list is sorted.
	addi	t6, zero, 4		# load 4 into $t6
while: 						# start of while loop
	bne		t5, zero, done	# if $t5~=0, the list is sorted
	nop
	addi	t5, zero, 1		# set the flag to sorted
	add 	t0, zero, zero	# init i at 0 
for:						# start of for loop
	sltiu	t2, t0, 4 		# make sure that the counter has not exceeded the length of the list
	beq		t2, zero, while	# if the for loop is over, jump back to the while loop
	nop
	mul		t1, t0, t6		# calc i*4
	add 	t7, sp, t1		# calc stack pointer + i*4
	lw		t3, 0(t7)		# load the number stored at the top of the stack (lowest addr) [n1]
	lw 		t4, 4(t7)		# load the 2nd to last number [n2]
	add 	t0, t0, 1 		# increment the counter
	slt 	t2, t3, t4		# check if n1 < n2 (out of order)
	beq		t2, zero, for   # pass if the numbers are in order ($t2=0)
	nop
	sw 		t3, 4(t7)		# put n1 in n2's spot
	sw 		t4, 0(t7)		# put n2 in n1's spot
	add 	t5, zero, zero 	# set the flag to 0 since the list is not sorted
	j		for
	nop
done:
	lw		s1, 0(sp)		# load the largest number in $s1
	la		t8, PORTD		# load the address of PORTD into $t8
	sw		s1, 0(t8)		# store the number in PORTD
	jr		ra				# return to function call
	nop

.end main
