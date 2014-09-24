`include "cpu_types_pkg.vh"
`include "pipeline_exmem_if.vh"
module pipeline_exmem
import cpu_types_pkg::*;
(
input logic CLK, nRST,
	pipeline_exmem_if plif_exmem
);

	always_ff @ (posedge CLK) begin
		if(!nRST) begin
			plif_exmem.rdat2 <= 0;
			plif_exmem.porto <= 0;
			plif_exmem.extimm <= 0;
			plif_exmem.imemaddr <= 0;
			plif_exmem.wsel <= 0;
			plif_exmem.dmemREN <= 0;
			plif_exmem.dmemWEN <= 0;
			plif_exmem.pcsrc <= 0;
			plif_exmem.regsrc <= 0;
			plif_exmem.halt <= 0;
		end
		else if(plif_exmem.en) begin
			plif_exmem.rdat2_l <= plif_exmem.rdat2;
			plif_exmem.porto_l <= plif_exmem.porto;
			plif_exmem.extimm_l <= plif_exmem.extimm;
			plif_exmem.imemaddr_l <= plif_exmem.imemaddr;
			plif_exmem.wsel_l <= plif_exmem.wsel;
			plif_exmem.dmemREN_l <= plif_exmem.dmemREN;
			plif_exmem.dmemWEN_l <= plif_exmem.dmemWEN;
			plif_exmem.pcsrc_l <= plif_exmem.reg_write;
			plif_exmem.regsrc_l <= plif_exmem.regsrc;
			plif_exmem.halt_l <= plif_exmem.halt;
		end
	end

endmodule