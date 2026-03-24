interface mem (input logic clk);
  // signals 
  logic rst;
  logic wr;
  logic [31:0] addr;
  logic [31:0] wdata;
  logic [31:0] rdata;

  // modports
  modport DRV(
    output wr,addr,wdata,
    input rdata
  );

  modport MON(
    input wr,addr,wdata,rdata
  );

  //clocking block

  clocking drv_cb @(posedge clk);
    default input #1 output #1;
    output wr,addr,wdata;
    input rdata;
  endclocking

  clocking mon_cb @(posedge clk);
    default input #1;
    input wr,addr,wdata,radata;
  endclocking

endinterface
  
    
