`include "cpu_types_pkg.vh"
`include "pipeline_if.vh"
module pipeline_idex
import cpu_types_pkg::*;
(
	input logic CLK, nRST, en,
	pipeline_if.idex plif_idex
);


	always_ff @ (posedge CLK) begin
		if(!nRST) begin
			plif_idex.rd_l <= regbits_t'(0);
			plif_idex.rt_l <= regbits_t'(0);
			plif_idex.rs_l <= regbits_t'(0);
			plif_idex.wsel_l <= 0;
			plif_idex.aluop_l <= aluop_t'(0);
			plif_idex.porta_l <= 0;
			plif_idex.portb_l <= 0;
			plif_idex.extimm_l <= 0;
			plif_idex.irsel_l <= 0;
			plif_idex.regsrc_l <= 0;
			plif_idex.halt_l <= 0;
			plif_idex.dmemREN_l <= 0;
			plif_idex.dmemWEN_l <= 0;
			plif_idex.regen_l <= 0;
			plif_idex.pcsrc_l <= 0;
		end else if(en) begin
			plif_idex.rd_l <= regbits_t'(plif_idex.rd);
			plif_idex.rt_l <= regbits_t'(plif_idex.rt);
			plif_idex.rs_l <= regbits_t'(plif_idex.rs);
			plif_idex.wsel_l <= plif_idex.wsel;
			plif_idex.aluop_l <= aluop_t'(plif_idex.aluop);
			plif_idex.porta_l <= plif_idex.porta;
			plif_idex.portb_l <= plif_idex.portb;
			plif_idex.extimm_l <= plif_idex.extimm;
			plif_idex.irsel_l <= plif_idex.irsel;
			plif_idex.regsrc_l <= plif_idex.regsrc;
			plif_idex.halt_l <= plif_idex.halt;
			plif_idex.dmemREN_l <= plif_idex.dmemREN;
			plif_idex.dmemWEN_l <= plif_idex.dmemWEN;
			plif_idex.regen_l <= plif_idex.regen;
			plif_idex.pcsrc_l <= plif_idex.pcsrc;
		end
	end
endmodule