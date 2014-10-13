main(){
	// setup timers
	T1CON = 11xx_xxxx_xx11_xxx0; 	// x = don't care
	T2CON = 11xx_xxxx_x010_xx0x;

	// setup outputs
	TRISG = 1111_1111_0111_1111;	// make port 7 an output

	// start playing the song
	int i = 0;
	while(true){
		int word = _notes[i];

		// check for end of song
		if (word == 0){
			break;
		}

		int halfPeriod = word[15:8];
		int duration = word[7:0];

		// play for duration
		TMR1 = 0
		TMR2 = 0
		while(TMR1 < duration){
			//toggle according to the period
			if (TMR2 >= halfPeriod){
				//toggle output
				PORTG[7] = ~PORTG[7];
				TMR2 = 0;
			}
		}
		//move to next note
		i++;
	}
}
