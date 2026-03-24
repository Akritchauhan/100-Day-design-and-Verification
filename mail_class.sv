class packet;
  int addr;
  int data;
endclass

module mailbox_packet_ex;
  mailbox mbx=new();

  task producer();
    packet p;
    repeat(5) begin
      p=new();
      p.addr=$urandom_range(0,255);
      p.data=$urandom_range(0,1023);
      $display("[PRODUCER} Sending packet : addr=%0d data=%0d",p.addr,p.data);
      mbx.put(p);
    end
  endtask

  task consumer();
    packet p;
    forever begin
      mbx.get(p);
      $display("[CONSUMER] Reecived packet : addr=%0d data=%0d",p.addr,p.data);
      #3;
    end
  endtask

  initial begin
    fork
      producer();
      consumer();
    join_any
    #100 $finish
  end
endmodule
    
