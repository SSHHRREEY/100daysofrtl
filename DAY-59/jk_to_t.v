module jk_flipflop( input clk, j, k,output reg q, qbar);

    always @(posedge clk) 
    begin
        q=1'b1;
        qbar = 1'b1;
        
        case ({j, k})
            2'b00: begin
                q <= q;
                qbar <= qbar;end
            2'b01: begin
                q <= 1'b0;
                qbar <= 1'b1;end
            2'b10: begin
                q <= 1'b1;
                qbar <= 1'b0;end
            2'b11: begin
                q <= 1'b1;
                qbar <= 1'b0;end
        endcase
    end
endmodule

module jk_to_t(input clk, 
    input t,
    output reg q,
    output reg qbar);
    
wire j, k;
    
    // Connect J and K to always high (logic 1)
    assign j = 1'b1;
    assign k = 1'b1;

    // Connect T to both J and K
    assign t = j & k;

    // Instantiate JK flip-flop module
    jk_flipflop jkff (clk, j, k, q, qbar);

endmodule
