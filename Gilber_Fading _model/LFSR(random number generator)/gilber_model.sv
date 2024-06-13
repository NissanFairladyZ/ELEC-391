module gilbert_channel (
    input logic clk,
    input logic reset,
    output logic state  // 0 for Good (G), 1 for Bad (B)
);

    // State encoding
    typedef enum logic  {
        G = 1'b0,  // Good state
        B = 1'b1   // Bad state
    } state_t;

    state_t current_state, next_state;

    // Transition probabilities
    parameter real p_GB = 0.05;  // Probability of going from G to B
    parameter real p_BG = 0.20;  // Probability of going from B to G

    // Random number generator for transitions
    real rand_val=$urandom_range(100) / 100.0;	//The rand_val variable will be replaced by the LFSR(random number) result in the end, in the top module.
	//try rand_val with constant.
    // State transition logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= G;  // Start in Good state
        end else begin
            current_state <= next_state;
        end
    end

    // Next state logic
    always_comb begin
        // Generate a random value between 0 and 1
        rand_val = 0.04;

        case (current_state)
            G: begin
                if (rand_val < p_GB) begin
                    next_state = B;
                end else begin
                    next_state = G;
                end
            end
            B: begin
                if (rand_val < p_BG) begin
                    next_state = G;
                end else begin
                    next_state = B;
                end
            end
        endcase
    end

    // Output logic
    always_ff @(posedge clk) begin
        state <= current_state;
    end

endmodule
