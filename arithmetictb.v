module tb;
  reg a,b;
  wire sum,diff,mul,div,mod;
  
  arithmetic uut(.a(a),.b(b),.sum(sum),.diff(diff),.div(div),.mod(mod),.mul(mul));
  
  initial begin
    $monitor("A=%0d B=%0d sum=%0d diff=%0d mul=%0d div=%0d mod=%0d",a,b,sum,diff,mul,div,mod);
    a=1;b=0;#10
    a=1;b=1;#10
    $finish;
  end
 
endmodule
