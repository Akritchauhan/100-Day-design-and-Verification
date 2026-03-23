module sem_example;

  semaphore sem;
  int q[$];
  task producer();
    int i;
    for(i=0;i<5;i++)begin
      q.push_back(i);
      $display("[Producer] Produced =%0d",i);
      sem.put(1);
    end
  endtask


  task consumer();
    forever begin
      sem.get(1);
      $display("[consumer] Consumed =%0d",q.pop_front());
    end
  endtask

  initial begin
    sem=new(0);
    fork
      producer();
      consumer();
    join_any
    #5 finish;
  end
endmodule
