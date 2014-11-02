module lab7_SL(input  logic       clk,
					output logic       vgaclk,						// 25 MHz VGA clock
					output logic       hsync, vsync, sync_b,	// to monitor & DAC
					output logic [7:0] r, g, b);					// to video DAC
	

	vga vga1(.clk(clk),.vgaclk(vgaclk),.hsync(hsync),.vsync(vsync),
				.sync_b(sync_b),.r(r),.g(g),.b(b));
endmodule
