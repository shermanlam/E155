/* This code plays music!

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-9-2014
*/


# REGISTER USE
# t0 = register address
# t1 = register value
# t2 = masking operations
# t3 = note period
# t4 = duration
# t5 = address of note
# t6 = algebra intermediate values
# s0 = PORTB address
# s1 = PORTB output



# load a header file for pin / register definitions
#include <P32xxxx.h>

# Define constants
#define PBDIV 0x3       # prescaler for peripheral clock. 0x3 = 1:8

# Define main function
.global main

# Compiler instructions
.text # store the code in the main program section of RAM
.set noreorder # do not let the compiler reorganize your code

# Main program
.ent main # Start function block
main:
    nop

    # setup peripheral clock. Default is 1:8 but let's set it anyways
    # OSCCON:
    #   bit 20-19 = 11 -> 1:8 prescalar
    #la      t0, OSCCON      # OSCCON = oscillator control register
    #lw      t1, 0(t0)       # get the value of OSCCON
    #li      t2, 0xFFE7FFFF  # mask for clearing PBDIV, which is bits 20-19
    #and     t1, t1, t2      # use the mask to set PBDIV to 00
    #li      t2, 0x3         # load mask for setting PBDIV
    #sll     t2, t2, 19      # shift the mask to the right location
    #or      t1, t1, t2      # set desired PBDIV
    #sw      t1, 0(t0)       # load new value into OSCCON
    # THIS DOESN"T WORK. GETS OVERRIDED BY CONFIG BITS

    # setup timer 1 (for 1 unit of signal duration = 51.2us)
    # T1CON:
    #   bit 15  = 1     -> on
    #       14  = 1     -> freeze on debug exception
    #       5-4 = 11    -> 1:256 prescaler
    #       1   = 0     -> use peripheral clock
    la      t0, T1CON       # load address of T1CON
    lw      t1, 0(t0)       # get the value of T1CON
    andi    t1, t1, 0xFFFD  # use a mask to set the 0 bit
    ori     t1, t1, 0xC030  # use a mask to set the 1 bits
    sw      t1, 0(t0)       # load new value to T1CON

    # setup timer 2 (for half signal period = 0.8us)
    # T2CON:
    #   bit 15  = 1     -> on
    #       14  = 1     -> freeze on debug exception
    #       6-4 = 010   -> 1:256 prescaler
    #       1   = 0     -> use peripheral clock
    la      t0, T2CON       # load address of T2CON
    lw      t1, 0(t0)       # get the value of T2CON
    andi    t1, t1, 0xFFAD  # use a mask to set the 0 bits
    ori     t1, t1, 0xC020  # use a mask to set the 1 bits
    sw      t1, 0(t0)       # load new value to T2CON

    # init some variables
    la      t5, _notes      # starting address of _notes

    # init output
    la      t0, TRISG       # load address of TRISG
    lw      t1, 0(t0)       # get value of TRISB
    andi    t1, t1, 0xFF00  # set RG7 as output
    sw      t1, 0(t0)       # store to TRISB
    la      s0, PORTG       # load address of PORTB
    sw      zero, 0(s0)     # start at 0

    # start main loop for playing song
    play:
        nop
        # read the note and duration. If there is no note, end
        lw      t6, 0(t5)             # load notes and duration into algebra register
        beq     t6, zero, end         # branch if there are no more notes
        li      t2, 0xFFFF0000        # mask for duration
        and     t4, t6, t2            # mask off to get duration
        srl     t4, t4, 16            # shift to lower 16bits to get duration
        andi    t3, t6, 0xFFFF        # mask off the note
        li      t6, 0x2               # load 2 into t6
        mul     t4, t4, t6            # multiply duration by 2

        # reset timer 1
        la      t0, TMR1          # get address of timer 1
        sw      zero, 0(t0)       # reset timer to 0

        # reset timer 2
        la      t0, TMR2        # get address of timer 2
        sw      zero, 0(t0)       # reset timer to 0

        # poll the timer until the duration has been met
        dur:
            la      t0, TMR1        # get address of timer 1
            lw      t1, 0(t0)       # poll timer 1
            beq     t1, t4, next    # check if timer 1 has reached duration
            nop

            # while the duration is being held, keep playing the notes
            note:
                la      t0, TMR2        # get address of timer 2
                lw      t1, 0(t0)       # poll timer 2
                slt     t6, t1, t3      # check if time is less than the period
                bne     t6, zero, dur   # if not time to toggle speaker, check duration
                nop
                # toggle!
                li      t6, 0xFFFF      # load -1 into t6
                xor     s1, s1, t6      # xor with -1. This inverts all the bits
                andi    s1, s1, 0x0080  # use mask to only get RG7
                la      s0, PORTG       # load address of PORTG
                sw      s1, 0(s0)       # write the value to PORTG.
                la      t0, TMR2        # get address of timer 2
                sw      zero, 0(t0)     # reset timer 2
                j       dur             # check duration
                nop

        # figure out next offset
        next:
            la      t0, TMR1            # get address of timer 1
            sw      zero, 0(t0)         # reset timer 1
            addi    t5, t5, 4           # get next note's address
            j       play                # play the next note
            nop

    end:
        nop
        jr      ra                  # jump to return address.


# end the function
.end main


# Song notes
    .section .rodata  # Store this information in FLASH instead of RAM
_notes:
    .HWORD 0x3b4, 0x989 # Data
    .HWORD  0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x58c, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x954, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x58c, 0x989
    .HWORD 0x4f1, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x5e0, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x4aa, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x58c, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x954, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x58c, 0x989
    .HWORD 0x4f1, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x58c, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x3b4, 0x1c9c
    .HWORD 0x63a, 0x989
    .HWORD 0x37e, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x428, 0x1c9c
    .HWORD 0x6fd, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x4aa, 0x1c9c
    .HWORD 0x768, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x4f1, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x000, 0x989
    .HWORD 0x000, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x1da, 0x989
    .HWORD 0x000, 0x989
    .HWORD 0x000, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x000, 0x989
    .HWORD 0x000, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x58c, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x954, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x58c, 0x989
    .HWORD 0x4f1, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x5e0, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x4aa, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x3ec, 0x989
    .HWORD 0x3b4, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x428, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x58c, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x954, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x58c, 0x989
    .HWORD 0x4f1, 0x1312
    .HWORD 0x000, 0x989
    .HWORD 0x768, 0x989
    .HWORD 0x4aa, 0x989
    .HWORD 0x4f1, 0x989
    .HWORD 0x58c, 0x2625
    .HWORD 0x000, 0x000
