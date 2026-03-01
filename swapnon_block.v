module swap(
    input clk,
    input rst,
    input swap_en,
    input in_a,
    input in_b,
    output reg a,
    output reg b
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        a <= 0;
        b <= 0;
    end
    else if (swap_en) begin
        a <= b;
        b <= a;
    end
end

endmodule
