module jkffwithsynrst_tb();

reg rst,clk,j,k;
wire q;

jkffwithsynrst dut ( clk,rst,j,k,q);

always #5 clk=~clk;

initial 
begin

clk=0;rst=1;j=0;k=0;

#10 rst=0;

#10 j=0;k=1;
#10 j=0;k=0;
#10 j=1;k=1;
#10 j=1;k=1;
#10 j=1;k=0;
#10 j=1;k=1;
$finish;

end
endmodule
