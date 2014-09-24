`ifndef PIPELINE_MEMWB_IF_VH
`define PIPELINE_MEMWB_IF_VH

`include "cpu_types_pkg.vh"

//Signal Declarations

//From ALU -> exmem
word_t porto, porto_l;
//From Control Unit -> idex -> exmem
regbits_t wsel, wsel_l; //This is the register write location determined by the Control Unit (not DP muxes)
logic   regen, regen_l;
logic   [1:0] regsrc, regsrc_l;
logic   en;
logic   sRST;
//logic   pcsrc, pcsrc_l; //These are not used for lab 5 (branches and jumps only)
//logic [1:0] extimm, extimm_l; //Not used beyond execute phase due to lack of branches / jumps in lab 5
//From Memory
logic   dmemload, dmemload_l;

interface pipeline_memwb_if;
	// import types
  import cpu_types_pkg::*;

  // mem -> wb
  modport exmem (
  	input  wsel,    regsrc,    regen,    porto,    dmemload,   en,  sRST,
  	output wsel_l,  regsrc_l,  regen_l,  porto_l,  dmemload_l
  );

endinterface

`endif