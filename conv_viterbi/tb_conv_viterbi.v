`timescale 1 ns / 1 ns
module tb_conv_viterbi();
reg clk;
reg reset;
//reg In;
wire [31:0] encoded;
//wire Out;
reg clk_enable;
integer i;
wire [15:0] In;
wire [15:0] Out;
/*
 Viterbi_Decoder_Subsystem u_Viterbi_Decoder_Subsystem (.clk(clk),
                                                         .reset(reset),
                                                         .clk_enable(clk_enable),
                                                         .In(In),
                                                         .ce_out(ce_out),
                                                         .Out(Out)
                                                         );


  CE u_CE (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In),
           .CE_out_0(encoded[0]),  // boolean
           .CE_out_1(encoded[1])  // boolean
           );

  Viterbi_Decoder1 u_Viterbi_Decoder1 (.clk(clk),
                                       .reset(reset),
                                       .enb(clk_enable),
                                       .Viterbi_Decoder1_in_0(encoded[0]),  // boolean
                                       .Viterbi_Decoder1_in_1(encoded[1]),  // boolean
                                       .decoded(Out)
                                       );
*/


noise_generator2 noise(.clk(clk),
		.enable(clk_enable),
		.reset(reset),
		.Q(In));


convolution_top convolution(.clk(clk),
				.reset(reset),
				.clk_enable(clk_enable),
				.In(In),
				.encoded(encoded));

viterbi_top viterbi(.clk(clk),
			.reset(reset),
			.clk_enable(clk_enable),
			.encoded(encoded),
			.Out(Out)); 


task clock;
    begin
        clk = 1'b1;
        #1;
        clk = 1'b0;
        #1;
    end
endtask

initial begin
reset = 1'b1;
clk_enable = 1'b0;
clock;
clock;
reset = 1'b0;
clock;
clk_enable = 1'b1;

for(i = 0; i < 100; i = i + 1) begin
	clock;
	clock;
end


end


endmodule
