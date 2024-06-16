module imm_product_tb;

  // Inputs
  reg signed [15:0] in1;
  reg signed [15:0] in2;

  // Output
  wire signed [15:0] prod_ab;

  // Instantiate the Unit Under Test (UUT)
  imm_product uut (
    .in1(in1),
    .in2(in2),
    .prod_ab(prod_ab)
  );

  initial begin
    // Initialize Inputs
	in1 = 16'b0010000000000000; //1
	in2 = 16'b1111111111110101; //?0.0013427734375

    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here
    // Test case 1
	in1 = 16'b0101010101010101; //2.66650390625.
	in2 = 16'b1111111111110101; //?0.0013427734375
    #10;
    $display("in1 = %b, in2 = %b, prod_ab = %b", in1, in2, prod_ab);

    // Finish simulation
    $stop;
  end
endmodule
