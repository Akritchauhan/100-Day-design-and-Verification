// BIT   VS      BYTE


module compare;
  bit [7:0] my_bit;
  byte my_byte;
  
  initial begin
    my_bit=8'b1010_1010;
    my_byte=8'b1010_1010;
    
    $display("my_bit : %b (%0d)",my_bit,my_bit);
    
    $display("my_byte : %b (%0d)",my_byte,my_byte);
  end
endmodule
  
