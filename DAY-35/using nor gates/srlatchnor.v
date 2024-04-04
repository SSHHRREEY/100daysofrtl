module srlatchnor(s,r,q,qbar);

input s,r; 
output q,qbar;

assign q=~(r | qbar);
assign qbar=~(s |q );

endmodule
