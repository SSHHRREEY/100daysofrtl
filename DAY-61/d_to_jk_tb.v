module d_to_jk_tb();
reg clk,j,k; 
wire q,qbar;

jkff dut (clk,j,k,q,qbar);


always #5 clk = ~clk;

initial begin
clk = 0;
j = 0;
k = 0;

    #10; j = 0; k = 1;
    #10 ;j = 0; k = 0;
    #10 ;j = 0; k = 1; 
    #10 ;j = 1; k = 0;
    #10 ;j = 1; k = 1;
     $finish; 



end
endmodule
