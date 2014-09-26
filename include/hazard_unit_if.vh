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
  logic dmemREN;
  logic dmemWEN;
  logic ihit;
  logic dhit;
  
  // will need these later for data hazard detection
  // Register
  //regbits_t rs;
  //regbits_t rt;
  //regbits_t idex_rt_l;
  // ALU
  //logic idex_alusrc_l;
  // Memory
  //logic exmem_dmemREN_l;
  // outputs

  logic ifid_sRST, ifid_en;
  logic idex_sRST, idex_en;
  logic exmem_sRST, exmem_en;
  logic memwb_sRST, memwb_en;

  logic rambusy;
  
  // required depending on how datapath is setup
  // logic [2:0] pcsrc_out;
  // PC

  //  modport
  modport hu (
    //---------------------------Inputs-----------------------------------------
    input dmemREN, dmemWEN, ihit, dhit, 
    //--------------------------Outputs----------------------------------------
    output ifid_sRST, idex_sRST, exmem_sRST, memwb_sRST, rambusy,
           ifid_en,   idex_en,   exmem_en,   memwb_en     
  );

endinterface

`endif
