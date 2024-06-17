`timescale 1 ns / 1 ns
module tb_errcorr_qpsk();
reg clk;
reg reset;
reg clk_enable;
integer i;
wire [15:0] in;
wire [15:0] audio;
wire [31:0] encoded1;
wire [15:0] I_comp [15:0];
wire [15:0] Q_comp [15:0];
wire [31:0] encoded2;
wire [15:0] out;

task clock;
    begin
        clk = 1'b1;
        #1;
        clk = 1'b0;
        #1;
    end
endtask


noise_generator2 noise(.clk(clk),
		.enable(clk_enable),
		.reset(reset),
		.Q(audio));

downsampler downsampler(.CLOCK_50(clk),
			.reset(reset),
			.data_in(audio),
			.data_out(in),
			.valid_out());

convolution_top convolution(.clk(clk),
				.reset(reset),
				.clk_enable(clk_enable),
				.In(in),
				.encoded(encoded1));

mod_top mod(.clk(clk),
		.reset(reset),
		.data_in(encoded1),
		.I_comp(I_comp),
		.Q_comp(Q_comp));

demod_top demod(.clk(clk),
		.reset(reset),
		.I_comp(I_comp),
		.Q_comp(Q_comp),
		.data_out(encoded2));

viterbi_top viterbi(.clk(clk),
			.reset(reset),
			.clk_enable(clk_enable),
			.encoded(encoded2),
			.Out(out)); 

initial begin
reset = 1'b1;
clk_enable = 1'b1;
clock;
clock;
reset = 1'b0;
clock;

for(i = 0; i < 100; i = i + 1) begin
	clock;
end


end

endmodule
