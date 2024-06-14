module tb_gilbert_channel();

    // Clock and reset signals
    logic clk;
    logic reset;

    // State output from the Gilbert Channel
    logic state;

    // Instantiate the Gilbert Channel module
    gilbert_channel uut (
        .clk(clk),
        .reset(reset),
        .state(state)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Reset generation and test sequence
    initial begin
        // Monitor the state
        $monitor("Time: %0t, State: %0b", $time, state);

        // Initial reset
        reset = 1;
        #20;
        reset = 0;

        // Run simulation for some time
        #3000;
        $finish;
    end

endmodule