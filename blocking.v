module swap_blocking();
  reg a, b,temp;

  
  always @(*) begin
    temp=a;
    a = b;
    b = temp;
  end
endmodule
