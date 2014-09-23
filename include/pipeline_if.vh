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

  word_t instruction;
  word_t instruction_l;
  word_t busA, busA_l;
  word_t busB, busB_l, budB_dl; // dmemstore
  word_t extended_imm, extended_imm_l, extended_imm_dl, extended_imm_tl;
  word_t immeaddr, imemaddr_l;
  word_t alu_output_port, alu_output_port_l, alu_output_port_dl;
  word_t dmemload, dmemload_l;
  regbits_t rd, rd_l;
  regbits_t rt, rt_l;
  regbits_t rs, rs_l;
  regbits_t wsel, wsel_l, wsel_dl;
  aluop_t aluop, aluop_l;
  logic [2:0] pc_src, pc_src_l, pc_src_dl;
  logic [1:0] reg_dst, reg_dst_l;
  logic [1:0] reg_write_sel, reg_write_sel_l, reg_write_sel_dl, reg_write_sel_tl;
  logic alu_src, alu_src_l;
  logic mem_to_reg, mem_to_reg_l, mem_to_reg_dl, mem_to_reg_tl;
  logic halt, halt_l, halt_dl, halt_tl;
  logic dmemREN, dmemREN_l, dmemREN_dl;
  logic dmemWEN, dmemWEN_l, dmemWEN_dl;
  logic reg_write, reg_write_l, reg_write_dl, reg_write_tl;
  logic pc_en, pc_en_l, pc_en_dl;
  logic negative, negative_l;
  logic overflow, overflow_l;
  logic zero, zero_l;

  // if -> id
  modport ifid (
  	input instruction,
  	output instruction_l
  );

  // id -> ex
  modport idex (
  	input rd, rt, reg_dst, aluop, busA, busB, extended_imm, alu_src, mem_to_reg, 
  				halt, dmemREN, dmemWEN, reg_write, pc_src, pc_en, reg_write_sel,
  	output rd_l, rt_l, reg_dst_l, aluop_l, busA_l, busB_l, extended_imm_l, alu_src_l, mem_to_reg_l,
  				 halt_l, dmemREN_l, dmemWEN_l, reg_write_l, pc_src_l, pc_en_l, reg_write_sel_l
  );

  // ex -> mem
  modport exmem (
  	input busB_l, alu_output_port, extended_imm_l, imemaddr, wsel, dmemREN_l, dmemWEN_l, reg_write_l, 
  				mem_to_reg_l, halt_l, negative, zero, overflow, pc_src_l, pc_en_l, reg_write_sel_l,
  	output busB_dl, alu_output_port_l, extended_imm_dl, imemaddr_l, wsel_l, dmemREN_dl, dmemWEN_dl,
  				 reg_write_dl, mem_to_reg_dl, halt_dl, negative_l, zero_l, overflow_l, pc_src_dl, 
  				 pc_en_dl, reg_write_sel_dl
  );

  // mem -> wb
  modport memwb (
  	input wsel_l, extended_imm_dl, alu_output_port_l, dmemload, mem_to_reg_dl, halt_dl, reg_write_dl, 
  				reg_write_sel_dl,
  	output wsel_dl, extended_imm_tl, alu_output_port_dl, dmemload_l, mem_to_reg_tl, halt_tl, 
  				 reg_write_tl, reg_write_sel_tl
  );

endinterface

`endif