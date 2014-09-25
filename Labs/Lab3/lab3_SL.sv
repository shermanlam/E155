/* This is the project wrapper that inits all the
individual components of the project

Author: Sherman Lam
Email: slam@g.hmc.edu
Date: Sep 25, 2014
*/
module lab3_SL(	input logic clk, reset,
						output logic [6:0] seg);
						
				
endmodule


/* This is a state machine that is used to keep
track of which row is being checked

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module row_sm( input logic loop_clk, reset,
					output logic newest);


endmodule

/* This is the state machine that records the last
two values (last and lastlast) entered into the keypad. 

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module record_sm(	input logic loop_clk, reset,
						output logic [3:0] last, lastlast);

endmodule


/* This is the state machine that outputs a slower
clk. This allows the program to run at a slower control
loop rate than that of the on board clock.

Author: Sherman
Email: slam@g.hmc.edu
Date: Sep 25,2104
*/
module clk_sm( input logic clk, reset,
					output logic loop_clk);
					
// run counter

// reset counter when it overflows


endmodule


