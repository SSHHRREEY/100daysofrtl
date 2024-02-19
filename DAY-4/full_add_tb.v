module full_add_tb();

reg a,b,bin;
wire diff,bor;

full_sub dut (a,b,bin,diff,bor);

initial 
begin

a=0;b=0;bin=0;#10;
a=0;b=0;bin=1; #10;
a=0;b=1;bin=0; #10;
a=0;b=1;bin=1; #10;
a=1;b=0;bin=0; #10;
a=1;b=0;bin=1; #10;
a=1;b=1;bin=0; #10;
a=1;b=1;bin=1; #10;

end

endmodule
