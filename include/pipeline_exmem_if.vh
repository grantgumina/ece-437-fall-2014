
`ifndef PIPELINE_EXMEM_IF_VH
`define PIPELINE_EXMEM_IF_VH

`include "cpu_types_pkg.vh"


interface pipeline_exmem_if;
	// import types
  import cpu_types_pkg::*;

  //Signal Declarations
  logic   en;
  logic   sRST;
  //Registers
  regbits_t wsel, wsel_l; //This is the register write location determined by the Control Unit (not DP muxes)
  logic     regen, regen_l;
  word_t    rdat2, rdat2_l;
  //ALU
  word_t porto, porto_l;
  //Memory
	logic   dmemWEN, dmemWEN_l;
	logic   dmemREN, dmemREN_l;
	logic   rambusy, rambusy_l; //Not sure about this signal. Request Unit is no longer part of the design
  //Datapath
  logic     hlt, hlt_l;
  logic     [1:0] regsrc, regsrc_l;
	logic     [1:0] pcsrc, pcsrc_l; //These are not used for lab 5 (branches and jumps only)
	word_t    extimm, extimm_l; //Not used beyond execute phase due to lack of branches / jumps in lab 5
  logic     btype, btype_l;
  logic     zero, zero_l;
  word_t    jraddr, jraddr_l;
  logic     [ADDR_W-1:0] jaddr, jaddr_l;
  word_t    rtnaddr, rtnaddr_l;

  opcode_t opcode, opcode_l;

  // ex -> mem
  modport exmem (
  	input  wsel,   rdat2,   regsrc,   regen,   hlt,   dmemWEN,   dmemREN,		rambusy,   porto,   pcsrc,   extimm,   btype,   zero,   jaddr,   jraddr,   rtnaddr,   opcode,  en, sRST,
  	output wsel_l, rdat2_l, regsrc_l, regen_l, hlt_l, dmemWEN_l, dmemREN_l, rambusy_l, porto_l, pcsrc_l, extimm_l, btype_l, zero_l, jaddr_l, jraddr_l, rtnaddr_l, opcode_l
  );

 endinterface

 `endif