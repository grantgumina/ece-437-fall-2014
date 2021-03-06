/*
  Warren Getlin
  wgetlin@gmail.com

   interface
*/

`ifndef PC_IF
`define PC_IF

// all types
`include "cpu_types_pkg.vh"

interface pc_if;
  // import types
  import cpu_types_pkg::*;

  //signal declarations
  logic PCSrc1, PCSrc2, PCSrc3, rambusy;
  //i_t itype;
  logic [IMM_W-1:0] immed;
  //j_t jump;
  logic [ADDR_W-1:0] jaddr;
  word_t imemaddr, jraddr, rtnaddr;

  //  modport
  modport pc (
   //--------------------------Inputs--------------------------------------------
    input  PCSrc1, PCSrc2, PCSrc3, rambusy,
           immed, jaddr, jraddr,
    //-------------------------Outputs-------------------------------------------
    output imemaddr, rtnaddr
  );

endinterface

`endif