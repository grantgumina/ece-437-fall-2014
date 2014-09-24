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
	hazard_unit_if hzif;
);

	always @(posedge clk or negedge nRST) begin : proc_
		if(~nRST) begin
			hzif.imemREN_out <= 0;
			hzif.dmemREN_out <= 0;
			hzif.dmemWEN_out <= 0;
			pcsrc_out <= pcsrc_in;
		end else begin
			if (hzif.ihit == 1) begin
			end else if (hzif.ihit == 0) begin
				if ((hzif.dmemREN_in || hzif.dmemWEN_in) && !hzif.dhit) begin
					if (hzif.dmemREN_in == 1 && hzif.dmemWEN_in == 0) begin
					end else if (hzif.dmemREN_in == 0 && hzif.dmemWEN_in == 1) begin
					end
				end
			end else if (hzif.dhit == 1) begin // should this be an "if"? Remember this isn't neccessarily synchronous
			end
		end
	end

endmodule