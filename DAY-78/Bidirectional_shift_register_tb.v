module bidirectional_shift_reg_tb();
  reg clk,rst,en,direction,d_in;
  wire [3:0]d_out;
  
 ///Instantiation
 bidirectional_reg BSR(clk,rst,en,direction,d_in,d_out);

///clock Initialization
initial
 begin
 clk = 1'b0;
 forever
 #5 clk = ~clk;
 end

///Initialization
 task initialize();
  {clk,rst,en,d_in} = 0;
 endtask 

 ////reset 
task reset();
 begin
  @(negedge clk)
  rst = 1'b1;
  @(negedge clk)
  rst = 1'b0;
 end 
 endtask

////stimulus generation
initial
 begin
  initialize;
  reset;
  en = 1;
  d_in = 0;
  @(negedge clk)
  direction = 0;
  #20;
   en = 1;
   d_in = 1;
  @(negedge clk)
   direction = 1;
  #20;
  en = 1;
  d_in = 1;
  @(negedge clk)
   direction = 0;
  #20
  en = 1;
  d_in = 0;
  @(negedge clk)
  direction = 1;
 end
initial #110 $finish;
endmodule 
  
    
  
 