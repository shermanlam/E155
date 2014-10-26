#include <stdio.h>

void main(void){
	// set TRISD
	TRISD = 0xFF0;

	// read switches on PORTD
	uint16 switches = PORTD & (0xF<<8);

	// write LEDs on PORTD
	while(1){
		PORTD = (PORTD >> 8) & 0xF;
	}
}
