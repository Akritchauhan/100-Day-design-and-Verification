module traffic(
  clk,light
);
  parameter s0=0,s1=1,s2=2;
  parameter RED=3'b100,GREEN=3'b010,YELLOW=3'b001;
  reg [0:1] state;
  
  
  always @(posedge clk)begin
    case(state)
      s0:begin
        light<=GREEN;
        state<=s1;
      end
      s1:begin
        light<=YELLOW;
        state<=s2;
      end
      s2:begin
        light<=RED;
        state<=s0;
      end
      default :begin
        light<=RED;
        state<=s0;
      end
    endcase
  end
endmodule


// more good way of writing moore fsm //
module traffic(
  input clk,
  output reg [2:0] light
);

  parameter s0 = 0, s1 = 1, s2 = 2;
  parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;

  reg [1:0] state;



  always @(*) begin
    case(state)
      s0: state = s1;
      s1: state = s2;
      s2: state = s0;
      default: state = s0;
    endcase
  end

  always @(*) begin
    case(state)
      s0: light = GREEN;
      s1: light = YELLOW;
      s2: light = RED;
      default: light = RED;
    endcase
  end

endmodule
