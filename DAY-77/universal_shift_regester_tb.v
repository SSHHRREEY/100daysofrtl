module universal_shift_reg_tb();
  reg clk,rst;
  reg [1:0]mode;
  reg [3:0]d_in;
  wire [3:0]d_out;
  
 ///Instantiation
 universal_shift_reg usr(clk,rst,mode,d_in,d_out);

///clock Initialization
initial
 begin
 clk = 1'b0;
 forever
 #5 clk = ~clk;
 end

///Initialization
 task initialize();
  {clk,rst,mode,d_in} = 0;
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
 

/////Mode
//task modee();
// begin
//  @(negedge clk)
//  mode = 2'b00;
//  @(negedge clk)
//  mode = 2'b01;
  
// end 
//endtask 

////input Intialization
 task inputs(input [3:0]i);
   d_in = i;
endtask

////stimulus generation
initial
 begin
  initialize;
  reset;
  inputs(4'b0000);
  @(negedge clk)
  mode = 2'b00;
  #20;
  inputs(4'b1010);
  @(negedge clk)
  mode = 2'b01;
  #20;
  inputs(4'b0110);
  @(negedge clk)
  mode = 2'b10;
  #20
  inputs(4'b0101);
  @(negedge clk)
  mode = 2'b11;
//  inputs(4'b1011);
 end

initial #110 $finish;

endmodule 
  
    
  
 