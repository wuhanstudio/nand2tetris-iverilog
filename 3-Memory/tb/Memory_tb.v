module Memory_tb();

reg [15:0] address = 16'h1FFC;
reg load = 1;
reg [15:0] inRAM = 16'hBEEF;
reg [15:0] in0000 = 16'hBF00;
reg [15:0] in0001 = 16'hBF01;
reg [15:0] in0010 = 16'hBF02;
reg [15:0] in0011 = 16'hBF03;
reg [15:0] in0100 = 16'hBF04;
reg [15:0] in0101 = 16'hBF05;
reg [15:0] in0110 = 16'hBF06;
reg [15:0] in0111 = 16'hBF07;
reg [15:0] in1000 = 16'hBF08;
reg [15:0] in1001 = 16'hBF09;
reg [15:0] in1010 = 16'hBF0a;
reg [15:0] in1011 = 16'hBF0b;
reg [15:0] in1100 = 16'hBF0c;
reg [15:0] in1101 = 16'hBF0d;
reg [15:0] in1110 = 16'hBF0e;
reg [15:0] in1111 = 16'hBF0f;
wire [15:0] out;
wire loadRAM;
wire load0000;
wire load0001;
wire load0010;
wire load0011;
wire load0100;
wire load0101;
wire load0110;
wire load0111;
wire load1000;
wire load1001;
wire load1010;
wire load1011;
wire load1100;
wire load1101;
wire load1110;
wire load1111;

Memory
  Memory(
    .address(address),
	.load(load),
	.inRAM(inRAM),
	.in0000(in0000),
	.in0001(in0001),
	.in0010(in0010),
	.in0011(in0011),
	.in0100(in0100),
	.in0101(in0101),
	.in0110(in0110),
	.in0111(in0111),
	.in1000(in1000),
	.in1001(in1001),
	.in1010(in1010),
	.in1011(in1011),
	.in1100(in1100),
	.in1101(in1101),
	.in1110(in1110),
	.in1111(in1111),
	.loadRAM(loadRAM),
	.load0000(load0000),
	.load0001(load0001),
	.load0010(load0010),
	.load0011(load0011),
	.load0100(load0100),
	.load0101(load0101),
	.load0110(load0110),
	.load0111(load0111),
	.load1000(load1000),
	.load1001(load1001),
	.load1010(load1010),
	.load1011(load1011),
	.load1100(load1100),
	.load1101(load1101),
	.load1110(load1110),
	.load1111(load1111),
	.out(out)
  );

always #1 address = address+1;


initial begin
  $dumpfile("Memory_tb.vcd");
  $dumpvars(0, Memory_tb);
	#20
	address = 16'h1FFC;
	load = 0;
	#20
  $finish;
end

endmodule
