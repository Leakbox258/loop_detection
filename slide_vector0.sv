`timescale 1ns / 100ps

module slide_vector0 #(
    VECTOR_SIZE = 16
) (
    input clk,
    input reset,
    input clk_en,
    input in
);

  reg [VECTOR_SIZE-1:0] nstate;
  wire state;

  assign state = in | nstate[0];

  always_ff @(posedge clk) begin
    if (reset) begin
      nstate <= '0;
    end else if (clk_en) begin
      nstate <= {nstate[VECTOR_SIZE-1:1], state};
    end
  end

endmodule
