// uvm_component_utils

class driver extends uvm_driver;

  `uvm_componeent_utils(driver)

  function new(string name , uvm_component parent);
    super.new(name,parent);
  endfunction
endclass

// uvm_object_utils

class write_sequence extend uvm_sequence;
  `uvm_object_utils(write_sequence)

  function new(string name = "write_sequence");
    super.new(name);
  endfunction

endclass 


// creating class

my_driver drv;
initial begin
  drv=my_driver::type_id::create("drv",this);
end
