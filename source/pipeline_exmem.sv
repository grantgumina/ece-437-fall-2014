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
		plif_exmem.portb_dl <= 0;
		plif_exmem.porto_l <= 0;
		plif_exmem.extimm_dl <= 0;
		plif_exmem.imemaddr_l <= 0;
		plif_exmem.wsel_l <= 0;
		plif_exmem.dmemREN_dl <= 0;
		plif_exmem.dmemWEN_dl <= 0;
		plif_exmem.pcsrc_dl <= 0;
		plif_exmem.regsrc_dl <= 0;
		plif_exmem.halt_dl <= 0;
		plif_exmem.nflag_l <= 0;
		plif_exmem.zflag_l <= 0;
		plif_exmem.vflag_l <= 0;
		plif_exmem.pcsrc_dl <= 0;
	end
	else if(plif_exmem.en) begin
		plif_exmem.portb_dl <= plif_exmem.portb_l;
		plif_exmem.porto_l <= plif_exmem.porto;
		plif_exmem.extimm_dl <= plif_exmem.extimm_l;
		plif_exmem.imemaddr_l <= plif_exmem.imemaddr;
		plif_exmem.wsel_l <= plif_exmem.wsel;
		plif_exmem.dmemREN_dl <= plif_exmem.dmemREN_l;
		plif_exmem.dmemWEN_dl <= plif_exmem.dmemWEN_l;
		plif_exmem.pcsrc_dl <= plif_exmem.reg_write_l;
		plif_exmem.regsrc_dl <= plif_exmem.regsrc_l;
		plif_exmem.halt_dl <= plif_exmem.halt_l;
		plif_exmem.nflag_l <= plif_exmem.nflag;
		plif_exmem.zflag_l <= plif_exmem.zflag;
		plif_exmem.vflag_l <= plif_exmem.vflag;
		plif_exmem.pcsrc_dl <= plif_exmem.pcsrc_l;
	end
end


