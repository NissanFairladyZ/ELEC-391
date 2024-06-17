
module qpsk_demodulator (
    input wire clk,
    input wire reset,
    input wire signed [15:0] qpsk_in_I,
    input wire signed [15:0] qpsk_in_Q,
    output reg [1:0] data_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 2'b00;
        end else begin
            if (qpsk_in_I >= 0 && qpsk_in_Q >= 0)
                data_out <= 2'b00;
            else if (qpsk_in_I < 0 && qpsk_in_Q >= 0)
                data_out <= 2'b01;
            else if (qpsk_in_I >= 0 && qpsk_in_Q < 0)
                data_out <= 2'b10;
            else
                data_out <= 2'b11;
        end
    end
endmodule
