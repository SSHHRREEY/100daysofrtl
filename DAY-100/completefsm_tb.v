module tb_top_module();

    // Declare inputs as reg and outputs as wire
    reg clk;
    reg reset;
    reg data;
    reg done_counting;
    reg ack;
    wire shift_ena;
    wire counting;
    wire done;

    // Instantiate the module under test (MUT)
    top_module uut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .shift_ena(shift_ena),
        .counting(counting),
        .done_counting(done_counting),
        .done(done),
        .ack(ack)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        data = 0;
        done_counting = 0;
        ack = 0;

        // Apply reset
        #15 reset = 0; // Release reset after 15ns

        // Pattern 1101 detection
        // IDLE state should now look for 1101 pattern
        data = 1; #10;
        data = 1; #10;
        data = 0; #10;
        data = 1; #10; // Pattern 1101 applied
        
        // SHIFT state: assert shift_ena for 4 cycles
        #40; // Wait 40ns (4 cycles of shift_ena)

        // COUNT state: counting signal should be asserted
        done_counting = 1; #10; // Simulate the counter finishing
        
        // DONE state: done signal should be asserted
        #10 ack = 1; // Simulate user acknowledgment
        
        // Back to IDLE state
        #10 ack = 0;
        
        // End simulation
        #20 $stop;
    end

    // Monitor the signals
    initial begin
        $monitor("At time %t: state=%b, data=%b, shift_ena=%b, counting=%b, done=%b",
                 $time, uut.state, data, shift_ena, counting, done);
    end

endmodule
