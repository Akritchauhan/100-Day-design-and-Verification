module siso(
  input clk,
input rst,
input si,
  output s0);
  reg [3:0] sreg;
  
  assign s0=sreg[0];
  
  always @(posedge clk or posedge rst)begin
    if(rst)
      sreg<=4'b0000;
    else
      sreg<={si,sreg[3:1]};
  end
endmodule
