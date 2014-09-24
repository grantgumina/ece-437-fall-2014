`include "cpu_types_pkg.vh"
`include "pipeline_memwb_if.vh"
module pipeline_memwb
import cpu_types_pkg::*;
(
	input logic CLK, nRST,
	pipeline_memwb_if plif_memwb
);

	always_ff @ (posedge CLK) begin
		if(!nRST) begin
			plif_memwb.wsel <= 0;
			plif_memwb.extimm <= 0;
			plif_memwb.porto <= 0;
			plif_memwb.dmemload <= 0;
			plif_memwb.regsrc <= 0;
			plif_memwb.halt <= 0;
			plif_memwb.regen <= 0;
			plif_memwb.regen_sel <= 0;
		end else if(plif_memwb.en) begin
			plif_memwb.wsel_l <= plif_memwb.wsel;
			plif_memwb.extimm_l <= plif_memwb.extimm;
			plif_memwb.porto_l <= plif_memwb.porto;
			plif_memwb.dmemload_l <= plif_memwb.dmemload;
			plif_memwb.regsrc_l <= plif_memwb.regsrc;
			plif_memwb.halt_l <= plif_memwb.halt;
			plif_memwb.regen_l <= plif_memwb.regen;
		end
	end
endmodule