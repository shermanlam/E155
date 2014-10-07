/*
This uses bubble sort to sort a list of 12, 32-bit numbers

Author: Sherman Lam
Date: 10/5/14
Email: slam@g.hmc.edu
*/

.global main        # start the main function

# Compiler instructions
.text               # store the code in the main program section of RAM
.set noreorder      # do not let the compiler reorganize your code

# define globals
#define LST1a   0x0     # top 16 bits of the number
#define LST1b   0xC     # bottom 16 ibts of the number
#define LST2a   0x1     # top 16 bits of the number
#define LST2b   0xB     # bottom 16 ibts of the number
#define LST3a   0x0     # top 16 bits of the number
#define LST3b   0xA     # bottom 16 ibts of the number
#define LST4a   0x0     # top 16 bits of the number
#define LST4b   0x9     # bottom 16 ibts of the number
#define LST5a   0x0     # top 16 bits of the number
#define LST5b   0x8     # bottom 16 ibts of the number
#define LST6a   0x0     # top 16 bits of the number
#define LST6b   0x7     # bottom 16 ibts of the number
#define LST7a   0x0     # top 16 bits of the number
#define LST7b   0x6     # bottom 16 ibts of the number
#define LST8a   0x0     # top 16 bits of the number
#define LST8b   0x5     # bottom 16 ibts of the number
#define LST9a   0x0     # top 16 bits of the number
#define LST9b   0x4     # bottom 16 ibts of the number
#define LST10a  0x0     # top 16 bits of the number
#define LST10b  0x3     # bottom 16 ibts of the number
#define LST11a  0x0     # top 16 bits of the number
#define LST11b  0x2     # bottom 16 ibts of the number
#define LST12a  0xFFFF     # top 16 bits of the number
#define LST12b  0xFFFF     # bottom 16 ibts of the number

# Register use:
#   $t0 = counter (i)
#   $t1 = i*4
#   $t2 = slt results
#   $t3 = lower number (n1)
#   $t4 = upper number (n2)
#   $t5 = flag. 1 if list is sorted. 0 if not.
#   $t6 = 4
#   $t7 = ADDR + i*4
#   $t8 = 
#   $s0 = 
#   $s1 = number

.ent main

main:
    # load 12 numbers into the stack
    lui     $s1, LST1a      # load first half of the number into reg
    ori     $s1, LST1b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST2a      # load first half of the number into reg
    ori     $s1, LST2b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST3a      # load first half of the number into reg
    ori     $s1, LST3b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST4a      # load first half of the number into reg
    ori     $s1, LST4b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST5a      # load first half of the number into reg
    ori     $s1, LST5b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST6a      # load first half of the number into reg
    ori     $s1, LST6b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST7a      # load first half of the number into reg
    ori     $s1, LST7b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST8a      # load first half of the number into reg
    ori     $s1, LST8b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST9a      # load first half of the number into reg
    ori     $s1, LST9b      # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST10a     # load first half of the number into reg
    ori     $s1, LST10b     # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST11a     # load first half of the number into reg
    ori     $s1, LST11b     # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    lui     $s1, LST12a     # load first half of the number into reg
    ori     $s1, LST12b     # load second half of the number into reg
    addi    $sp, $sp, -4    # add mem
    sw      $s1, 0($sp)     # load number into ram
    
    add     $t5, $0, $0     # start a flag that indicates if the list is sorted.
    addi    $t6, $0, 4      # load 4 into $t6
while:                      # start of while loop
    bne     $t5, $0, done   # if $t5!=0, the list is sorted
    nop
    addi    $t5, $0, 1      # set the flag to sorted
    add     $t0, $0, $0     # init i at 0 
for:                        # start of for loop
    sltiu   $t2, $t0, 11    # make sure that the counter has not exceeded the length of the list
    beq     $t2, $0, while  # if the for loop is over, jump back to the while loop
    nop
    mul     $t1, $t0, $t6   # calc i*4
    add     $t7, $sp, $t1   # calc stack pointer + i*4
    lw      $t3, 0($t7)     # load the number stored at the top of the stack (lowest addr) [n1]
    lw      $t4, 4($t7)     # load the 2nd to last number [n2]
    add     $t0, $t0, 1     # increment the counter
    slt     $t2, $t3, $t4   # check if n1 < n2 (out of order)
    beq     $t2, $0, for    # pass if the numbers are in order ($t2=0)
    nop
    sw      $t3, 4($t7)     # put n1 in n2's spot
    sw      $t4, 0($t7)     # put n2 in n1's spot
    add     $t5, $0, $0     # set the flag to 0 since the list is not sorted
    j       for
    nop
done:
    
    jr      $ra             # return to function call
    nop

.end main
