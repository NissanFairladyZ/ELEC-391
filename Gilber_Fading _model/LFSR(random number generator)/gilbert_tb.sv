module gilbert_tb;



     logic clk;
     logic reset;
     logic state; // 0 for Good (G), 1 for Bad (B)


gilbert_channel DUT(
	.clk(clk),
	.reset(reset),
	.state(state)
	);

initial begin
	clk = 1'b0;
forever	#10 clk=~clk;

end


initial begin
	
	reset=1'b1;
	#20
	reset=1'b0;
	#200;

end
endmodule
