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
			plif_idex.reg_dst_l <= 0;
			plif_idex.aluop_l <= aluop_t'(0);
			plif_idex.busA_l <= 0;
			plif_idex.busB_l <= 0;
			plif_idex.extended_imm_l <= 0;
			plif_idex.alu_src_l <= 0;
			plif_idex.mem_to_reg_l <= 0;
			plif_idex.halt_l <= 0;
			plif_idex.dmemREN_l <= 0;
			plif_idex.dmemWEN_l <= 0;
			plif_idex.reg_write_l <= 0;
			plif_idex.pc_src_l <= 0;
			plif_idex.reg_write_sel_l <= 0;
		end else if(en) begin
			plif_idex.rd_l <= regbits_t'(plif_idex.rd);
			plif_idex.rt_l <= regbits_t'(plif_idex.rt);
			plif_idex.rs_l <= regbits_t'(plif_idex.rs);
			plif_idex.reg_dst_l <= plif_idex.reg_dst;
			plif_idex.aluop_l <= aluop_t'(plif_idex.aluop);
			plif_idex.busA_l <= plif_idex.busA;
			plif_idex.busB_l <= plif_idex.busB;
			plif_idex.extended_imm_l <= plif_idex.extended_imm;
			plif_idex.alu_src_l <= plif_idex.alu_src;
			plif_idex.mem_to_reg_l <= plif_idex.mem_to_reg;
			plif_idex.halt_l <= plif_idex.halt;
			plif_idex.dmemREN_l <= plif_idex.dmemREN;
			plif_idex.dmemWEN_l <= plif_idex.dmemWEN;
			plif_idex.reg_write_l <= plif_idex.reg_write;
			plif_idex.pc_src_l <= plif_idex.pc_src;
			plif_idex.reg_write_sel_l <= plif_idex.reg_write_sel;
		end
	end
endmodule