module minority_detector(A,B,C,detector);
input A,B,C;  
output detector;
wire W1,W2,W3; 

 assign W1 = A&B;   
 assign W2 = B&C;
 assign W3 = C&A;  
 
 assign detector = ~(W1|W2|W3);
 

endmodule