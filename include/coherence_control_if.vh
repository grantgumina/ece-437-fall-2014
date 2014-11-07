`ifndef COHERENCE_CONTROL_IF
`define COHERENCE_CONTROL_IF

// all types
`include "cpu_types_pkg.vh"

interface coherence_control_if;
  // import types
  import cpu_types_pkg::*;


  word_t [CPUS-1:0]  daddr, dwb, dstore;
  logic  [CPUS-1:0]  dWEN, snoopy, modded;
  logic  [CPUS-1:0]  cctrans, ccwrite;
  logic  [CPUS-1:0]  ccwait, ccinv;
  word_t [CPUS-1:0]  ccsnoopaddr;
  
  modport co (
    input   cctrans, ccwrite, daddr, dWEN, dstore, snoopy, modded,
    output  ccwait, ccinv, ccsnoopaddr, dwb;
  );
 
  modport tb (
    input   ccwait, ccinv, ccsnoopaddr, dwb,
    output  cctrans, ccwrite, daddr, dWEN, dstore, snoopy, modded;
  );
endinterface

`endif 