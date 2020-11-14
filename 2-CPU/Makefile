
all CPU_test.out:
	iverilog -o CPU_test.out tb/CPU_tb.v *.v

run CPU_tb.vcd: CPU_test.out
	vvp CPU_test.out

sim: CPU_tb.vcd
	gtkwave CPU_tb.vcd

cpu_test: tb/CPU_tb.v *.v
	@iverilog -o CPU_test.out tb/CPU_tb.v *.v
	@vvp CPU_test.out
	@diff CPU.out tb/CPU.cmp
	@echo "--- CPU PASS ---"

test: cpu_test
	@echo ""
	@echo "--- ALL PASS ---\n"

clean:
	rm -f *.out *.vcd