virtual class parent_class;
  bit [31:0] data;
  int id;
endclass

class child_class extends parent_class;
  function void display();
    $display("Child : value of data=%0h and id=%0h",data,id);
  endfunction
endclass

module class_example;
  initial begin
    child_class c;
    c=new();
    
    c.data=50;
    c.id=100;
    c.display()
  end
endmodule
