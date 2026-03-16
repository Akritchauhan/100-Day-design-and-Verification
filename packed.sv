module tb;
  bit [7:0] my_data;
  initial begin
    my_data=8'hA2;
    
    for(int i=0 ; i< $size(my_data);i=i+1)begin
      $display("mydata[%0d] =%0b ",i,my_data[i]);
    end
  end
endmodule


// multi dimension

module array_example;
  bit [2:0] [3:0] my_packed_array = `{4`h2 , 4`h4 ,4`h6};
  initial begin
    foreach (my_packed_array[i]) begin
      $display("my_packed_array[%0h] =%0h ",i,my_packed_array[i]);
    end
  end
endmodule
