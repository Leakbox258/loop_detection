module async_loop_tp (
    input c,
    input d
);

  reg a, b;

  always @(a, c) begin
    b = ~c & a;
  end

  always @(b, d) begin
    a = ~d & b;
  end

endmodule
