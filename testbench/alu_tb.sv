
/*
  Warren Getlin
  wgetlin@gmail.com

  alu test bench
*/

// mapped needs this
`include "alu_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  //parameter PERIOD = 10;

  //logic CLK = 0, nRST;

  // test vars
  //int v1 = 1;
  //int v2 = 4721;
  //int v3 = 25119;

  // clock
  //always #(PERIOD/2) CLK++;

  // interface
  alu_if aluif ();
  // test program
  test PROG (aluif);

  // DUT
`ifndef MAPPED
  alu DUT(aluif);
`else
  alu DUT(
    .\aluif.porta (aluif.porta),
    .\aluif.portb (aluif.portb),
    .\aluif.aluop (aluif.aluop),
    .\aluif.v_flag (aluif.v_flag),
    .\aluif.n_flag (aluif.n_flag),
    .\aluif.z_flag (aluif.z_flag),
    .\aluif.porto (aluif.porto)
  );
`endif

endmodule

program test (alu_if.tb aluif_tb);

  import cpu_types_pkg::*;
  parameter PERIOD = 10;
  int testcase = 1;

  initial begin
  aluif_tb.porta = 32'h3;
  aluif_tb.portb = 32'h4;
  aluif_tb.aluop = ALU_SLL; //Result should be 30

  #(PERIOD)

  testcase = 2;
  aluif_tb.porta = 32'h10;
  aluif_tb.portb = 32'h4;
  aluif_tb.aluop = ALU_SRL; //Result should be 1

  #(PERIOD)

  testcase = 3;
  aluif_tb.porta = 32'h3;
  aluif_tb.portb = 32'h4;
  aluif_tb.aluop = ALU_ADD; //Result should be 7

  #(PERIOD)

  testcase = 4;
  aluif_tb.porta = 32'h10;
  aluif_tb.portb = 32'h1;
  aluif_tb.aluop = ALU_SUB; //Result should be F

  #(PERIOD)

  testcase = 5;
  aluif_tb.porta = 32'hB;
  aluif_tb.portb = 32'h5;
  aluif_tb.aluop = ALU_AND; //Result should be 1

  #(PERIOD)

  testcase = 6;
  aluif_tb.porta = 32'h10;
  aluif_tb.portb = 32'h4;
  aluif_tb.aluop = ALU_OR; //Result should be 14

  #(PERIOD)

  testcase = 7;
  aluif_tb.porta = 32'hA;
  aluif_tb.portb = 32'h5;
  aluif_tb.aluop = ALU_XOR; //Result should be F

  #(PERIOD)

  testcase = 8;
  aluif_tb.porta = 32'hA;
  aluif_tb.portb = 32'h4;
  aluif_tb.aluop = ALU_NOR; //Result should be 1

  #(PERIOD)

  testcase = 9;
  aluif_tb.porta = 32'h10;
  aluif_tb.portb = 32'h4;
  aluif_tb.aluop = ALU_SLT; //Result should be 0

  #(PERIOD)

  testcase = 10;
  aluif_tb.porta = 32'h4;
  aluif_tb.portb = 32'h10;
  aluif_tb.aluop = ALU_SLTU; //Result should be 1

  #(PERIOD)

  testcase = 11;
  aluif_tb.porta = 32'hFFFFFFFF;
  aluif_tb.portb = 32'hFFFFFFFF;
  aluif_tb.aluop = ALU_ADD;

  #(PERIOD)

  testcase = 12;
  aluif_tb.porta = 32'h7FFFFFFF;
  aluif_tb.portb = 32'hFFFFFFFF;
  aluif_tb.aluop = ALU_SUB;
  end
endprogram