module pipo (
    input clk,        
    input rst,        
    input load,      
    input [3:0] parallel_in,  
    output [3:0] parallel_out 
);

    reg [3:0] reg_data;

    always @(posedge clk) begin
        if (rst) begin
            reg_data <= 4'b0000;
        end else if (load) begin
            reg_data <= parallel_in;
        end
    end

    assign parallel_out = reg_data;

endmodule
