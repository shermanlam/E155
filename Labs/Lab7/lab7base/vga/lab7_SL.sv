module lab7_SL(input  logic       clk,
					output logic       vgaclk,						// 25 MHz VGA clock
					output logic       hsync, vsync, sync_b,	// to monitor & DAC
					output logic [7:0] r, g, b);					// to video DAC
	
	logic [9:0] xpt;
	assign xpt = 10'd50;
	logic [9:0] ypt;
	assign ypt = 10'd50;
	vga vga1(.clk(clk),.xpt(xpt),.ypt(ypt),
				.vgaclk(vgaclk),.hsync(hsync),.vsync(vsync),
				.sync_b(sync_b),.r(r),.g(g),.b(b));
endmodule



