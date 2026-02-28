module tb;
reg a,b,c;
  wire y;
  
  procedural uut(.a(a),.b(b),.c(c),.y(y));
  
  initial begin
    $monitor("A=%b B=%b C=%b y=%b",a,b,c,y);
    c=0;a=1;b=0;#5
    c=1;a=0;b=1;#5
   $finish;
    
  end
endmodule
