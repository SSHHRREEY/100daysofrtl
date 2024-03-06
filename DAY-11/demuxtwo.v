module demuxtwo(i,e,s0,y0,y1);
input i,e,s0;
output y0,y1;

assign y0=e&~s0;
assign y1=e&s0;

endmodule