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
  logic     [1:0] pcsrc, pcsrc_l; //These are not used for lab 5 (branches and jumps only)
  word_t    extimm, extimm_l; //Not used beyond execute phase due to lack of branches / jumps in lab 5
  logic     btype, btype_l;
  logic     zero, zero_l;
  word_t    jraddr, jraddr_l;
  logic     [ADDR_W-1:0] jaddr, jaddr_l;
  word_t    rtnaddr, rtnaddr_l;

  opcode_t opcode, opcode_l;

  //From ALU -> exmem
  word_t porto, porto_l;
  
  //From Memory
  word_t   dmemload, dmemload_l;

  // mem -> wb
  modport memwb (
  	input  wsel,    regsrc,    regen,    porto,    dmemload,   rtnaddr,   pcsrc,   extimm,   btype,   zero,   jraddr,   jaddr,   opcode,  en, sRST,
  	output wsel_l,  regsrc_l,  regen_l,  porto_l,  dmemload_l, rtnaddr_l, pcsrc_l, extimm_l, btype_l, zero_l, jraddr_l, jaddr_l, opcode_l
  );

endinterface

`endif
