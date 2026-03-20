class packet_class;
  int value;
endclass

module assignment_example;
  packet_class pkt1,pkt2;
  initial begin
    pkt1=new();
    pkt1.value=10;
    
    pkt2=pkt1;
    $display("Pkt1 value is %0d",pkt1.value);
    $display("Pkt2 value is %0d",pkt2.value);
    
    
    pkt2.value=25;
    $display("Pkt1 value is %0d",pkt1.value);
    $display("Pkt2 value is %0d",pkt2.value);
  end
endmodule
