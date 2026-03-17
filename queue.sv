module queue_example;
  int q[$];
  int a;
  initial begin
    q.push_back(10);
    q.push_back(20);
    q.push_back(30);
    $dsiplay ("Queue after Push_back : %p",q);
    
    q.push_front(5);
    $display("after push_front(5): %p",q);
    
    a=q.pop_front();
    $display("value of a : %d",a);
    $display("after pop_front: %p",q);
    
    a=q.pop_back();
    $display("value of a:%0d",a);
    $display("After pop_back : %p",q);
    
  end 
endmodule
