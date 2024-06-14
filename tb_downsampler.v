module tb_downsampler();
reg CLOCK_50;
reg [15:0] data_in;
wire [15:0] data_out;
wire valid_out;
reg [2:0] counter;
reg reset;


downsampler DUT(.CLOCK_50(CLOCK_50),.data_in(data_in),.data_out(data_out), .reset(reset));

initial begin
forever begin
CLOCK_50 = 1'b0;
#10;
CLOCK_50 = 1'b1;
#10;
end

end

initial begin
reset =1;
#30 reset = 0;
data_in=16'd100;
#20;
data_in=16'd200;
#20;
data_in=16'd300;
#20;
data_in=16'd400;
#20;
data_in=16'd500;
#20;
data_in=16'd600;
#20;
data_in=16'd700;
#20;
data_in=16'd800;


#5;
if(data_out==16'd600 && counter == 3'd5) begin
$display("PASS:Test passed");
end
else begin $display("FAIL:Tests failed");
end

end
endmodule