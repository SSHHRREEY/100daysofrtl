module srff_tb();
reg clk,rst,s,r; 
wire q;

srff dut (clk,rst,s,r,q);


always #5 clk = ~clk;

initial begin
clk = 0;
rst=1;
s = 0;
r = 0;

#10 rst = 0;

    #10; s = 0; r = 1;
    #10 ;s = 0; r = 0;
    #10 ;s = 0; r = 1; 
    #10 ;s = 1; r = 0;
    #10 ;s = 1; r = 1;
     $finish; 



end
endmodule
