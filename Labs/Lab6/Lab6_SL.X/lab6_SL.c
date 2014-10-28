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
void parse(char*);


/*
This inits UART control register values.

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initUART(void){
    // set I/O pins
    TRISFbits.TRISF5 = 0;
    TRISFbits.TRISF4 = 1;
    
        //call all the individual init functions
	initMODE();
	initSTA();
	initBRG();
}


/* 
This inits the control register U2MODE. From lecture slides.

bit 31-16: unused
bit 15: ON = 1: enable UART
bit 14: FRZ = 0: don't care when CPU in normal state
bit 13: SIDL = 0: don't care when CPU in normal state
bit 12: IREN = 0: disable IrDA
bit 11: RTSMD = 0: don't care if not using flow control
bit 10: unused
bit 9-8: UEN = 00: enable U1TX and U1RX, disable U1CTSb and U1RTSb
bit 7: WAKE = 0: do not wake on UART if in sleep mode
bit 6: LPBACK = 0: disable loopback mode
bit 5: ABAUD = 0: don't auto detect baud rate
bit 4: RXINV = 0: U1RX idle state is high
bit 3: BRGH = 0: standard speed mode
bit 2-1: PDSEL = 00: 8-bit data, no parity
bit 0: STSEL = 0: 1 stop bit

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initMODE(void){
    U2MODE = 0x8000;
}


/*
This inits the control register U2STA. From lecture

bit 31-25: unused
bit 24-16: write 0 when not using auto address detect
bit 15-14: UTXISEL = 00: interrupt when TX buffer not full
bit 13: UTXINV = 0: U1TX idle state is high
bit 12: URXEN = 1: enable receiver
bit 11: UTXBRK = 0: disable break transmission
bit 10: UTXEN = 1: enable transmitter
bit 9: UTXBF: don't care (read-only)
bit 8: TRMT: don't care (read-only)
bit 7-6: URXISEL = 00: interrupt when receive buffer not empty
bit 5: ADDEN = 0: disable address detect
bit 4: RIDLE: don't care (read-only)
bit 3: PERR: don't care (read-only)
bit 2: FERR: don't care (read-only)
bit 1: OERR = 0: reset receive buffer overflow flag
bit 0: URXDA: don't care (read-only)

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initSTA(void){ 
    U2STA = 0x1400;
}


/*
This inits the control register BRG. From lecture slides

Want rate of 115.2 Kbaud
Assuming PIC peripheral clock Fpb = Fosc / 2 = 20 MHz
based on default instructions in lab 1.
U3BRG = (Fpb / 4*baud rate) - 1
-> U3BRG = 10 (decimal)
Actual baud rate 113636.4 (-1.2% error)

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 10-16-14
*/
void initBRG(void){
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
	//index for storing to buffer
	int i = 0;

	while(1){
		//read the next char
            //printf("Reading next\n");
		char data = getcharserial();

		//check if this is the end of the string (signalled by carriage return)
		if (data == '\r'){
                        str[i] = 0;         //null terminate string
			return;
		}

		//write to buffer
		else{
			str[i] = data;
			i++;
		}
	}
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
void domath(int a1, int a2, char op){
    int answer = 0;
    if (op == 43){      // +
        answer = a1 + a2;
    }
    else if (op == 45){      // -
        answer = a1 - a2;
    }
    else if (op == 42){      // *
        answer = a1 * a2;
    }
    else if (op == 47){      // /
        if (a2==0){
            printf("Cannot divide by 0 \n");
            return;
        }
        answer = a1 / a2;
    }
    else{
        printf("Operation: %c is not supported.\n\r");
        return;
    }

    printf("Answer: %d \n",answer);
}



/*
 This method parses the string and chooses which operation to perform

 Author: Sherman Lam
 Email: slam@g.hmc.edu
 Date: 10-24-14
 */
void parse(char* str){
    int i = 0;          // for indexing through string
    char c;             // a char
    int a1 = 0;         // number argument 1
    int a2 = 0;         // number argument 2
    char op = 0;        // operator
    int update1 = 0;    // whether a1 was set
    int update2 = 0;    // whether a2 was set
    //get the first number
    do{
        c = str[i];
        if (isNum(c)){
            a1 += a1*10+(c-48);
            update1 = 1;
        }
        //throw an error if a number was not entered
        else if (!isOp(c)){
            printf("Equation invalid \n");
            return;
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
            update2 = 1;
        }
        //throw an error if a number was not entered
        else if (!(c==0)){
            printf("Equation invalid \n");
            return;
        }
        i++;
    } while(c != 0);  // check for null terminator

    //printf("a1: %d, a2: %d, op: %d \n",a1,a2,op);
    if(update1 && update2){
        domath(a1,a2,op);
    }
    else{
        printf("Incomplete equation \n");
    }
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
            sendstrserial("Please enter an equation \n\r");

            //read the string
            char str[80];
            getstrserial(str);
            printf("\rYou typed: %s\n\r", str);

            //clean and parse the string
            char str1[80];
            clean(str,str1);
            parse(str1);
            
        }
}