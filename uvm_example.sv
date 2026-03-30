`include "uvm_macros.svh"
import uvm_pkg ::* ;

`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top();

  //interface
  //DUT instantiation
  initial begin
    `uvm_info("INFO",".................",UVM_NONE)
    `uvm_info("INFO",".................",UVM_NONE)

    `uvm_info("TOP","testbench and initial block,set interface in config db",UVM_HIGH)
    `uvm_info("INFO","Call run_test, phases will start execute ",UVM_HIGH)

    run_test("my_test");
  end

endmodule

// class test

class my_test extend uvm_test;
  `uvm_component_utils(my_test)

  function new (string name="my_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of test class",UVM_NONE);
  endfunction

  environment env;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO","Build phase of test class",UVM_NONE)
    env=environment::type_id::create("env",this);
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elabpration(phase);
    `uvm_info("INFO","End of Elaboration of test class",UVM_NONE)
    print();
  endfunction


  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("INFO","Run_phase of test class",UVM_NONE)
    `uvm_info("INFO","Start the Sequence",UVM_NONE)

  endtask
endclass

//environment class

class environment extends uvm_env;
  `uvm_component_utils(environment)

  function new(string name="environment",uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of Environment class",UVM_NONE)
  endfunction

  agent agt;
  scoreboard scb;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO","Build phase of environmenyt class",UVM_NONE)
    agt=agent::type_id::create("agt",this);
    scb=scoreboard::type_id::create("scb",this);

  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("INFO","Connect_phase of Environment class",UVM_NONE)

    `uvm_info("INFO","Connecting Monitor and Scoreboard in Environment class",UVM_NONE)

  endfunction

endclass


//Sequencer class

class my_sequence extends uvm_sequence;
  `uvm_object_utils(my_sequence)

  function new(string name="sequencer");
    super.new(name);
    `uvm_info("INFO","Constructor of Sequence class",UVM_NONE)
  endfunction

  virtual task body();
    `uvm_info("INFO"," Body task of Sequence class ",UVM_NONE)
  endtask
endclass

// agent.sv
class agent extends uvm_agent;
  `uvm_component_utils(agent)

  function new(string name="agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of agent class",UVM_NONE)
  endfunction

  sequencer sqr;
  driver drv;
  monitor mon;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO","Build Phase of Agent class",UVM_NONE)
    sqr=sequencer::type_id::create("sqr",this);
    drv=driver::type_id::create("drv",this);
    mon=monitor::type_id::create("mon",this);

  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("INFO","Connect_phase of Agent class",UVM_NONE)
    `uvm_info("INFO","Connecting Driver and Sequencer in agent class",UVM_NONE)
  endfunction

endclass


//driver class
class driver extends uvm_driver;
  `uvm_component_utils(driver)

  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of Driver class",UVM_NONE)
  endfunction


  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO","Build phase of driver class",UVM_NONE)
    `uvm_info("INFO","get Interface from config db",UVM_NONE)
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("INFO","Run_phase of Driver class",UVM_NONE)
    `uvm_info("INFO","Assign Transcation on Interface Pins",UVM_NONE)
  endtask
endclass


// Monitor.sv

class monitor extends uvm_monitor;
  `uvm_componenet_utils(monitor)

  function new (string name="monitor",uvm_componenet parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of Monitor class",UVM_NONE)
  endfunction

  virtual function void build_phase(uvm_phase phase);
    `uvm_info("INFO","Build phase of Monitor class",UVM_NONE)
    `uvm_info("INFO","get Interface from config db",UVM_NONE)
  endfunction

   task run_phase(uvm_phase phase);
    super.run_phase(phase);
     `uvm_info("INFO","Run_phase of Monitor class",UVM_NONE)
     `uvm_info("INFO","Create Transcation packet from Interface Pins",UVM_NONE)
  endtask
  
endclass


//scoreboard

    
