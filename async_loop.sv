module top (
    input clk
);
  wire i_rst;
  wire [3:0] count;

  counter counter (
      clk,
      i_rst,
      count
  );
  reset reset (
      count,
      i_rst
  );
endmodule

module counter (
    input clk,
    input i_rst,
    output [3:0] cnt
);

  reg [3:0] count;
  always @(posedge clk or posedge i_rst) begin  //warning on "count->i_rst->count"
    if (i_rst) count <= 0;
    else count <= count + 1;
  end

  assign cnt = count;
endmodule

module reset (
    input [3:0] count,
    output reg i_rst
);
  parameter number = 10;
  always @(count)
    if (count == number) i_rst = 1;
    else i_rst = 0;
endmodule
