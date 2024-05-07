module jk_to_sr_tb();
    reg s, r, clk;
    wire q, qbar;

    jk_to_jr dut (clk,s,r,q,qbar);
    initial
    clk = 0;
    always #5 clk = ~clk; 


    initial begin

        
        s = 0;r = 0;#10; 
        s = 0;r = 1;#10; 
        s = 1;r = 0;#10; 
        s = 1;r = 1;#10; 
        
        #20;

$finish;
end
endmodule
