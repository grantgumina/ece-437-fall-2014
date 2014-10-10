`include "cpu_types_pkg.vh"
`include "pipeline_ifid_if.vh"
module pipeline_ifid
import cpu_types_pkg::*;
(
	input logic CLK, nRST,
	pipeline_ifid_if.ifid plif_ifid
);

always_ff @(posedge CLK, negedge nRST) begin
	if(~nRST) begin
		plif_ifid.instr_l   <= 0;
    	plif_ifid.rtnaddr_l <= 0;
    end else if (plif_ifid.sRST) begin
    	plif_ifid.instr_l   <= 0;
    	plif_ifid.rtnaddr_l <= 0;
    end else if (plif_ifid.en) begin
		plif_ifid.instr_l <= plif_ifid.instr; 
	  	plif_ifid.rtnaddr_l <= plif_ifid.rtnaddr;
  	end
end

endmodule