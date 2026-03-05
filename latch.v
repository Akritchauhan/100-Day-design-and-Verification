module latch(input en,d,output reg q);
always @(*)begin
if(en)
q<=d;
else
q<=0;
end
endmodule
