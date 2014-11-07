`include "coherence_control_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module coherence_control_tb;

`ifndef MAPPED
	
	parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  coherence_control_if coif ();

  test PROG (CLK, nRST, coif);

  `ifndef MAPPED
    coherence_control COH (CLK, nRST, coif);
  `endif

endmodule

program test (input logic CLK, output logic nRST, coherence_control_if.tb cotb);

	import cpu_types_pkg::*;
	parameter PERIOD = 20;

	initial begin
		integer testcase = 0;
		nRST = 0;
		cotb.cctrans = 0;
		cotb.ccwrite = 0;
		cotb.daddr   = 0;
		cotb.dWEN    = 0;
		#(PERIOD*2);

		nRST = 1;

		testcase = 1;
		$display("Test 1: LW on C0...");

		cotb.cctrans[0] = 1;
		cotb.daddr[0] = 32'h3100;
		
	end
endprogram 




