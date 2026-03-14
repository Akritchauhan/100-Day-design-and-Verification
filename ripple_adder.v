module ripple_adder #(n=8) (
  input [n-1:0]a,b,
  input cin,
  output [n-1:0] sum,
  output cout
);
  
  wire [n:0] carry;
  assign carry[0]=cin;
  
  generate
    genvar i;
    for(i=0;i<n;i=i+1)begin:adder_stage
      full adder Fa(
        .a(a[i]),.b(b[i]),.cin(carry[i]),.cout(carry[i+1]),.sum(sum[i])
      );
    end
  endgenerate
  
  assign cout =carry[n];
endmodule
    
