module srffnand_tb();

reg clk, s, r;
wire q;

srffnand dut (clk,s,r,q);

always #5 clk = ~clk;

initial begin
clk = 0;
s = 0;
r = 0;

    #10 s = 0; r = 1;
    #10 s = 0; r = 0;
    #10 s = 0; r = 1; 
    #10 s = 1; r = 0;
    #10 s = 1; r = 1;
     $finish; 
end

endmodule
