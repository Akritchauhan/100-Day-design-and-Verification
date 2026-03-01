module event_queue;
  reg a ,b,clk;
  reg d,q;
  wire w1,w2;
  
  assign w1 = a & b;
  and (w2, a, b);
  
  always @(posedge clk) begin
    q <= d;
  end
  
  initial begin
    $monitor("T=%0t [$monitor] a=%0d b=%0d d=%0d q=%0d w1=%0d w2=%0d",
              $time,a,b,d,q,w1,w2);
    
    $strobe("T=%0t [$strobe] END timestep values a=%0d b=%0d d=%0d q=%0d w1=%0d w2=%0d",
             $time ,a,b,d,q,w1,w2);
    
    a=0; b=0; d=0; clk=0; q=0;
    $display("T=%0t [$display] Initial",$time);
    
    a=1;
    $display("T=%0t [$display] After a=1",$time);
    
    #0 b=1;
    $display("T=%0t [$display] Scheduled b=1 at #0",$time);
    
    d <= 1;
    $display("T=%0t [$display] Scheduled d<=1",$time);
    
    #5 clk=1;
    #1 clk=0;
    #5 $finish;
  end
endmodule
