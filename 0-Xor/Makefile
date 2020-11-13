all Xor_test.out:
	iverilog -o Xor_test.out Xor.v Xor_tb.v

run Xor_tb.vcd: Xor_test.out
	vvp Xor_test.out

sim: Xor_tb.vcd
	gtkwave Xor_tb.vcd

clean:
	rm -f Xor_tb.vcd Xor_test.out Xor.out