module top_module (
    input clk,
    input reset,       // Synchronous reset
    input data,
    output reg shift_ena,
    output reg counting,
    input done_counting,
    output reg done,
    input ack
);

    // State declaration using localparam
    localparam IDLE  = 3'b000;
    localparam SHIFT = 3'b001;
    localparam COUNT = 3'b010;
    localparam DONE  = 3'b011;

    // State and other variables
    reg [2:0] state, next_state;
    reg [2:0] bit_count; // Counter to track 4 clock cycles for shifting
    reg [3:0] shift_reg; // Shift register to detect pattern 1101

    // State and bit counter management
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            shift_reg <= 0;
        end else begin
            state <= next_state;
            
            // Update shift register in IDLE state
            if (state == IDLE) begin
                shift_reg <= {shift_reg[2:0], data};
            end

            // Increment bit count in SHIFT state
            if (state == SHIFT)
                bit_count <= bit_count + 1;
            else
                bit_count <= 0;
        end
    end

    // State transition logic
    always @(*) begin
        // Default output values
        shift_ena = 0;
        counting = 0;
        done = 0;

        case (state)
            IDLE: begin
                // Detect the pattern 1101
                if (shift_reg == 4'b1101)
                    next_state = SHIFT;
                else 
                    next_state = IDLE;
            end

            SHIFT: begin
                // Enable shift_ena for 4 cycles
                shift_ena = 1;
                if (bit_count == 3) 
                    next_state = COUNT;
                else 
                    next_state = SHIFT;
            end

            COUNT: begin
                // Wait for done_counting signal
                counting = 1;
                if (done_counting) 
                    next_state = DONE;
                else 
                    next_state = COUNT;
            end

            DONE: begin
                // Notify the user and wait for acknowledgment
                done = 1;
                if (ack) 
                    next_state = IDLE;
                else 
                    next_state = DONE;
            end

            default: next_state = IDLE;
        endcase
    end

endmodule
