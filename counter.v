module counter_2bit (
  input clk,rst,
  output [1:0] count
);
  
  always @(posedge clk)begin
    if(rst)
      count<=2'b00;
    else
      count<=count +1;
  end
endmodule
