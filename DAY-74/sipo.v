module sipo (
    input wire clk,        
    input wire rst,         
    input wire shift_in,   
    output wire [3:0] q    
);

    reg [3:0] shift_reg;
    always @(posedge clk) begin
        if (rst) begin
      shift_reg <= 4'b0000;
        end else begin
            shift_reg <= {shift_in, shift_reg[3:1]};
        end
    end

    assign q = shift_reg;

endmodule
