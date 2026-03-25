// module_top

`include "interface.sv"
`include "test.sv"

module test_bench_top;
  logic clk;

  mem_if mem_if_inst(clk);
  test_program t1(mem_if_inst);

  memory dut(
    .clk(mem_if_inst.clk),
    .rst(mem_if_inst.rst),
    .addr(mem_if_inst.addr),
    .wr_en(mem_if_inst.wr_en),
    .rd_en(mem_if_inst.rd_en),
    .wdata(mem_if_inst.wdata),
    .rdata(mem_if_inst.rdata)
  );
  initial clk=0;
  always #5 clk=~clk;

endmodule


// test

`include "environment.sv"
program test_program(mem_if vif);
  environment env;

  initial begin
    env=new(vif);
    env.run();
  end
endprogram

// environment

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;

  mailbox gen2drv;
  mailbox mon2scb;

  virtual mem_if vif;

  function new(virtual mem_if vif);
    this.vif=vif;

    gen=new(gen2drv);
    drv=new(vif, gen2drv , mon2scb);
    mon=new(vif , mon2scb);
    scb=new(mon2scb);
  endfunction

  task run();
    fork
      drv.run();
      mon.run();
      scb.run();
    join_none
  endtask
endclass
  
