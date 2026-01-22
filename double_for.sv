// ?

module double_for #(
    DW = 8
) (
    input  logic [DW-1:0] in0,
    in1,
    output logic [DW-1:0] out0,
    out1
);

  integer i;

  always_comb begin
    for (i = 0; i < DW; i = i + 1) begin
      out0[i] = ~in0[i];
    end
  end

  always_comb begin
    for (i = 0; i < DW; i = i + 1) begin
      out1[i] = ~in1[i];
    end
  end

endmodule
