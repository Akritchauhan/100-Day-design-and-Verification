class my_class;
  bit [31:0] data;
  int id;
  
  task update(bit [31:0] m_data , int my_id);
    data=m_data;
    id=my_id;
  endtask
  
  function print();
    $display("value of data =%0d and id =%0d",data,id);
  endfunction
endclass


module example;
  initial begin
    my_class c1=new();
    c1.data=10;
    c1.print();
    #10
    c1.update(5,9);
    c1.print();
  end
endmodule
  
