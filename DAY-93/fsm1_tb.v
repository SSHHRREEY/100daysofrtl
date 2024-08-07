module top_module_tb;

  reg clk;
  reg areset;
  reg in;
  wire out;

  // Instantiate the top_module
  top_module uut (
    .clk(clk),
    .areset(areset),
    .in(in),
    .out(out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle clock every 5 time units
  end

  initial begin
    // Initialize inputs
    clk = 0;
    areset = 0;
    in = 0;

    // Apply asynchronous reset
    #10 areset = 1;
    #10 areset = 0;

    // Test sequence
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;

    // Apply asynchronous reset again
    #10 areset = 1;
    #10 areset = 0;

    // Test sequence after reset
    #10 in = 1;
    #10 in = 0;

    // Finish simulation
    #20 $finish;
  end

  initial begin
    // Monitor the signals
    $monitor("Time: %0d, clk: %b, areset: %b, in: %b, state: %b, out: %b", $time, clk, areset, in, uut.state, out);
  end

endmodule
