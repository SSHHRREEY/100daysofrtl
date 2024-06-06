module sipo_tb();

    reg clk;
    reg rst;
    reg shift_in;

    wire [3:0] q;

    sipo uut (
        .clk(clk),
        .rst(rst),
        .shift_in(shift_in),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        rst = 0;
        shift_in = 0;

        #10;
        rst = 1;
        #10;
        rst = 0;

        
        shift_in = 1; #10; 
        shift_in = 0; #10; 
        shift_in = 1; #10; 
        shift_in = 1; #10; 

        shift_in = 0; #10; 
        shift_in = 1; #10; 
        shift_in = 0; #10;
        shift_in = 1; #10; 

        
        #100;
        $stop;
    end

endmodule
