/*
  Warren Getlin
  wgetlin@gmail.com

   interface
*/

`ifndef HAZARD_UNIT_IF
`define HAZARD_UNIT_IF

// all types
`include "cpu_types_pkg.vh"

interface hazard_unit_if;
  // import types
  import cpu_types_pkg::*;

  // signal declarations
  // inputs
  // pcsrc_in, dmemREN_in, dmemWEN_in, regen_in all come from the control unit
  logic dmemREN;
  logic dmemWEN;
  logic ihit;
  logic dhit;

  logic dREN_ex;
  
  regbits_t wsel_ex, wsel_mem, rsel1_id, rsel2_id; //data hazard detection

  // outputs
  logic ifid_sRST, ifid_en;
  logic idex_sRST, idex_en;
  logic exmem_sRST, exmem_en;
  logic memwb_sRST, memwb_en;

  logic [1:0] pcsrc_ex, pcsrc_mem;
  logic [1:0] pcsrc_wb;
  logic brtkn;

  logic rambusy;
  
  //  modport
  modport hu (
    //---------------------------Inputs-----------------------------------------
    input dREN_ex, dmemREN, dmemWEN, ihit, dhit, wsel_ex, wsel_mem, rsel1_id, rsel2_id, pcsrc_ex, pcsrc_mem, pcsrc_wb, brtkn,
    //--------------------------Outputs----------------------------------------
    output ifid_sRST, idex_sRST, exmem_sRST, memwb_sRST, rambusy,
           ifid_en,   idex_en,   exmem_en,   memwb_en     
  );

endinterface

`endif
