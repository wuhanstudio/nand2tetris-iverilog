## Building a 16-bit CPU from Scratch on FPGA (nand2tetris) 

- Some may ask how many lines of code are required to design a simple programmable CPU?

- The answer is **less than 350 lines of verilog code** in 16 files.

```
Starting from a single Nand gate, you'll build a 16-bit blinky CPU that runs on real-world FPGAs.
```

### Prerequisites

A small laptop is enough for this project. No extra hardware required.

Software to be installed:

- Make
- iverilog
- gtkwave

If you'd like to run this CPU on real FPGAs, here's the synthesis report in Lattice Diamond:

```
Design Summary
   Number of registers:    152 out of  4635 (3%)
      PFU registers:          152 out of  4320 (4%)
      PIO registers:            0 out of   315 (0%)
   Number of SLICEs:       134 out of  2160 (6%)
      SLICEs as Logic/ROM:    134 out of  2160 (6%)
      SLICEs as RAM:            0 out of  1620 (0%)
      SLICEs as Carry:         10 out of  2160 (0%)
   Number of LUT4s:        267 out of  4320 (6%)
      Number used as logic LUTs:        247
      Number used as distributed RAM:     0
      Number used as ripple logic:       20
      Number used as shift registers:     0
   Number of PIO sites used: 5 + 4(JTAG) out of 105 (9%)
   Number of block RAMs:  4 out of 10 (40%)
   Number of GSRs:        0 out of 1 (0%)
```

It's so tiny that virtually any randomly chosen FPGA should work.

### Instructions

> Detailed instructions will be given under each directory.

#### Step 1 - Environment Setup

Build useful gates starting from a single Nand gate.

- Nand.v
- Not.v
- And.v
- Or.v
- Xor.v

#### Step 2 - ALU

Time to build an ALU.

- Mux.v
- Not16.v
- And16.v
- Mux16.v
- Or8Way.v
- HalfAdder.v
- FullAdder.v
- Add16.v
- ALU.v

#### Step 3 - CPU

A working 16-bit CPU:

- CPU.v

#### Step 4 - Computer

A programmable computer with input (buttons) and output (LEDs):

- Hack.v

![](./3-Hack/img/Hack1.png)

### Related Projects

- https://www.nand2tetris.org/
- https://gitlab.com/x653/nand2tetris-fpga/
- https://github.com/theapi/nand2tetris_fpga