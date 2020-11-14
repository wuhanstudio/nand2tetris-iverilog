/**
* Memory mapped IO
*
* Big Multiplexer/Demultiplexer to address Memory.
*
* if (load==1) and (address[13]==0) loadRAM=1
* if (load==1) and (address[13]==1 and address[3:0]==0000) load0000=1
* if (load==1) and (address[13]==1 and address[3:0]==0001) load0001=1
* if (load==1) and (address[13]==1 and address[3:0]==0010) load0010=1
* ...
* if (address[13]==0) data = dataRAM
* if (address[13]==1 and address[3:0]=0000) data = data0000
* if (address[13]==1 and address[3:0]=0001) data = data0001
* if (address[13]==1 and address[3:0]=0010) data = data0010
*/

`default_nettype none
module Memory(
	input wire [15:0] inRAM,
	input wire [15:0] in0000,
	input wire [15:0] in0001,
	input wire [15:0] in0010,
	input wire [15:0] in0011,
	input wire [15:0] in0100,
	input wire [15:0] in0101,
	input wire [15:0] in0110,
	input wire [15:0] in0111,
	input wire [15:0] in1000,
	input wire [15:0] in1001,
	input wire [15:0] in1010,
	input wire [15:0] in1011,
	input wire [15:0] in1100,
	input wire [15:0] in1101,
	input wire [15:0] in1110,
	input wire [15:0] in1111,
	input wire [15:0] address,
	input wire load,
	output wire [15:0] out,
	output wire loadRAM,
	output wire load0000,
	output wire load0001,
	output wire load0010,
	output wire load0011,
	output wire load0100,
	output wire load0101,
	output wire load0110,
	output wire load0111,
	output wire load1000,
	output wire load1001,
	output wire load1010,
	output wire load1011,
	output wire load1100,
	output wire load1101,
	output wire load1110,
	output wire load1111
);

//your implementation comes here:










endmodule	
