module demod_top(input clk, input reset, input [15:0] I_comp [15:0], input [15:0] Q_comp [15:0], output [31:0] data_out);

qpsk_demodulator bit15(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[15]),
			.qpsk_in_Q(Q_comp[15]),
			.data_out(data_out[31:30]));
qpsk_demodulator bit14(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[14]),
			.qpsk_in_Q(Q_comp[14]),
			.data_out(data_out[29:28]));
qpsk_demodulator bit13(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[13]),
			.qpsk_in_Q(Q_comp[13]),
			.data_out(data_out[27:26]));
qpsk_demodulator bit12(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[12]),
			.qpsk_in_Q(Q_comp[12]),
			.data_out(data_out[25:24]));
qpsk_demodulator bit11(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[11]),
			.qpsk_in_Q(Q_comp[11]),
			.data_out(data_out[23:22]));
qpsk_demodulator bit10(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[10]),
			.qpsk_in_Q(Q_comp[10]),
			.data_out(data_out[21:20]));
qpsk_demodulator bit9(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[9]),
			.qpsk_in_Q(Q_comp[9]),
			.data_out(data_out[19:18]));
qpsk_demodulator bit8(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[8]),
			.qpsk_in_Q(Q_comp[8]),
			.data_out(data_out[17:16]));
qpsk_demodulator bit7(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[7]),
			.qpsk_in_Q(Q_comp[7]),
			.data_out(data_out[15:14]));
qpsk_demodulator bit6(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[6]),
			.qpsk_in_Q(Q_comp[6]),
			.data_out(data_out[13:12]));
qpsk_demodulator bit5(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[5]),
			.qpsk_in_Q(Q_comp[5]),
			.data_out(data_out[11:10]));
qpsk_demodulator bit4(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[4]),
			.qpsk_in_Q(Q_comp[4]),
			.data_out(data_out[9:8]));
qpsk_demodulator bit3(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[3]),
			.qpsk_in_Q(Q_comp[3]),
			.data_out(data_out[7:6]));
qpsk_demodulator bit2(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[2]),
			.qpsk_in_Q(Q_comp[2]),
			.data_out(data_out[5:4]));
qpsk_demodulator bit1(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[1]),
			.qpsk_in_Q(Q_comp[1]),
			.data_out(data_out[3:2]));
qpsk_demodulator bit0(.clk(clk),
			.reset(reset),
			.qpsk_in_I(I_comp[0]),
			.qpsk_in_Q(Q_comp[0]),
			.data_out(data_out[1:0]));





endmodule
