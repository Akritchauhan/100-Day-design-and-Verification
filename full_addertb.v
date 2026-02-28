module tb;
  reg a,b,cin;
  wire sum,carry;
  
  continuous uut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  
  initial begin
    $monitor("A=%b B=%b c=%b sum=%b cout=%b",a,b,cin,sum,carry);
    a=0;b=0;cin=0;#5
    a=0;b=0;cin=1;#5
    a=0;b=1;cin=0;#5
    a=0;b=1;cin=1;#5
    a=1;b=0;cin=0;#5
    a=1;b=0;cin=1;#5
    a=1;b=1;cin=0;#5
    a=1;b=1;cin=1;#5
    $finish;
  end
endmodule
