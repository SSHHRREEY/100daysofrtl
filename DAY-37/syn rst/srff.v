module srff(clk,rst,s,r,q);

input clk,rst,s,r; 
output reg q;

always@(posedge clk) 
begin
     if (rst)
     q<=0;
     
     else 
     begin
     case({s,r})
     2'b00:q<=q;
     2'b01:q<=0;
     2'b10:q<=1;
     2'b11:q<=1'bx;
     
endcase
end
end
endmodule
