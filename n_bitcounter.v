module counter #(parameter n=4)
(input clk,input rst,output reg [n-1:0] q);

always @(posedge clk or posedge rst)begin
if(rst)
q<={n{1'b0}};
else
q<=q+1;
end

endmodule
