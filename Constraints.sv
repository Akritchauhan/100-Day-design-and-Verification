class packet;
  rand int data;

  constraint data_c{
    data inside {4,7,8,[10:20],25,30,[40:70]};
  }

  function void display();
    $display("Randomized data =%0d ",data);
  endfunction
endclass


module tb;
  packet p;
  initial begin
    p=new();

    repeat (10) begin
      if(p.randomize())
        p.display();
      else
        $display("Randomization Failed");
    end
  end
endmodule



//if else 

class packet;
  rand bit [7:0] value;
  rand enum {LOQ ,HIGH} scale;

  constraint scale_c {if (scale == LOW) value <50;
                      else value >=50;
                     }
endclass

module constraint_example;
  packet item;

  initia begin
    item=new();
    repeat(5) begin
      item.randomize();
      $display("scale=%s , value =%0d",item.scale.name(),item.value);
    end
  end
endmodule
