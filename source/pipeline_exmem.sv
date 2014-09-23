`include "cpu_types_pkg.vh"
`include "pipeline_if.vh"
module pipeline_exmem
import cpu_types_pkg::*;
(
input logic CLK, nRST, en,
	pipeline_if.exmem plif_exmem
);

	always_ff @ (posedge CLK) begin
	if(!nRST) begin
		plif_exmem.busB_dl <= 0;
		plif_exmem.alu_output_port_l <= 0;
		plif_exmem.extended_imm_dl <= 0;
		plif_exmem.imemaddr_l <= 0;
		plif_exmem.wsel_l <= 0;
		plif_exmem.dmemREN_dl <= 0;
		plif_exmem.dmemWEN_dl <= 0;
		plif_exmem.pc_src_dl <= 0;
		plif_exmem.mem_to_reg_dl <= 0;
		plif_exmem.halt_dl <= 0;
		plif_exmem.negative_l <= 0;
		plif_exmem.zero_l <= 0;
		plif_exmem.overflow_l <= 0;
		plif_exmem.pc_src_dl <= 0;
		plif_exmem.reg_write_sel_dl <= 0;
	end
	else if(en) begin
		plif_exmem.busB_dl <= plif_exmem.busB_l;
		plif_exmem.alu_output_port_l <= plif_exmem.alu_output_port;
		plif_exmem.extended_imm_dl <= plif_exmem.extended_imm_l;
		plif_exmem.imemaddr_l <= plif_exmem.imemaddr;
		plif_exmem.wsel_l <= plif_exmem.wsel;
		plif_exmem.dmemREN_dl <= plif_exmem.dmemREN_l;
		plif_exmem.dmemWEN_dl <= plif_exmem.dmemWEN_l;
		plif_exmem.pc_src_dl <= plif_exmem.reg_write_l;
		plif_exmem.mem_to_reg_dl <= plif_exmem.mem_to_reg_l;
		plif_exmem.halt_dl <= plif_exmem.halt_l;
		plif_exmem.negative_l <= plif_exmem.negative;
		plif_exmem.zero_l <= plif_exmem.zero;
		plif_exmem.overflow_l <= plif_exmem.overflow;
		plif_exmem.pc_src_dl <= plif_exmem.pc_src_l;
		plif_exmem.reg_write_sel_dl <= plif_exmem.reg_write_sel_l;
	end
end


