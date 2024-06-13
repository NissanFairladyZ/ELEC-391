module tb_LFSR;

    // Testbench signals
    logic clk;
    logic reset;
    logic [7:0] LSFR_out;

    // Instantiate the LFSR module
    LFSR dut (
        .clk(clk),
        .reset(reset),
        .LSFR_out(LSFR_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock
    end

    // Stimulus
    initial begin
        // Initialize signals
        reset = 1;

        // Apply reset
        #20;
        reset = 0;

        // Run the LFSR for a while
        #200;

        // End simulation
        #1000;
        $finish;
    end

endmodule
