module loop_detection #(
    parameter         [7:0] POL_MASK = 8'hC0,
    parameter integer       POL_W    = 7,
    parameter integer       DW       = 16
) (
    input [POL_W-1:0] pn_state_in,

    output [DW-1:0]    pn_generated,
    output [DW+POL_W-1:0] pn_full_state_out
);

  wire [DW-1:0] pn;
  wire [DW+POL_W-1:0] pn_full_state;

  assign pn_full_state = {pn_state_in[POL_W-1:0], pn};  // {[6:0], [15:0]}

  generate
    genvar i;
    for (i = 0; i < DW; i = i + 1) begin : pn_loop
      assign pn[i] = ^(pn_full_state[i+:POL_W+1] & POL_MASK);

      // due to speciality of ^(... & 8'hC0) when POL_MASK[0] != '1
      //
      // pn[0] = pn[7] ^ pn[6]
      // pn[1] = pn[8] ^ pn[7]
      // ...
      // pn[9] = pn_state_in[0] ^ pn[15]
      // pn[15:10] doesn't combine with other bits of pn

    end
  endgenerate

  assign pn_generated = pn;
  assign pn_full_state_out = pn_full_state;

endmodule
