/* This is the project wrapper that inits all the
individual components of the project

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 25, 2014
*/
module lab3_SL(	input logic clk, reset,
						input logic [3:0] col,
						output logic on1,on2,
						output logic [3:0] state,
						output logic [6:0] seg);
	//wires
	logic[3:0] newest;
	logic[3:0] last;
	logic[3:0] lastlast;
	logic pressed;
	logic wasPressed;
	logic loop_clk;
	logic[4:0] led;
	logic[3:0] samples;
	logic[3:0] laststate;
	
	// run the clk at a slower rate
	clk_sm 			subClk(.clk(clk),.reset(reset),.loop_clk(loop_clk));	
	//keep track of the last 2 numbers
	record_sm 		memory(.loop_clk(loop_clk),.reset(reset),.pressed(pressed),
							.newest(newest),.last(last),.lastlast(lastlast),
							.wasPressed(wasPressed));
	//fsm for deciding which row to check next
	row_sm 			row(.loop_clk(loop_clk),.reset(reset),.state(state),.col(col));
	//sample the keys synchronously
	sample_keys		sample(.loop_clk(loop_clk),.reset(reset),.col(col),.samples(samples));
	//remember the last state
	last_state		rememberState(.loop_clk(loop_clk),.state(state),.laststate(laststate));
	//read the rows and cols of the keypad and decode to hex
	decode_keys		read(.laststate(laststate),.samples(samples),.pressed(pressed),.newest(newest));
	// keeps track if key was pressed in the last time step
	record_pressed recordPressed(.loop_clk(loop_clk),.reset(reset),.pressed(pressed),
							.wasPressed(wasPressed));
	
	//seven segment display
	seven_seg_displays		seven_seg(.clk(clk),.reset(reset),.s1(lastlast),
										.s2(last),.on1(on1),.on2(on2),.seg(seg),
										.led(led));
				
endmodule


/* This keeps track of the last state

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 27, 2014
*/
module last_state(input logic loop_clk,
						input logic [3:0] state,
						output logic [3:0] laststate);
		always_ff@(posedge loop_clk) begin
			laststate <= state;
		end
endmodule


/* This is a state machine that is used to keep
track of which row is being checked

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module row_sm( input logic loop_clk, reset,
					input logic [3:0] col,
					output logic [3:0] state);
	
	//state encodings
	parameter ROW1 = 4'b0001;
	parameter ROW2 = 4'b0010;
	parameter ROW3 = 4'b0100;
	parameter ROW4 = 4'b1000;
	
	//next state
	logic [3:0] next;
	
	always_ff@(posedge loop_clk) begin
		if (reset)
			state <= ROW1;
		else if (col == 4'b0000)		//only switch rows when button not pressed.
			state <= next;
		else	
			state <= state;	
		
	end			
	
	always_comb begin
		//next state logic
		case (state)
			ROW1: 		next = ROW2;
			ROW2: 		next = ROW3;
			ROW3: 		next = ROW4;
			ROW4: 		next = ROW1;
			default: 	next = ROW1;
		endcase
	end
	
endmodule


/* This samples the keys at the rising edge of loop_clk.
This is meant to prevent button bounce.

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 26,2014
*/
module sample_keys(	input logic loop_clk, reset,
							input logic [3:0] col, 
							output logic [3:0] samples);
		always_ff@(posedge loop_clk) begin
			if (reset)
				samples <= 4'b0000;
			else begin
				samples <= col;
			end
		end
endmodule


