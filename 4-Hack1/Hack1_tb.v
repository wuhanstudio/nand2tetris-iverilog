module Hack1_tb();

reg clk_in = 0;
reg [1:0] but = 0;
wire [1:0] led;

Hack1
  HACK1(
    .clk_in(clk_in),
    .but(but),
    .led(led)
  );

always #1 clk_in = ~clk_in;

initial begin
  $dumpfile("Hack1_tb.vcd");
  $dumpvars(0, Hack1_tb);

#50 but=1;
#50 but=2;
#50 but=3;
#50 but=0;
#50
  $finish;
end

endmodule
