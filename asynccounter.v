module tff(clk,rst,t,q);
input clk,t;
input rst;
output reg q;

always @(negedge clk or posedge rst) begin
    if(rst)
        q <= 0;
    else if(t)
        q <= ~q;
end

endmodule



module ripple(clk,rst,q);

input clk,rst;
output [3:0] q;

tff tf1(clk ,rst,1'b1,q[0]);
tff tf2(q[0],rst,1'b1,q[1]);
tff tf3(q[1],rst,1'b1,q[2]);
tff tf4(q[2],rst,1'b1,q[3]);

endmodule
