
all PC_test.out:
	iverilog -o PC_test.out tb/PC_tb.v And.v And16.v Inc16.v Not.v Not16.v Or.v Or8Way.v Xor.v Mux.v Mux16.v HalfAdder.v FullAdder.v Add16.v PC.v

run PC_tb.vcd: PC_test.out
	vvp PC_test.out

sim: tb/PC_tb.vcd
	gtkwave PC_tb.vcd

inc16_test: tb/Inc16_tb.v Inc16.v Add16.v FullAdder.v HalfAdder.v Xor.v And.v Not.v Or.v Nand.v
	@iverilog -o Inc16_test.out tb/Inc16_tb.v Inc16.v Add16.v FullAdder.v HalfAdder.v Xor.v And.v Not.v Or.v Nand.v
	@vvp Inc16_test.out
	@diff Inc16.out tb/Inc16.cmp
	@echo "--- Inc16 PASS ---"

mux4way16_test: tb/Mux4Way16_tb.v Mux4Way16.v Mux16.v Mux.v And.v Not.v Or.v Nand.v
	@iverilog -o Mux4Way16_test.out tb/Mux4Way16_tb.v Mux4Way16.v Mux16.v Mux.v And.v Not.v Or.v Nand.v
	@vvp Mux4Way16_test.out
	@diff Mux4Way16.out tb/Mux4Way16.cmp
	@echo "--- Mux4Way16 PASS ---"

mux8way16_test: tb/Mux8Way16_tb.v Mux8Way16.v Mux4Way16.v Mux16.v Mux.v And.v Not.v Or.v Nand.v
	@iverilog -o Mux8Way16_test.out tb/Mux8Way16_tb.v Mux8Way16.v Mux4Way16.v Mux16.v Mux.v And.v Not.v Or.v Nand.v
	@vvp Mux8Way16_test.out
	@diff Mux8Way16.out tb/Mux8Way16.cmp
	@echo "--- Mux8Way16 PASS ---"

pc_test: tb/PC_tb.v PC.v Register.v Bit.v DFF.v Inc16.v Add16.v FullAdder.v HalfAdder.v Mux8Way16.v Mux4Way16.v Mux16.v Mux.v And.v Not.v Xor.v Or.v Nand.v
	@iverilog -o PC_test.out tb/PC_tb.v PC.v Register.v Bit.v DFF.v Inc16.v Add16.v FullAdder.v HalfAdder.v Mux8Way16.v Mux4Way16.v Mux16.v Mux.v And.v Not.v Xor.v Or.v Nand.v
	@vvp PC_test.out
	@diff PC.out tb/PC.cmp
	@echo "--- PC PASS ---"

test: inc16_test mux4way16_test mux8way16_test pc_test
	@echo ""
	@echo "--- ALL PASS ---\n"

clean:
	rm -f *.out *.vcd