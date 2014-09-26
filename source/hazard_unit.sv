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

	always_ff @ (posedge CLK or negedge nRST) begin
		if(~nRST) begin
			hzif.imemREN_out <= 1;
			hzif.dmemREN_out <= 0;
			hzif.dmemWEN_out <= 0;
			hzif.ifid_sRST <= 0;
		end else begin
			if (hzif.ihit == 1) begin
				hzif.dmemREN_out <= hzif.dmemREN_in;
				hzif.dmemWEN_out <= hzif.dmemWEN_in;
				// hzif.pcsrc_out <= hzif.pcsrc_in;
			end else if (hzif.ihit == 0) begin
				hzif.imemREN_out <= 1;
				hzif.dmemREN_out <= 0;
				hzif.dmemWEN_out <= 0;
				if (hzif.dmemREN_in == 1 && hzif.dmemWEN_in == 0) begin
					hzif.imemREN_out <= 1;
					hzif.dmemREN_out <= 1;
					hzif.dmemWEN_out <= 0;
				end else if (hzif.dmemREN_in == 0 && hzif.dmemWEN_in == 1) begin
					hzif.imemREN_out <= 1;
					hzif.dmemREN_out <= 0;
					hzif.dmemWEN_out <= 1;
				end
			end else if (hzif.dhit == 1) begin // same case as nRST
				hzif.imemREN_out <= 1;
				hzif.dmemREN_out <= 0;
				hzif.dmemWEN_out <= 0;
				hzif.ifid_sRST <= 1;
			end
		end
	end

	always_ff @ (posedge CLK or negedge nRST) begin
		if (~nRST) begin
			hzif.regen_out <= 0;
		end else begin
			if (hzif.ihit == 1) begin
				hzif.regen_out <= hzif.regen_in;
			end else begin
				hzif.regen_out <= 0;
			end
		end
	end

	assign hzif.rambusy = !hzif.ihit;

	// data hazard detection code here
	// todo fix this
	always_comb begin
		if (hzif.idex_dmemREN_l && (hzif.idex_rt_l == hzif.rs) || (hzif.idex_rt_l == hzif.rt)) begin
			hzif.hazen = 1;
		end else begin
			hzif.hazen = 0;
		end
	end

endmodule
