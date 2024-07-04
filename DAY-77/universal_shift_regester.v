 module universal_shift_reg(input clk,rst,[1:0]mode,[3:0]d_in, output reg[3:0]d_out);
//  wire [1:0]mode;
//  wire [3:0]d_in;
  
  always @(posedge clk)
   begin
     if(rst)
       d_out <= 0;
     else
       begin
         case(mode)
          2'b00 : d_out <= d_out;      // locked mode, do nothing
          2'b01 : d_out <= {d_in[0], d_in[3:1]};//right_shift; 
          2'b10 : d_out <= {d_in[2:0], d_in[3]};//left_shift; 
          2'b11 : d_out <= d_in;       // parallel in parallel out
         endcase
       end
   end
  
 endmodule 