module tb;
  byte temp_array [8];
  initial begin
    foreach (temp_array[i])begin
      temp_array[i]=$random;
      $display("assign 0x%0h to index %0d",temp_array[i],i);
    end
    
    $display("temp_array =%p",temp_array);
  end
endmodule 
    
