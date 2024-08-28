module tb_top_module;

    reg clk;
    reg reset;
    wire shift_ena;

    top_module uut (
        .clk(clk),
        .reset(reset),
        .shift_ena(shift_ena)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end

    initial begin
        $monitor("Time: %0t | reset: %b | shift_ena: %b", $time, reset, shift_ena);
    end

endmodule
