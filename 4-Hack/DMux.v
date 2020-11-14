/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */
`default_nettype none

module DMux(
	input wire in,
	input wire sel,
    output wire a,
	output wire b
);

// your implementation comes here:

wire notsel;

Not Not_0(sel, notsel);
And And_0(in, notsel, a);
And And_1(in, sel, b);

endmodule
