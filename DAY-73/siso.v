module siso (
    input wire clk,       
    input wire rst,     
    input wire shift_in,  
    output wire shift_out 
);
 reg [3:0] q;

    always @(posedge clk ) begin
        if (rst) begin
           
            q <= 4'b0000;
        end 
        
        else
         begin
            q <= {shift_in, q[3:1]};
        end
    end

    assign shift_out = q[0];

endmodule
