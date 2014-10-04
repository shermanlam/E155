.global main
# Compiler instructions
.text # store the code in the main program section of RAM
.set noreorder # do not let the compiler reorganize your code

# define globals
# #define ADDR				# address of the lowest value stored in the stack

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
# 	$s0	= ADDR

.ent main

	lui		$s0, 0x0000		# load the first 16 bits of the address
	ori		$s0, 0x0000		# load the last 16 bits of the address
	add 	$t5, $0, $0 	# start a flag that indicates if the list is sorted.
while: 						# start of while loop
	bne		$t5, $0, end	# if $t5~=0, the list is sorted
	nop
	add 	$t0, $0, $0		# init i at 0 
for:						# start of for loop
	sltiu	$t2, $t0, 11 	# make sure that the counter has not exceeded the length of the list
	beq		$t2, $0, while	# if the for loop is over, jump back to the while loop
	nop
	mul		$t1, $t0, $t6	# calc i*4
	add 	$t7, $s0, $t1	# calc ADDR + i*4
	lw		$t3, 0($t7)		# load the number stored at the bottom of the stack (lowest addr) [n1]
	lw 		$t4, 4($t7)		# load the 2nd to last number [n2]
	add 	$t0, $t0, 1 	# increment the counter
	slt 	$t2, $t3, $t4	# check if n1 < n2
	bne		$t2, $0, for    # pass if it is in order
	nop
	sw 		$t3, 4($t7)		# put n1 in n2's spot
	sw 		$t4, 0($t7)		# put n2 in n1's spot
	add 	$t5, $0, $0 	# set the flag to 0 since the list is not sorted
end:
	nop

.end main
