module tb;
  reg clk;
  reg [7:0]data;
  reg parity_bit;
  initial clk=0;
  always #5 clk=~clk;
  
  function bit calc_parity(input [7:0] d);
    calc_parity=^d;
  endfunction
  
  
  task send_data(input [7:0]d);
    begin
      @(posedge clk);
      data=d;
      parity_bit=calc_parity(d);
      $display("[%0t] sending data=%0b parity=%b",$time,data,parity_bit);
    end
  endtask
  
  initial begin
    data=0;
    parity_bit=0;
    send_data(8'b1011_0010);
    send_data(8'b1111_0010);
    send_data(8'b0101_0001);
    
    #50 $finish;
  end
endmodule
    
