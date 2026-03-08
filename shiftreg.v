module siso(
  input clk,
input rst,
input si,
  output s0);
  reg [3:0] sreg;
  
  assign s0=sreg[0];
  
  always @(posedge clk or posedge rst)begin
    if(rst)
      sreg<=4'b0000;
    else
      sreg<={si,sreg[3:1]};
  end
endmodule



// SIPO //
module sipo(
  input clk,
input rst,
input si,
  output [3:0] s0);
  reg [3:0] sreg;
  
  assign s0=sreg;
  
  always @(posedge clk or posedge rst)begin
    if(rst)
      sreg<=4'b0000;
    else
      sreg<={si,sreg[3:1]};
  end
endmodule

//PISO//

module piso(
  input clk,
input rst,
  input load,
  input [3:0] pi,
  output reg s0);
  reg [3:0] sreg;
  

  
  always @(posedge clk or posedge rst)begin
    if(rst)
      sreg<=4'b0000;
    s0<=1'b0;
    else begin
      if (load)begin
       sreg<=pi;
       s0<=1'b0
      end
      else begin
        s0<=sreg[0];
        sreg<={1'b0,sreg[3:1]};
      end
    end
  end
endmodule

 // PIPO  //
module pipo(
  input clk,
input rst,
  input [3:0] pi,
  output [3:0] s0);
  reg [3:0] sreg;
  
  assign s0=sreg
  
  
  always @(posedge clk or posedge rst)begin
    if(rst)
      sreg<=4'b0000;
    else 
      sreg<=pi
  end
endmodule
