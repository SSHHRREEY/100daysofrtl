module mux2_tb;
reg i0,i1,s;
wire y;

 mux2 dut (s,i0,i1,y);

initial
 begin
/*
s = 0; i0 = 1; i1 = 0;

i0 = 0; i1 = 1;#10;

s = 1; i0 = 1; i1 = 0;#10;

i0 = 0; i1 = 1;#10;
*/

s=0;i0=0;i1=0;#10;
s=0;i0=0;i1=1;#10;
s=0;i0=1;i1=0;#10;
s=0;i0=1;i1=1;#10;

s=1;i0=0;i1=0;#10;
s=1;i0=0;i1=1;#10;
s=1;i0=1;i1=0;#10;
s=1;i0=1;i1=1;#10;

end
                
endmodule