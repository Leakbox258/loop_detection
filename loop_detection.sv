`timescale 1ns / 100ps


module loop_detection #(
    VECTOR_SIZE = 16
) (
    input clk,

    input reset,
    input clk_en,
    input [VECTOR_SIZE-1:0] in,
    output [VECTOR_SIZE-1:0] out
);

  slide_vector0 sv0 (
      clk,
      reset,
      clk_en,
      in[0]
  );

  slide_vector1 sv1 (
      in,
      out
  );

endmodule
