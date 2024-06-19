module 	LFSR(
input	logic	clk, 
input 	logic	reset,
output	logic	[7:0]	LSFR_out);
		
logic	[7:0]	in = 8'b10000001;

logic feedback;

always@(posedge clk) begin 
	if(reset)
	in <=8'b10000001;
	else
	in <= {(in <<< 1'b1),feedback};
	end

assign feedback = in[7]^in[4]^in[3]^in[2];

assign LSFR_out = in;


endmodule
