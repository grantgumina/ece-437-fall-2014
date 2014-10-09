/*
  Warren Getlin
  wgetlin@gmail.com

  hazard unit
	
	Housekeeping
	------------
	hzif.wsel_ex:  the Register write location from the EXECUTE phase
	hzif.wsel_mem: the Register write location from the MEMORY phase

	hzif.rsel1_id: the first Register read select from the DECODE phase
	hzif.rsel2_id: the second Register read select from the DECODE phase 
*/

`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

module hazard_unit 
import cpu_types_pkg::*;
(
	input CLK, nRST,
	hazard_unit_if hzif
);
	assign hzif.rambusy = ~hzif.ifid_en || ((hzif.dmemWEN || hzif.dmemREN) && !hzif.ihit);

	always_comb begin
		hzif.ifid_sRST  = 0;
		hzif.ifid_en    = 1;
		hzif.idex_sRST  = 0;
		hzif.idex_en    = 1;
		hzif.exmem_sRST = 0;
		hzif.exmem_en   = 1;
		hzif.memwb_sRST = 0;
		hzif.memwb_en   = 1;
		
		//MEMORY HAZARD CONTROL
		if (hzif.dmemWEN || hzif.dmemREN) begin
			hzif.ifid_sRST  = 0;
			hzif.ifid_en    = 0; //stalling
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 0; //stalling
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 0; //stalling
			hzif.memwb_sRST = 0; 
			hzif.memwb_en   = 1;
			if (hzif.dhit) begin
				hzif.ifid_sRST  = 0;
				hzif.ifid_en    = 0; //stalling
				hzif.idex_sRST  = 0;
				hzif.idex_en    = 0; //stalling
				hzif.exmem_sRST = 1; //nopping
				hzif.exmem_en   = 0; 
				hzif.memwb_sRST = 0;
				hzif.memwb_en   = 1; 
			end
		end
		
		//DATA HAZARD CONTROL
		if (hzif.wsel_ex) begin //If a write is attempted in the EXECUTE phase
			if (hzif.wsel_ex == hzif.rsel1_id || hzif.wsel_ex == hzif.rsel2_id) begin
				hzif.ifid_sRST  = 0;
				hzif.ifid_en    = 0; //Stall ifid
				hzif.idex_sRST  = 1; //Nop 	 idex
				hzif.idex_en    = 1;
				hzif.exmem_sRST = 0;
				hzif.exmem_en   = 1;
				hzif.memwb_sRST = 0;
				hzif.memwb_en   = 1;
			end
		end
		else if (hzif.wsel_mem) begin //when the instr moves to the MEM phase
			if (hzif.wsel_mem == hzif.rsel1_id || hzif.wsel_mem == hzif.rsel2_id) begin
				hzif.ifid_sRST  = 0;
				hzif.ifid_en    = 0; //Stall ifid
				hzif.idex_sRST  = 1; //Nop   idex 
				hzif.idex_en    = 1; 
				hzif.exmem_sRST = 0;
				hzif.exmem_en   = 1;
				hzif.memwb_sRST = 0;
				hzif.memwb_en   = 1;			
			end
		end
		
		// CONTROL FLOW HAZARD
		if (hzif.pcsrc_ex) begin //If a write is attempted in the EXECUTE phase
			hzif.ifid_sRST  = 0; 
			hzif.ifid_en    = 0; //Stall ifid to stall PC
			hzif.idex_sRST  = 1; //Nop 	 idex
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end
		else if (hzif.pcsrc_mem) begin //when the instr moves to the MEM phase
			hzif.ifid_sRST  = 0; 
			hzif.ifid_en    = 0; //Stall ifid
			hzif.idex_sRST  = 1; //Nop 	 idex
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end
		else if (hzif.pcsrc_wb && hzif.brtkn) begin //when the instr moves to the WB phase
			hzif.ifid_sRST  = 1; //Nop   ifid
			hzif.ifid_en    = 1; //Resume PC 
			hzif.idex_sRST  = 1; //Nop 	 idex
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end 
		else if (hzif.pcsrc_wb && ~hzif.brtkn) begin //when the instr moves to the WB phase
			hzif.ifid_sRST  = 0; 
			hzif.ifid_en    = 1; //Resume PC 
			hzif.idex_sRST  = 1; //Nop 	 idex
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end 		
	end
endmodule
