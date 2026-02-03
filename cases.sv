module cases (
    input logic [7:0] video_data
);
  logic [8:0] q_m;

  logic N1D;

  logic N1q_m07;
  logic N0q_m07;

  always_comb begin
    N1D = video_data[7];
    case (q_m[0])
      1'b0: N1q_m07 = 1'b0;
      1'b1: N1q_m07 = 1'b1;
    endcase
  end

  always_comb begin
    q_m[0] = video_data[0];
    for (int i = 0; i < 7; i++) q_m[i+1] = q_m[i] ~^ video_data[i+1];
    q_m[8] = 1'b0;

    if (N1D) begin
      N0q_m07 = 1'b1;
    end else begin
      N0q_m07 = 1'b0;
    end
  end

endmodule
