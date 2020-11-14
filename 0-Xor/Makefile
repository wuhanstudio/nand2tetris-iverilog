all Xor_test.out: tb/Xor_tb.v Xor.v Or.v Not.v And.v Nand.v
	iverilog -o Xor_test.out tb/Xor_tb.v Xor.v Or.v Not.v And.v Nand.v

run Xor_tb.vcd: Xor_test.out
	vvp Xor_test.out

sim: Xor_tb.vcd
	gtkwave Xor_tb.vcd

test: run
	diff Xor.out tb/Xor.cmp
	@echo "--- XOR PASS ---\n"

clean:
	rm -f Xor_tb.vcd Xor_test.out Xor.out