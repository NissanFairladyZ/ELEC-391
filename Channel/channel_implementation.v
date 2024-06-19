module AWGN_channel(
input wire clk,
input wire reset,
output wire [15:0] AWGN_noise
);

wire [15:0] AWGN_noise_21;
wire [15:0] AWGN_noise_9;
wire channel_decider;

gilbert_channel inst(
.clk(clk),
.reset(reset),
.state(channel_decider)
);

AWGN_21db_LUT inst2(
.clk(clk),
.noise21(AWGN_noise_21)
);

AWGN_9db_LUT inst3(
.clk(clk),
.noise9(AWGN_noise_9)
);

assign AWGN_noise = (channel_decider) ? AWGN_noise_9:AWGN_noise_21;

endmodule