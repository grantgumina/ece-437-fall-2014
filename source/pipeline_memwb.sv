`include "cpu_types_pkg.vh"
`include "pipeline_memwb_if.vh"
module pipeline_memwb
import cpu_types_pkg::*;
(
	input logic CLK, nRST,
	pipeline_memwb_if.memwb plif_memwb
);

	always_ff @ (posedge CLK, negedge nRST) begin
		if(~nRST || plif_memwb.sRST) begin
			//Register
			plif_memwb.wsel_l <= 0;
			plif_memwb.regen_l <= 0;
			plif_memwb.regsrc_l <= 0;
			//ALU
			plif_memwb.porto_l <= 0;
			//Memory
			plif_memwb.dmemload_l <= 0;
		end else if(plif_memwb.en) begin
			//Register
			plif_memwb.wsel_l <= plif_memwb.wsel;
			plif_memwb.regen_l <= plif_memwb.regen;
			plif_memwb.regsrc_l <= plif_memwb.regsrc;
			//ALU
			plif_memwb.porto_l <= plif_memwb.porto;
			//Memory
			plif_memwb.dmemload_l <= plif_memwb.dmemload;
		end
	end
endmodule