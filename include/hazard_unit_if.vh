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


  //  modport
  modport hu (
   //---------------------------Inputs-----------------------------------------
    input 

    //--------------------------Outputs----------------------------------------
    output

  );

endinterface

`endif
