`default_nettype none
module DMux_tb();

	integer file;

	reg in    = 0;
	reg sel   = 0;
	wire a, b;

	DMux DMux_1(
	    .in(in),
	    .sel(sel),
		.a(a),
		.b(b)
	  );

	task display;
    	#1 $fwrite(file, "|   %1b   |   %1b   |   %1b   |   %1b   |\n", in, sel, a, b);
  	endtask

  	initial begin
  		$dumpfile("DMux_tb.vcd");
  		$dumpvars(0, DMux_tb);
		file = $fopen("DMux.out","w");
    	$fwrite(file, "|  in   |  sel  |   a   |   b   |\n");

		in = 0;
		sel = 0;
		display();

		sel = 1;
		display();

		in = 1;
		sel = 0;
		display();

		sel = 1;
		display();

		$finish();	
	end

endmodule
