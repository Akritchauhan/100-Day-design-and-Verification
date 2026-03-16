//single dimension

module array_example;
  int array1[6]=`{100,200,300,400,500};
  initial begin
    foreach(array1[i])begin
      $display("array[%0d] = %0d ",i,array1[i]);
    end
  end
endmodule
  

// 2D array

module array_example;
  int array2[0:5][0:1]=`{`{10,100},`{20,200},`{30,300},`{40,400},`{50,500},`{60,600}};
  initial
    begin
      foreach (array[i,j])begin
        $display("array[%0d][%0d] =%0d ",i,j,array[i][j]);
      end
      end
endmodule
  
