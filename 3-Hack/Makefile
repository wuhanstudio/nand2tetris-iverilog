
all Hack_test.out:
	iverilog -o Hack_test.out *.v

run Hack_tb.vcd: Hack_test.out
	vvp Hack_test.out

sim: Hack_tb.vcd
	gtkwave Hack_tb.vcd

clean:
	rm -f *.out *.vcd