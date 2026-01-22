module async_loop_fp (
    input  a,
    input  b,
    output f
);
  reg c, d, e;

  always_comb begin
    d = ~b & ~a;
    e = c & a;
  end

  always_comb begin
    c = ~d;
  end

  assign f = e;

endmodule
