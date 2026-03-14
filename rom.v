module rom(
  input clk,
  input [9:0] addr,
  output reg [7:0] dout
);
  
  reg [7:0] mem [0:15];
  
  
  initial begin
    $readmemh("read_mem.mem", mem);
  end
  
  always @(posedge clk)begin
    dout<=mem[addr];
  end
endmodule


//read_mem.mem
11
22
12
12
33
13
13
14
14
44
66
67
90
66
89
