module arithmetic(
  input a,b,
  output sum,
  output diff,
  output div,
  output mod,
  output mul);

  assign sum= a+b;
  assign diff = a-b;
  assign mul= a*b;
  assign div=a/b;
  assign mod= a%b;
endmodule
