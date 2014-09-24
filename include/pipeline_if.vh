// Grant Gumina - gumina@purdue.edu

`ifndef PIPELINE_IF_VH
`define PIPELINE_IF_VH

`include "cpu_types_pkg.vh"

interface pipeline_if;
	// import types
  import cpu_types_pkg::*;

  // housekeeping
  // l  - latched
  // dl - double latched (latched a second time)
  // tl - triple latched

  word_t instr;
  word_t instr_l;
  word_t porta, porta_l;
  word_t portb, portb_l, budB_dl; // dmemstore
  word_t extimm, extimm_l, extimm_dl, extimm_tl;
  word_t immeaddr, imemaddr_l;
  word_t porto, porto_l, porto_dl;
  word_t dmemload, dmemload_l;
  regbits_t rd, rd_l;
  regbits_t rt, rt_l;
  regbits_t rs, rs_l;
  regbits_t wsel, wsel_l, wsel_dl;
  aluop_t aluop, aluop_l;
  logic [2:0] pcsrc, pcsrc_l, pcsrc_dl;
  logic [4:0] wsel, wsel_l;
  logic , regen_l, regen_dl, regen_tl;
  logic alu_src, alu_src_l;
  logic regsrc, regsrc_l, regsrc_dl, regsrc_tl;
  logic hlt, hlt_l, hlt_dl, hlt_tl;
  logic dmemREN, dmemREN_l, dmemREN_dl;
  logic dmemWEN, dmemWEN_l, dmemWEN_dl;
  logic rambusy, rambusy_l, rambusy_dl;
  logic nflag, nflag_l;
  logic vflag, vflag_l;
  logic zflag, zflag_l;

  // if -> id
  modport ifid (
  	input instr,
  	output instr_l
  );

  // id -> ex
  modport idex (
  	input rd, rt, wsel, aluop, porta, portb, extimm, alu_src, regsrc, 
  				hlt, dmemREN, dmemWEN, regen, pcsrc, rambusy,
  	output rd_l, rt_l, wsel_l, aluop_l, porta_l, portb_l, extimm_l, alu_src_l, regsrc_l,
  				 hlt_l, dmemREN_l, dmemWEN_l, regen_l, pcsrc_l, rambusy_l
  );

  // ex -> mem
  modport exmem (
  	input portb_l, porto, extimm_l, imemaddr, wsel, dmemREN_l, dmemWEN_l, regen_l, 
  				regsrc_l, hlt_l, nflag, z_flag, vflag, pcsrc_l, rambusy_l,
  	output portb_dl, porto_l, extimm_dl, imemaddr_l, wsel_l, dmemREN_dl, dmemWEN_dl,
  				 regen_dl, regsrc_dl, hlt_dl, nflag_l, z_flag_l, vflag_l, pcsrc_dl, 
  				 rambusy_dl
  );

  // mem -> wb
  modport memwb (
  	input wsel_l, extimm_dl, porto_l, dmemload, regsrc_dl, hlt_dl, regen_dl, 
  	output wsel_dl, extimm_tl, porto_dl, dmemload_l, regsrc_tl, hlt_tl, 
  				 regen_tl
  );

endinterface

`endif