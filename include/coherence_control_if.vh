`ifndef COHERENCE_CONTROL_IF
`define COHERENCE_CONTROL_IF

// all types
`include "cpu_types_pkg.vh"

interface coherence_control_if;
  // import types
  import cpu_types_pkg::*;


  word_t daddr;
  logic  [CPUID-1:0]  dWEN;
  logic  [CPUID-1:0]  cctrans, ccwrite;
  logic  [CPUID-1:0]  ccwait, ccinv;
  word_t [CPUID-1:0]  ccsnoopaddr;
  
  modport co (
    input   cctrans, ccwrite, daddr, dWEN;
    output  ccwait, ccinv, ccsnoopaddr;
  );
 
  modport tb (
    input   ccwait, ccinv, ccsnoopaddr,
    output  cctrans, ccwrite, daddr, dWEN;
  );
endinterface

`endif 