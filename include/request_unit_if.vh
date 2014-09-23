/*
  Warren Getlin
  wgetlin@gmail.com

   request unit interface
*/

`ifndef REQUEST_UNIT_IF
`define REQUEST_UNIT_IF

// all types
`include "cpu_types_pkg.vh"

interface request_unit_if;
  // import types
  import cpu_types_pkg::*;

  //signal declarations

  logic ihit, dhit;
  logic imemREN, dmemREN, dmemWEN;
  logic dWEN, dREN, halt, cuhlt;
  logic rambusy;

  //  modport
  modport ru (
   //--------------------------Inputs--------------------------------------------
    input 
    //from Cache
    ihit, dhit,
    //from datapath
    dWEN, dREN, cuhlt,

    //--------------------------Outputs--------------------------------------------
    output
    //to Cache
    halt, imemREN, dmemREN, dmemWEN,
    //to datapath
    rambusy
  );

endinterface

`endif