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
  logic [1:0] pcsrc;
  logic rambusy;
  //i_t itype;
  word_t extimm;
  //j_t jump;
  logic [ADDR_W-1:0] jaddr;
  word_t imemaddr, jraddr, rtnaddr, pcplus4;

  //  modport
  modport pc (
   //--------------------------Inputs--------------------------------------------
    input  pcsrc, rambusy,
           extimm, jaddr, jraddr,
           pcplus4,
    //-------------------------Outputs-------------------------------------------
    output imemaddr, rtnaddr
  );

endinterface

`endif