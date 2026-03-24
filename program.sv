program test (input bit [7:0] addr);
  initial begin
    #display(" Addr =%0d",addr);
endprogram


// testbench
'include "test.sv"
module tb;
  wire [7:0] addr;

  design_code dut(addr);
  test t1(addr);
endmodule
  
  
