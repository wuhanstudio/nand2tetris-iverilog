/**
 * Not gate:
 * out = not in
 */
`default_nettype none

module Not(
    input wire in,
    output wire out
);

Nand Nand_1(in, in, out);

endmodule
