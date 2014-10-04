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
#define LST6 0x6
#define LST7 0x7
#define LST8 0x8
#define LST9 0x9
#define LST10 0xC
#define LST11 0xB
#define LST12 0xA


# Register use:
#	$t0 = counter (i)
# 	$t1 = i*4
# 	$t2 = slt results
# 	$t3 = lower number (n1)
#	$t4 = upper number (n2)
# 	$t5 = flag. 1 if list is sorted. 0 if not.
# 	$t6 = 4
# 	$t7 = ADDR + i*4
# 	$t8 = 
# 	$s0	= 
#   $s1 = number

.ent main

main:
	# load 12 numbers into the stack
	addi 	$s1, $0, LST1	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST2	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST3	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST4	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST5	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST6	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST7	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST8	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST9	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST10	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST11	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	addi 	$s1, $0, LST12	# load a number in reg
	addi	$sp, $sp, -4	# add mem
	sw		$s1, 0($sp)		# load number into ram
	
	add 	$t5, $0, $0 	# start a flag that indicates if the list is sorted.
	addi	$t6, $0, 4		# load 4 into $t6
while: 						# start of while loop
	bne		$t5, $0, done	# if $t5~=0, the list is sorted
	nop
	addi	$t5, $0, 1		# set the flag to sorted
	add 	$t0, $0, $0		# init i at 0 
for:						# start of for loop
	sltiu	$t2, $t0, 11 	# make sure that the counter has not exceeded the length of the list
	beq		$t2, $0, while	# if the for loop is over, jump back to the while loop
	nop
	mul		$t1, $t0, $t6	# calc i*4
	add 	$t7, $sp, $t1	# calc stack pointer + i*4
	lw		$t3, 0($t7)		# load the number stored at the top of the stack (lowest addr) [n1]
	lw 		$t4, 4($t7)		# load the 2nd to last number [n2]
	add 	$t0, $t0, 1 	# increment the counter
	slt 	$t2, $t3, $t4	# check if n1 < n2 (out of order)
	beq		$t2, $0, for    # pass if the numbers are in order ($t2=0)
	nop
	sw 		$t3, 4($t7)		# put n1 in n2's spot
	sw 		$t4, 0($t7)		# put n2 in n1's spot
	add 	$t5, $0, $0 	# set the flag to 0 since the list is not sorted
	j		for
done:
	nop
	jr		$ra

.end main
