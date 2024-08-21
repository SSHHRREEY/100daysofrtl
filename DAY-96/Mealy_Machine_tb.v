module tb_top_module;
    // Inputs
    reg clk;
    reg aresetn;
    reg x;

    // Output
    wire z;

    // Instantiate the module
    top_module uut (
        .clk(clk),
        .aresetn(aresetn),
        .x(x),
        .z(z)
    );

    // Clock generation
    always #5 clk = ~clk; // Clock with 10 time units period

    initial begin
        // Initialize inputs
        clk = 0;
        aresetn = 0;
        x = 0;

        // Apply asynchronous reset
        #7 aresetn = 1;  // Release reset after 7 time units

        // Apply input stimulus
        #10 x = 1;  // Input sequence
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;

        // Finish simulation
        #20 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0d | clk=%b | aresetn=%b | x=%b | z=%b | state=%b", 
                 $time, clk, aresetn, x, z, uut.state);
    end

endmodule
