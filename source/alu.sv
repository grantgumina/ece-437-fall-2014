/*
  Warren Getlin
  wgetlin@gmail.com

  alu sv file
*/

`include "alu_if.vh"
`include "cpu_types_pkg.vh"

module alu
(
    //input logic clk, nRst,
    alu_if.af aluif
);

import cpu_types_pkg::*;

always_comb begin
    casez(aluif.aluop)
        ALU_SLL: begin
            aluif.porto = aluif.porta<<aluif.portb;
            aluif.v_flag = 0;
        end
        ALU_SRL: begin
            aluif.porto = aluif.porta>>aluif.portb;
            aluif.v_flag = 0;
        end
        ALU_ADD: begin
            aluif.porto = $signed(aluif.porta)+$signed(aluif.portb);
            if (!(aluif.porta[WORD_W-1]^aluif.portb[WORD_W-1])) begin
                if (aluif.porto[WORD_W-1]^aluif.porta[WORD_W-1]) begin
                    aluif.v_flag = 1;
                end
                else begin
                    aluif.v_flag = 0;
                end
            end
            else begin
                aluif.v_flag = 0;
            end
        end
        ALU_SUB: begin
            aluif.porto = $signed(aluif.porta)-$signed(aluif.portb);
            if (aluif.porta[WORD_W-1]^aluif.portb[WORD_W-1]) begin
                if (aluif.porto[WORD_W-1]^aluif.porta[WORD_W-1]) begin
                    aluif.v_flag = 1;
                end
                else begin
                    aluif.v_flag = 0;
                end
            end
            else begin
                aluif.v_flag = 0;
            end
        end
        ALU_AND: begin
            aluif.porto = aluif.porta&aluif.portb;
            aluif.v_flag = 0;
        end
        ALU_OR: begin
            aluif.porto = aluif.porta|aluif.portb;
            aluif.v_flag = 0;
        end
        ALU_XOR: begin
            aluif.porto = aluif.porta^aluif.portb;
            aluif.v_flag = 0;
        end
        ALU_NOR: begin
            aluif.porto = ~(aluif.porta|aluif.portb);
            aluif.v_flag = 0;
        end
        ALU_SLT: begin
            aluif.porto = $signed(aluif.porta) < $signed(aluif.portb);
            aluif.v_flag = 0;
        end
        ALU_SLTU: begin
            aluif.porto = aluif.porta < aluif.portb;
            aluif.v_flag = 0;
        end
        default: begin
            aluif.porto = '0;
            aluif.v_flag = 0;
        end
    endcase
end

assign aluif.n_flag = aluif.porto[WORD_W-1];
assign aluif.z_flag = aluif.porto ? 0 : 1;

endmodule



