module sequencedetector(
  input clk,
  input rst,
  input din,
  output reg out
);
  
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  
  reg [2:0] state,n_state;
  
  always @(posedge clk or posedge rst)begin
    if(rst)begin
      state<=0;
    end
    else begin
      state<=n_state;
    end
  end
  
  always @(din or state)begin
    case(state)
      s0:begin
        if(din==0)
          n_state=s0;
        else
          n_state=s1;
      end
      
      s1:begin
        if(din==0)
          n_state=s2;
        else
          n_state=s1;
      end
      
      s2:begin
        if(din==0)
          n_state=s0;
        else
          n_state=s3;
      end
      
      s3:begin
        if(din==0)
          n_state=s4;
        else
          n_state=s1;
      end
      
      s4:begin
        if(din==0)
          n_state=s0;
        else
          n_state=s3;
      end
      
      default:n_state=s0;
    endcase
  end
  
  always @(state)begin
    case(state)
      s0:out=0;
      s1:out=0;
      s2:out=0;
      s3:out=0;
      s4:out=1;
      default:out=0;
    endcase
  end
endmodule
