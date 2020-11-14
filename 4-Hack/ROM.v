/**
 * instruction memory at boot time 
 * The instruction memory is read only (ROM) and
 * preloaded with 2048 x 16bit of Hackcode holding the bootloader.
 * 
 * instruction = ROM[pc]
 */
`default_nettype none

module ROM(
	input wire [15:0] pc,
	output wire [15:0] instruction		
);

	// ROM file of hack
	parameter ROMFILE = "../asm/led/led.hack";
	
	reg [15:0] mem [0:2047];
	assign instruction = mem[pc[10:0]];
	
	initial begin
		$readmemb(ROMFILE,mem);
	end

endmodule
