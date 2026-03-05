module converter #(parameter size=4)(gray,binary);
input [size-1:0] gray;
output reg [size-1:0] binary;

integer i;

always @(*)begin
binary[size-1]=gray[size-1];

for (i=size-2;i>=0;i=i-1)begin
binary[i]=binary[i+1] ^ gray[i];
end
end

endmodule
