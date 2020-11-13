`default_nettype none
module Mux8Way16_tb();

	integer file;

	reg [15:0] a;
	reg [15:0] b;
	reg [15:0] c;
	reg [15:0] d;
	reg [15:0] e;
	reg [15:0] f;
	reg [15:0] g;
	reg [15:0] h;
	reg [2:0] sel;
	wire [15:0] out;

	Mux8Way16 Mux8Way16_1(
	    .a(a),
		.b(b),
		.c(c),
		.d(d),
	    .e(e),
		.f(f),
		.g(g),
		.h(h),
		.sel(sel),
		.out(out)
	  );

	task display;
    	#1 $fwrite(file, "| %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b |  %1b  | %1b |\n", a, b, c, d, e, f, g, h, sel, out);
  	endtask

  	initial begin
  		$dumpfile("Mux8Way16_tb.vcd");
  		$dumpvars(0, Mux8Way16_tb);
		file = $fopen("Mux8Way16.out","w");
    	$fwrite(file, "|        a         |        b         |        c         |        d         |        e         |        f         |        g         |        h         |  sel  |       out        |\n");

		a = 16'b0000000000000000;
		b = 16'b0000000000000000;
		c = 16'b0000000000000000;
		d = 16'b0000000000000000;
		e = 16'b0000000000000000;
		f = 16'b0000000000000000;
		g = 16'b0000000000000000;
		h = 16'b0000000000000000;
		sel = 3'b000;
		display();

		sel = 3'b001;
		display();

		sel = 3'b010;
		display();

		sel = 3'b11;
		display();

		sel = 3'b100;
		display();

		sel = 3'b101;
		display();

		sel = 3'b110;
		display();

		sel = 3'b111;
		display();

		a = 16'b0001001000110100;
		b = 16'b0010001101000101;
		c = 16'b0011010001010110;
		d = 16'b0100010101100111;
		e = 16'b0101011001111000;
		f = 16'b0110011110001001;
		g = 16'b0111100010011010;
		h = 16'b1000100110101011;
		sel = 3'b000;
		display();

		sel = 3'b001;
		display();

		sel = 3'b010;
		display();

		sel = 3'b11;
		display();

		sel = 3'b100;
		display();

		sel = 3'b101;
		display();

		sel = 3'b110;
		display();

		sel = 3'b111;
		display();

		$finish();	
	end

endmodule
