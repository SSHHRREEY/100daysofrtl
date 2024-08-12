`timescale 1ns/1ps

module top_module_tb;

    // Inputs
    reg clk;
    reg areset;
    reg j;
    reg k;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .clk(clk),
        .areset(areset),
        .j(j),
        .k(k),
        .out(out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    initial begin
        // Initialize Inputs
        clk = 0;
        areset = 0;
        j = 0;
        k = 0;

        // Apply asynchronous reset
        #10 areset = 1;
        #10 areset = 0;

        // Test sequence 1: Test OFF -> ON transition
        #10 j = 1; k = 0;  // Expect: out = 1

        // Test sequence 2: Test ON -> OFF transition
        #20 j = 0; k = 1;  // Expect: out = 0

        // Test sequence 3: Test holding ON state
        #20 j = 0; k = 0;  // Expect: out = 1

        // Test sequence 4: Test holding OFF state
        #20 j = 0; k = 0;  // Expect: out = 0

        // Test sequence 5: Apply reset during ON state
        #20 j = 1; k = 0;
        #10 areset = 1;    // Apply reset, Expect: out = 0
        #10 areset = 0;

        // Test sequence 6: Transition from OFF -> ON again
        #20 j = 1; k = 0;  // Expect: out = 1

        // Test sequence 7: Apply reset during OFF state
        #20 j = 0; k = 1;
        #10 areset = 1;    // Apply reset, Expect: out = 0
        #10 areset = 0;

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | areset: %b | j: %b | k: %b | out: %b", $time, areset, j, k, out);
    end

endmodule
