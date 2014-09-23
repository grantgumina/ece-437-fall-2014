/*
  Warren Getlin
  wgetlin@gmail.com

  testbench for memory controller block

*/

// types
`include "cpu_types_pkg.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;

  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  cache_control_if ccif ();
  cpu_ram_if ramif ();

  // test program
  test                                PROG (CLK,nRST,ccif,ramif);

  // dut
`ifndef MAPPED
  memory_control                    MEM (CLK,nRST,ccif);
  ram                                  RAM (CLK, nRST, ramif);
`endif


endmodule

program test (input logic CLK, output logic nRST, cache_control_if.tb ccif_tb, cpu_ram_if.tb ramif_tb);

import cpu_types_pkg::*;

parameter PERIOD2 = 40;
int testcase = 0;

  //Ram inputs
  assign ramif_tb.ramaddr = ccif_tb.ramaddr;
  assign ramif_tb.ramstore = ccif_tb.ramstore;
  assign ramif_tb.ramREN = ccif_tb.ramREN;
  assign ramif_tb.ramWEN = ccif_tb.ramWEN;
  //Ram outputs
  assign ccif_tb.ramstate = ramif_tb.ramstate;
  assign ccif_tb.ramload = ramif_tb.ramload;

initial begin

  //Initialize
  nRST = 0;
  ccif_tb.dWEN = 0;
  ccif_tb.dREN = 0;
  ccif_tb.iREN = 0;
  ccif_tb.dstore = '0;
  ccif_tb.iaddr = '0;
  ccif_tb.daddr = '0;

  testcase = 1;
  #(PERIOD2);
  nRST = 1;

  ccif_tb.daddr = 32'h00000004;
  ccif_tb.dstore = 32'hFACEFACE;
  ccif_tb.dWEN = 1;
  #(PERIOD2);
  ccif_tb.dWEN = 0;
  #(PERIOD2);
  ccif_tb.dREN = 1;
  #(PERIOD2);
  ccif_tb.dREN = 0;
  #(PERIOD2);

  ccif_tb.daddr = 32'h0000000C;
  ccif_tb.dstore = 32'h0000FFFF;
  ccif_tb.dWEN = 1;
  #(PERIOD2);
  ccif_tb.dWEN = 0;
  #(PERIOD2);
  ccif_tb.dREN = 1;
  #(PERIOD2);
  ccif_tb.dREN = 0;
  #(PERIOD2);


  testcase = 2;
  ccif_tb.dREN = 1;
  ccif_tb.iREN = 1;
  #(PERIOD2);
  ccif_tb.dREN = 0;
  #(PERIOD2);


end
endprogram