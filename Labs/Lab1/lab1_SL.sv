//This is a module for lab1
module lab1_SL(	input logic clk,				//clock
						input logic [3:0] s,			//4 DIP switches
						output logic [7:0] led, 	//8 lights on LED bar
						output logic [6:0] seg);	//segments in 7-seg display
	
	ledBarDecoder	bar(.s(s), .led(led));	//instance of the led bar decoder
	led7Decoder		led7(.s(s), .seg(seg)); //instance of 7-seg display decoder

endmodule

/* This module decodes the switch inputs into an output for the 
	color bar on development board.
	s[3:0] = [sw3, ... ,sw1]
	led[7:0] = [led7, ... ,led0]
	
	Author: Sherman
	Date: Sep 9, 2014
*/
module ledBarDecoder(input logic [3:0] s,
							output logic [7:0] led);
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
	Date: Sep 9, 2014
*/
module led7Decoder(	input logic [3:0] s,			//4 DIP switches
							output logic [6:0] seg);	//segments in 7-seg display
	always_comb begin
		//lookup table for s-seg relationship
		case(s)
			4'b0000:	seg = 7'b1000000;		// 0x0
			4'b0001:	seg = 7'b1111001;		// 0x1
			4'b0010:	seg = 7'b0100100;		// 0x2
			4'b0011:	seg = 7'b0110000;		// 0x3
			4'b0100:	seg = 7'b0011001;		// 0x4
			4'b0101:	seg = 7'b0010010;		// 0x5
			4'b0110:	seg = 7'b0000010;		// 0x6
			4'b0111:	seg = 7'b1111000;		// 0x7
			4'b1000:	seg = 7'b0000000;		// 0x8
			4'b1001:	seg = 7'b0011000;		// 0x9
			4'b1010:	seg = 7'b0001000;		// 0xA
			4'b1011:	seg = 7'b0000011;		// 0xB
			4'b1100:	seg = 7'b0100111;		// 0xC
			4'b1101:	seg = 7'b0100001;		// 0xD
			4'b1110:	seg = 7'b0000110;		// 0xE
			4'b1111:	seg = 7'b0001110;		// 0xF
			default: seg = 7'b1111110;		// default to a dash
		endcase
		
	end
endmodule
		