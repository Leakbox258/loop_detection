module async_loop (
    input clk,
    input i_rst,
    output [3:0] cnt
);
    reg [3:0] count;
    wire inter_rst;
    wire total_rst;

    assign inter_rst = (count == 4'd10);
    assign total_rst = i_rst | inter_rst;

    // count -> inter_rst -> total_rst -> total_rst -> count
    always @(posedge clk or posedge total_rst) begin
        if (total_rst) begin
            count <= 4'b0000;
        end else begin
            count <= count + 1'b1;
        end
    end

    assign cnt = count;

endmodule