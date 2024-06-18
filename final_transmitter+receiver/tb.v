module transmitter_receiver_tb();
  reg [15:0] symb_in;
  reg clk, reset;
  reg read_ready_t, read_ready_r;
  wire [15:0] symb_out;
  wire [15:0] out;
  wire [15:0] downsampled_out;

  transmitter_t2 transmitter(symb_in, symb_out, clk, reset, read_ready_t);
  reciever_t2  reciever(symb_out, out, clk, reset,read_ready_r);
  downsampler downsampler(.in(out), .out(downsampled_out), .clk(clk), .reset(reset));
  initial begin
    
    reset = 1; #10;
    reset = 0; read_ready_t= 1; read_ready_r=1; symb_in = 16'b0001011010100000; #10; // 0.70703125 in decimal, 

    #1000; $stop;
  end

  always begin
    clk = 0; #5; clk = 1; #5;
  end
endmodule
