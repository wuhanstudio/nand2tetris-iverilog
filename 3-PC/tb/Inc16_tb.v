`default_nettype none
module Inc16_tb();

	integer file;

	reg [15:0] in;
	wire [15:0] out;

	Inc16 Inc16_1(
	    .in(in),
		.out(out)
	  );

	task display;
    	#1 $fwrite(file, "| %1b | %1b |\n", in, out);
  	endtask

  	initial begin
  		$dumpfile("Inc16_tb.vcd");
  		$dumpvars(0, Inc16_tb);
		file = $fopen("Inc16.out","w");
    	$fwrite(file, "|        in        |       out        |\n");

		in = 16'b0000000000000000;
		display();

		in = 16'b1111111111111111;
		display();

		in = 16'b0000000000000101;
		display();

		in = 16'b1111111111111011;
		display();

		$finish();	
	end

endmodule
