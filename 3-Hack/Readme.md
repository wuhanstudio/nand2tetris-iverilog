## Step 3 - Computer
Unfortunately, there is no test file, but you can test it on your real hardware.

The last file to accomplish.

### Hack.v

```
module Hack(
    input wire clk,					//clock 100 MHz	
    input wire [1:0] but,			//buttons	(0 if pressed, 1 if released)
	output reg [1:0] led			//leds 		(0 off, 1 on)
);
	
	// ROM file of hack
	parameter ROMFILE = "./blinky.hack";

	// reset logic	
	reg rstn=0;						//reset_not
	always @(posedge clk)			//used to initialize all register
		rstn <=1;
	
	// hack cpu (nand2tetris)
	CPU CPU_0(						
		.clk(clk),
    	.inM(outM),         		// M value input  (M = contents of RAM[A])
    	.instruction(instruction), 	// Instruction for execution
    	.rstn(rstn),           		// Signals whether to re-start the current
                         			// program (rstn==0) or continue executing
                         			// the current program (rstn==1).
    	.outM(inM),       			// M value output
    	.writeM(writeM),          	// Write to M? 
    	.addressMR(addressR),    	// Address in data memory to Read(of M)
    	.addressMW(addressW),    	// Address in data memory to Write (of M)
    	.pc(pc)          			// address of next instruction
	);
	wire [15:0] pc;
	wire [15:0] instruction;
	wire [15:0] addressR;
	wire [15:0] addressW;
	wire [15:0] inM;
	wire writeM;
	
	// memory map
	localparam led_A =      16'b0010000000000000;		//8192
	localparam but_A =      16'b0010000000000001;		//8193

	reg [15:0] outM;	
	always @(*)
		begin
		outM = 0;
		if (addressR[15:13]==0) outM = ram[addressR[12:0]];
		else
			case (addressR)
				but_A: outM = {14'b00000000000000,but};
				led_A: outM = {14'b00000000000000,led};
			endcase
		end
	

	//RAM
	reg [15:0] ram [0:1023];
	always @(posedge clk)
		if (writeM & (addressW[15:13]==0)) ram[addressW] <= inM;

	//ROM		
	reg [15:0] rom [0:1023];
	assign instruction = rom[pc];
	initial begin
		$readmemb(ROMFILE,rom);
	end
	
	// leds	
	always @(posedge clk)
		if (!rstn) led <= 0;
		else if (writeM & (addressW==led_A)) led <= inM[1:0];

endmodule
```

### Hack Computer

Hack1 is a minimal version of our hack computer consisting of  six hardware modules (Clock, CPU, ROM, RAM, Memory, Register). The memory can address 2048 words of RAM plus two registers mapped to I/O, with which we can control button and leds on the board. ROM of 2048 words will be preloaded with small assembler programs to test the hardware.

![](./img/Hack1.png)

### Memory map
|address | memory|R/W|function|
|-|-|-|-|
|0-2047  | RAM|R/W|R0--R15, static, stack, heap|
| 8192    | but|R/W|0 = button pressed, 1 = button released|
| 8193    | led|R/W|0 = led off, 1 = led on|

---

**That's it**, not a long journey, right? Now you have a computer  running at100 MHz (clk_in), with two buttons (but[1:0]) and two leds (led[1:0]).