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
    parameter real p_GB = 5;  // Probability of going from G to B
    parameter real p_BG = 20;  // Probability of going from B to G

    // Random number generator for transitions
    logic [7:0] LFSR_out; // Changed from LSFR_out to lfsr_out

    LFSR LFSR_inst (
        .clk(clk),
        .reset(reset),
        .LFSR_out(LFSR_out) // Changed from LSFR_out to lfsr_out
    );

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= G;  // Start in Good state
        end else begin
            current_state <= next_state;
        end
    end

    // Next state logic
    always_comb begin
        case (current_state)
            G: begin
                if ((LFSR_out>0)&&(LFSR_out <= p_GB)) begin // Changed from LSFR_out to lfsr_out
                    next_state = B;
                end else begin
                    next_state = G;
                end
            end
            B: begin
                if (LFSR_out <= p_BG) begin // Changed from LSFR_out to lfsr_out
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


//////////////////////////////////////

module 	LFSR(
input	logic	clk, 
input 	logic	reset,
output	logic	[7:0]	LFSR_out);
		
logic	[7:0]	in = 8'b10000001;

logic feedback;

always@(posedge clk) begin 
	if(reset)
	in <=8'b10000001;
	else
	in <= {(in <<< 1'b1),feedback};
	end

assign feedback = in[7]^in[4]^in[3]^in[2];

assign LFSR_out = in;


endmodule
