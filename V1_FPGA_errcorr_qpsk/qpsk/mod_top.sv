module mod_top(input clk, input reset, input [31:0] data_in, output [15:0] I_comp [15:0] , output [15:0] Q_comp [15:0]);

qpsk_modulator bit15(.clk(clk),
			.reset(reset),
			.data_in(data_in[31:30]),
			.qpsk_out_I(I_comp[15]),
			.qpsk_out_Q(Q_comp[15]));
qpsk_modulator bit14(.clk(clk),
			.reset(reset),
			.data_in(data_in[29:28]),
			.qpsk_out_I(I_comp[14]),
			.qpsk_out_Q(Q_comp[14]));
qpsk_modulator bit13(.clk(clk),
			.reset(reset),
			.data_in(data_in[27:26]),
			.qpsk_out_I(I_comp[13]),
			.qpsk_out_Q(Q_comp[13]));
qpsk_modulator bit12(.clk(clk),
			.reset(reset),
			.data_in(data_in[25:24]),
			.qpsk_out_I(I_comp[12]),
			.qpsk_out_Q(Q_comp[12]));
qpsk_modulator bit11(.clk(clk),
			.reset(reset),
			.data_in(data_in[23:22]),
			.qpsk_out_I(I_comp[11]),
			.qpsk_out_Q(Q_comp[11]));
qpsk_modulator bit10(.clk(clk),
			.reset(reset),
			.data_in(data_in[21:20]),
			.qpsk_out_I(I_comp[10]),
			.qpsk_out_Q(Q_comp[10]));
qpsk_modulator bit9(.clk(clk),
			.reset(reset),
			.data_in(data_in[19:18]),
			.qpsk_out_I(I_comp[9]),
			.qpsk_out_Q(Q_comp[9]));
qpsk_modulator bit8(.clk(clk),
			.reset(reset),
			.data_in(data_in[17:16]),
			.qpsk_out_I(I_comp[8]),
			.qpsk_out_Q(Q_comp[8]));
qpsk_modulator bit7(.clk(clk),
			.reset(reset),
			.data_in(data_in[15:14]),
			.qpsk_out_I(I_comp[7]),
			.qpsk_out_Q(Q_comp[7]));
qpsk_modulator bit6(.clk(clk),
			.reset(reset),
			.data_in(data_in[13:12]),
			.qpsk_out_I(I_comp[6]),
			.qpsk_out_Q(Q_comp[6]));
qpsk_modulator bit5(.clk(clk),
			.reset(reset),
			.data_in(data_in[11:10]),
			.qpsk_out_I(I_comp[5]),
			.qpsk_out_Q(Q_comp[5]));
qpsk_modulator bit4(.clk(clk),
			.reset(reset),
			.data_in(data_in[9:8]),
			.qpsk_out_I(I_comp[4]),
			.qpsk_out_Q(Q_comp[4]));
qpsk_modulator bit3(.clk(clk),
			.reset(reset),
			.data_in(data_in[7:6]),
			.qpsk_out_I(I_comp[3]),
			.qpsk_out_Q(Q_comp[3]));
qpsk_modulator bit2(.clk(clk),
			.reset(reset),
			.data_in(data_in[5:4]),
			.qpsk_out_I(I_comp[2]),
			.qpsk_out_Q(Q_comp[2]));
qpsk_modulator bit1(.clk(clk),
			.reset(reset),
			.data_in(data_in[3:2]),
			.qpsk_out_I(I_comp[1]),
			.qpsk_out_Q(Q_comp[1]));
qpsk_modulator bit0(.clk(clk),
			.reset(reset),
			.data_in(data_in[1:0]),
			.qpsk_out_I(I_comp[0]),
			.qpsk_out_Q(Q_comp[0]));




endmodule

