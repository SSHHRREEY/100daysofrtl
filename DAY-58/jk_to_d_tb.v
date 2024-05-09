module sr_to_d_tb();
reg clk,d;
wire q,qbar;

sr_to_d dut (clk,d,q,qbar);

initial
clk=0;

always #5 clk=~clk;

initial begin

#10 d=0;
#10 d=1;
#10 d=1;
#10 d=0;

$finish;
end
endmodule
