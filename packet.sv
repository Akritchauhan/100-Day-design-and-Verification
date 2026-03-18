class packet;
  int id;
  bit [7:0] data;
  
  function void set_data(int id , bit [7:0] data);
    this.id=id;
    this.data=data;
    this.display();
  endfunction
  
  
  function void display();
    $display("Packet Id =%0d , Data =%0d ",id,data);
  endfunction
endclass

module test;
  initial begin
    packet p1=new();
    p1.sett_data(10,55);
  end
endmodule
    
