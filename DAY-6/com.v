module com (a,b,a_equal_b,a_less_b,a_greater_b);

input a,b;
output a_equal_b,a_less_b,a_greater_b;

assign a_equal_b =(a == b);
assign a_less_b = ( a<b );
assign a_greater_b =(a>b);

endmodule
