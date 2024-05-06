module sr_to_t_tb();
 reg t,clk;
  wire q, qbar;

    sr_to_t dut (clk,t,q,qbar);
    initial
    clk = 0;
    always #5 clk = ~clk; 


    initial begin

#10 t=1;
#10 t=0;
#10 t=1;
#10 t=0;

        
        #20;

$finish;
end
endmodule

