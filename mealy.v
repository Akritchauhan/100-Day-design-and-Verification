module detector(
  input clk,
  input rst,
  input din,
  output reg out);
  
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  
  reg [1:0] state,n_state;
  
  always @(posedge clk or posedge rst)begin
    if(rst)
      state<=s0;
    else
      state<=n_state;
  end
  
  always @(din or state)begin
    case(state)
      
      s0:begin
        if(din==0)begin
          n_state=s0;
          out=0;
        end
        else begin
          out=0;
          n_state=s1;
        end  
        end
      
       s1:begin
        if(din==0)begin
          n_state=s2;
          out=0;
        end
        else begin
          out=0;
          n_state=s1;
        end  
        end
      
       s2:begin
        if(din==0)begin
          n_state=s0;
          out=0;
        end
        else begin
          out=0;
          n_state=s3;
        end  
        end
      
       s3:begin
        if(din==0)begin
          n_state=s0;
          out=1;
        end
        else begin
          out=0;
          n_state=s1;
        end  
        end
      default :n_state=s0;
    endcase
  end
endmodule
