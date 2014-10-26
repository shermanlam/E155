#include <stdio.h>
#include <P32xxxx.h>

/* Functions prototypes */
void initMODE(void);
void initSTA(void);
void initBRG(void);
char getcharserial(void);
void getstrserial(char*);
void sendcharserial(char);
void sendstrserial(char*);
int parse(char*);


/*
This inits UART control register values.

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initUART(void){
    TRISFbits.TRISF5 = 0;
    TRISFbits.TRISF4 = 1;
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
bit 7 (WAKE) = 1 ->		Wake if start bit detected
bit 2-1 (PDSEL) = 00 ->	8 bit data, no parity
bit 0 (STSEL) = 0 ->	1 stop bit

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initMODE(void){
	//U2MODE = U2MODE & 0b1111111111111000;	//set 0s
	//U2MODE = U2MODE | 0b1110100010000000;	//set 1s
    U2MODE = 0x8000;
}


/*
This inits the control register U2STA

bit 12 (URXEN) = 1 ->	enable receive
bit 10 (UTXEN) = 1 -> 	enable transmit

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initSTA(void){
	//U2STA = U2STA & 0b1111111111111111;		//set 0s
	//U2STA = U2STA | 0b0001010000000000;		//set 1s
    U2STA = 0x1400;
}


/*
This inits the control register BRG

bit 15-0 = 115k -> with 20MHz clk, 113.6 baud rate

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initBRG(void){
	//U2BRG = 115000;
    U2BRG = 10;
}


/*
This waits until there is a char available from the serial port and returns it

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-23-14
*/
char getcharserial(void){
	//wait for data to be available
        //printf("Reading serial\n");
	while(!(U2STA & 0x1)){}

	//return char
	return U2RXREG;
}


/* This reads a string from serial

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-23-14
*/
void getstrserial(char* str){
    /*
	//index for storing to buffer
	int i = 0;

	while(1){
		//read the next char
            //printf("Reading next\n");
		char data = getcharserial();

		//check if this is the end of the string (signalled by carriage return)
		if (data == '\r'){
                    //printf("end\n");
			return;
		}

		//write to buffer
		else{
			buf[i] = data;
			i++;
		}
	}
     */
    int i = 0;
    do { // read an entire string until detecting
    str[i] = getcharserial(); // carriage return
    } while (str[i++] != '\r'); // look for carraige return
    str[i-1] = 0; // null-terminate the string
}


/* This writes a single char to the tx register

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-23-14
*/
void sendcharserial(char data){
	//wait until the transmit buffer has space
	while(U2STA & 0x200){}			// if bit 9 = 1 -> buffer full

	//write to buffer
	U2TXREG = data;
}


/* This writes a string to the tx register

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-23-14
*/
void sendstrserial(char* str){
	//first send a newline and carriage return symbol to start 
	//at the beginning of a new line
	sendcharserial('\n');
	sendcharserial('\r');

	//send the str
	int i = 0;
	while(str[i] != 0){
		sendcharserial(str[i]);
		i++;
	}
}

/* This method checks is the char is number
 *
 * Author: Sherman Lam
 * Email: slam@g.hmc.edu
 * Date: 10-24-14
 */


/* This method cleans the string of new line chars, spaces, etc
 *
 * Author: Sherman Lam
 * Email: slam@g.hmc.edu
 * Date: 10-24-14
 */
void clean(char* input, char* output){
    char c = '0';
    int i = 0;      // index for iterating through input
    int j = 0;      // index for iterating through output
    do{
        c = input[i];
        if (c == ' '){}         //check if char is whitespace.
        else if ((int)c == 127){       // backspace
            j--;
            if (j<0){
                j=0;
            }
        }
        else{
            output[j] = c;
            j++;
        }
        i++;
    } while (c != 0);

    //write null terminator
    output[j] = 0;
    
}


/* This method checks if the input char is a number
 between 0 and 9

 Author: Sherman Lam
 Email: slam@g.hmc.edu
 Date: 10-25-14
 */
int isNum(char c){
    return ((48<=c) && (c<=57));
}


/* This method checks if the input char is a valid operator

 Author: Sherman Lam
 Email: slam@g.hmc.edu
 Date: 10-25-14
 */
int isOp(char c){
    int state = 0;
    //check all supported operators
    state |= (c=='+');
    state |= (c=='-');
    state |= (c=='*');
    state |= (c=='/');
    return state;
}


/* This method does math given two integers and an operator

 Name: Sherman Lam
 Email: slam@g.hmc.edu
 Date: 10-25-14
 */
int domath(int a1, int a2, char op){
    if (op == 43){      // +
        return a1 + a2;
    }
    if (op == 45){      // -
        return a1 - a2;
    }
    if (op == 42){      // *
        return a1 * a2;
    }
    if (op == 47){      // /
        return a1 / a2;
    }
    else{
        printf("Operation: %c is not supported.\n\r");
        return 0;
    }
}



/*
 This method parses the string and chooses which operation to perform

 Author: Sherman Lam
 Email: slam@g.hmc.edu
 Date: 10-24-14
 */
int parse(char* str){
    int i = 0;          // for indexing through string
    char n1[8];         // first num
    char n2[8];         // second num
    char c;             // a char
    int a1 = 0;         // number argument 1
    int a2 = 0;         // number argument 2
    char op = 0;        // operator
    //get the first number
    do{
        c = str[i];
        if (isNum(c)){
            a1 += a1*10+(c-48);
        }
        i++;
    } while(isNum(c));  // check for number

    //get the operator
    op = c;

    //get the second number
    do{
        c = str[i];
        if (isNum(c)){
            a2 += a2*10+(c-48);
        }
        i++;
    } while(c != 0);  // check for null terminator

    return domath(a1,a2,op);
}


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
            //prompt the user for an equation
            sendstrserial("Please enter an equation: \n\r");

            //read the string
            char str[80];
            getstrserial(str);
            printf("\n\rYou typed: %s\n\r", str);

            //clean and parse the string
            char str1[80];
            clean(str,str1);
            printf("\n\rCleaned string: %s\n\r", str1);
            int result = parse(str1);
            printf("Answer: %d \n\r", result);

            //send back the results
            
        }
}