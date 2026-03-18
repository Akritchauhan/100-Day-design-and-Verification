class parent_class;
  bit [7:0] data;
  bit enable;
  
  function new();
    data=8'hAA;
    enable=1;
  endfunction
  
  task display_parent();
    $display("Parent --> data=%0h , enable =%0b",data,enable);
  endtask
endclass

class child_class extends parent_class;
  
  bit[3:0] addr;
  bit wr_en;
  
  function new();
    addr=4'h8;
    wr_en=0;
  endfunction
  task display_child();
    $display("child --> data=%0h , enable =%0b ,addr=%0h , wr_en=%0d",data,enable,addr,wr_en);
  endtask
endclass
