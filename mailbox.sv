module mailbox_example();
  mailbox mb=new(3);

  task process_A();
    int value =5;
    mb.put(value);
    $display("Put data =%0d",value);
  endtask

  task process_B();
    int value;
    mb.get(value);
    $display("Retrieved data=%0d",value);
  endtask

  initial begin
    for
      process_A();
    process_B();
    join
  end
endmodule
