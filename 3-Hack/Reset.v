/**
 * The module rst delivers a reset signal at power up which
 * is clocked by clk.
 *
 * The timing diagram should be:
 * -------------------------------------------
 * clk     0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 ...
 * -------------------------------------------
 * reset   0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 ...
 * -------------------------------------------
 */

module Reset(
    input  wire clk,
    output reg reset
);

	// your implementation comes here:

    // remember that you did it
    reg done = 0;
    always @(posedge clk)
        done <= 1;

    // reset it on start
    reg reset = 0;
    always @(posedge clk) begin
        if (done==0) reset <=1;
        else reset <= 0;
	end

endmodule
