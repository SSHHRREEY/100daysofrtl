module tb_pipo;
    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;

    wire [3:0] parallel_out;

    pipo uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
      
        rst = 0;
        load = 0;
        parallel_in = 4'b0000;

        rst = 1;
        #10;
        rst = 0;
        #10;

        parallel_in = 4'b1010;
        load = 1;
        #10;
        load = 0;
        #10;

        parallel_in = 4'b0110;
        load = 1;
        #10;
        load = 0;
        #10;

        rst = 1;
        #10;
        rst = 0;
        #10;

        $stop;
    end

    initial begin
        $monitor("Time=%0t : clk=%b rst=%b load=%b parallel_in=%b parallel_out=%b",
                 $time, clk, rst, load, parallel_in, parallel_out);
    end

endmodule
