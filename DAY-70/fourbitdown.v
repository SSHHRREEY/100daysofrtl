module fourbitdown( clk,rst,out);

input clk,rst;
output reg[3:0] out ;

always@(posedge clk)
begin

if(rst==0)
out<=0;

else
out<=out-1;


end
endmodule
