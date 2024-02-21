module com_tb();

reg a,b; 
wire a_equal_b,a_less_b,a_greater_b;

com dut(a,b,a_equal_b,a_less_b,a_greater_b);
initial begin

a=0;b=0;

#10 
a=0;b=1;

#10 
a=1;b=0;

#10 
a=1;b=1;

end


endmodule
