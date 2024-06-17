`timescale 1 ns / 1 ns
module tb_top_system();
reg clk;
reg reset;
reg clk_enable;
integer i;
wire [15:0] in;
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
		.Q(in));

top_system top(.clk(clk),
		.reset(reset),
		.clk_enable(clk_enable),
		.in(in),
		.out(out));

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
