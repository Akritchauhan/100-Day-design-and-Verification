module array_example;
  bit [4:0] array[2:0][1:0] =`{`{5'h5,5'h1},`{5'h10,5'h2},`{5'h15,5'h3}};
  
  initial begin
    foreach (array[i,j])begin
      $display("array[%0h][%0h]=%h",i,j,array[i][j]);
    end
  end
endmodule
