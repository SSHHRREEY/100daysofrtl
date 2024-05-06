module sr_flipflop( input clk, s, r,output reg q, qbar);

    always @(posedge clk) 
    begin
        q=1'b0;
        qbar = 1'b1;
        
        case ({s, r})
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

module sr_to_t(
    input clk,t,
    output q, qbar);

    wire s, r;
    
    assign s = t & qbar;
    assign r = t & q;

    sr_flipflop srff (clk, s, r, q, qbar);

endmodule