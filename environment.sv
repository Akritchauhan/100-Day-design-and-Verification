`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;

  function new();
    gen=new();
    drv=new();
    mon=new();
    scb=new();
  endfunction
endclass
  
