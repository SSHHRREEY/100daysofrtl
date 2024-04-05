module srffnand(
    input clk, s, r,
    output reg q
);

always @(posedge clk) begin
    case({s,r})
        2'b00: q <= q; // No change
        2'b01: q <= 0; // Reset
        2'b10: q <= 1; // Set
        2'b11: q <= 1'bx; // Invalid state
    endcase
end

endmodule
