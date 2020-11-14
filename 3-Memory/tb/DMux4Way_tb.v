`default_nettype none
module DMux4Way_tb();

	integer file;

	reg in       = 0;
	reg [1:0]sel = 0;
	wire a, b, c, d;

	DMux4Way DMux4Way_1(
	    .in(in),
	    .sel(sel),
		.a(a),
		.b(b),
		.c(c),
		.d(d)
	  );

	task display;
    	#1 $fwrite(file, "|  %1b  |  %1b  |  %1b  |  %1b  |  %1b  |  %1b  |\n", in, sel, a, b, c, d);
  	endtask

  	initial begin
  		$dumpfile("DMux4Way_tb.vcd");
  		$dumpvars(0, DMux4Way_tb);
		file = $fopen("DMux4Way.out","w");
    	$fwrite(file, "| in  | sel  |  a  |  b  |  c  |  d  |\n");

		in = 0;
		sel = 2'b00;
		display();

		sel = 2'b01;
		display();

		sel = 2'b10;
		display();

		sel = 2'b11;
		display();

		in = 1;
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
