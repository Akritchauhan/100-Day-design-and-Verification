module mux_2x1(

  input logic a,b,sel,
  output logic y
);
  
  always_comb begin
    if(sel)
      y=a;
    else
      y=b;
  end
endmodule
