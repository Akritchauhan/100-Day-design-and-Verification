module sv_randomize_eaxmple;
  reg [7:0] a;

  initia begin
    if(randomize(a))begin
      $display("Randomized data:%d",a);
    end else begin
      $display("Randomization failed");
    end
  end
endmodule
