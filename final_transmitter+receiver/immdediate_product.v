module imm_product(
  input signed [15:0] in1, // bit 15: sign bit, bit 14-13: integer, bit 12-0: fraction
  input signed [15:0] in2, // bit 15: sign bit, bit 14-13: integer, bit 12-0: fraction
  output  signed [15:0] prod_ab
);

wire signed [31:0] c;
wire signed [31:0] a, b;
wire signed [63:0] product; // intermediate product

// Convert fixed-point inputs to 32-bit signed integers
assign a = { {16{in1[15]}}, in1[15:0] }; // sign-extend in1 to 32 bits
assign b = { {16{in2[15]}}, in2[15:0] }; // sign-extend in2 to 32 bits

// Perform multiplication
assign product = a * b;

// Adjust the product to fixed-point format by right shifting 13 bits (fractional part)
assign c = product >>> 13;
assign prod_ab = c[15:0];

endmodule
