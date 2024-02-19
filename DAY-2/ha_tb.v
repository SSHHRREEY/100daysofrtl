module ha_tb();

reg a,b; 
wire sum,carry;

ha dut(a,b,sum,carry);
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
