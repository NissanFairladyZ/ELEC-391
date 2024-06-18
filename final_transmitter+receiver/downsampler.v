module downsampler(in, out, clk, reset);
    input [15:0] in;
    input clk, reset;
    output reg [15:0] out;

    reg [4:0] counter;  // Since the rate is 4, we only need 2 bits (0 to 3)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;  // Reset counter to 0
            out <= 0;      // Clear output
        end else begin
            if (counter ==1) begin
                out <= in;  // Update output every fourth clock cycle
                counter <= 0;  // Reset counter
            end else begin
                counter <= counter + 1;  // Increment counter
                out <= out;  // Maintain old output
            end
        end
    end
endmodule
