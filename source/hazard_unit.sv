/*
  Warren Getlin
  wgetlin@gmail.com

  hazard unit
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

	always_comb begin: MEMORY
		hzif.ifid_sRST  = 0;
		hzif.ifid_en    = 1;
		hzif.idex_sRST  = 0;
		hzif.idex_en    = 1;
		hzif.exmem_sRST = 0;
		hzif.exmem_en   = 1;
		hzif.memwb_sRST = 0;
		hzif.memwb_en   = 1;
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
		/*
		else if (hzif.ihit) begin //I'm like, 80% sure this else if block does nothing 
			hzif.ifid_sRST  = 0; //everything resumes
			hzif.ifid_en    = 1; 
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 1; 
			hzif.exmem_sRST = 0; 
			hzif.exmem_en   = 1; 	
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end
		else begin
			hzif.ifid_sRST  = 0;
			hzif.ifid_en    = 1;
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;
		end
		*/
		//THE FOLLOWING IS DATA HAZARD CONTROL
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
	end
/*
hzif.wsel_ex:  the Register write location from the EXECUTE phase
hzif.wsel_mem: the Register write location from the MEMORY phase
hzif.wsel_wb:  the Register write location from the WRITE BACK phase

hzif.rsel1_id: the first Register read select from the DECODE phase
hzif.rsel2_id: the second Register read select from the DECODE phase */

endmodule
