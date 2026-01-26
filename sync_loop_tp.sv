module sync_loop_tp (
    count,
    clk
);
  //   parameter number = 10;
  //   reg i_rst;

  output [3:0] count;
  input clk;
  reg [3:0] count;

  always @(posedge clk) count <= count + 1;  //warning here 

endmodule
