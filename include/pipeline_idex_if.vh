// Grant Gumina - gumina@purdue.edu

`ifndef PIPELINE_IDEX_IF_VH
`define PIPELINE_IDEX_IF_VH

`include "cpu_types_pkg.vh"

interface pipeline_idex_if;
	// import types
  import cpu_types_pkg::*;

  //Signal Delcarations
  logic   en;
  logic   sRST;
  //Register File
  regbits_t wsel, wsel_l; //This is the register write location determined by the Control Unit (not DP muxes)
  logic     regen, regen_l;
  //ALU
  aluop_t aluop, aluop_l;
  word_t rdat1, rdat1_l;
  word_t rdat2, rdat2_l;
  //Datapath
  logic   alusrc, alusrc_l;
  logic   [1:0] regsrc, regsrc_l;
  logic   [1:0] pcsrc, pcsrc_l; //These are not used for lab 5 (branches and jumps only)
  word_t  extimm, extimm_l;
  logic   btype, btype_l;
  word_t  rtnaddr, rtnaddr_l;

  word_t    jraddr, jraddr_l;
  logic     [ADDR_W-1:0] jaddr, jaddr_l;
  
  //Memory
  logic   hlt, hlt_l;
  logic   dmemWEN, dmemWEN_l;
  logic   dmemREN, dmemREN_l;
  logic   rambusy, rambusy_l; //Not sure about this signal. Request Unit is no longer part of the design
  

  // id -> ex
  modport idex (
  	input  wsel,   rdat1,   rdat2,   alusrc,   aluop,   regsrc,   regen,   hlt,   dmemWEN,   dmemREN,		rambusy,   pcsrc,   extimm,   btype,   jaddr,   jraddr,   rtnaddr,  en, sRST,
  	output wsel_l, rdat1_l, rdat2_l, alusrc_l, aluop_l, regsrc_l, regen_l, hlt_l, dmemWEN_l, dmemREN_l, rambusy_l, pcsrc_l, extimm_l, btype_l, jaddr_l, jraddr_l, rtnaddr_l
  );
  
endinterface

`endif