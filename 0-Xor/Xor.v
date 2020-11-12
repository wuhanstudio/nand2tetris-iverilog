/**
 * Exclusive-or gate:
 * out = not (a == b)
 */
`default_nettype none

module Xor(
	input wire a,
	input wire b,
	output wire out
);

assign out = a ^ b;

endmodule
