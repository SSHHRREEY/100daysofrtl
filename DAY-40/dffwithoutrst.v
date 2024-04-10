module dffwithoutrst(clk,d,q);

input clk,d;
output reg q;

always@(posedge clk)
begin

q<=d;

end
endmodule
