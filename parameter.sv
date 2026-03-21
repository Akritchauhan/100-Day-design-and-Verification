class packet #(parameter WIDTH=8);
  bit [WIDTH-1:0] data;

  function void display();
    $display("Packet width=%0d , data =%0d ",WIDTH ,data);
  endfunction
endclass

module param_class_example;
  packet #(4) p1;
  packet #(8) p2;

  initial begin
    p1=new();
    p2=new();
    p1.data=4'b1010;
    p2.data=8'b11001100;

    p1.display();
    p2.display();
  end
endmodule
