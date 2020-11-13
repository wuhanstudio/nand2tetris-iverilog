
`default_nettype none

module Mux8Way16 (
  input wire[15:0] a,
  input wire[15:0] b,
  input wire[15:0] c,
  input wire[15:0] d,
  input wire[15:0] e,
  input wire[15:0] f,
  input wire[15:0] g,
  input wire[15:0] h,
  input wire[2:0] sel,
  output wire[15:0] out
);

  wire[15:0] mux_ab_out;
  wire[15:0] mux_cd_out;
  wire[15:0] mux_ef_out;
  wire[15:0] mux_gh_out;

  wire[15:0] mux_abcd_out;
  wire[15:0] mux_efgh_out;

  Mux16 mux_ab(a, b, sel[0], mux_ab_out);
  Mux16 mux_cd(c, d, sel[0], mux_cd_out);
  Mux16 mux_ef(e, f, sel[0], mux_ef_out);
  Mux16 mux_gh(g, h, sel[0], mux_gh_out);

  Mux16 mux_abcd(mux_ab_out, mux_cd_out, sel[1], mux_abcd_out);
  Mux16 mux_efgh(mux_ef_out, mux_gh_out, sel[1], mux_efgh_out);

  Mux16 mux_output(mux_abcd_out, mux_efgh_out, sel[2], out);
endmodule