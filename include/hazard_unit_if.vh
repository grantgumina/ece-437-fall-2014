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

  //signal declarations
  // inputs
  // pcsrc_in, dmemREN_in, dmemWEN_in, regen_in all come from the control unit
  logic dmemREN_in;
  logic dmemWEN_in;
  logic regen_in;
  logic hazen;
  logic ihit;
  logic dhit;
  logic [2:0] pcsrc_in;
  // will need these later for data hazard detection
  // Register
  regbits_t ifid_rs_l;
  regbits_t ifid_rt_l;
  regbits_t idex_rt_l;
  // ALU
  logic idex_alusrc_l;
  // Memory
  logic idex_dmemREN_l;
  // outputs
  // Memory
  logic imemREN_out;
  logic dmemREN_out;
  logic dmemWEN_out;
  logic regen_out;
  // required depending on how datapath is setup
  // logic [2:0] pcsrc_out;
  // PC
  logic rambusy;

  //  modport
  modport hu (
    //---------------------------Inputs-----------------------------------------
    input pcsrc_in, dmemREN_in, dmemWEN_in, ihit,       dhit,  
          regen_in, ifid_rt_l,  ifid_rs_l,  idex_rt_l,  idex_alusrc_l, idex_dmemREN_l,
    //--------------------------Outputs----------------------------------------
    output imemREN_out, dmemREN_out, dmemWEN_out, regen_out, rambusy, hazen
  );

endinterface

`endif
