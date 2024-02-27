module gr_to_bin_tb;
    wire [3:0] b;
    reg [3:0] g;
    
    // Instantiate the device under test (DUT)
    gr_to_bin dut (.b(b), .g(g));
    
    // Stimulus
    initial begin
        // Initialize g
        g = 4'b0000;
        
        // Apply each Gray code value sequentially and observe the binary output
        #10; g = 4'b0001;
        #10; g = 4'b0010;
        #10; g = 4'b0011;
        #10; g = 4'b0100;
        #10; g = 4'b0101;
        #10; g = 4'b0110;
        #10; g = 4'b0111;
        #10; g = 4'b1000;
        #10; g = 4'b1001;
        #10; g = 4'b1010;
        #10; g = 4'b1011;
        #10; g = 4'b1100;
        #10; g = 4'b1101;
        #10; g = 4'b1110;
        #10; g = 4'b1111;
        
        // End simulation
        #10; $finish;
    end
endmodule
