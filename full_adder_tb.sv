// top_module
`include "test.sv"
`include "interface.sv"
module testbench;
  intf intff();
  test tst (intff);

  full_adder FA(
    .a(intff.a),
    .b(intff.b),
    .c(intff.c),
    .sum(intff.sum),
    .carry(intff.carry)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule

//Interface

interface();
  logic a;
  logic b;
  logic c;
  logic sum;
  logic carry;
endinterface


//transaction(mailboix)
class transaction ;
  rand bit a;
  rand bit b;
  rand bit c;

  bit sum;
  bit carry;

  function void display(string name);
    $display("a=%0b b-%0b c=%0b sum=%0b carry=%0b",a,v,c,sum,carry);
  endfunction
endclass

//generator.sv

class generator ;
  transaction trans;

  mailbox gen2drv;

  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction

  task main();
    repeat(2)
      begin
        trans=new();
        trans.randomize();

        gen2drv.put(trans);

      end
  endtask
endclass


// driver
class driver;
  virtual intf vif;

  mailbox gen2drv;
  function new(virtual intf vif , mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction

  task main();
    repeat(2)
      begin
        transaction trans;

        gen2drv.get(trans);
        vif.a<=trans.a;
        vif.b<=trans.b;
        vif.c<=trans.c;

        #1;

      end
  endtask
endclass

// monitor.sv
class monitor;
  virtual intf vif;
  mailbox mon2scb;

  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction

  task main();
    repeat(2)
      #1;
    begin
      transaction trans;
      trans=new();
      trans.a=vif.a;
      trans.b=vif.b;
      trans.c=vif.c;
      trans.sum=vif.sum;
      trans.carry=vif.carry;

      mon2scb.put(trans);

    end
  endtask

endclass


//scoreboard
class scoreboard;
  mailbox mon2scb;

  function new (mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction

  task main();
    transaction trans;
    repeat(3);
    begin
      mon2scb.get(trans);

      if(((trans.a ^ trans.b ^ trans.c) == trans.sum ) && ((( trans.a & trans.b) | (trans.b & trans.c ) | (trans.c & trans.a))== trans.carry))
        $display("****** PASS ******** ");
      else
        $display("!!!!! FAIL !!!!!!");
    end
  endtask
endclass

//environment
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

  virtual intf vif;

  function new(virtual intf vif);
    this.vif=vif;

    gen2drv=new();
    mon2scb=new();
    gen=new(gen2drv);
    drv=new(vif,gen2drv);
    mon=new(vif,mon2scb);
    scb=new(mon2scb);

  endfunction

  task test_run();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
  endtask
endclass

// test
`include "environment.sv"
program test(intf intff);
  environment env;

  initial begin
    env=new(intff);
    env.test_run();
  end

endprogram

    
    
  
      
        

        
  
    
  
