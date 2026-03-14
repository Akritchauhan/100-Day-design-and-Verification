module single_port_ram(
input clk,
  input cs,
  input we,
  input [9:0] addr,
  input [7:0] din,
  output reg [7:0] dout
);
  
  reg [7:0] mem [0:1023];
  
  always @(posedge clk)begin
    if(cs)begin
      if(we)
        mem[addr]<=din;
      else
        dout<=mem[addr];
    end
  end
endmodule
