// Testbench for moore_seq_detect
module tb_moore_seq_detect;

  reg x;
  reg clk;
  reg rst;
  wire z;

  // Instantiate the sequence detector module
  moore_seq_detect uut (
    .x(x),
    .clk(clk),
    .rst(rst),
    .z(z)
  );

  // Clock generation
  always #5 clk = ~clk; // 10 time units clock period

  // Test stimulus
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    x = 0;

    // Apply reset
    #10 rst = 1;

    // Test sequence '101'
    #10 x = 1;  // 1
    #10 x = 0;  // 10
    #10 x = 1;  // 101 (z should be 1)

    // Overlapping sequence '101'
    #10 x = 0;  // 010
    #10 x = 1;  // 101 (z should be 1)

    // Another test sequence
    #10 x = 1;  // 11
    #10 x = 0;  // 110
    #10 x = 1;  // 101 (z should be 1)

    // Test without sequence
    #10 x = 0;  // 0
    #10 x = 0;  // 00
    #10 x = 0;  // 000 (z should be 0)

    // End simulation
    #20 $finish;
  end

  // Monitor signals
  initial begin
    $monitor("At time %t: x = %b, rst = %b, z = %b, current_state = %b", $time, x, rst, z, uut.current_state);
  end

endmodule
