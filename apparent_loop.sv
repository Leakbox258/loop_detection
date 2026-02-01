module apparent_loop (
    a,
    d
);
  input a;
  output d;
  reg b, d;
  wire c;
  always @(a or c) begin  // @(a, c)
    b = a;
    d = c;
  end
  assign c = a & b;  // @(a, b)
endmodule
//In above case, the change of 'c' will cause the always block be 
//evaluated again. Following is a way to fix the problem. 
