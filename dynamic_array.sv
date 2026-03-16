// dynamic array

module dynamic_array;
  int da[];
  
  initial begin
    int n=5;
    da =new[n];
    
    foreach (da[i]) da[i]=i*10;
    
    
    $display("Dyanmci array elements:");
    foreach (da[i])
      $display("da[%0d]=%0d",i,da[i]);
    
  end
endmodule
