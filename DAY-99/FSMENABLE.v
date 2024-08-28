module top_module (
    input clk,
    input reset,      
    output reg shift_ena
);

    localparam IDLE      = 3'b000,
               ENABLE_1  = 3'b001,
               ENABLE_2  = 3'b010,
               ENABLE_3  = 3'b011,
               ENABLE_4  = 3'b100;

    reg [2:0] state, next_state;

    always @(posedge clk) begin
        if (reset) begin
            state <= ENABLE_1;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            ENABLE_1:  next_state = ENABLE_2;
            ENABLE_2:  next_state = ENABLE_3;
            ENABLE_3:  next_state = ENABLE_4;
            ENABLE_4:  next_state = IDLE;
            default:   next_state = IDLE;
        endcase
    end

    always @(*) begin
        shift_ena = (state != IDLE);  
    end

endmodule
