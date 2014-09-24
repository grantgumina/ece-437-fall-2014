// Grant Gumina - gumina@purdue.edu

`ifndef PIPELINE_IFID_IF_VH
`define PIPELINE_IFID_IF_VH

`include "cpu_types_pkg.vh"

interface pipeline_ifid_if;
	// import types
  import cpu_types_pkg::*;

	//Signal Delcarations
  logic  en;
  logic	 sRST;
  word_t instr, instr_l;
  //Registers
	regbits_t rd, rd_l;
	regbits_t rt, rt_l;
	regbits_t rs, rs_l;

  //if -> id
  modport ifid (input en, sRST, instr, output instr_l);

endinterface

`endif