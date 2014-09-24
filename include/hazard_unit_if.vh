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
  logic [2:0] pcsrc_in;
  logic dmemREN_in;
  logic dmemWEN_in;
  logic regen_in;
  logic hazen;
  logic ihit;
  logic dhit;
  // will need these later for data hazard detection
  // regbits_t ifidrs_l;
  // regbits_t ifidrt_l;
  // regbits_t idexrt_l;
  // logic idexalusrc_l;
  // logic idexdmemREN_l;
  // outputs
  logic imemREN_out;
  logic dmemREN_out;
  logic dmemWEN_out;
  logic regen_out;
  // required depending on how datapath is setup
  // logic [2:0] pcsrc_out;
  logic pcen;

  //  modport
  modport hu (
    //---------------------------Inputs-----------------------------------------
    input pcsrc_in, dmemREN_in, dmemWEN_in, ihit, dhit, regen_in,
          ifidrt_l, ifidrs_l, idexrt_l, idexalusrc_l, idexdmemREN_l,
    //--------------------------Outputs----------------------------------------
    output imemREN_out, dmemREN_out, dmemWEN_out, regen_out, pcsrc_out,
           pcen
  );

endinterface

`endif
