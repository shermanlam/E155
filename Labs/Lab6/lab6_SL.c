#include <stdio.h>


/* Functions prototypes */
void initUART(void);
void initMODE(void);
void initSTA(void);
void tx(char);
char rx(void);
long dataRdy(void);
void initBRG(void);


/*
This inits UART control register values.

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initUART(void){
	//call all the individual init functions
	initMODE();
	initSTA();
	initBRG();
}


/* 
This inits the control register U2MODE

bit 15 (ON) = 1 ->		turn UART on
bit 14 (FRZ) = 1 -> 	freeze when in debug mode
bit 13 (SIDL) = 1 ->	Stop in idle mode
bit 11 (RTSMD) = 1 ->	Simplex Mode
bit 9-8 (UEN) = ??
bit 7 (WAKE) = 11 ->	Wake if start bit detected
bit 2-1 (PDSEL) = 00 ->	8 bit data, no parity
bit 0 (STSEL) = 0 ->	1 stop bit

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initMODE(void){

}


/*
This inits the control register U2STA

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initSTA(void){

}


/*
This inits the control register BRG

bit 15-0 = 115k -> with 20MHz clk, 113.6 baud rate

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initBRG(void){

}


/*
This writes 8 bits of data to the tx register.
Input: an 8 bit message to send

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-17-14
*/
void tx(char msg){
	U2TXREG = msg;
}


/*
This checks the status register if data is ready.
Returns 0 if not ready, 1 if is ready

Author: Sherman
Email: slam@g.hmc.edu
Date: 10-17-14
*/
bool dataRdy(void){
	//read status reg
	long stat = U2STA;
	//mask off the last bit;
	bool rdy = stat & 0x1;
	return rdy;
}


/*
This reads the next 3 char from the rx buffer
Output: a pointer to the beginning of the array

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-17-14
*/
*char rx(void){
	bool rdy;
	char data;
	char msg[3];		//3 char message

	//read the next 3 numbers in the buffer
	for(int i=0; i<3; i++){
		//wait until data is ready
		do{
			rdy = dataRdy();
		} while(rdy==0)
		
		//when data is ready, read from buffer. Use lower 8 bits
		data = U2RXREG & 0xFF;
		
		//store message in array
		msg[i] = data;

		//clear
		rdy = 0;
		data = 0;
	}

	//return the pointer
	return &msg;
}


/*
This waits until there is a char available from the serial port and returns it

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-23-14
*/
char getcharserial(void){
	//wait for data to be available
	while(~(U2STA & 0x1)){}

	//return char
	return U2RXREG & 0xFF;
}


/* This reads a string from serial

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-23-14


/*
This is the main loop for interfacing with the calculator

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void main(void){
	// initialize the UART communiations
	initUART();

	//loop
	while(1){
		//TODO: This won't work! Need to parse 3 chars in a row...
		//check if data is available
		bool rdy = dataRdy();
		if (rdy){
			//if so, get data
			char input = rx();
			//parse user input
			
			//do the math

			//transmit result
		}
	}
}