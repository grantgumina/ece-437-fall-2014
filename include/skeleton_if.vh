/*
  Warren Getlin
  wgetlin@gmail.com

   interface
*/

`ifndef _IF
`define _IF

// all types
`include "cpu_types_pkg.vh"

interface _if;
  // import types
  import cpu_types_pkg::*;

  //signal declarations

  //PC

  //ALU

  //Memory

  //Register

  //Request Unit

  //Datapath

  //  modport
  modport -- (
   //--------------------------Inputs--------------------------------------------
    input
    //from PC

    //from ALU

    //from Register

    //from Request Unit

    //from Datapath

    //--------------------------Outputs--------------------------------------------
    output
    //to PC

    //to ALU

    //to Register

    //to Request Unit

    //to Datapath

  );

endinterface

`endif