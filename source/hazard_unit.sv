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
	assign hzif.rambusy = (hzif.dmemWEN || hzif.dmemREN) && !hzif.ihit;

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
		else if (hzif.ihit) begin
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
	end
endmodule

/*
always_ff @ (posedge CLK, negedge nRST) begin: DATA
	if (~nRST) begin
			hzif.ifid_sRST  = 0;
			hzif.ifid_en    = 1;
			hzif.idex_sRST  = 0;
			hzif.idex_en    = 1;
			hzif.exmem_sRST = 0;
			hzif.exmem_en   = 1;
			hzif.memwb_sRST = 0;
			hzif.memwb_en   = 1;		
	end
end
*/







/*
	always_ff @ (posedge CLK or negedge nRST) begin
		if(~nRST) begin
			hzif.imemREN_out = 1;
			hzif.dmemREN_out = 0;
			hzif.dmemWEN_out = 0;
		end else begin
			if (hzif.ihit == 1) begin
				hzif.dmemREN_out = hzif.dmemREN_in;
				hzif.dmemWEN_out = hzif.dmemWEN_in;
				// hzif.pcsrc_out = hzif.pcsrc_in;
			end else if (hzif.ihit == 0) begin
				hzif.imemREN_out = 1;
				hzif.dmemREN_out = 0;
				hzif.dmemWEN_out = 0;
				if (hzif.dmemREN_in == 1 && hzif.dmemWEN_in == 0) begin
					hzif.imemREN_out = 1;
					hzif.dmemREN_out = 1;
					hzif.dmemWEN_out = 0;
				end else if (hzif.dmemREN_in == 0 && hzif.dmemWEN_in == 1) begin
					hzif.imemREN_out = 1;
					hzif.dmemREN_out = 0;
					hzif.dmemWEN_out = 1;
				end
			end else if (hzif.dhit == 1) begin // same case as nRST
				hzif.imemREN_out = 1;
				hzif.dmemREN_out = 0;
				hzif.dmemWEN_out = 0;
			end
		end
	end

	always_ff @ (posedge CLK or negedge nRST) begin
		if (~nRST) begin
			hzif.regen_out = 0;
		end else begin
			if (hzif.ihit == 1) begin
				hzif.regen_out = hzif.regen_in;
			end else begin
				hzif.regen_out = 0;
			end
		end
	end



*/

