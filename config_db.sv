uvm_config_db#(virtual simple_if)::set(
  uvm_root::get(), // context
  "*",             // instance_path
  "vif",           //field_name
  intf             //value
);


uvm_conf_db#(virtual simple_if)::get(
  this,
  "",
  "vif",
  vif
)
  
