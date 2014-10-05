
#include <P32xxxx.h>
.global main
# Compiler instructions
.text # store the code in the main program section of RAM
.set noreorder # do not let the compiler reorganize your code

# define globals
#define LST1a   0x0
#define LST1b   0x1
#define LST2a   0x0
#define LST2b   0x2
#define LST3a   0x0
#define LST3b   0x3
#define LST4a   0x0
#define LST4b   0x4
#define LST5a   0x0000
#define LST5b   0xFFFF

#define PINMODE     0xF00       # 1 = input, 0 = output


# Register use:
#	$t0 = counter (i)
# 	$t1 = i*4
# 	$t2 = slt results
# 	$t3 = lower number (n1)
#	$t4 = upper number (n2)
# 	$t5 = flag. 1 if list is sorted. 0 if not.
# 	$t6 = 4
# 	$t7 = stack pointer + i*4
# 	$t8 = address of PORTD and TRISD
# 	$s0	= 
#   $s1 = number to load / store to memory

.ent main

main:
	# load 5 numbers into the stack
	lui 	s1, LST1a       # load first half of the number into reg
    ori     s1, LST1b       # load second half of the number into reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	lui 	s1, LST2a       # load first half of the number into reg
    ori     s1, LST2b       # load second half of the number into reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	lui 	s1, LST3a       # load first half of the number into reg
    ori     s1, LST3b       # load second half of the number into reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	lui 	s1, LST4a       # load first half of the number into reg
    ori     s1, LST4b       # load second half of the number into reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram
	lui 	s1, LST5a       # load first half of the number into reg
    ori     s1, LST5b       # load second half of the number into reg
	addi	sp, sp, -4		# add mem
	sw		s1, 0(sp)		# load number into ram

    # pin configuration
    la      t8, TRISD       # load the address of TRISD into t8
    addi    s1, zero, PINMODE     # load the pinmodes into s1
    sw      s1, 0(t8)       # set which pins are inputs or outputs.

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
	sw		s1, 0(t8)		# store the number in PORTD -> write to LEDs
	jr		ra				# return to function call
	nop

.end main
