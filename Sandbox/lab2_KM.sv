module lab2_KM(input  logic clk, reset,
					output logic [7:0] led);
					
	logic [27:0] threshold = 28'd40000000;
	logic [27:0] counter = '0;
	
	assign led[6:0] = '0;
	
	always_ff @(posedge clk)//, posedge reset)
	
		if (reset)
			begin
				counter <= '0;
				led[7] <= 1'b0;
			end
		else if (counter >= threshold)
			begin
				counter <= '0;
				led[7] <= ~led[7];
			end
		else
			begin
				counter <= counter + 1'b1;
				//led[7] <= led[7];
			end
	
	
endmodule