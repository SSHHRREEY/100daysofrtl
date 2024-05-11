module d_flipflop(input clk,d,output reg q,qbar);
always@(posedge clk)
begin

q<=d;
qbar<=~d;

end
endmodule

module d_to_sr(input clk,s,r,output q,qbar);
wire d;

assign d= s+(~r)&qbar;

d_flipflop dff(clk,d,q,qbar);
endmodule
