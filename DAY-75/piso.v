module piso (
    input clk,        
    input  rst,        
    input load,      
    input  [3:0] parallel_in,  
    output  shift_out 
);

    reg [3:0] shift_reg;
    always @(posedge clk) begin
        if (rst) begin
            shift_reg <= 4'b0000;
        end else if (load) begin
            shift_reg <= parallel_in;
        end else begin
            shift_reg <= {shift_reg[2:0], 1'b0}; 
        end
    end

    assign shift_out = shift_reg[0];

endmodule
