`include "cpu_types_pkg.vh"
`include "pipeline_exmem_if.vh"
module pipeline_exmem
import cpu_types_pkg::*;
(
input logic CLK, nRST,
	pipeline_exmem_if.exmem plif_exmem
);

	always_ff @ (posedge CLK, negedge nRST) begin
		if(~nRST) begin
			//Register File
			plif_exmem.wsel_l <= 0;
			plif_exmem.regen_l <= 0;
			plif_exmem.rdat2_l <= 0;
			//ALU
			plif_exmem.porto_l <= 0;
			//Memory
			plif_exmem.dmemREN_l <= 0;
			plif_exmem.dmemWEN_l <= 0;
			plif_exmem.rambusy_l <= 0;
			//Datapath
			plif_exmem.regsrc_l <= 0;
			plif_exmem.hlt_l 		<= 0;
			plif_exmem.extimm_l <= 0;
			plif_exmem.pcsrc_l 	<= 0;
			plif_exmem.btype_l  <= 0;
			plif_exmem.zero_l   <= 0;
			plif_exmem.jaddr_l  <= 0;
			plif_exmem.jraddr_l <= 0;
			plif_exmem.rtnaddr_l <= 0;
			plif_exmem.opcode_l  <= opcode_t'(6'b0);
		end else if (plif_exmem.sRST) begin
			plif_exmem.wsel_l <= 0;
			plif_exmem.regen_l <= 0;
			plif_exmem.rdat2_l <= 0;
			//ALU
			plif_exmem.porto_l <= 0;
			//Memory
			plif_exmem.dmemREN_l <= 0;
			plif_exmem.dmemWEN_l <= 0;
			plif_exmem.rambusy_l <= 0;
			//Datapath
			plif_exmem.regsrc_l <= 0;
			plif_exmem.hlt_l 		<= 0;
			plif_exmem.extimm_l <= 0;
			plif_exmem.pcsrc_l 	<= 0;
			plif_exmem.btype_l  <= 0;
			plif_exmem.zero_l   <= 0;
			plif_exmem.jaddr_l  <= 0;
			plif_exmem.jraddr_l <= 0;
			plif_exmem.rtnaddr_l <= 0;		
		end else if(plif_exmem.en) begin
			//Register File
			plif_exmem.wsel_l  <= plif_exmem.wsel;
			plif_exmem.regen_l <= plif_exmem.regen;
			plif_exmem.rdat2_l <= plif_exmem.rdat2;
			//ALU
			plif_exmem.porto_l <= plif_exmem.porto;
			//Memory
			plif_exmem.dmemREN_l <= plif_exmem.dmemREN;
			plif_exmem.dmemWEN_l <= plif_exmem.dmemWEN;
			plif_exmem.rambusy_l   <= plif_exmem.rambusy;
			//Datapath
			plif_exmem.regsrc_l 	<= plif_exmem.regsrc;
			plif_exmem.hlt_l    	<= plif_exmem.hlt;
			plif_exmem.extimm_l 	<= plif_exmem.extimm;
			plif_exmem.pcsrc_l 		<= plif_exmem.pcsrc;
			plif_exmem.btype_l    <= plif_exmem.btype;
			plif_exmem.zero_l 		<= plif_exmem.zero;
			plif_exmem.jaddr_l    <= plif_exmem.jaddr;
			plif_exmem.jraddr_l   <= plif_exmem.jraddr;
		    plif_exmem.rtnaddr_l <= plif_exmem.rtnaddr;
			plif_exmem.opcode_l  <= plif_exmem.opcode;
		end
	end

endmodule