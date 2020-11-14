
all ALU_test.out:
	iverilog -o ALU_test.out tb/ALU_tb.v And.v And16.v Nand.v Not.v Not16.v Or.v Or8Way.v Xor.v Mux.v Mux16.v HalfAdder.v FullAdder.v Add16.v ALU.v

run ALU_tb.vcd: ALU_test.out
	vvp ALU_test.out

sim: ALU_tb.vcd
	gtkwave ALU_tb.vcd

mux_test: tb/Mux_tb.v Mux.v Not.v And.v Or.v Nand.v
	@iverilog -o Mux_test.out tb/Mux_tb.v Mux.v Not.v And.v Or.v Nand.v
	@vvp Mux_test.out
	@diff Mux.out tb/Mux.cmp
	@echo "--- MUX PASS ---"

mux16_test: tb/Mux16_tb.v Mux16.v Mux.v Not.v And.v Or.v Nand.v
	@iverilog -o Mux16_test.out tb/Mux16_tb.v Mux16.v Mux.v Not.v And.v Or.v Nand.v
	@vvp Mux16_test.out
	@diff Mux16.out tb/Mux16.cmp
	@echo "--- MUX16 PASS ---"

not16_test: tb/Not16_tb.v Not16.v Not.v Nand.v
	@iverilog -o Not16_test.out tb/Not16_tb.v Not16.v Not.v Nand.v
	@vvp Not16_test.out
	@diff Not16.out tb/Not16.cmp
	@echo "--- NOT16 PASS ---"

and16_test: tb/And16_tb.v And16.v And.v Nand.v
	@iverilog -o And16_test.out tb/And16_tb.v And16.v And.v Nand.v
	@vvp And16_test.out
	@diff And16.out tb/And16.cmp
	@echo "--- AND16 PASS ---"

or8way_test: tb/Or8Way_tb.v Or8Way.v Or.v Not.v Nand.v
	@iverilog -o Or8Way_test.out tb/Or8Way_tb.v Or8Way.v Or.v Not.v Nand.v
	@vvp Or8Way_test.out
	@diff Or8Way.out tb/Or8Way.cmp
	@echo "--- OR8WAY PASS ---"

halfadder_test: tb/HalfAdder_tb.v HalfAdder.v Xor.v Not.v Or.v And.v Nand.v
	@iverilog -o HalfAdder_test.out tb/HalfAdder_tb.v HalfAdder.v Xor.v Not.v Or.v And.v Nand.v
	@vvp HalfAdder_test.out
	@diff HalfAdder.out tb/HalfAdder.cmp
	@echo "--- HALFADDER PASS ---"

fulladder_test: tb/FullAdder_tb.v FullAdder.v HalfAdder.v Xor.v Not.v Or.v And.v Nand.v
	@iverilog -o FullAdder_test.out tb/FullAdder_tb.v FullAdder.v HalfAdder.v Xor.v Not.v Or.v And.v Nand.v
	@vvp FullAdder_test.out
	@diff FullAdder.out tb/FullAdder.cmp
	@echo "--- FULLADDER PASS ---"

add16_test: tb/Add16_tb.v Add16.v FullAdder.v HalfAdder.v Xor.v Not.v Or.v And.v Nand.v
	@iverilog -o Add16_test.out tb/Add16_tb.v  Add16.v FullAdder.v HalfAdder.v Xor.v Not.v Or.v And.v Nand.v
	@vvp Add16_test.out
	@diff Add16.out tb/Add16.cmp
	@echo "--- ADD16 PASS ---"

alu_test: tb/ALU_tb.v ALU.v Add16.v FullAdder.v HalfAdder.v Mux16.v Not16.v And16.v  Or8Way.v Mux.v Xor.v Not.v Or.v And.v Nand.v
	@iverilog -o ALU_test.out tb/ALU_tb.v ALU.v Add16.v FullAdder.v HalfAdder.v Mux16.v Not16.v And16.v Or8Way.v Mux.v Xor.v Not.v Or.v And.v Nand.v
	@vvp ALU_test.out
	@diff ALU.out tb/ALU.cmp
	@echo "--- ALU PASS ---"

test: mux_test mux16_test not16_test and16_test or8way_test halfadder_test fulladder_test add16_test alu_test
	@echo ""
	@echo "--- ALL PASS ---\n"

clean:
	rm -f *.out *.vcd