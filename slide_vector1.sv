`timescale 1ns / 100ps

module slide_vector1 #(
    parameter VECTOR_SIZE = 16
) (
    input  [VECTOR_SIZE-1:0] in,
    output [VECTOR_SIZE-1:0] out
);

  wire [VECTOR_SIZE-1:0] nstate;

  assign nstate[0] = in[0];

  genvar i;
  generate
    for (i = 1; i < VECTOR_SIZE; i = i + 1) begin
      assign nstate[i] = in[i] | nstate[i-1];
    end
  endgenerate

  assign out = nstate;

endmodule
