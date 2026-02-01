module comb_loop (
    input  b,
    output d
);
  wire a, c;

  assign a = c;
  assign c = b & a;  //warning on "c->a->c" 

  assign d = c;

endmodule
