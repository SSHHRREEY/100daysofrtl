module min_dect_tb();
 reg A,B,C;
 wire detector;
 integer i;
 
 ///Instantiation
 minority_detector MJ(A,B,C,detector);
 
 ///Initialization
 initial
 {A,B,C} = 0;
 
 ///stimulus Generation
 initial
  begin
    for(i=0; i<8; i=i+1)
	 begin
	  {A,B,C} = i;
	  #10;
	 end
  end
 initial #80 $finish;
 endmodule  
 