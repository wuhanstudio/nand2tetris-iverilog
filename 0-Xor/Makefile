all:
	iverilog -o Xor_test.out Xor.v Xor_tb.v

run:
	vvp Xor_test.out

sim:
	gtkwave Xor_tb.vcd

clean:
	rm Xor_tb.vcd Xor_test.out Xor.out