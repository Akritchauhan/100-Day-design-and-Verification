`timescale 1ns / 1ps
module dataflow_level(
input sel,d0,d1,
output y
);
assign y=((~sel)&d0) | (sel&d1);
endmodule
