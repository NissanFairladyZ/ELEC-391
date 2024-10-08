module qpsk_modulator (
    input wire clk,
    input wire reset,
    input wire [1:0] data_in,
    output reg signed [15:0] qpsk_out_I,
    output reg signed [15:0] qpsk_out_Q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            qpsk_out_I <= 16'd0;
            qpsk_out_Q <= 16'd0;
        end else begin
            case (data_in)
                2'b00: begin
                    qpsk_out_I <= 16'sd23170; // 1/sqrt(2) * 32767
                    qpsk_out_Q <= 16'sd23170; // 1/sqrt(2) * 32767
                end
                2'b01: begin
                    qpsk_out_I <= -16'sd23170; // -1/sqrt(2) * 32767
                    qpsk_out_Q <= 16'sd23170;  // 1/sqrt(2) * 32767
                end
                2'b10: begin
                    qpsk_out_I <= 16'sd23170;  // 1/sqrt(2) * 32767
                    qpsk_out_Q <= -16'sd23170; // -1/sqrt(2) * 32767
                end
                2'b11: begin
                    qpsk_out_I <= -16'sd23170; // -1/sqrt(2) * 32767
                    qpsk_out_Q <= -16'sd23170; // -1/sqrt(2) * 32767
                end
            endcase
        end
    end
endmodule
