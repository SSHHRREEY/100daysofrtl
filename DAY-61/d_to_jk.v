module d_flipflop(input clk,d,output reg q,qbar);
always@(posedge clk)
begin

q<=d;
qbar<=~d;

end
endmodule

module d_to_jk(input clk,j,k,output q,qbar);
wire d;

assign d=q&~k + ~qbar&j;

d_flipflop dff(clk,d,q,qbar);
endmodule
