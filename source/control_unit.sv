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
    cuif.pcsrc  = 0;
    cuif.immed  = 0; cuif.jaddr  = 0; cuif.jraddr = 0;
    //ALU Signal
    cuif.aluop  = ALU_ADD;
    //Register Signals
    cuif.WEN = 0;  cuif.wdat = 0;
    cuif.wsel = 0; cuif.rsel1 = 0; cuif.rsel2 = 0;
    //Datapath Signals
    cuif.extop = 0; cuif.irsel = 0; cuif.memtoreg = 0;
    //Cache / Request Unit Signlas
    cuif.dmemstore = 0; cuif.dmemaddr  = 0;
    cuif.dWEN = 0; cuif.dREN = 0; cuif.halt = 0;

    casez (itype.opcode) //I-type instruction management
        BEQ  : begin
            cuif.irsel  = 0;
            ///////////////cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.rsel2  = itype.rt;
            cuif.WEN    = 0;
            //PC
            cuif.pcsrc[0] = cuif.zflag;
            cuif.pcsrc[1] = 0;
            //ALU
            cuif.immed  = itype.imm;
            cuif.aluop  = ALU_SUB;
        end
        BNE  : begin
            cuif.irsel  = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.rsel2  = itype.rt;
            cuif.WEN    = 0;
            //PC
            cuif.pcsrc[0] = ~cuif.zflag;
            cuif.pcsrc[1] = 0;
            //ALU
            cuif.immed  = itype.imm;
            cuif.aluop  = ALU_SUB;
        end
        ADDI : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_ADD;
            cuif.wdat   = cuif.porto;
        end
        ADDIU: begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_ADD;
            cuif.wdat   = cuif.porto;
        end
        SLTI : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 1;
            cuif.aluop  = ALU_SLT;
            cuif.wdat   = cuif.porto;
        end
        SLTIU: begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_SLT;
            cuif.wdat   = cuif.porto;
        end
        ANDI : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_AND;
            cuif.wdat   = cuif.porto;
        end
        ORI  : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_OR;
            cuif.wdat   = cuif.porto;
        end
        XORI : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = itype.rs;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 0;
            cuif.aluop  = ALU_XOR;
            cuif.wdat   = cuif.porto;
        end
        LUI  : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 0;
            //Registers
            cuif.rsel1  = '0;
            cuif.wsel   = itype.rt;
            cuif.WEN    = 1;
            //PC

            //ALU
            cuif.immed  = itype.imm;
            cuif.extop  = 2;
            cuif.aluop  = ALU_ADD;
            cuif.wdat   = cuif.porto;
        end
        LW   : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 1;
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
            cuif.dmemaddr = cuif.porto;
        end
        SW   : begin
            cuif.irsel  = 1;
            cuif.memtoreg = 1;
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
            cuif.dmemaddr = cuif.porto;          
            cuif.dmemstore = cuif.rdat2;
        end
        HALT : begin
            cuif.halt = 1;
        end
        //J-type instructions
        J: begin
            cuif.irsel  = 0;
            cuif.memtoreg = 0;
            //Registers
            cuif.WEN    =  0;
            //PC
            cuif.pcsrc = 2;
            //ALU
            cuif.aluop  = ALU_ADD;
            cuif.jaddr = jtype.addr;
        end  
        JAL: begin
            cuif.irsel  = 0;
            cuif.memtoreg = 2;
            //Registers 
            //cuif.wdat   = 
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
            cuif.WEN = 0;  cuif.wdat = 0;
            cuif.wsel = 0; cuif.rsel1 = 0; cuif.rsel2 = 0;
            //Datapath Signals
            cuif.extop = 0; cuif.irsel = 0; cuif.memtoreg = 0;
            //Cache / Request Unit Signlas
            cuif.dmemstore = 0; cuif.dmemaddr  = 0;
            cuif.dWEN = 0; cuif.dREN = 0; cuif.halt = 0;

            casez(rtype.funct)
                ADDU : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_ADD;
                    cuif.wdat   = cuif.porto;
                end
                AND  : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_AND;
                    cuif.wdat   = cuif.porto;
                end
                NOR  : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_NOR;
                    cuif.wdat   = cuif.porto;
                end
                OR   : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_OR;
                    cuif.wdat   = cuif.porto;
                end
                SLT  : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_SLT;
                    cuif.wdat   = cuif.porto;
                end
                SLTU :  begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_SLTU;
                    cuif.wdat   = cuif.porto;
                end
                SLL  : begin
                    cuif.irsel  = 1;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.extop  = 0;
                    cuif.immed  = rtype.shamt;
                    cuif.aluop  = ALU_SLL;
                    cuif.wdat   = cuif.porto;
                end
                SRL  : begin
                    cuif.irsel  = 1;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.extop  = 0;
                    cuif.immed  = rtype.shamt;
                    cuif.aluop  = ALU_SRL;
                    cuif.wdat   = cuif.porto;
                end
                SUBU : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_SUB;
                    cuif.wdat   = cuif.porto;
                end
                XOR  : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = rtype.rt;
                    cuif.wsel   = rtype.rd;
                    cuif.WEN    = 1;
                    //PC

                    //ALU
                    cuif.aluop  = ALU_XOR;
                    cuif.wdat   = cuif.porto;
                end
                JR   : begin
                    cuif.irsel  = 0;
                    cuif.memtoreg = 0;
                    //Registers
                    cuif.rsel1  = rtype.rs;
                    cuif.rsel2  = '0;
                    cuif.WEN    = 0;
                    //PC
                    cuif.pcsrc = 3;
                    //ALU
                    cuif.aluop  = ALU_ADD;
                    cuif.jraddr = cuif.porto;
                end
                default : begin
                    cuif.irsel    = 0;
                    cuif.memtoreg = 0;
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
