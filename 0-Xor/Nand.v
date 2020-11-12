/**
 * Nand gate: 
 * out = 0 if (a == 1 and b == 1)
 *       1 otherwise
 *
 * This module is implemented using verilog primitives
 */

`default_nettype none

module Nand(
	input a,
	input b,
	output out
);
	nand(out,a,b);
endmodule
