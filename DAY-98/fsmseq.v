module top_module (
    input clk,
    input reset,      
    input data,
    output reg start_shifting
);

    parameter S0 = 3'b000;  
    parameter S1 = 3'b001;  
    parameter S2 = 3'b010;  
    parameter S3 = 3'b011;  
    parameter S4 = 3'b100;  

    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            S0: next_state = data ? S1 : S0;
            S1: next_state = data ? S2 : S0;
            S2: next_state = data ? S2 : S3;
            S3: next_state = data ? S4 : S0;
            S4: next_state = S4; 
            default: next_state = S0;
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always @(posedge clk) begin
        if (reset)
            start_shifting <= 1'b0;
        else if (state == S4)
            start_shifting <= 1'b1;
    end

endmodule
