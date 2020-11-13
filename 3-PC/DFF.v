/**
* Data-Flip-Flop
* out[t+1] = in[t]
*
* This module is implemented using reg-variables in verilog
*/

`default_nettype none
module DFF(
		input wire clk,
		input wire in,
		output reg out
);

always @(posedge clk)
	if (in) out <= in;
	else out <= 1'b0;

endmodule

