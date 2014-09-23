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

import cpu_types_pkg::*;

word_t PCreg, PCregN, PCplus4; //consider that word_t might not equate to regbis_t

always_ff @ (posedge CLK, negedge nRST) begin: PCRegister
    if (!nRST)
        PCreg <= '0;
    else
        PCreg <= PCregN;
end

assign PCplus4 = PCreg + 4;

always_comb begin: PCLogic
    if (pcif.rambusy) //wait for ram to finish
        PCregN = PCreg;
    else begin
        if (pcif.PCSrc1) begin //branch
            if (pcif.immed[15])
                PCregN = PCplus4 + {14'b11111111111111,pcif.immed,2'b00};
            else
                PCregN = PCplus4 + {14'b00000000000000,pcif.immed,2'b00};
        end
        else if (pcif.PCSrc2) //jtype
            PCregN = {PCplus4[31:28],pcif.jaddr,2'b00};
        else if (pcif.PCSrc3) //jump to reg value
            PCregN = pcif.jraddr;
        else  //increment normally
            PCregN = PCplus4;
    end
end

assign pcif.imemaddr = PCreg;
assign pcif.rtnaddr  = PCplus4;

endmodule






