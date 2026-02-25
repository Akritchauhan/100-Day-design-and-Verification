module counter_2bit_tb;
  reg clk , rst;
  wire [1:0] count;
  
  counter_2bit uut(.clk(clk),.rst(rst),.count(count));
 
  initial clk =0;
  always #5 clk=~clk;

  
  initial begin
    $display("-----------------");
    
    rst=1;#10;
    rst=0;#50;
    rst=1;#10;
    rst=0;#30;
    
    $finish;
  end
    
    initial begin
      $monitor("%0t  %0b  %0b", $time, rst, count);
    end
    endmodule
    
  
 
