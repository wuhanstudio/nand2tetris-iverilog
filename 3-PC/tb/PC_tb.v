module PC_tb();

reg clk = 0;
reg reset = 0;
reg inc = 0;
reg [15:0] in = 0;
reg load =0;
wire [15:0] out;

PC
  PC(
    .clk(clk),
	.reset(reset),
	.inc(inc),
	.in(in),
	.load(load),
	.out(out)
  );
 reg [15:0] t=0;
integer file;
always #1
	begin
		t <= t+1;
		clk = ~clk;
		display();
	end

	task display;
    	$fwrite(file, "| %5d| %6d |  %1b  |  %1b  |  %1b  | %6d |\n", t, $signed(in), reset, load, inc, $signed(out));
  	endtask
  	
  	initial begin
  		$dumpfile("PC_tb.vcd");
  		$dumpvars(0, PC_tb);
		file = $fopen("PC.out","w");
    	$fwrite(file, "| time |   in   |reset|load | inc |  out   |\n");
		

		#2 in=0;reset=0;load=0;inc= 0;
		#2 inc=1;
		#2 in=-32123;
		#2 load=1;
		#2 load=0;
		#2
		#2 in=12345;load=1;inc=0; // 12
		#2 reset=1;
		#2 reset=0;inc=1;
		#2 reset=1;
		#2 reset=0;load=0;       // 20
		#2 reset=1;

		#2 in=0;reset=0;load=1;
		#2 load=0;
		#2 in=22222;reset=1;load=0;inc=0;
		#2
		$finish;
	end

endmodule
