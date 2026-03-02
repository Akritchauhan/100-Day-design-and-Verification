`timescale 1ns / 1ps
module gate_level(
input sel,d0,d1,
output y
);
wire w1,w2,w3;

not g1(w1,sel);
and g2(w2,w1,d0);
and g3(w3,d1,sel);
or g4(y,w2,w3);
endmodule
