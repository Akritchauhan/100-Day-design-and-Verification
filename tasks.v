task display_data;
  input [7:0] data;
  begin
    $display("time =%ot , Data=%0b",$time,data);
  end
endtask

task pulse;
  output reg sig;
  input integer width;
  begin
    sig=1;
    #width sig=0;
  end
endtask

task split_byte;
  input [7:0] in_byte;
  output [3:0] upper,lower;
  begin
    upper=in_byte[7:4];
    lower=in_byte[3:0];
  end
endtask



module zero_count_task(data,out);
  input [7:0] data;
  output reg [3:0] out;
  
  always @(data)
    count_0s_in_byte(data, count);
  
  task count_0s_in_byte(input [7:0] data,output reg [3:0] count);
    integer i;
    begin
      count=0;
      for(i=0;i<=7;i=i+1)
        if(data[i]==0) count=count+1;
    end
  endtask
endmodule
