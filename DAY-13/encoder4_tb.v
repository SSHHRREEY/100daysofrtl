module encoder4_tb();

    reg [3:0] x;
    wire [1:0] y;

    encoder4 dut(x, y);

    initial begin
        

      
        x = 4'b1000; #10;
        
        x = 4'b0100; #10;

        x = 4'b0010; #10; 

        x = 4'b0001; #10; 

        $finish;
    end

endmodule
