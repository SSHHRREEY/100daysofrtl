module srlatchnand_tb();

reg s,r; 
wire q,qbar;

srlatchnand dut( s,r ,q,qbar );

initial
begin

#10;s=0 ; r=0;
#10;s=0 ; r=1;
#10;s=1 ; r=0;
#10;s=1 ; r=1;


$finish;

end
endmodule
