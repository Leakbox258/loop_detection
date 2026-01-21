module loop_detection #(
    parameter         [31:0] POL_MASK = 32'h0000_00C0,
    parameter integer        POL_W    = 7,
    parameter integer        DW       = 16
) (
    input [POL_W-1:0] pn_state_in,

    output [DW-1:0]    pn_generated,
    output [DW+POL_W-1:0] pn_full_state_out
);

  wire [DW-1:0] pn;
  wire [DW+POL_W-1:0] pn_full_state;

  assign pn_full_state = {pn_state_in[POL_W-1:0], pn};


  generate
    genvar i;
    for (i = 0; i < DW; i = i + 1) begin : pn_loop
      assign pn[i] = ^(pn_full_state[i+:POL_W+1] & POL_MASK);
    end
  endgenerate

  assign pn_generated = pn;
  assign pn_full_state_out = pn_full_state;

endmodule
