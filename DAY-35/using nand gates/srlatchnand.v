module srlatchnand( s,r ,q,qbar );
input s,r;
output q,qbar;

assign q=~(s & qbar);
assign qbar=~(r & q);

endmodule
