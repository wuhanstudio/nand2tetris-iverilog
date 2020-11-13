/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

`default_nettype none

module Register(
	input clk,
	input [15:0] in,
	input load,
	output [15:0] out
);

Bit b0(clk, in[0], load, out[0]);
Bit b1(clk, in[1], load, out[1]);
Bit b2(clk, in[2], load, out[2]);
Bit b3(clk, in[3], load, out[3]);
Bit b4(clk, in[4], load, out[4]);
Bit b5(clk, in[5], load, out[5]);
Bit b6(clk, in[6], load, out[6]);
Bit b7(clk, in[7], load, out[7]);
Bit b8(clk, in[8], load, out[8]);
Bit b9(clk, in[9], load, out[9]);
Bit b10(clk, in[10], load, out[10]);
Bit b11(clk, in[11], load, out[11]);
Bit b12(clk, in[12], load, out[12]);
Bit b13(clk, in[13], load, out[13]);
Bit b14(clk, in[14], load, out[14]);
Bit b15(clk, in[15], load, out[15]);

endmodule
