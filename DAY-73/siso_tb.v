`timescale 1ns / 1ps

module tb_siso();
reg clk;
reg rst;
reg shift_in;

wire shift_out;

    siso uut (
        .clk(clk),
        .rst(rst),
        .shift_in(shift_in),
        .shift_out(shift_out)
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

        #100;
        $stop;
    end

endmodule
