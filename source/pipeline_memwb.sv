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
			plif_memwb.extended_imm_tl <= 0;
			plif_memwb.aluresult_dl <= 0;
			plif_memwb.dmemload_l <= 0;
			plif_memwb.mem_to_reg_tl <= 0;
			plif_memwb.halt_tl <= 0;
			plif_memwb.reg_write_tl <= 0;
			plif_memwb.reg_write_sel_tl <= 0;
		end else if(en) begin
			plif_memwb.wsel_dl <= plif_memwb.wsel_l;
			plif_memwb.extended_imm_tl <= plif_memwb.extended_imm_dl;
			plif_memwb.aluresult_dl <= plif_memwb.aluresult_l;
			plif_memwb.dmemload_l <= plif_memwb.dmemload;
			plif_memwb.mem_to_reg_tl <= plif_memwb.mem_to_reg_dl;
			plif_memwb.halt_tl <= plif_memwb.halt_dl;
			plif_memwb.reg_write_tl <= plif_memwb.reg_write_dl;
			plif_memwb.reg_write_sel_tl <= plif_memwb.reg_write_sel_dl;
		end
	end
endmodule