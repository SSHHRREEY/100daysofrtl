module sr_to_jk_test();
    reg j, k, clk;
    wire q, qbar;

    sr_to_jk dut (clk,j,k,q,qbar);
    initial
    clk = 0;
    always #5 clk = ~clk; 


    initial begin

        
        j = 0;k = 0;#10; 
        j = 0;k = 1;#10; 
        j = 1;k = 0;#10; 
        j = 1;k = 1;#10; 
        
        #20;

$finish;
end
endmodule
