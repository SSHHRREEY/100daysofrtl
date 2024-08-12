module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        if(state==OFF&&j==0)
            next_state<=OFF;
        else if(state==OFF&&j==1)
            next_state<=ON;
        else if(state==ON&&k==1)
            next_state<=OFF;
        else if(state==ON&&k==0)
            next_state<=ON;
        else 
            next_state<=next_state;
            
        // State transition logic
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=OFF;
        else
            state<=next_state;
        // State flip-flops with asynchronous reset
    end
    // Output logic
    assign out = (state == OFF?0:1);

endmodule