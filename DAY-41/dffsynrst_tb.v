`timescale 1ns / 1ps

module dffsynrst_tb;

    reg clk, rst, d;
    wire q;

    dffsynrst dff_inst (clk,rst,d,q);

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 0;
        d = 0;

        #20 rst = 1;
        #20 rst = 0;

        #10 d = 1; // Apply input D = 1
        #10 d = 0; // Apply input D = 0

        // Test scenario 2
        #20 d = 1; // Apply input D = 1
        #20 d = 1; // Apply input D = 1

        // Test scenario 3
        #20 d = 0; // Apply input D = 0
        #20 d = 1; // Apply input D = 1
         $finish;
    end


endmodule
