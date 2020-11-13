/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */
`default_nettype none

module Inc16(
	input wire [15:0] in,
	output wire [15:0] out
);

// your implementation comes here:

Add16 Add16_0(in, 16'b1, out);

endmodule
