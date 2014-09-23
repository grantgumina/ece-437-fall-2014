/*
  Warren Getlin
  wgetlin@gmail.com

  alu interface
*/
`ifndef ALU_IF
`define ALU_IF

// all types
`include "cpu_types_pkg.vh"

interface alu_if;
  // import types
  import cpu_types_pkg::*;

  logic     v_flag, n_flag, z_flag;
  aluop_t   aluop;
  word_t    porta, portb, porto;

  // alu file ports
  modport af (
    input   porta, portb, aluop,
    output  v_flag, n_flag, z_flag, porto
  );
  // alu file tb
  modport tb (
    input   v_flag, n_flag, z_flag, porto,
    output  porta, portb, aluop
  );
endinterface

`endif //ALU_IF_VH
