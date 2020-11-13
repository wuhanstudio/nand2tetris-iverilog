all Clock_test.out:
	iverilog -o Clock_test.out Clock_tb.v Clock.v

run Clock_test.vcd: Clock_test.out
	vvp Clock_test.out

sim: Clock_tb.vcd
	gtkwave Clock_tb.vcd

clean:
	rm -f Clock_tb.vcd Clock_test.out Clock.out