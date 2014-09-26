`ifndef PIPELINE_MEMWB_IF_VH
`define PIPELINE_MEMWB_IF_VH

`include "cpu_types_pkg.vh"

interface pipeline_memwb_if;
	// import types
  import cpu_types_pkg::*;
  
  //Signal Declarations
  logic   en;
  logic   sRST;
  //From Control Unit -> idex -> exmem
  regbits_t wsel, wsel_l; //This is the register write location determined by the Control Unit (not DP muxes)
  logic   regen, regen_l;
  logic   [1:0] regsrc, regsrc_l;
  //From ALU -> exmem
  word_t porto, porto_l;
  //logic   pcsrc, pcsrc_l; //These are not used for lab 5 (branches and jumps only)
  //logic [1:0] extimm, extimm_l; //Not used beyond execute phase due to lack of branches / jumps in lab 5
  //From Memory
  word_t   dmemload, dmemload_l;

  // mem -> wb
  modport memwb (
  	input  wsel,    regsrc,    regen,    porto,    dmemload,   en,  sRST,
  	output wsel_l,  regsrc_l,  regen_l,  porto_l,  dmemload_l
  );

endinterface

`endif
