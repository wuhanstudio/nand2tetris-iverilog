/**
* BlockRAM of iCE40
* implements 2048 words of RAM addressed from 0000 - 2047
* out = M[address] (continuosly assigned using combinatorial logic)
* if (load =i= 1) M[address][t+1] = in[t] (clocked using sequential logic)
*/

`default_nettype none
module RAM(
	input wire clk,
	input wire [15:0] address,
	input wire [15:0] in,
	input wire load,
	output wire [15:0] out
);
	
	reg [15:0] regRAM [0:2047]; 
	always @(posedge clk)
		if (load) regRAM[address[10:0]] <= in;

	assign out = regRAM[address[10:0]];
endmodule
