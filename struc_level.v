`timescale 1ns / 1ps



module mux2x1(
input a,b,sel,
output reg y
);
always @(*)begin
if(sel)
y=a;
else
y=b;
end
endmodule


module struc_level(
input d0,d1,d2,d3,
input [1:0]s,
output y
);
wire w1,w2;
 mux2x1 m1(d0,d1,s[0],w1);
 mux2x1 m2(d2,d3,s[0],w2);
 mux2x1 m3(w1,w2,s[1],y);
 
endmodule
