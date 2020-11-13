module Clock_tb();

reg in = 0;
wire out;
Clock
  CLOCK(
    .in(in),
	.out(out)
  );

always #1 in = ~in;


initial begin
	
  $dumpfile("Clock_tb.vcd");
  $dumpvars(0, Clock_tb);
	# 5000
  $finish;
end

endmodule