/* This checks whether or not a button has been pressed.

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 25, 2014
*/
module decode_keys(	input logic [3:0] laststate,
						input logic [3:0] samples,
						output logic pressed,
						output logic [3:0] newest);
	logic [4:0] key = 'b0;
	always_comb begin
		//check each row
		case(laststate)
			4'b0001:	casez(samples)			// find the first key
						4'b1???: key = 5'hA;
						4'b01??: key = 5'h3;
						4'b001?: key = 5'h2;
						4'b0001: key = 5'h1;
						default: key = 5'h10;	// no key		
					endcase	
			4'b0010:	casez(samples)			// find the first key
						4'b1???: key = 5'hB;
						4'b01??: key = 5'h6;
						4'b001?: key = 5'h5;
						4'b0001: key = 5'h4;
						default: key = 5'h10;	// no key		
					endcase	
			4'b0100:	casez(samples)			// find the first key
						4'b1???: key = 5'hC;
						4'b01??: key = 5'h9;
						4'b001?: key = 5'h8;
						4'b0001: key = 5'h7;
						default: key = 5'h10;	// no key		
					endcase			
			4'b1000:	casez(samples)			// find the first key
						4'b1???: key = 5'hD;
						4'b01??: key = 5'hF;
						4'b001?: key = 5'h0;
						4'b0001: key = 5'hE;
						default: key = 5'h10;	// no key		
					endcase	
			default: 			key = 5'h10;
		endcase
		
		//key is only pressed if we found a key
		pressed = ~key[4];
		newest = key[3:0];
		
		//TODO: change pressed to also depend on the state. Store pressed
		// as a 4 bit number.
	
	end
endmodule
					
				
/* This module keeps track of which key was pressed

Author: Sherman
Email: slam@g.hmc.edu
Date Sep 27, 2014
*/
/*
module sort_presses (input logic pressed, loop_clk, reset,
							input logic [3:0] laststate,
							output logic [3:0] pressedSort);
	
	logic [3:0] lastPressedSort; 
	
	always_ff@(posedge loop_clk) begin
		if (reset)
			lastPressedSort = 4'b0000;
		else 
			pressedSort <= lastPressedSort;
	end	
	
	//next state logic
	always_comb begin
		case(state)
			4'b0001:		lastPressedSort[0] = pressed;		//row 1
			4'b0010:		lastPressedSort[1] = pressed;		//row 2
			4'b0100:		lastPressedSort[2] = pressed;		//row 3
			4'b1000:		lastPressedSort[3] = pressed;		//row 4
			default: 	lastPressedSort = 4'b0000;
		endcase
	end
endmodule
		*/
		
					
/* This keeps track of whether or not a key was pressed in
the last time step

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 25, 2014
*/
module record_pressed(	input logic pressed, loop_clk, reset,
							output logic wasPressed);
		always_ff@(posedge loop_clk) begin
			if (reset == 1'b1)
				wasPressed = 1'b0;
			else
				wasPressed <= pressed;
		end
	
endmodule	


/* This is a state machine that sorts the presses

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 27, 2014
*/


/* This is the state machine that records the last
two values (last and lastlast) entered into the keypad. 

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module record_sm(	input logic loop_clk, reset,
						input logic pressed, wasPressed,
						input logic [3:0] newest,
						output logic [3:0] last, lastlast);
	// store
	always_ff@(posedge loop_clk, posedge reset) begin
		if (reset) begin
			last = 'h0;
			lastlast = 'h0; 
		end
		//record only the first instance of the press
		else if (pressed & (~wasPressed)) begin
			lastlast <= last;
			last <= newest;
		end
		else begin
			lastlast <= lastlast;
			last <= last;
		end
	end
endmodule


/* This is the state machine that outputs a slower
clk. This allows the program to run at a slower control
loop rate than that of the on board clock.

debounce math: 
Scanning 1 row max: 3.8kHz
Scanning 1 row with FOS of 2: 1.9kHz
Scanning 4 rows: 7.6kHz
Loop every 5263 clock cycles
Pulse clk every 2632 clock cycles


Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module clk_sm( input logic clk, reset,
					output logic loop_clk);

parameter HALF_PERIOD = 16'd2632; //7.6kHz loop rate
//parameter HALF_PERIOD = 16'd3;
//parameter HALF_PERIOD = 28'd10000;
logic [27:0] counter = '0;

always_ff@(posedge clk, posedge reset) begin
	if (reset == 1'b1) begin					
		counter = '0;
		loop_clk = 0;
	end
	else if (counter >= HALF_PERIOD) begin
		counter = '0;
		loop_clk = ~loop_clk;		//toggle loop_clk
	end
	else begin
		counter = counter + 1'b1;
		loop_clk = loop_clk;
	end
end


endmodule







