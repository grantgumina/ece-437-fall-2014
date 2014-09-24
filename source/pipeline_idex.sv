`include "cpu_types_pkg.vh"
`include "pipeline_idex_if.vh"
module pipeline_idex
import cpu_types_pkg::*;
(
	input logic CLK, nRST,
	pipeline_idex_if.idex plif_idex
);

	always_ff @ (posedge CLK, negedge nRST) begin
		if(~nRST || plif_idex.sRST) begin
			//Register File
			plif_idex.rd_l <= regbits_t'(0);
			plif_idex.rt_l <= regbits_t'(0);
			plif_idex.rs_l <= regbits_t'(0);
			plif_idex.wsel_l <= 0;
			plif_idex.regen_l <= 0;
			//ALU
			plif_idex.aluop_l <= aluop_t'(0);
			plif_idex.rdat1_l <= 0;
			plif_idex.rdat2_l <= 0;
			//Datapath
			plif_idex.extimm_l <= 0;
			plif_idex.alusrc_l <= 0;
			plif_idex.regsrc_l <= 0;
			//Memory
			plif_idex.hlt_l <= 0;
			plif_idex.dmemREN_l <= 0;
			plif_idex.dmemWEN_l <= 0;
			plif_idex.rambusy_l <= 0;
		end else if(plif_idex.en) begin
			//Register
			plif_idex.rd_l <= plif_idex.rd;
			plif_idex.rt_l <= plif_idex.rt;
			plif_idex.rs_l <= plif_idex.rs;
			plif_idex.wsel_l <= plif_idex.wsel;
			plif_idex.regen_l <= plif_idex.regen;
			//ALU
			plif_idex.aluop_l <= plif_idex.aluop;
			plif_idex.rdat1_l <= plif_idex.rdat1;
			plif_idex.rdat2_l <= plif_idex.rdat2;
			//Datapath
			plif_idex.extimm_l <= plif_idex.extimm;
			plif_idex.alusrc_l <= plif_idex.alusrc;
			plif_idex.regsrc_l <= plif_idex.regsrc;
			//Memory
			plif_idex.hlt_l     <= plif_idex.hlt;
			plif_idex.dmemREN_l <= plif_idex.dmemREN;
			plif_idex.dmemWEN_l <= plif_idex.dmemWEN;
			plif_idex.rambusy_l <= plif_idex.rambusy;
		end
	end

endmodule