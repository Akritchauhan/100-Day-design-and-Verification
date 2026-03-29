`include "uvm_macros.svh";
import uvm_pkg::*;

class driver;

  task run();
    `uvm_info("DRV","INFO MSG",UVM_NONE);
    `uvm_warning("DRV","potenial error");
    `uvm_error("DRV","Real error");
    #10;
    `uvm_fatal("DRV","Sim can't continue");
    $display("SIMULATIONNDONE");
  endtask
endclass


module tb;
  driver drv;

  initial begin
    drv=new();
    drv.run();
  end
endmodule
