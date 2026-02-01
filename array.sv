module array (
    input [3:0] in,
    output reg [3:0] out
);

  reg [7:0][3:0] data;
  wire [31:0] pack_data;
  assign pack_data[31:0] = data;

  integer j;
  always @(*) begin
    data[0][3:0] = in[3:0];

    for (j = 0; j < 3; j = j + 1) begin
      out[j] = pack_data[j];
    end
  end

endmodule
