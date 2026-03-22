class packet;
  rand int addr;
  rand int data;
endclass

module tb;
  initial begin
    packet p=new();
    p.data.rand_mode(0);//disable randomization

    repeat(5) begin
      p.randomize();
      $display("addr =%0d data=%0d ",p.addr,p.data);
    end
  end
endmodule
