module johnson_counter_tb();
  reg clk,rst;
  wire [3:0] out;
  
  johnson_counter dut (.out(out), .rst(rst), .clk(clk));
  
  always 
    #5 clk =~clk;
  
  initial begin
    rst=1'b1; clk=1'b0;
   #20 rst= 1'b0;
  end
  
  initial 
    begin 
   	 $monitor( $time, " clk=%b, out= %b, rst=%b", clk,out,rst);
  	 #105  $stop;  
   end
 
endmodule