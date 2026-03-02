`timescale 1ns / 1ps
module behavioral_level(
input sel,d0,d1,
output reg y
);

always @(*)begin
if(sel)
y=d1;
else
y=d0;
end
endmodule
