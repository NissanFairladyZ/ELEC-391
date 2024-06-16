
module transmitter_t2_tb();
  reg [15:0] symb_in;
  reg clk, reset, read;
  wire [15:0] symb_out;

  transmitter_t2 transmitter(symb_in, symb_out, clk, reset, read);

  initial begin
    reset = 1; #10;
    reset = 0; read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    read = 1; symb_in = 16'b0001011010100001; #10;
    read = 0; #20;
    #400; $stop;
  end

  always begin
    clk = 0; #5; clk = 1; #5;
  end
endmodule

