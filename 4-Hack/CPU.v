/**
 * The Hack CPU (Central Processing unit), consisting of an ALU,
 * two registers named A and D, and a program counter named PC.
 * The CPU is designed to fetch and execute instructions written in 
 * the Hack machine language. In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM==0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time step. If reset==1 then the 
 * CPU jumps to address 0 (i.e. pc is set to 0 in next time step) rather 
 * than to the address resulting from executing the current instruction. 
 */

module CPU(
	input wire clk,
    input wire [15:0] inM,         	// M value input  (M = contents of RAM[A])
    input wire [15:0] instruction, 	// Instruction for execution
	input wire rstn,           		// Signals whether to re-start the current
                         			// program (rstn==1) or continue executing
                         			// the current program (rstn==0).

    output reg [15:0] outM,       	// M value output
    output wire writeM,          	// Write to M? 
    output wire [15:0] addressMR,   // Address in data memory (of M) to read
    output wire [15:0] addressMW,   // Address in data memory (of M) to write
    output reg [15:0] pc         	// address of next instruction
);
	reg loadM;
	assign writeM = loadM;
	assign addressMR = regAn;
	assign addressMW = regA;
	localparam FETCH = 0;
	localparam EXEC = 1;
	localparam JMP =2;

	reg [1:0] next_state;
	reg [1:0] state;
	always @(posedge clk)
		if (!rstn) state <= FETCH;
		else state <= next_state;

	always @(*)
	begin
		next_state = FETCH;
		loadI = 0;
		inc=0;
		jmp=0;
		loadA=0;
		loadM=0;
		loadALU=0;
		loadAI=0;
		loadAn=0;
		loadD=0;
		case (state)
			FETCH:
				begin
					next_state = EXEC;
					loadI = 1;
				end
			EXEC:
				begin
					if (regI[15])
						begin
							next_state = JMP;
							loadALU=1;
						end
					else
						begin
							next_state = FETCH;
							loadAI=1;
							inc=1;
						end
				end
			JMP:
				begin
					next_state = FETCH;
					loadA = regI[5];
					loadAn = !regI[5];
					loadD = regI[4];
					loadM = regI[3];
					jmp = ((lt & regI[2]) | (eq & regI[1]) | ((!(lt|eq)) & regI[0]));
					inc = !jmp;
				end
		endcase	
	end

	reg loadI;	
	reg [15:0] regI;
	always @(posedge clk)
		if (!rstn) regI <= 0;
		else if (loadI) regI <= instruction;
	
	reg [15:0] regM;
	always @(posedge clk)
		if (~rstn) regM <= 0;
		else if (loadI) regM <= inM;
	
	wire [15:0] am;
	assign am = (regI[12]) ? regM : regA;
	wire lt;
	wire eq;
	reg jmp;
	reg inc;
	wire [15:0] outALU;
	alu ALU(
		.x(regD),
		.y(am),
		.zx(regI[11]),
		.nx(regI[10]),
		.zy(regI[9]),
		.ny(regI[8]),
		.f(regI[7]),
		.no(regI[6]),
		.out(outALU),
		.zr(eq),
		.ng(lt)
	);
	reg loadALU;
	always @(posedge clk)
		if (!rstn) outM <= 0;
		else outM <= outALU;

	reg [15:0] regAn;
	reg loadAI;
	reg loadA;
	reg loadAn;
	always @(posedge clk)
		if (~rstn) regAn <= 0;
		else if (loadAI) regAn <= regI;
		else if (loadA) regAn <= outM;
		else if (loadAn) regAn <= regA;

	always @(posedge clk)
		if (~rstn) pc <= 0;
		else if (jmp) pc<= regAn;
		else if (inc) pc <= pc+1;
	
	reg [15:0] regA;
	always @(posedge clk)
		if (~rstn) regA <= 0;
		else if (loadI) regA <= regAn;
	
	reg [15:0] regD;
	reg loadD;
	always @(posedge clk)
		if (~rstn) regD <= 0;
		else if (loadD) regD <= outM;
	
endmodule
