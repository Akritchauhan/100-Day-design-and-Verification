`define data_width 8

module reg_block(
  input [`data_width -1:0] d,
  input clk,
  output reg q);
  
  always @(posedge clk)
    q<=d;
endmodule


`define op_and
module dut(
  input i1,i2,
  output out1,out2,out3
);
  
  `ifdef op_and
  assign out1=i1&i2;
  `else
  assign out2=i1 |i2;
  nor_dut n1(out3,i1,i2);
  `endif
  
endmodule
 
