 module bidirectional_reg(input clk,rst,en,direction,d_in, output reg[3:0]d_out);
  
  always@(posedge clk)
   begin
    if(rst)
	 d_out <= 0;
	else
     if(en)
	  begin
       case(direction)
        0 : d_out <= {d_in,d_out[3:1]};
        1 : d_out <= {d_out[2:0],d_in};
        default d_out <= d_out;
       endcase
      end
	  else
        d_out <= d_out;	  
     end
  endmodule   
