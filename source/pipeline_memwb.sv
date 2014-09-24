`include "cpu_types_pkg.vh"
`include "pipeline_if.vh"
module pipeline_memwb
import cpu_types_pkg::*;
(
	input logic CLK, nRST, en,
	pipeline_if.memwb plif_memwb
);

	always_ff @ (posedge CLK) begin
		if(!nRST) begin
			plif_memwb.wsel_dl <= 0;
			plif_memwb.extimm_tl <= 0;
			plif_memwb.porto_dl <= 0;
			plif_memwb.dmemload_l <= 0;
			plif_memwb.regsrc_tl <= 0;
			plif_memwb.halt_tl <= 0;
			plif_memwb.regen_tl <= 0;
			plif_memwb.regen_sel_tl <= 0;
		end else if(plif_memwb.en) begin
			plif_memwb.wsel_dl <= plif_memwb.wsel_l;
			plif_memwb.extimm_tl <= plif_memwb.extimm_dl;
			plif_memwb.porto_dl <= plif_memwb.porto_l;
			plif_memwb.dmemload_l <= plif_memwb.dmemload;
			plif_memwb.regsrc_tl <= plif_memwb.regsrc_dl;
			plif_memwb.halt_tl <= plif_memwb.halt_dl;
			plif_memwb.regen_tl <= plif_memwb.regen_dl;
		end
	end
endmodule