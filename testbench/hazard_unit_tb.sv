// Grant Gumina - gumina@purdue.edu

`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"
`include "cpu_ram_if.vh"

`timescale 1 ns / 1 ns

module hazard_unit_tb;

  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  hazard_unit_if hzif ();

  test PROG (CLK, nRST, hzif);

  `ifndef MAPPED
    hazard_unit HAZ (CLK, nRST, hzif);
  `endif

endmodule

program test (input logic CLK, output logic nRST, hazard_unit_if hzif);
  import cpu_types_pkg::*;
  parameter PERIOD2 = 40;

  initial begin
  #(PERIOD2);
  // data
  // test 1
  nRST            = 0;
  hzif.dREN_ex    = 1;
  hzif.wsel_ex    = 2;
  hzif.rsel1_id   = 2;
  #(PERIOD2);
  nRST            = 1;

  // test 2
  nRST            = 0;
  hzif.dREN_ex    = 0;
  hzif.wsel_ex    = 0;
  hzif.rsel1_id   = 0;
  hzif.dmemWEN    = 1;
  #(PERIOD2);
  nRST            = 1;

  // control
  // test 3
  nRST            = 0;
  hzif.dREN_ex    = 0;
  hzif.wsel_ex    = 0;
  hzif.rsel1_id   = 0;
  hzif.dmemWEN    = 0;
  hzif.pcsrc_ex   = 1;
  #(PERIOD2);
  nRST            = 1;

  // test 4
  nRST            = 0;
  hzif.dREN_ex    = 0;
  hzif.wsel_ex    = 0;
  hzif.rsel1_id   = 0;
  hzif.dmemWEN    = 0;
  hzif.pcsrc_ex   = 0;
  hzif.pcsrc_mem  = 0;
  #(PERIOD2);
  nRST            = 1;

  end
endprogram