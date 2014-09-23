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
  logic     PCSrc1, PCSrc2, PCSrc3;
  word_t    jraddr;
  logic [ADDR_W-1:0] jaddr;

  //ALU
  aluop_t   aluop;
  logic     zflag;
  word_t    porto;

  //Register
  logic     WEN;
  regbits_t wsel, rsel1, rsel2;
  word_t    wdat, rdat2;
  
  //Request Unit
  word_t    instr;
  word_t    dmemaddr, dmemstore;

  //Datapath
  logic [1:0] extop;
  logic  irsel;
  logic [1:0] memtoreg;
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
    PCSrc1, PCSrc2, PCSrc3, immed, jaddr, jraddr,
    //to ALU
    aluop,
    //to Register
    WEN, wsel, rsel1, rsel2, wdat,
    //to Datapath
    extop, irsel, memtoreg, //immed,
    //to Request Unit
    dmemaddr, dmemstore, halt, dWEN, dREN
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