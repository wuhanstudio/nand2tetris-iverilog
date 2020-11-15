## Step 3 - Computer
Unfortunately, there is no test file in the last section, but you can test it on your real hardware.

### Reset.v

```
/**
 * The module rst delivers a reset signal at power up which
 * is clocked by clk.
 *
 * The timing diagram should be:
 * -------------------------------------------
 * clk     0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 ...
 * -------------------------------------------
 * reset   0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 ...
 * -------------------------------------------
 */

module Reset(
    input  wire clk,
    output wire reset
);

    // your implementation comes here:

    // remember that you did it
    reg done = 0;
    always @(posedge clk)
        done <= 1;

    // reset it on start
    reg reset_r = 0;
    always @(posedge clk) begin
        if (done==0) reset_r <=1;
        else reset_r <= 0;
	end

    assign reset = reset_r;

endmodule
```

### Rom.v

```
/**
 * The module rom provides access to the instruction memory
 * of hack. The instruction memory is read only (ROM) and
 * preloaded with 4Kx16bit of Hackcode.
 * 
 * The signal data (16bit) provides the instruction at memory address
 * data = ROM[address]
 */

module ROM(
    input  wire [15:0] address,
    output wire [15:0] data        
);

    // your implementation comes here:

    // ROM file of hack
    parameter ROMFILE = "./blinky.hack";
    
    reg [15:0] regROM [0:1023];
    assign data = regROM[address];
    initial begin
        $readmemb(ROMFILE,regROM);
    end

endmodule
```

### Memory.v

```
/*
 * The module mem provides access to memory RAM 
 * and memory mapped IO
 * In our Minimal-Hack-Project we will use 4Kx16 Bit RAM
 * 
 * address | memory
 * ----------------
 * 0-4047  | RAM
 * 8192    | but
 * 8193    | led
 *
 * WRITE:
 * When load is set to 1, 16 bit dataW are stored to Memory address
 * at next clock cycle. M[address] <= dataW
 * READ:
 * dataR provides data stored in Memory at address.
 * dataR = M[address]
 *
 */

module Memory(
    input  wire clk,
    input  wire [15:0] address,
    input  wire [15:0] dataW,
    output wire [15:0] dataR,
    input  wire load,
    input  wire [1:0] but,
    output wire [1:0] led
);

    // your implementation comes here:

    // Read Memory    
    assign dataR =  (address[13]==0)? regRAM[address[11:0]] : memGPIO;
    wire [15:0] memGPIO;
    assign memGPIO =  (address[0]==0)? regLED : but;

    // Write to RAM
    reg [15:0] regRAM [0:8191];
    always @(posedge clk) begin
        if (load & (address[13]==0)) regRAM[address[11:0]] <= dataW;
    end

    // leds
    assign led = regLED[1:0];
    reg [15:0] regLED = 0;
    always @(posedge clk) begin
        if (load & (address==8192)) regLED <= dataW;
        else regLED <= regLED;
    end

endmodule
```

The last file to accomplish.

### Hack.v

```
/** 
 * The module hack is our top-level module
 * It connects the external pins of our fpga (hack.pcf)
 * to the internal components (cpu,mem,clk,rst,rom)
 *
 */

`default_nettype none
module hack(                        // top level module 
    input  wire clk,                
    input  wire [1:0] but,          // buttons  (0 if pressed, 1 if released)
    output wire [1:0] led           // leds     (0 off, 1 on)
);

    // your implementation comes here:

    // reset logic
    wire reset;
    Reset Reset_0(.clk(clk),.reset(reset));

    // hack cpu (nand2tetris)
    wire [15:0] pc;
    wire [15:0] instruction;
    wire [15:0] addressM;
    wire [15:0] inM;
    wire loadM;
    wire [15:0] outM;
    CPU CPU_0(                        
        .clk(clk),
        .inM(inM),                  // M value input  (M = contents of RAM[A])
        .instruction(instruction),  // Instruction for execution
        .reset(reset),              // Signals whether to re-start the current
                                    // program (rstn==0) or continue executing
                                    // the current program (rstn==1).
        .outM(outM),                // M value output
        .loadM(loadM),              // Write to M? 
        .addressM(addressM),        // Address in data memory to Read(of M)
        .pc(pc)                     // address of next instruction
    );

    // rom stores hack code
    ROM ROM_0(
        .address(pc),
        .data(instruction)
    );

    // mem gives access to ram and io    
    Memory Memory_0(
        .clk(clk),
        .address(addressM),
        .dataR(inM),
        .dataW(outM),
        .load(loadM),
        .but(but),
        .led(led)
    );

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
