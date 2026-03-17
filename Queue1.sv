module queue_datatype_simple;
  int int_q[$]='{10,20,30};
  bit [3:0] bit_q[$] ='{5,0,7,1};
  
  real real_q[$]='{1,5,2.75,3.0};
  
  string str_q[$]='{"apple","banana","cheery"};
  
  typedef enum {RED ,GREEN , BLUE} color_t;
  
  color_t color_q[$]='{RED , GREEN , BLUE};
  
  initial begin
    $display("Integer Queue :%p",int_q);
    $display("Bit Queue     :%p",bit_q);
    $display("Real Queue    :%p",real_q);
    $display("String Queue  :%p",str_q);
    $display("Enum Queue    :%p",color_q);
    
  end
endmodule
  
  
