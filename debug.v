module my_block #(parameter max_count = 10)(
  input clk,
  input rst,
  output reg done,
  `ifdef debug
  output reg [7:0] dbg_count
  `endif
);

  reg [7:0] count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 0;
      done  <= 0;
      `ifdef debug
      dbg_count <= 0;
      `endif
    end 
    else begin
      if (count < max_count) begin
        count <= count + 1;
        done  <= 0;
      end 
      else begin
        done <= 1;
      end

      `ifdef debug
      dbg_count <= count;
      `endif
    end
  end

endmodule
