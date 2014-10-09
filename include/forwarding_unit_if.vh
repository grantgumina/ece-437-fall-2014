`ifndef FORWARDING_UNIT_IF_VH
`define FORWARDING_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface forwarding_unit_if;
  import cpu_types_pkg::*;
  
  regbits_t   idexrs;
  regbits_t   idexrt;
  regbits_t   exmemwsel;
  regbits_t   memwbwsel;
  logic       exmemregen;
  logic       memwbregen;
  logic       idexalusrc;
  logic       [1:0] fwda;
  logic       [1:0] fwdb;
  logic       [1:0] fwdc;

  modport forwarding_unit_if (
    input   idexrs, idexrt, exmemwsel, memwbwsel, exmemregen, memwbregen, idexalusrc,
    output  fwda,  fwdb,  fwdc
  );

endinterface
`endif