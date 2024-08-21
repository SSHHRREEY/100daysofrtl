module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter S0=2'b00, S1=2'b01, S2=2'b10;
    reg [1:0] state, next_state;

    // State transition logic (combinational)
    always @(*) begin
        case (state)
            S0: next_state = x ? S1:S0;
            S1: next_state = x ? S1:S2;
            S2: next_state = x ? S1:S0;
            default: next_state = S0;
        endcase
    end
    
    // State flip-flops (sequential)
    always @(posedge clk, negedge aresetn) begin
        state <= (aresetn==0) ? S0:next_state ;
    end
    
    // Output logic
    assign z = (state==S2 && x==1);
    
endmodule