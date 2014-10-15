/*
  Warren Getlin
  wgetlin@gmail.com

  control unit for datapath
*/

`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"

module control_unit
(
    //input logic clk, nRst,
    control_unit_if cuif
);

import cpu_types_pkg::*;

r_t rtype;
j_t jtype;
i_t itype;

assign rtype = cuif.instr;
assign jtype = cuif.instr;
assign itype = cuif.instr;


always_comb begin: CULogic
    //Initialization
    //Program Counter Signals
    cuif.btype  = 0;
    cuif.pcsrc  = 0;
    cuif.immed  = 0; cuif.jaddr  = 0; cuif.jraddr = 0;
    //ALU Signal
    cuif.aluop  = ALU_ADD;
    //Register Signals
    cuif.WEN = 0;
    cuif.wsel = 0; cuif.rsel1 = 0; cuif.rsel2 = 0;
    //Datapath Signals
    cuif.extop = 0; cuif.alusrc = 0; cuif.regsrc = 0;
    //Cache / Request Unit Signlas
    cuif.dWEN = 0; cuif.dREN = 0; cuif.halt = 0;

    casez (itype.opcode) //I-type instruction management
        BEQ  : begin
            cuif.alusrc  = 0;
            ///////////////cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.rsel2  = itype.rt;
            cuif.WEN    = 0;
            //PC
            cuif.pcsrc = 1;
            cuif.btype = 0;

            // EXTENDER
            cuif.extop = 1;

            //ALU
            cuif.immed  = itype.imm;
            cuif.aluop  = ALU_SUB;
        end
        BNE  : begin
            cuif.alusrc  = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.rsel2  = itype.rt;
            cuif.WEN    = 0;
            //PC
            cuif.pcsrc = 1;
            cuif.btype = 1;

            //EXTENDER
            cuif.extop = 1;

            //ALU
            cuif.immed  = itype.imm;
            cuif.aluop  = ALU_SUB;
        end
        ADDI : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_ADD;
        end
        ADDIU: begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_ADD;
        end
        SLTI : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_SLT;
        end
        SLTIU: begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_SLT;
        end
        ANDI : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_AND;
        end
        ORI  : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_OR;
        end
        XORI : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_XOR;
        end
        LUI  : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 0;
            //Registers
            cuif.rsel1  = '0;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 2;
            cuif.aluop  = ALU_ADD;
        end
        LW   : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 1;
            cuif.dREN   = 1;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_ADD;
        end
        SW   : begin
            cuif.alusrc  = 1;
            cuif.regsrc = 1;
            cuif.dWEN = 1;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.rsel2  = itype.rt;
            cuif.WEN    = 0;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_ADD;     
        end
        HALT : begin
            cuif.halt = 1;
        end
        //J-type instructions
        J: begin
            cuif.alusrc  = 0;
            cuif.regsrc = 0;
            //Registers
            cuif.WEN    =  0;
            //PC
            cuif.pcsrc = 2;
            //ALU
            cuif.aluop  = ALU_ADD;
            cuif.jaddr = jtype.addr;
        end  
        JAL: begin
            cuif.alusrc  = 0;
            cuif.regsrc = 2;
            //Registers 
            cuif.wsel   = 31;
            cuif.WEN    =  1;
            //PC
            cuif.pcsrc = 2;
            //ALU
            cuif.aluop  = ALU_ADD;
            cuif.jaddr = jtype.addr;
        end
        RTYPE  : begin //R-Type instruction management
            //Initialization
            //Program Counter Signals
            cuif.pcsrc = 0;
            cuif.immed  = 0; cuif.jaddr  = 0; cuif.jraddr = 0;
            //ALU Signal
            cuif.aluop  = ALU_ADD;
            //Register Signals
            cuif.WEN = 0;
            cuif.wsel = 0; cuif.rsel1 = 0; cuif.rsel2 = 0;
            //Datapath Signals
            cuif.extop = 0; cuif.alusrc = 0; cuif.regsrc = 0;
            //Cache / Request Unit Signlas
            cuif.dWEN = 0; cuif.dREN = 0; cuif.halt = 0;

            casez(rtype.funct)
                ADDU : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_ADD;
                end
                AND  : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_AND;
                end
                NOR  : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_NOR;
                end
                OR   : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_OR;
                end
                SLT  : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_SLT;
                end
                SLTU :  begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_SLTU;
                end
                SLL  : begin
                    cuif.alusrc  = 1;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.extop  = 0;
                    cuif.immed  = rtype.shamt;
                    cuif.aluop  = ALU_SLL;
                end
                SRL  : begin
                    cuif.alusrc  = 1;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.extop  = 0;
                    cuif.immed  = rtype.shamt;
                    cuif.aluop  = ALU_SRL;
                end
                SUBU : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_SUB;
                end
                XOR  : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_XOR;
                end
                JR   : begin
                    cuif.alusrc  = 0;
                    cuif.regsrc = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = '0;
                    cuif.WEN    = 0;
                    //PC
                    cuif.pcsrc = 3;
                    //ALU
                    cuif.aluop  = ALU_ADD;
                end
                default : begin
                    cuif.alusrc    = 0;
                    cuif.regsrc = 0;
                    cuif.extop    = 0;
                    //Registers
                    cuif.rsel1  = '0;
                    cuif.rsel2  = '0;
                    cuif.WEN    = 0;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_ADD; 
                    cuif.dWEN = 0;
                    cuif.dREN = 0;
                    cuif.halt = 0;
                end
            endcase
        end
    endcase
end


endmodule
