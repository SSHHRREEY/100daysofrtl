module mux(    input i0, i1, i2, i3,
    input sel0, sel1,
    output reg y
);

always @(*) begin
    case({sel0, sel1}) 
        2'b00: y = i0;
        2'b01: y = i1;
        2'b10: y = i2;
        2'b11: y = i3;
        default: y = 1'b0; 
    endcase
end

endmodule
