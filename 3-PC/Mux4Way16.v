`default_nettype none

module Mux4Way16 (
  input wire[15:0] a,
  input wire[15:0] b,
  input wire[15:0] c,
  input wire[15:0] d,
  input wire[1:0] sel,
  output wire[15:0] out
);

  wire[15:0] mux_ab_out;
  wire[15:0] mux_cd_out;

  Mux16 mux_ab(a, b, sel[0], mux_ab_out);
  Mux16 mux_cd(c, d, sel[0], mux_cd_out);

  Mux16 mux_final(mux_ab_out, mux_cd_out, sel[1], out);
endmodule
