// Grant Gumina - gumina@purdue.edu

`ifndef PIPELINE_IFID_IF_VH
`define PIPELINE_IFID_IF_VH

`include "cpu_types_pkg.vh"

//Signal Delcarations
word_t instr;
word_t instr_l;

interface pipeline_ifid_if;
	// import types
  import cpu_types_pkg::*;

  logic  en;
  word_t instr, instr_l;

  //if -> id
  modport ifid (input en, instr, output instr_l);

endinterface

`endif