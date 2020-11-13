`default_nettype none
module Mux4Way16_tb();

	integer file;

	reg [15:0] a;
	reg [15:0] b;
	reg [15:0] c;
	reg [15:0] d;
	reg [1:0] sel;
	wire [15:0] out;

	Mux4Way16 Mux4Way16_1(
	    .a(a),
		.b(b),
		.c(c),
		.d(d),
		.sel(sel),
		.out(out)
	  );

	task display;
    	#1 $fwrite(file, "| %1b | %1b | %1b | %1b |  %1b  | %1b |\n", a, b, c, d, sel, out);
  	endtask

  	initial begin
  		$dumpfile("Mux4Way16_tb.vcd");
  		$dumpvars(0, Mux4Way16_tb);
		file = $fopen("Mux4Way16.out","w");
    	$fwrite(file, "|        a         |        b         |        c         |        d         | sel  |       out        |\n");

		a = 16'b0000000000000000;
		b = 16'b0000000000000000;
		c = 16'b0000000000000000;
		d = 16'b0000000000000000;
		sel = 2'b00;
		display();

		sel = 2'b01;
		display();

		sel = 2'b10;
		display();

		sel = 2'b11;
		display();

		a = 16'b0001001000110100;
		b = 16'b1001100001110110;
		c = 16'b1010101010101010;
		d = 16'b0101010101010101;
		sel = 2'b00;
		display();

		sel = 2'b01;
		display();

		sel = 2'b10;
		display();

		sel = 2'b11;
		display();

		$finish();	
	end

endmodule
