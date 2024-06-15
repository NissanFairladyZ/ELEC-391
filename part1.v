module part1 (CLOCK_50, CLOCK2_50, KEY, FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, 
		        AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT);

	input CLOCK_50, CLOCK2_50;
	input [0:0] KEY;
	// I2C Audio/Video config interface
	output FPGA_I2C_SCLK;
	inout FPGA_I2C_SDAT;
	// Audio CODEC
	output AUD_XCK;
	input AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input AUD_ADCDAT;
	output AUD_DACDAT;
	
	// Local wires.
	wire read_ready, write_ready;
	wire read, write;
	wire [15:0] readdata_left, readdata_right;
	wire [15:0] writedata_left, writedata_right;
	//wire [31:0] data_in;
	wire [15:0] data_out1;
	wire [15:0] data_out2;
	wire reset = ~KEY[0];
	
	
	//audio_player ap (CLOCK_50,audio_out);
	downsampler dp(.CLOCK_50(CLOCK_50),.reset(reset),.data_in(readdata_left),.data_out(data_out1));
	downsampler up(.CLOCK_50(CLOCK_50),.reset(reset),.data_in(readdata_right),.data_out(data_out2));
	

	assign writedata_left = write ? data_out1: 16'b0;
	assign writedata_right = write ? data_out2: 16'b0;
	assign read = read_ready && write_ready;
	assign write = write_ready && write_ready;
	
/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following wires:
// read_ready, write_ready - CODEC ready for read/write operation 
// readdata_left, readdata_right - left and right channel data from the CODEC
// read - send data from the CODEC (both channels)
// writedata_left, writedata_right - left and right channel data to the CODEC
// write - send data to the CODEC (both channels)
// AUD_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio CODEC
// I2C_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio/Video Config module
/////////////////////////////////////////////////////////////////////////////////
	clock_generator my_clock_gen(
		// inputs
		CLOCK2_50,
		reset,

		// outputs
		AUD_XCK
	);

	audio_and_video_config cfg(
		// Inputs
		CLOCK_50,
		reset,

		// Bidirectionals
		FPGA_I2C_SDAT,
		FPGA_I2C_SCLK
	);

	audio_codec codec(
		// Inputs
		CLOCK_50,
		reset,

		read,	write,
		writedata_left, writedata_right,

		AUD_ADCDAT,

		// Bidirectionals
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,

		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		AUD_DACDAT
	);
/*	
	module audio_player (
    input CLOCK_50,
    output [15:0] audio_out
);
    reg [15:0] memory [0:65535];
    reg [15:0] address = 0;

    initial $readmemb("C\elec391\audio.mif", memory);

    always @(posedge CLOCK_50) begin
        audio_out <= memory[address];
        address <= address + 1;
    end
	 
endmodule
*/
endmodule 

module downsampler(
input CLOCK_50, 
input wire reset, 
input wire [15:0] data_in,
output reg [15:0] data_out
);

reg [2:0] counter;

always@(posedge CLOCK_50 or posedge reset) begin
if(reset) begin
counter<=16'd0;
data_out<=16'd0;
end else if (counter == 3'd5) begin
data_out <= data_in;
counter <=16'd0;
end else begin
counter <= counter +1;
data_out <= data_out;
end
end
endmodule

/*
module part1 (
    CLOCK_50, CLOCK2_50, KEY,
    FPGA_I2C_SCLK, FPGA_I2C_SDAT,
    AUD_XCK, AUD_DACLRCK, AUD_ADCLRCK,
    AUD_BCLK, AUD_ADCDAT, AUD_DACDAT
);

    input CLOCK_50, CLOCK2_50;
    input [2:0] KEY;
    // I2C Audio/Video config interface
    output FPGA_I2C_SCLK;
    inout FPGA_I2C_SDAT;
    // Audio CODEC
    output AUD_XCK;
    input AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
    input AUD_ADCDAT;
    output AUD_DACDAT;

    // Local wires.
    wire read_ready, write_ready, read, write;
    wire [23:0] readdata_left, readdata_right;
    wire [23:0] writedata_left, writedata_right;
    wire reset = ~KEY[0];

    // Noise and filter
    wire [23:0] noise;
    wire [23:0] clear_data_left, clear_data_right;
    wire [23:0] noisy_left_input, noisy_right_input;
    reg [23:0] register_output1,register_output2,register_output3,register_output4,register_output5,register_output6,register_output7,register_output8;

    noise_generator gen(CLOCK_50, 1'b1, reset, noise);
   	
    assign noisy_left_input =  readdata_left + noise;
    assign noisy_right_input = readdata_right + noise;
    assign writedata_left = (KEY[2]) && write_ready ? noisy_left_input : clear_data_left;
    assign writedata_right = (KEY[2]) && write_ready ? noisy_right_input : clear_data_right;
    assign read = read_ready && write_ready ;
    assign write = write_ready && write_ready;
    assign clear_data_left = (noisy_left_input << 3) + (register_output1 >> 3) + (register_output2 >> 3)+(register_output3 >> 3) + (register_output4 >> 3)+(register_output5 >> 3) +
    (register_output6 >> 3)+(register_output7 >> 3); 
    assign clear_data_right = clear_data_left;


    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset) begin
            register_output1 <= 0;
            register_output2 <= 0;
            register_output3 <= 0;
            register_output4 <= 0;
            register_output5 <= 0;
            register_output6 <= 0;
            register_output7 <= 0;
        end else if (read_ready) begin
            register_output1 <= noisy_left_input;
            register_output2 <= register_output1;
            register_output3 <= register_output2;
            register_output4 <= register_output3;
            register_output5 <= register_output4;
            register_output6 <= register_output5;
            register_output7 <= register_output6;
        end
    end



    /////////////////////////////////////////////////////////////////////////////////
    // Audio CODEC interface.
    //
    // The interface consists of the following wires:
    // read_ready, write_ready - CODEC ready for read/write operation
    // readdata_left, readdata_right - left and right channel data from the CODEC
    // read - send data from the CODEC (both channels)
    // writedata_left, writedata_right - left and right channel data to the CODEC
    // write - send data to the CODEC (both channels)
    // AUD_* - should connect to top-level entity I/O of the same name.
    //         These signals go directly to the Audio CODEC
    // I2C_* - should connect to top-level entity I/O of the same name.
    //         These signals go directly to the Audio/Video Config module
    /////////////////////////////////////////////////////////////////////////////////
    clock_generator my_clock_gen(
        // inputs
        CLOCK2_50,
        reset,

        // outputs
        AUD_XCK
    );

    audio_and_video_config cfg(
        // Inputs
        CLOCK_50,
        reset,

        // Bidirectionals
        FPGA_I2C_SDAT,
        FPGA_I2C_SCLK
    );

    audio_codec codec(
        // Inputs
        CLOCK_50,
        reset,

        read, write,
        writedata_left, writedata_right,

        AUD_ADCDAT,

        // Bidirectionals
        AUD_BCLK,
        AUD_ADCLRCK,
        AUD_DACLRCK,

        // Outputs
        read_ready, write_ready,
        readdata_left, readdata_right,
        AUD_DACDAT
    );

endmodule

module noise_generator (clk, enable, reset, Q);
    input clk, enable, reset;
    output [23:0] Q;
    reg [2:0] counter;
    always @(posedge clk) begin
        if (reset)
            counter = 0;
        if (enable)
            counter = counter + 1'b1;
    end
    assign Q = {{10{counter[2]}}, counter, 11'd0};
endmodule
*/



