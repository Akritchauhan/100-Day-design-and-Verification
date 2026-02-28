module procedural(
  input a,
  input b,
  input c,
  output reg y
);
  always @(*)begin
    if(c)
      y=a;
    else
      y=b;
  end
endmodule
