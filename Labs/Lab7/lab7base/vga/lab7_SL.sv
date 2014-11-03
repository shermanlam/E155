module lab7_SL(	input  logic		clk, reset,
				input  logic 		sclk, sdo, sdi,			// spi communication lines		
				output logic    	vgaclk,					// 25 MHz VGA clock
				output logic    	hsync, vsync, sync_b,	// to monitor & DAC
				output logic [7:0] 	r, g, b);				// to video DAC
	
	logic [9:0] xpt;
	logic [9:0] ypt;
	logic ready;
	logic [31:0] data;
	//for displaying vga
	vga vga1(.clk(clk),.xpt(xpt),.ypt(ypt),
				.vgaclk(vgaclk),.hsync(hsync),.vsync(vsync),
				.sync_b(sync_b),.r(r),.g(g),.b(b));
	//for receiving spi data
	spiRx spi(.sclk(sclk),.sdo(sdo),.reset(reset),.ready(ready),
					.sdi(sdi),.data(data));
	//for parsing data
	parse parser(.data(data),.reset(reset),.ready(ready),.xpt(xpt),.ypt(ypt));
endmodule


/*
Module for receiving 32 bit spi data

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 11-2-14
*/
module spiRx(  	input logic 		sclk, sdo, reset,	// SPI data lines
				output logic 		sdi,				// SPI data
				output logic 		ready,				// whether the data packet is ready
				output logic [31:0] data);				// data packet
	//counter for 32 bits
	parameter bits = 5'd31;
	logic [4:0] counter;
	
	//read on rising edge of spi clock
	always_ff@(posedge sclk) begin
		if (reset)	counter = '0;
		else 			counter = counter + 1'b1; 
	end
	
	//shift register
	always_ff@(posedge sclk) begin
		data = {data[30:0],sdo};
	end
	
	assign ready = (counter == 0);
	
	//send back bogus data
	always_ff@(negedge sclk)
		sdi = 0;
	
endmodule


/*
Module for parsing spi data

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: 11-2-14
*/
module parse(	input logic [31:0] data,		// data packet
				input logic ready, reset,		// whether data is ready to be stored, reset
				output logic [9:0] xpt, ypt);	// x and y position of cursor
	
	logic [31:0] dataCp;
	
	//store 32 bit data
	always_ff@(posedge ready, posedge reset) begin
		if (reset) 		dataCp = '0;
		else 			dataCp = data;
	end
	
	//mask to get x and y
	always_comb begin
		xpt = dataCp[25:16];
		ypt = dataCp[9:0];
	end
endmodule
	
	
	
