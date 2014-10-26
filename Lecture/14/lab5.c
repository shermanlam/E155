#include <stdio.h>

const unsigned short notes[] = {
	948, 2441,
	1004, 2441
}


void init(){
	//timer 1
	T1CON = 0b1100000000110000;
	//timer 2
	T2CON = 0b1100000000100000;
	//output
	TRISD = 0xFFE;		// RBD1 = output
}

void play_note(unsigned short period, unsigned short dur){
	//reset timer
	TMR1 = 0;
	TMR2 = 0;

	//check duration
	while(TMR1 < dur){
		//check period
		if (TMR2 >= period){
			//toggle output pin
			PORTD = (~PORTD) & 0x1; // alt syntax: PORTDbits.RD0;
		}
	}
}


void main(void){
	// init timers
	init();

	int i = 0;
	while(1){
		//parse the note and duration
		unsigned short period = notes[i];
		unsigned short dur = notes[i+1];

		//check for end of song
		if ((period == 0) & (dur == 0)){
			break;
		}

		//play
		else{
			play_note(period,dur);
		}

		//get next
		i += 2;
	}
}