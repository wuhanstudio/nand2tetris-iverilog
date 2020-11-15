
# Step 0 - Xor

To accomplish this part, try:

```
make test
```

you should see:

```
--- NAND PASS ---
--- Not PASS ---
--- AND PASS ---
--- OR PASS ---
--- XOR PASS ---
```

To make this happen, you need to implement several gates (around 5 lines of code each):

- Nand.v
- Not.v
- And.v
- Or.v
- Xor.v

And you can test them one by one to make sure every single step is OK:

```
make nand_test
make not_test
make and_test
make or_test
make xor_test
```

**When testing, becareful with the difference between LF (Linux) and CRLF (Windows).**

### File Structure

```
- Xor_tb.v    // Test file to make sure Xor is well functioning, you don't need to change this
- Xor.cmp     // Xor output sample
- Nand.v      // Implement it!
- Not.v       // Implement it!
- And.v       // Implement it!
- Or.v        // Implement it!
- Xor.v       // Implement it!
```

## Nand.v

```
/**
 * Nand gate: 
 * out = 0 if (a == 1 and b == 1)
 *       1 otherwise
 *
 * This module is implemented using verilog primitives
 */

`default_nettype none

module Nand(
	input a,
	input b,
	output out
);
	nand(out,a,b);
endmodule
```

### Not.v

```
/**
 * Not gate:
 * out = not in
 */
`default_nettype none

module Not(
	input wire in,
	output wire out
);

Nand Nand_1(in, in, out);

endmodule
```

## And.v

```
/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */
module And(
	input wire a,
	input wire b,
	output wire out
);

// your implementation comes here:

wire n_out;

nand(n_out, a, b);
nand(out, n_out, n_out);

endmodule
```

## Or.v

```
 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */
`default_nettype none

module Or(
	input wire a,
	input wire b,
	output wire out
);

wire n_a, n_b;

Not not_a(a, n_a);
Not not_b(b, n_b);
Nand Nand_1(n_a, n_b, out);

endmodule
```

## Xor.v

```
/**
 * Exclusive-or gate:
 * out = not (a == b)
 */
`default_nettype none

module Xor(
	input wire a,
	input wire b,
	output wire out
);

// assign out = a ^ b;

wire n_a, n_b, n_a_b, n_b_a;

Not not_a(a, n_a);
Not not_b(b, n_b);
And and_n_a_b(n_a, b, n_a_b);
And and_n_b_a(a, n_b, n_b_a);
Or or_o(n_a_b, n_b_a, out);

endmodule
```



**Congratulations**, you are now familiar with the workflow, and successfully implemented Xor gate starting from a single Nand gate.
