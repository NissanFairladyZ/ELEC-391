`timescale 1 ns / 1 ns
module top_system(input clk, input reset, input clk_enable, input [15:0] in, output [15:0] out);


wire [15:0] downsampler_out;
wire [31:0] encoded1;
wire [15:0] I_comp [15:0];
wire [15:0] Q_comp [15:0];
wire [31:0] encoded2;

downsampler downsampler(.CLOCK_50(clk),
			.reset(reset),
			.data_in(in),
			.data_out(downsampler_out),
			.valid_out());

convolution_top convolution(.clk(clk),
				.reset(reset),
				.clk_enable(clk_enable),
				.In(downsampler_out),
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








endmodule