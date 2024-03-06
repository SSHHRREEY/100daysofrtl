module demuxtwo_tb();

reg i,e,s0;
wire y0,y1;

demuxtwo dut(i,e,s0,y0,y1);
initial begin

e=0;s0=0;i=1;

#10 
e=0;s0=1;i=1;

#10 
e=1;s0=0;i=1;

#10 
e=1;s0=1;i=1;

$finish;
end


endmodule