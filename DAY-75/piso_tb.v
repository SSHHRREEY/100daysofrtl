module piso_tb;

    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire shift_out;

    piso uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .shift_out(shift_out)
    );


    always #5 clk = ~clk; 

    
    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        parallel_in = 4'b0000;

        #10 rst = 0;

        #10 load = 1;
        parallel_in = 4'b1011;

        #10 load = 0;

        #50;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | load=%b | parallel_in=%b | shift_out=%b",
                 $time, rst, load, parallel_in, shift_out);
    end
endmodule
