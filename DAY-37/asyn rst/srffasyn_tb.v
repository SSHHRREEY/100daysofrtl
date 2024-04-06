module srffnand_tb();

reg clk, s, r;
wire q;

// Instantiate the DUT (Device Under Test)
srffnand dut (clk,rst,s,r,q);

// Clock generation
always #5 clk = ~clk;

// Initial values
initial begin
    clk = 0;
    s = 0;
    r = 0;

    #10 s = 0; r = 1; // No change
    #10 s = 0; r = 0; // Reset
    #10 s = 0; r = 1; // Reset (again)
    #10 s = 1; r = 0; // Set
    #10 s = 1; r = 1; // Invalid state (set and reset both active)
    #10 $finish; // End simulation
end

endmodule
