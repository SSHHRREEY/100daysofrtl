module jkffwithoutrst_tb();

    reg clk, j, k;
    wire q;

    
    jkffwithoutrst dut (clk,j,k,q);

  
    always #5 clk = ~clk;


    initial begin
        
        clk = 0;j = 0;k = 0;
        #10 j = 0; k = 1;
        #10 j = 0; k = 0;
        #10 j = 1; k = 1;
        #10 j = 0; k = 1;
        #10 j = 1; k = 0;
        #10 j = 1; k = 1;
$finish; 
    end

endmodule
