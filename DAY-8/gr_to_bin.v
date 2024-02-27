module gr_to_bin(
    input [3:0] g,
    output reg [3:0] b
);

    always @* begin
        b[0] = g[0] ^ b[1];
        b[1] = b[2] ^ g[1];
        b[2] = b[3] ^ b[2];
        b[3] = g[3];
    end

endmodule
