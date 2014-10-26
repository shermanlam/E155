module spi (input logic sck,
			input logic sdo,
			output logic [7:0] q);
	
	always_ff(posedge sck) begin
		q  <= (q[6:0], sdo);		//shift register
	end

endmodule
