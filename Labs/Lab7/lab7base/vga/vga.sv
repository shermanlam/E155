// vga.sv
// 20 October 2011 Karl_Wang & David_Harris@hmc.edu
// VGA driver with character generator

module vga(input  logic       clk,
			  input 	logic	[9:0]	xpt, ypt,					// x,y position for the rectangle
			  output logic       vgaclk,						// 25 MHz VGA clock
			  output logic       hsync, vsync, sync_b,	// to monitor & DAC
			  output logic [7:0] r, g, b);					// to video DAC
 
  logic [9:0] x, y;
  logic [7:0] r_int, g_int, b_int;
	
  // Use a PLL to create the 25.175 MHz VGA pixel clock 
  // 25.175 Mhz clk period = 39.772 ns
  // Screen is 800 clocks wide by 525 tall, but only 640 x 480 used for display
  // HSync = 1/(39.772 ns * 800) = 31.470 KHz
  // Vsync = 31.474 KHz / 525 = 59.94 Hz (~60 Hz refresh rate)
  pll	vgapll(.inclk0(clk),	.c0(vgaclk)); 

  // generate monitor timing signals
  vgaController vgaCont(vgaclk, hsync, vsync, sync_b,  
                        r_int, g_int, b_int, r, g, b, x, y);
	
  // user-defined module to determine pixel color
  //videoGen videoGen(x, y, r_int, g_int, b_int);
  videoGen2 videoGen(.x(x),.y(y),.xpt(xpt),.ypt(ypt),.r(r_int),.g(g_int),.b(b_int));
  
endmodule

module vgaController #(parameter HMAX   = 10'd800,
                                 VMAX   = 10'd525, 
											HSTART = 10'd152,
											WIDTH  = 10'd640,
											VSTART = 10'd37,
											HEIGHT = 10'd480)
						  (input  logic       vgaclk, 
                     output logic       hsync, vsync, sync_b,
							input  logic [7:0] r_int, g_int, b_int,
							output logic [7:0] r, g, b,
							output logic [9:0] x, y);

  logic [9:0] hcnt, vcnt;
  logic       oldhsync;
  logic       valid;
  
  // counters for horizontal and vertical positions
  always @(posedge vgaclk) begin
    if (hcnt >= HMAX) hcnt = 0;
    else hcnt++;
	 if (hsync & ~oldhsync) begin // start of hsync; advance to next row
	   if (vcnt >= VMAX) vcnt = 0;
      else vcnt++;
    end
    oldhsync = hsync;
  end
  
  // compute sync signals (active low)
  assign hsync = ~(hcnt >= 10'd8 & hcnt < 10'd104); // horizontal sync
  assign vsync = ~(vcnt >= 2 & vcnt < 4); // vertical sync
  assign sync_b = hsync | vsync;

  // determine x and y positions
  assign x = hcnt - HSTART;
  assign y = vcnt - VSTART;
  
  // force outputs to black when outside the legal display area
  assign valid = (hcnt >= HSTART & hcnt < HSTART+WIDTH &
                  vcnt >= VSTART & vcnt < VSTART+HEIGHT);
  assign {r,g,b} = valid ? {r_int,g_int,b_int} : 24'b0;
endmodule


module videoGen(input  logic [9:0] x, y,
           		 output logic [7:0] r_int, g_int, b_int);
	
  logic pixel;
  logic [7:0] ch;

  // given y position, choose a character to display
  // then look up the pixel value from the character ROM
  // and display it in red or blue
  assign ch = y[8:3]+8'd48;  
  chargenrom chargenromb(ch, x[2:0], y[2:0], pixel);  
  assign {r_int, g_int, b_int} = (y[3]==0) ? {{8{pixel}},16'h0000} : 
	                                           {16'h0000,{8{pixel}}}; 
endmodule


/*
Module for generating a pixel value for a given x, y position

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 11-2-14
*/
module videoGen2(	input	logic [9:0] x,y,xpt,ypt,
						output logic [7:0] r,g,b);
	//background rgb values
	logic [7:0] r_bkg,g_bkg,b_bkg;
	//pointer rgb value
	logic [7:0] r_ptr,g_ptr,b_ptr;
	
	background 	gen_bkg(.x(x),.y(y),.r(r_bkg),.g(g_bkg),.b(b_bkg));
	mouse			gen_ptr(.x(x),.y(y),.ypt(ypt),.xpt(xpt),
								.r(r_ptr),.g(g_ptr),.b(b_ptr));
	
	//or the outputs;
	assign r = r_bkg | r_ptr;
	assign g = g_bkg | g_ptr;
	assign b = b_bkg | b_ptr;
						
endmodule


/*
Module for generating a plain color background

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 11-2-14
*/
module background(input 	logic [9:0] x,y,
						output	logic [7:0] r,g,b);
					
	assign r = x>>2;
	assign g = y>>2;
	assign b = 8'd0;
	
endmodule


/*
Module for generating a mouse

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 11-2-14
*/
module mouse(	input 	logic [9:0] x,y,xpt,ypt,
				output	logic [7:0] r,g,b);

	//variable declaration
	parameter size = 8'd8;					// size of the mouse			
	logic intriangle, instem, inrange;		// if pixel is in various parts of the mouse
	logic [9:0] dx, dy;						// difference between x coord of pixel and cursor position
	always_comb begin
		dx = x-xpt;
		dy = y-ypt;
		intriangle = (dx<size & dx>0 & dy<size & dy>0 & dx+dy<size);
		instem = ((dx==dy) & dx<size & dx>0 & dy<size & dy>0);
		inrange = intriangle | instem;
		r = inrange? 8'd255 : 8'd0;
		g = inrange? 8'd255 : 8'd0;
		b = inrange? 8'd255 : 8'd0;
	end
	
endmodule



module chargenrom(input  logic [7:0] ch,
                  input  logic [2:0] xoff, yoff,
						output logic       pixel);
						
  logic [5:0] charrom[2047:0]; // character generator ROM
  logic [7:0] line;            // a line read from the ROM
  
  // initialize ROM with characters from text file 
  initial 
	 $readmemb("charrom.txt", charrom);
	 
  // index into ROM to find line of character
  assign line = {charrom[yoff+{ch, 3'b000}]}; 
  // reverse order of bits
  assign pixel = line[3'd7-xoff];
endmodule


