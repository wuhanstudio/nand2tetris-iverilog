/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *    else out does not change (out[t+1] = out[t])
 */

`default_nettype none
module Bit(
	input wire clk,
	input wire in,
	input wire load,
	output wire out
);

// your implementation comes here:

wire mux_out;

Mux Mux_0(.a(out), .b(in), .sel(load), .out(mux_out));
DFF dff(.clk(clk), .in(mux_out), .out(out));

endmodule
