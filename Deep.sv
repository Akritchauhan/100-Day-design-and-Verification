class classA;
  int i=5;
endclass

class classB;
  int j=50;
  classA c1=new();
  
  function void copy(classB obj_b);
    this.j=obj_b.j;
    this.c1.i=obj_b.c1.i;
  endfunction :copy
  
endclass

module deep_copy_demo;
  classB b1,b2;
  
  initial begin
    b1=new();
    b2=new();
    b2.copy(b1);
    
    $display("Initially:b1.j=%0d b1.c1.i=%0d",b1.j,b1.c1.i);
    $display("Initially:b2.j=%0d b2.c1.i=%0d",b2.j,b2.c1.i);
     
    b1.j=1;
    b1.c1.i=10;
    
    $display("b1.j=%0d b1.c1.i=%0d",b1.j,b1.c1.i); $display("b2.j=%0d b2.c1.i=%0d",b2.j,b2.c1.i);
    
    b2.j=2;
    b2.c1.i=20;
    
        
    $display("b1.j=%0d b1.c1.i=%0d",b1.j,b1.c1.i); $display("b2.j=%0d b2.c1.i=%0d",b2.j,b2.c1.i);
  end
endmodule
    
