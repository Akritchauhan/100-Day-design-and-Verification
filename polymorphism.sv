class parent_class;
  bit [31:0] data;
  int id;
  
  virtual function void display();
    $display("Base: value of data =%0d , id =%0d",data,id);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("child: value of data=%0d ,id =%0d",data,id);
  endfunction
endclass


module class_example;
  initial begin
    parent_class p;
    child_class c;
    p=new();
    c=new();
    
    p.data=10;
    p.id=1;
    p.display();
    
    p=c;
    
    c.data=5;
    c.id=2;
    
    p.display();//calling child function
    
  end
endmodule
