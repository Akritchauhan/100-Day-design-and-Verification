class parent;
  function void display();
    $display("parent display method");
  endfunction
endclass

class child extend parent;
  function void display();
    $display("child Display Method -Before calling parent");
    super.display();
    $display("child display method - After calling Parent");
  endfunction
endclass

