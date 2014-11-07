`include "coherence_control_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module coherence_control_tb;
	
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
	parameter PERIOD2 = 40;

	initial begin
		integer testcase;
		testcase = 1;
		nRST = 0;
		cotb.cctrans = 0;
		cotb.ccwrite = 0;
		cotb.daddr   = 0;
		cotb.dWEN    = 0;
		cotb.dstore  = 0;
		cotb.snoopy  = 0;
		cotb.modded  = 0;
		cotb.dwait   = 3;

		#(PERIOD2);

		nRST = 1;

		testcase = 1; //$display("Test 1: LW on C0...");
		cotb.cctrans[0] = 1;
		cotb.daddr[0] = 32'h3100;
		#(PERIOD2);
		cotb.snoopy[1] = 1;
		#(PERIOD2);
		cotb.snoopy[1] = 0;
		cotb.modded[1] = 1;
		#(PERIOD2*2);
		#(PERIOD2/2);
		cotb.dstore[1] = 32'hFEED0000;
		cotb.dwait[1]  = 0;
		#(PERIOD2/2);
		cotb.dwait[1]  = 1;
		#(PERIOD2*2);
		#(PERIOD2/2);
		cotb.dstore[1] = 32'hBEEF;
		cotb.dwait[1]  = 0;
		#(PERIOD2/2);
		cotb.dwait[1]  = 1;

		testcase = 2; //$display("Test 2: LW on C1...");
		cotb.cctrans[1] = 1;
		cotb.daddr[1] = 32'hFACE;
		#(PERIOD2);
		cotb.snoopy[0] = 1;
		#(PERIOD2);
		cotb.snoopy[0] = 0;
		cotb.modded[0] = 1;
		#(PERIOD2*2);
		#(PERIOD2/2);
		cotb.dstore[0] = 32'hFEED0000;
		cotb.dwait[0]  = 0;
		#(PERIOD2/2);
		cotb.dwait[0]  = 1;
		#(PERIOD2*2);
		#(PERIOD2/2);
		cotb.dstore[0] = 32'hBEEF;
		cotb.dwait[0]  = 0;
		#(PERIOD2/2);
		cotb.dwait[0]  = 1;

		testcase = 3; //$display("Test 3: SW on C1...");
		cotb.cctrans[1] = 1;
		cotb.ccwrite[1] = 1;
		cotb.daddr[1] = 32'hFACE;
		#(PERIOD2);
		cotb.snoopy[0] = 1;
		#(PERIOD2);
		cotb.snoopy[0] = 0;
		cotb.modded[0] = 1;
		#(PERIOD2*2);
		#(PERIOD2/2);
		cotb.dstore[0] = 32'hFEED0000;
		cotb.dwait[0]  = 0;
		#(PERIOD2/2);
		cotb.dwait[0]  = 1;
		#(PERIOD2*2);
		#(PERIOD2/2);
		cotb.dstore[0] = 32'hBEEF;
		cotb.dwait[0]  = 0;
		#(PERIOD2/2);
		cotb.dwait[0]  = 1;

		testcase = 4; //$display("Test 1: LW on C0 with no Mod");
		cotb.cctrans[0] = 1;
		cotb.daddr[0] = 32'h3100;
		#(PERIOD2);
		cotb.snoopy[1] = 1;
		#(PERIOD2);
		cotb.snoopy[1] = 0;
		#(PERIOD2*2);

	end
endprogram 




