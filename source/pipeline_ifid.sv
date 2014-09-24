`include "cpu_types_pkg.vh"
`include "pipeline_if.vh"
module pipeline_ifid
import cpu_types_pkg::*;
(
	input logic CLK, nRST, en,
	pipeline_if.ifid plif_ifid
);

always @(posedge clk or negedge rst_n) begin
	if(~nRST) begin
		plif_ifid.instr_l <= 0;
	end else if(en) begin
		plif_ifid.instr_l <= plif_ifid.instr; 
	end
end

endmodule