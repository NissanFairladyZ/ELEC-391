`timescale 1 ns / 1 ns
module part1 (CLOCK_50, CLOCK2_50, KEY, FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, 
		        AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT);

	input CLOCK_50, CLOCK2_50;
	input [0:0] KEY;
	input [9:0] SW; //Line I Added
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
	wire [15:0] file_data;
	wire [15:0] data_out_mif2;
	wire [15:0] data_out_mif1;
	wire reset = ~KEY[0];
	
	
	reg [15:0] addr;  //Line I Added
	wire [15:0] file_data; //Line I Added
	reg clk_40k; //Line I Added
	reg [13:0] count; //Line I Added
	localparam  DIVIDE_BY = 1250; //Line I Added
	localparam  ROM_SIZE = 52612; //Line I Added
	
	always @(posedge CLOCK_50) begin //Line I Added
		if(count == DIVIDE_BY - 1) begin //Line I Added
			count <= 0; //Line I Added
			clk_40k <= ~clk_40k; //Line I Added
		end else begin //Line I Added
			count <= count + 14'b1; //Line I Added
		end //Line I Added
	end //Line I Added
	
	audio_rom rom1( //Line I Added
	.address(addr), //Line I Added
	.clock(CLOCK_50), //Line I Added
	.q(file_data) //Line I Added
	); //Line I Added
	
	always @(posedge clk_40k) begin //Line I Added
        if (reset) begin //Line I Added
            addr <= 0;  //Line I Added
        end else begin //Line I Added
			addr <= addr + 16'b1; //Line I Added
		end //Line I Added
	end //Line I Added
	
	
	
	/*
	//audio_player ap (CLOCK_50,audio_out);
	downsampler dp(.CLOCK_50(CLOCK_50),.reset(reset),.data_in(readdata_left),.data_out(data_out1));
	downsampler up(.CLOCK_50(CLOCK_50),.reset(reset),.data_in(readdata_right),.data_out(data_out2));
	*/
	top_system top(.clk(CLOCK_50),
		.reset(reset),
		.clk_enable(1'b1),
		.in(readdata_left),
		.out(data_out1));
		
	top_system top_mif(.clk(CLOCK_50), //Line I Added
	.reset(reset), //Line I Added
	.clk_enable(1'b1), //Line I Added
	.in(file_data), //Line I Added
	.out(data_out_mif1)); //Line I Added
	
	assign data_out2 = data_out1;
	assign data_out_mif2 = data_out_mif1; //Line I Added
	
	always_comb begin//Line I Added
	if(~SW[1]) begin //Line I Added
	assign writedata_left = (write) ? data_out1: 16'b0;
	assign writedata_right = (write) ? data_out2: 16'b0;
	assign read = read_ready && write_ready;
	assign write = write_ready && write_ready;
	end else if (SW[1]) begin //Line I Added
	assign writedata_left = (write) ? data_out_mif1: 16'b0; //Line I Added
	assign writedata_right = (wrtie) ? data_out_mif2: 16'b0; //Line I Added
	assign read = read_ready && write_ready; //Line I Added
	assign write = write_ready && write_ready; //Line I Added
	end else begin //Line I Added
	assign writedata_left = (write) ? data_out1: 16'b0; //Line I Added
	assign writedata_right = (write) ? data_out2: 16'b0; //Line I Added
	assign read = read_ready && write_ready; //Line I Added
	assign write = write_ready && write_ready; //Line I Added
	end //Line I Added
	end //Line I Added
    
	

	
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
