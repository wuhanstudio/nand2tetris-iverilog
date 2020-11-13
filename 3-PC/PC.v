/**
 * A 16-bit counter with load control bit.
 * if (load[t] == 1)       out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

`default_nettype none

module PC(
	input wire clk,
	input wire reset,
	input wire [15:0] in,
	input wire load,
	input wire inc,
	output wire [15:0] out
);	

wire [15:0] tempin;
wire [15:0] inp;
wire [15:0] outtemp;

Inc16 inc_0(tempin, inp);

Mux8Way16 mux_0(tempin, 16'b0, in, 16'b0, inp, 16'b0, in, 16'b0, {inc, load, reset}, outtemp);

Register r0(clk, outtemp, 1'b1, tempin);
Register r1(clk, outtemp, 1'b1, out);

endmodule
