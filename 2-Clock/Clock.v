/** 
 * input clk_in: clock input 100 MHz
 * output clk: clock output 33.333333 MHz
 *
 * Implementation with 2 bit DFF-counter:
 * counter | 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 ....
 * clk     | 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 ....
 */

`default_nettype none

module Clock(
	input wire in,			//external clock
	output wire out			//Hack clock slower than 33.333333 MHz
);

// your implementation comes here:

assign out = in;

endmodule
