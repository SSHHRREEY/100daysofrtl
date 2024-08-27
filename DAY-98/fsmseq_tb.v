module tb_top_module;

    reg clk;
    reg reset;
    reg data;
    wire start_shifting;

    top_module uut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .start_shifting(start_shifting)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;
        data = 0;

        reset = 1;
        #10;
        reset = 0;

        data = 0;
        #10;

        data = 1;
        #10;

        data = 1;
        #10;

        data = 0;
        #10;

        data = 1;
        #10;

        data = 0;
        #10;
        data = 1;
        #10;
        data = 1;
        #10;

        reset = 1;
        #10;
        reset = 0;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | data = %b | start_shifting = %b", 
                 $time, clk, reset, data, start_shifting);
    end

endmodule
