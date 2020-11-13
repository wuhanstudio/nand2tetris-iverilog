
all ALU_test.out:
	iverilog -o ALU_test.out ALU_tb.v And.v And16.v Nand.v Not.v Not16.v Or.v Or8Way.v Xor.v Mux.v Mux16.v HalfAdder.v FullAdder.v Add16.v ALU.v

run ALU_tb.vcd: ALU_test.out
	vvp ALU_test.out

sim: ALU_tb.vcd
	gtkwave ALU_tb.vcd

nand_test: tb/Nand_tb.v Nand.v
	iverilog -o Nand_test.out tb/Nand_tb.v Nand.v
	vvp Nand_test.out
	diff Nand.out tb/Nand.cmp
	@echo "--- NAND PASS ---\n"

not_test: tb/Not_tb.v Not.v Nand.v
	iverilog -o Not_test.out tb/Not_tb.v Not.v Nand.v
	vvp Not_test.out
	diff Not.out tb/Not.cmp
	@echo "--- Not PASS ---\n"

test: nand_test not_test
	@echo "--- ALL PASS ---\n"

clean:
	rm -f *.out *.vcd