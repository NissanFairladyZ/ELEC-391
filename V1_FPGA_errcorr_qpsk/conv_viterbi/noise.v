module noise_generator2 (clk, enable, reset, Q);
input clk, enable, reset;
output [15:0] Q;
reg [4:0] counter = 5'b0;

always@(posedge clk) begin
	if(reset) counter <= 0;
	else if(enable) counter <= counter + 1'b1;
end

assign Q = {{5{counter[4]}},counter, 6'b0};
endmodule
