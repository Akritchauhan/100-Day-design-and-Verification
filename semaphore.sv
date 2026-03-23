module semaphore_memory_eaxmple;
  semaphore mem_key=new(1);
  int shared_mem;

  task person_A();
    mem_key.get(1);
    $display("A got the key, writing to memory...");
    shared_mem=100;
    #10;
    $display("A finished writing");
    mem_key.put(1);
  endtask

  task person_B();
    mem_key.get(1);
    $display("B got the key,writing to memory..");
    shared_mem=200;
    #10;
    $display("B finished writing");
    mem_key.put(1);
  endtask

  initial begin
    fork
      person_A();
      person_B();
    join
    $display("final memory value =%0d",shared_mem);
  end

endmodule
