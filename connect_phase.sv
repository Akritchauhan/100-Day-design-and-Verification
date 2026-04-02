class my_agent extends uvm_agent;
  sequencer sre;
  driver drv;
  monitor mon;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    sre=sequencer::type_id::create("sre",this);
    drv=driver::type_id::create("drv",this);
    mon=monitor::type_id::create("mon",this);

  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv.seq_item_port.connect(sre.seq_item_export);
  endfunction
endclass
    
