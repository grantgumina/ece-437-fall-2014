/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
<<<<<<< HEAD
  test PROG (CLK, nRST, rfif);
=======
  test PROG ();
>>>>>>> 3f7f4ff63c60e4f842d19b9da798ed96487b6f5e
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

<<<<<<< HEAD
program test (input logic CLK, output logic nRST, register_file_if.tb rfif_tb);
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;
  int testcase = 0;
  parameter PERIOD = 10;
  initial begin
    //initialize Write enable, select, and data, and read vals
    nRST = 0;
    #(PERIOD * 10);
    nRST = 1;
    rfif_tb.WEN = 0;
    rfif_tb.rsel1 = 0;
    rfif_tb.rsel2 = 0; //Set read selects to reg 0
    rfif_tb.wsel = 1; //Write to reg 1
    rfif_tb.wdat = v1;
    #(PERIOD * 2);
    //Test 1: Check that read data matches written data
    testcase = 1;
    rfif_tb.WEN = 1; //Enable writing to reg
    rfif_tb.rsel1 = 1; //Read from reg 1
    #(PERIOD * 2);
    //Test 2: Check read select line functionality
    testcase = 2;
    rfif_tb.rsel2 = 1;
    #(PERIOD * 2);
    //Test 3: write to reg 31 and test select line functionality
    testcase = 3;
    rfif_tb.wdat = v2;
    rfif_tb.wsel = 31;
    #(PERIOD * 2);
    rfif_tb.rsel1 = 31;
    #(PERIOD * 2);
    rfif_tb.rsel2 = 31;
    #(PERIOD * 2);
  end
=======
program test;
>>>>>>> 3f7f4ff63c60e4f842d19b9da798ed96487b6f5e
endprogram
