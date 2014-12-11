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

	logic branchjump;
	logic loaduse;

	//assign hzif.rambusy = ~hzif.ifid_en || ((hzif.dmemWEN || hzif.dmemREN) && !hzif.ihit);
	//assign hzif.rambusy = ~hzif.ifid_en || hzif.dmemWEN || hzif.dmemREN || !hzif.ihit;
	assign hzif.rambusy = !hzif.ifid_en || !hzif.ihit || ((hzif.dmemWEN || hzif.dmemREN)) || (!branchjump && loaduse);

	always_comb begin
		loaduse = 0;
		branchjump = 0;
		hzif.ifid_sRST  = 0;
		hzif.ifid_en    = 1;
		hzif.idex_sRST  = 0;
		hzif.idex_en    = 1;
		hzif.exmem_sRST = 0;
		hzif.exmem_en   = 1;
		hzif.memwb_sRST = 0;
		hzif.memwb_en   = 1;
		
		//MEMORY HAZARD CONTROL
		if ((hzif.dREN_ex) && //if lw in execute phase and write reg equals either source reg in decode
			(hzif.wsel_ex == hzif.rsel1_id || hzif.wsel_ex == hzif.rsel2_id)) begin
			loaduse = 1;
			hzif.ifid_sRST  = 0;
			hzif.ifid_en    = 0; //stalling
			hzif.idex_sRST  = 1; //nopping
			hzif.idex_en    = 0; //stalling
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1; //stalling (jk not really)
			hzif.memwb_sRST = 0; 
			hzif.memwb_en   = 1;
		end 


		if (hzif.halt_decode) begin //halt makes it to decode
			hzif.ifid_sRST  = 0; 
			hzif.ifid_en    = 0; //stall decode 
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 1; 
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1; 
			hzif.memwb_sRST = 0; 
			hzif.memwb_en   = 1;
		end
		if (hzif.halt_execute) begin //halt makes it to execute
			hzif.ifid_sRST  = 0;
			hzif.ifid_en    = 0; 
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 0; //stall execute 
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1; 
			hzif.memwb_sRST = 0; 
			hzif.memwb_en   = 1;
		end
		if (hzif.halt_mem) begin //halt makes it to mem
			hzif.ifid_sRST  = 0;
			hzif.ifid_en    = 0; 
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 0;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 0; //stall memory 
			hzif.memwb_sRST = 0; 
			hzif.memwb_en   = 1;
		end
		/*
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
		*/
		
		// CONTROL FLOW HAZARD
		if (hzif.pcsrc_ex) begin //If a branch is attempted in the EXECUTE phase
			branchjump = 1;
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
			branchjump = 1;
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
			branchjump = 1;
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
			branchjump = 1;
			hzif.ifid_sRST  = 0; 
			hzif.ifid_en    = 1; //Resume PC 
			hzif.idex_sRST  = 0; //Nop Nop idex
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end 		
		if ((hzif.dmemWEN || hzif.dmemREN)) begin
				hzif.ifid_sRST  = 0;
				hzif.ifid_en    = 0; //stalling
				hzif.idex_sRST  = 0;
				hzif.idex_en    = 0; //stalling
				hzif.exmem_sRST = 0;
				hzif.exmem_en   = 0; //stalling
				hzif.memwb_sRST = 0; 
				hzif.memwb_en   = 0; //not stalling
			if (hzif.dhit) begin //the behavior here is suspect
				hzif.ifid_sRST  = 1;
				hzif.ifid_en    = 0; //stalling
				hzif.idex_sRST  = 0; //flushing 
				hzif.idex_en    = 1; //stalling 
				hzif.exmem_sRST = 0; //flushing
				hzif.exmem_en   = 1; 
				hzif.memwb_sRST = 0;
				hzif.memwb_en   = 1; //resuming
			end
		end
				/*if (hzif.ihit) begin
					hzif.ifid_en = 1;
					hzif.idex_sRST = 0;
				end*/
	end
endmodule
