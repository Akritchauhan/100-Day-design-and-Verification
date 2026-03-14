module sram_2kb(
  input clk,
  input we,
  input [10:0] addr,
  input [7:0] din,
  output reg [7:0] dout

);
  
  wire [9:0] addr_lower;
  wire cs0,cs1;
  wire [7:0] dout_0,dout_1;
  
  assign addr_lower=addr[9:0];
  assign cs0=~addr[10];
  assign cs1=addr[10];
  
  assign dout =addr[10] ? dout_1 : dout_0;
  
  sram_1kb sram(
    clk,
    cs0,
    we,
    addr_lower,
    din,
    dout_0
  );
  
   sram_1kb sram1(
    clk,
    cs1,
    we,
    addr_lower,
    din,
    dout_1
  );
  
endmodule

module sram_1kb(
  input clk,
  input cs,
  input we,
  input [9:0] addr,
  input [7:0] addr,
  output reg [7:0] dout
  
);
  
  reg [7:0] mem [0:1023];
  
  always @(posedge clk)begin
    if(we)
      mem[addr]<=din;
    else
      dout<=mem[addr];
  end
endmodule
  
                    
                    
