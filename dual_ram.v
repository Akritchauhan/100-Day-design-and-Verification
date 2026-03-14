module dual_port_ram(

  input clk,
  
  //port a
  input we_a,
  input [9:0] addr_a,
  input [7:0] din_a,
  output reg [7:0] dout_a,
  
  //port b
  
  input we_b,
  input [9:0] addr_b,
  input [7:0] din_b,
  output reg [7:0] dout_b
);
  
  reg [7:0] mem [0:1023];
  
  always @(posedge clk)begin
    if(we_a)
      mem[addr_a]<=din_a;
      else
        dout_a<=mem[addr_a];
    end

  always @(posedge clk)begin
    if(we_b)begin
      mem[addr_b]<=din_b;
      else
        dout_b<=mem[addr_b];
    end
  end
endmodule
