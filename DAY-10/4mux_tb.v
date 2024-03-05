module mux_tb;

reg i0, i1, i2, i3;
reg sel0, sel1;
wire y;

mux dut( sel0, sel1,i0, i1, i2, i3, y);
initial
begin
    sel0 = 1'b0; sel1 = 1'b0; i0 = 4'b0000; i1 = 4'b0000; i2 = 4'b1001; i3 = 4'b0110; #10;
    sel0 = 1'b0; sel1 = 1'b1; i0 = 4'b1001; i1 = 4'b0100; i2 = 4'b0001; i3 = 4'b0010; #10;
    sel0 = 1'b1; sel1 = 1'b0; i0 = 4'b0010; i1 = 4'b1001; i2 = 4'b0010; i3 = 4'b1000; #10;
    sel0 = 1'b1; sel1 = 1'b1; i1 = 4'b1010; i1 = 4'b1101; i2 = 4'b1010; i3 = 4'b0110; #10;
    
    $finish;
end

endmodule
