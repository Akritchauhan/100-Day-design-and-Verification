class packet ;
  rand bit [5:0] value;
  rand bit sel;
  constraint value_c {value == get_values(sel);}

  function bit [5:0] get_values(bit sel);
    return (sel ? 'h10:'h20);
  endfunction
endclass

module constraint_example;
  packet p;
  initia begin
    p=new();
    repeat(3)begin
      item.randomize();
      $display("constraint value =%0h",item.value);
    end
    $display("On function call outside:value =%0h",item.get_value(1));
  end
endmodule
