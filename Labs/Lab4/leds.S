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
# Main program
.ent main # Start function block
main:
la $t0, TRISD # Load the address of TRISD into $t0
addi $t1, $0, 0xFF00
sw $t1, 0($t0) # TRISD = 0xF00 (bottom 8 bits outputs)
addi $t1, $zero, LEDS # $t1 = LEDS (LEDS + 0)
write: # This is a label you can jump to
la $t0, PORTD # Load the address of PORTD into $t0
sw $t1, 0($t0) # PORTD = $t1
j write # Jump back to write
nop
.end main # End function block