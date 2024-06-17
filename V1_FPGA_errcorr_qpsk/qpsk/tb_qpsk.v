

module tb_qpsk_mod_demod;
    reg clk;
    reg reset;
    reg [1:0] data_in;
    wire signed [15:0] qpsk_out_I;
    wire signed [15:0] qpsk_out_Q;
    wire [1:0] data_out;

    qpsk_modulator mod (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .qpsk_out_I(qpsk_out_I),
        .qpsk_out_Q(qpsk_out_Q)
    );

    qpsk_demodulator demod (
        .clk(clk),
        .reset(reset),
        .qpsk_in_I(qpsk_out_I),
        .qpsk_in_Q(qpsk_out_Q),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        data_in = 2'b00;
        #10 reset = 0;

        #10 data_in = 2'b00;
        #10 $display("Input Data: 00, I: %d, Q: %d, Output Data: %b", data_in, qpsk_out_I, qpsk_out_Q, data_out);

        #10 data_in = 2'b01;
        #10 $display("Input Data: 01, I: %d, Q: %d, Output Data: %b", data_in, qpsk_out_I, qpsk_out_Q, data_out);

        #10 data_in = 2'b10;
        #10 $display("Input Data: 10, I: %d, Q: %d, Output Data: %b", data_in, qpsk_out_I, qpsk_out_Q, data_out);

        #10 data_in = 2'b11;
        #10 $display("Input Data: 11, I: %d, Q: %d, Output Data: %b", data_in, qpsk_out_I, qpsk_out_Q, data_out);

        #10 $finish;
    end
endmodule
