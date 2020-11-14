/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

module DMux4Way(
	input wire in,
	input wire [1:0] sel,
    output wire a,
	output wire b,
	output wire c,
	output wire d
	);
// your implementation comes here:

wire not0, not1, cond1, cond2, cond3, cond4;
wire res1, res2, res3, res4;

Not Not_0(sel[0], not0);
Not Not_1(sel[1], not1);
And And_0(not0, not1, cond1);
And And_1(not1, sel[0], cond2);
And And_2(sel[1], not0, cond3);
And And_3(sel[1], sel[0], cond4);

DMux DMux_0(in, cond1, res1, a);
DMux DMux_1(in, cond2, res2, b);
DMux DMux_2(in, cond3, res3, c);
DMux DMux_3(in, cond4, res4, d);

endmodule
