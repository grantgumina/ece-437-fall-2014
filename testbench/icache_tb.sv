// Grant Gumina - gumina@purdue.edu

`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module icache_tb;
  parameter PERIOD = 20;

  logic CLK = 1, nRST;

  always #(PERIOD/2) CLK++;

  datapath_cache_if dpif ();
  cache_control_if ccif ();
  cpu_ram_if ramif ();

  test PROG (CLK, nRST, dpif, ccif, ramif);

  `ifndef mapped
    memory_control MEM (CLK,nRST,ccif);
    ram RAM (CLK, nRST, ramif);
    icache IC (CLK, nRST, dpif.icache, ccif.icache);
  `endif
endmodule

program test (input logic CLK, output logic nRST,
              datapath_cache_if dpif,
              cache_control_if ccif,
              cpu_ram_if ramif);

  import cpu_types_pkg::*;

  parameter PERIOD2 = 40;
  int testcase = 0;

  //Ram inputs
  assign ramif.ramaddr = ccif.ramaddr;
  assign ramif.ramstore = ccif.ramstore;
  assign ramif.ramREN = ccif.ramREN;
  assign ramif.ramWEN = ccif.ramWEN;
  //Ram outputs
  assign ccif.ramstate = ramif.ramstate;
  assign ccif.ramload = ramif.ramload;

  initial begin
    // initalize values
    nRST = 0;
    #(PERIOD2);
    nRST = 1;
    // check that things work
    testcase = 1;
    dpif.imemaddr = 32'h00000004;
    dpif.imemREN = 0;
    nRST = 0;
    #(PERIOD2);
    nRST = 1;

    // check that ihit is asserted
    testcase = 2;
    dpif.imemaddr = 32'h00000008;
    dpif.imemREN = 1;
    nRST = 0;
    #(PERIOD2);
    nRST = 1;
    if (!dpif.ihit) begin
      $display ("%d: FAIlURE - iREN != 1 --> %d != %d",
                testcase, ccif.iREN[0], 1);
    end

    // check that iREN is asserted (ismatch must be false)
    dpif.imemaddr = 32'h00000008;
    dpif.imemREN = 1;
    nRST = 0;
    #(PERIOD2);
    nRST = 1;
    testcase = 3;
    if (!ccif.iREN[0]) begin
      $display ("%d: FAIlURE - iREN != 1 --> %d != %d",
                testcase, ccif.iREN[0], 1);
    end

    // check iaddr == dpif.imemaddr;
    testcase = 4;
    if (ccif.iaddr[0] != dpif.imemaddr) begin
      $display ("%d: FAIlURE - IADDR != IMEMADDR --> %d != %d",
                testcase, ccif.iaddr[0], dpif.imemaddr);
    end
  end

endprogram
