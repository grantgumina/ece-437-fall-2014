/*
  Warren Getlin
  wgetlin@gmail.com

  control unit interface
*/

`ifndef CONTROL_UNIT_IF
`define CONTROL_UNIT_IF

// all types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  //signal declarations

  //PC
  logic     [1:0] pcsrc;
  word_t    jraddr;
  logic [ADDR_W-1:0] jaddr;

  //ALU
  aluop_t   aluop;
  logic     zflag;
  word_t    porto;

  //Register
  logic     WEN;
  regbits_t wsel, rsel1, rsel2;
  word_t    rdat2;
  
  //Request Unit
  word_t    instr;

  //Datapath
  logic [1:0] extop;
  logic alusrc;
  logic [1:0] regsrc;
  logic [IMM_W-1:0] immed;
  logic dWEN, dREN;
  logic halt;

  // control unit modport
  modport cu (
   //--------------------------Inputs--------------------------------------------
    input
    //from PC
    //from ALU
    zflag, porto,
    //from Register
    rdat2,
    //from Request Unit
    instr,
    //--------------------------Outputs--------------------------------------------
    output
    //to PC
    pcsrc, immed, jaddr, jraddr,
    //to ALU
    aluop,
    //to Register
    WEN, wsel, rsel1, rsel2,
    //to Datapath
    extop, alusrc, regsrc, //immed,
    //to Request Unit
    halt, dWEN, dREN
  );

  /*
  // control unit tb
  modport tb (
    input
    output
  );
*/
endinterface

`endif