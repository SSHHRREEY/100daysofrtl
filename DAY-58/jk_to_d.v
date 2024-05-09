module jk_flipflop( input clk, j, k,output reg q, qbar);

    always @(posedge clk)
     begin
     q <= 1;
      qbar <= 1;
     
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
                q <= 1'b0;
                qbar <= 1'b1;end
        endcase
    end
endmodule

module jk_to_d(input clk,d,output q, qbar);
wire j, k;
assign j = d;
assign k = ~d;
jk_flipflop jkff (clk, d, q, qbar);
endmodule