`include "uvm_macroos.svh"
import uvm_pkh::*;

module tb;
  int data;

  initial begin
    #50;
    `uvm_info("TB_TOP","Hello world",UVM_LOW);

    $display("hello world with display");

    `uvm_info("TB",$sformatf("value of data : %0d",data),UVM_NONE);

  end
endmodule
    
