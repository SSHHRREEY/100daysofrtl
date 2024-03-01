module mux2(s,i0,i1,y);
input s,i0,i1;
output reg y;

always@(*)
begin

if(s)
y=i1;

else
y=i0;


end

endmodule