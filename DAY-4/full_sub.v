module full_sub(a,b,bin,diff,bor);

input a,b,bin;
output diff,bor;

assign diff =a^b^bin;
assign bor =(~a&b)|(bin&(a~^b));

endmodule

