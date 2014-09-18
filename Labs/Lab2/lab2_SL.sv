/* This is the main module. It selects which set of switch
	outputs to use and then decodes the number of the selected
	switch. This also sets the clock that time-multiplexes the 
	two 7 segment outputs.
	
	Author: Sherman Lam
	Email: slam@g.hmc.edu
	Date: Sep 17, 2014
*/
module lab2_SL(input logic clk, reset,
					input logic [3:0] s1,s2, //DIP switches
					output logic on1, on2,   //decides which LED set is on
					output logic [6:0] seg); //segment states
					
	// time multiplexing
	multiplexer m1(.clk(clk), .on1(on1), .on2(on2), .reset(reset));
	
	// select the right set of switches.
	// on1 -> s1 is used. on2 -> s2 is used
	logic [3:0] s3;
	// inverted because to turn on, the pin must be pulled LOW
	assign s3 = on1? s2 : s1;	
	
	// 7 segment decoder
	led7Decoder decoder(.s(s3), .seg(seg));
	
endmodule


/* This module time multiplexes

	Author: Sherman Lam
	Email: slam@g.hmc.edu
	Date: Sep 17, 2014
*/
module multiplexer(	input logic clk, reset,
							output logic on1,on2);
	// time multiplexer for switching bewteen displays
	logic [18:0] hPeriod = 19'd333333;	// 1Hz toggling
	logic [18:0] counter = 'b0;
	//logic [28:0] hPeriod = 29'd80000000;	// 1Hz toggling
	//logic [28:0] counter = 'b0;
		
	always_ff @(posedge clk, posedge reset) begin
		if (reset)		
			on1 = 1'b1;
		else begin
			if (counter >= hPeriod) begin
				counter = 'b0;
				on1 = ~on1;
			end
			else
				//on1 = on1;
				counter <= counter + 1'b1;
		end
	end
	
	assign on2 = ~on1;
	
endmodule


/* This module decodes the switch inputs into an output for the 
	7 segment display on the development board.
	s[3:0] = [sw3, ... ,sw1]
	seg[6:0] = [g,f, ... ,b,a]
	
	Author: Sherman
   Email: slam@g.hmc.edu
	Date: Sep 9, 2014
*/
module led7Decoder(	input logic [3:0] s,			//4 DIP switches
							output logic [6:0] seg);	//segments in 7-seg display
							
	always_comb begin
		//lookup table for s-seg relationship
		case(s)
			4'h0:	seg = 7'b100_0000;		// 0x0
			4'h1:	seg = 7'b111_1001;		// 0x1
			4'h2:	seg = 7'b010_0100;		// 0x2
			4'h3:	seg = 7'b011_0000;		// 0x3
			4'h4:	seg = 7'b001_1001;		// 0x4
			4'h5:	seg = 7'b001_0010;		// 0x5
			4'h6:	seg = 7'b000_0010;		// 0x6
			4'h7:	seg = 7'b111_1000;		// 0x7
			4'h8:	seg = 7'b000_0000;		// 0x8
			4'h9:	seg = 7'b001_1000;		// 0x9
			4'ha:	seg = 7'b000_1000;		// 0xA
			4'hb:	seg = 7'b000_0011;		// 0xB
			4'hc:	seg = 7'b010_0111;		// 0xC
			4'hd:	seg = 7'b010_0001;		// 0xD
			4'he:	seg = 7'b000_0110;		// 0xE
			4'hf:	seg = 7'b000_1110;		// 0xF
			default: seg = 7'b111_1110;		// default to a dash
		endcase
      
	end
endmodule