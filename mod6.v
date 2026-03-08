module counter(clk,rst,q);
  parameter n=6;
  parameter width=3;
  
  input clk,rst;
  output reg [width-1:0]q;
  
  always @(posedge clk or posedge rst)begin
    if(rst)
      q<=0;
    else if(q==n-1)
      q<=0;
    else
      q<=q+1;
  end
endmodule
