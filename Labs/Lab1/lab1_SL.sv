/* This module is the wrapper for the project. It instantiates
   an instance of the led bar decoder and 7 segment decoder
   
   Author: Sherman
   Email: slam@g.hmc.edu
   Date: Sep 9, 2014
*/

module lab1_SL(	input logic clk,				//clock
						input logic [3:0] s,			//4 DIP switches
						output logic [7:0] led, 	//8 lights on LED bar
						output logic [6:0] seg);	//segments in 7-seg display
	
	ledBarDecoder	bar(.clk(clk), .s(s), .led(led));	//instance of the led bar decoder
	led7Decoder		led7(.s(s), .seg(seg)); //instance of 7-seg display decoder

endmodule

/* This module decodes the switch inputs into an output for the 
	color bar on development board.
	s[3:0] = [sw3, ... ,sw1]
	led[7:0] = [led7, ... ,led0]
	
	Author: Sherman
   Email: slam@g.hmc.edu
	Date: Sep 9, 2014
*/
module ledBarDecoder(input logic clk,
							input logic [3:0] s,
							output logic [7:0] led);
	logic [23:0] count = 24'b0;
	logic [23:0] period = 24'h7F2815;	//every 8333333 cycles of a 40MHz clock, the
													//7th led will flash on or off
	
	always_ff @(posedge clk) begin
		if (count >= period) begin
			count <= 24'b0;
			led[7] = ~led[7];
		end
		else			
			count <= count + 1'b1;
	end
	
	always_comb begin
		led[1:0] = s[0] ? 2'b01 : 2'b10;
		led[3:2] = s[1] ? 2'b01 : 2'b10;
		led[5:4] = s[2] ? 2'b01 : 2'b10;
		led[6] = (s[3]&s[2]) ? 1'b1 : 1'b0;
	end

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
		