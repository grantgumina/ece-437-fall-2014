/*
  Warren Getlin
  wgetlin@gmail.com

  this block includes the program counter and its logic
*/

// interface include
`include "pc_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module pc(
    input logic CLK, nRST,
    pc_if.pc pcif
);

parameter PC_INIT = 0;

import cpu_types_pkg::*;

word_t PCreg, PCregN, PCplus4; //consider that word_t might not equate to regbis_t

always_ff @ (posedge CLK, negedge nRST) begin: PCRegister
    if (!nRST)
        PCreg <= PC_INIT;
    else
        PCreg <= PCregN;
end

assign PCplus4 = PCreg + 4;

always_comb begin: PCLogic
    if (pcif.rambusy) //wait for ram to finish
        PCregN = PCreg;
    else begin
        if (pcif.pcsrc == 1) begin //branch
            PCregN = pcif.pcplus4 + {pcif.extimm[29:0], 2'b00};
        end
        else if (pcif.pcsrc == 2) //jtype
            PCregN = {pcif.pcplus4[31:28],pcif.jaddr,2'b00};
        else if (pcif.pcsrc == 3) //jump to reg value (JR)
            PCregN = pcif.jraddr;
        else  //increment normally
            PCregN = PCplus4;
    end
end

assign pcif.imemaddr = PCreg;
assign pcif.rtnaddr  = PCplus4;

endmodule






