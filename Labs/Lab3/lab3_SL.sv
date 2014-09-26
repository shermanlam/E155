/* This is the project wrapper that inits all the
individual components of the project

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 25, 2014
*/
module lab3_SL(	input logic clk, reset,
						input logic [3:0] col,
						output logic [6:0] seg);
	//wires
	logic[3:0] newest;
	logic[3:0] last;
	logic[3:0] lastlast;
	logic pressed;
	logic loop_clk;
	logic[3:0] state;
		
	clk_sm 		subClk(.clk(clk),.reset(reset),.loop_clk(loop_clk));	
	record_sm 	memory(.loop_clk(loop_clk),.reset(reset),.pressed(pressed),
							.newest(newest),.last(last),.lastlast(lastlast));
	row_sm 		row(.loop_clk(loop_clk),.reset(reset),.state(state));
	read_keys	read(.state(state),.col(col),.pressed(pressed),.newest(newest));
				
endmodule


/* This is a state machine that is used to keep
track of which row is being checked

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module row_sm( input logic loop_clk, reset,
					output logic [3:0] state);
	
	//state encodings
	parameter ROW1 = 4'b0001;
	parameter ROW2 = 4'b0010;
	parameter ROW3 = 4'b0100;
	parameter ROW4 = 4'b1000;
	
	//next state
	logic [3:0] next;
	
	always_ff@(posedge loop_clk) begin
		if (reset == 1'b1) begin
			state <= ROW1;
		end
		else 
			state <= next;
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



/* This checks whether or not a button has been pressed.

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 25, 2014
*/
module read_keys(	input logic [3:0] state,
						input logic [3:0] col,
						output logic pressed,
						output logic [3:0] newest);
	logic [4:0] key = 'b0;
	always_comb begin
		//check each row
		case(state)
			4'b0001:	casez(col)			// find the first key
						4'b1???: key = 5'hA;
						4'b01??: key = 5'h3;
						4'b001?: key = 5'h2;
						4'b0001: key = 5'h1;
						default: key = 5'h10;	// no key		
					endcase	
			4'b0010:	casez(col)			// find the first key
						4'b1???: key = 5'hB;
						4'b01??: key = 5'h6;
						4'b001?: key = 5'h5;
						4'b0001: key = 5'h4;
						default: key = 5'h10;	// no key		
					endcase	
			4'b0100:	casez(col)			// find the first key
						4'b1???: key = 5'hC;
						4'b01??: key = 5'h9;
						4'b001?: key = 5'h8;
						4'b0001: key = 5'h7;
						default: key = 5'h10;	// no key		
					endcase			
			4'b1000:	casez(col)			// find the first key
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
	
	end
endmodule
					


/* This is the state machine that records the last
two values (last and lastlast) entered into the keypad. 

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module record_sm(	input logic loop_clk, reset,
						input logic pressed,
						input logic [3:0] newest,
						output logic [3:0] last, lastlast);
	// store
	always_ff@(posedge loop_clk, posedge reset) begin
		if (reset == 1'b1) begin
			last = 'h0;
			lastlast = 'h0; 
		end
		else if (pressed == 1'b1)	begin
			lastlast <= last;
			last <= newest;
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

//parameter HALF_PERIOD = 16'd2632; //7.6kHz loop rate
parameter HALF_PERIOD = 16'd3;
logic [15:0] counter = '0;

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


