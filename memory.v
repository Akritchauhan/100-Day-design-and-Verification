module memory(
  input clk,
  input rst,
  input we,
  input [9:0] addr,
  input [7:0] din,
  output reg [7:0] dout
);
  reg [7:0] mem [1023:0];
  
  always @(posedge clk or posedge rst)begin
    if(rst)begin
      dout<=0;
    end
    else begin
      if(we)
        mem[addr]<=din;
    end
    else
      dout<=mem[addr];
  end
endmodule
