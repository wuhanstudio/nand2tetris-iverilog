
all Memory_test.out:
	iverilog -o Memory_test.out tb/Memory_tb.v Memory.v And.v DMux.v Not.v Or.v Mux.v Mux16.v Nand.v

run Memory_tb.vcd: Memory_test.out
	vvp Memory_test.out

sim: Memory_tb.vcd
	gtkwave Memory_tb.vcd

dmux_test: tb/DMux_tb.v DMux.v And.v Not.v Nand.v
	@iverilog -o DMux_test.out tb/DMux_tb.v DMux.v And.v Not.v Nand.v
	@vvp DMux_test.out
	@diff DMux.out tb/DMux.cmp
	@echo "--- DMux PASS ---"

dmux4way_test: tb/DMux4Way_tb.v DMux4Way.v DMux.v And.v Not.v Nand.v
	@iverilog -o DMux4Way_test.out tb/DMux4Way_tb.v DMux4Way.v DMux.v And.v Not.v Nand.v
	@vvp DMux4Way_test.out
	@diff DMux4Way.out tb/DMux4Way.cmp
	@echo "--- DMux4Way PASS ---"

dmux8way_test: tb/DMux8Way_tb.v DMux8Way.v DMux4Way.v DMux.v And.v Not.v Nand.v
	@iverilog -o DMux8Way_test.out tb/DMux8Way_tb.v DMux8Way.v DMux4Way.v DMux.v And.v Not.v Nand.v
	@vvp DMux8Way_test.out
	@diff DMux8Way.out tb/DMux8Way.cmp
	@echo "--- DMux8Way PASS ---"

test: dmux_test dmux4way_test dmux8way_test
	@echo ""
	@echo "--- ALL PASS ---\n"

clean:
	rm -f *.out *.vcd