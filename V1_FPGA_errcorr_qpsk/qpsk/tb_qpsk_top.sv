`timescale 1 ns / 1 ns
module tb_qpsk_top();
reg clk;
reg reset;
reg clk_enable;
integer i;
wire [15:0] in;
wire [15:0] I_comp [15:0];
wire [15:0] Q_comp [15:0];
wire [31:0] out;

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
		.Q(in));

mod_top mod(.clk(clk),
		.reset(reset),
		.data_in({in, 16'b0}),
		.I_comp(I_comp),
		.Q_comp(Q_comp));

demod_top demod(.clk(clk),
		.reset(reset),
		.I_comp(I_comp),
		.Q_comp(Q_comp),
		.data_out(out));

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
