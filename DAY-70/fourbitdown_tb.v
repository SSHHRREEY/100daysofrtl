module fourbitdown_tb();

reg clk,rst;
wire out;

fourbitdown dut ( clk,rst,out);

always #5 clk=~clk;

initial
begin
clk=0;rst=0;

#10 rst=1;
#10 rst=0;
#10 rst=1;
#10 rst=0;
#10 rst=1;
#10 rst=1;
#10 rst=0;
#10 rst=0;
#10 rst=1;
$finish ;


end
endmodule
