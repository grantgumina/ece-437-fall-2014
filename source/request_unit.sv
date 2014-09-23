/*
  Warren Getlin
  wgetlin@gmail.com

  request unit sv file
*/

`include "cpu_types_pkg.vh"
`include "request_unit_if.vh"
 
module request_unit
(
  input logic CLK, nRST,
  request_unit_if.ru ruif
);
  
import cpu_types_pkg::*;

//The goal of this block is to halt the program counter whenever a memory access is occurring.


  //assign ruif.imemREN = ~ruif.cuhlt;
  assign ruif.rambusy = (ruif.dREN | ruif.dWEN) & ~(ruif.ihit);
  //assign ruif.halt    = ruif.cuhlt;

  always_ff @ (posedge CLK, negedge nRST) begin
    if (!nRST) begin
      ruif.imemREN <= 1;
      ruif.halt    <= 0;
    end
    else begin
      if (ruif.cuhlt) begin
        ruif.imemREN <= 0;
        ruif.halt    <= 1;
      end
    end
  end

  always_ff @ (posedge CLK, negedge nRST) begin
    if (!nRST) begin
      ruif.dmemREN <= 0;
      ruif.dmemWEN <= 0;
    end
    else begin
      if (ruif.ihit) begin
        ruif.dmemWEN <= ruif.dWEN;
        ruif.dmemREN <= ruif.dREN;
      end
      else if (ruif.dhit) begin
        ruif.dmemREN <= 0;
        ruif.dmemWEN <= 0;
      end
    end
  end

endmodule