module loop_detection (
	pn_state_in,
	pn_generated,
	pn_full_state_out
);
	parameter [7:0] POL_MASK = 8'hc0;
	parameter integer POL_W = 7;
	parameter integer DW = 16;
	input [POL_W - 1:0] pn_state_in;
	output wire [DW - 1:0] pn_generated;
	output wire [(DW + POL_W) - 1:0] pn_full_state_out;
	wire [DW - 1:0] pn;
	wire [(DW + POL_W) - 1:0] pn_full_state;
	assign pn_full_state = {pn_state_in[POL_W - 1:0], pn};
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < DW; _gv_i_1 = _gv_i_1 + 1) begin : pn_loop
			localparam i = _gv_i_1;
			assign pn[i] = ^(pn_full_state[i+:POL_W + 1] & POL_MASK);
		end
	endgenerate
	assign pn_generated = pn;
	assign pn_full_state_out = pn_full_state;
endmodule