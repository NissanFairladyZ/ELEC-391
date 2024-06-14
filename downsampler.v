module downsampler(
    input CLOCK_50,
    input wire reset,
    input wire [15:0] data_in,
    output reg [15:0] data_out,
output reg valid_out
);
    reg [2:0] counter;

    always @(posedge CLOCK_50 or posedge reset) begin

//data_out = 16'd0;
       if (reset) begin
           counter <= 16'd0;
           data_out <= 16'd0;
        end else if (counter == 3'd1) begin
            data_out <= data_in;
             counter <= 16'd0;
         end else begin
           counter <= counter + 1;
data_out <= data_out;
       end
    end
endmodule