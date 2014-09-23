/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"

`include "register_file_if.vh"
`include "control_unit_if.vh"
`include "request_unit_if.vh"
`include "alu_if.vh"
`include "pc_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  //interfaces
  register_file_if rfif ();
  control_unit_if  cuif ();
  request_unit_if  ruif ();
  alu_if          aluif ();
  pc_if            pcif ();

  //portmaps
  control_unit             CU (cuif);
  alu                     ALU (aluif);
  register_file            RF (CLK, nRST, rfif);
  request_unit             RU (CLK, nRST, ruif);
  pc                       PC (CLK, nRST, pcif); 
 
  //intermediate signals
  word_t extimm, wdat;
  word_t aluoperand;

  //Program Counter
  assign pcif.pcsrc = cuif.pcsrc;
  assign pcif.jaddr  = cuif.jaddr;
  assign pcif.jraddr = cuif.jraddr;
  assign pcif.immed  = cuif.immed;
  assign pcif.rambusy= ruif.rambusy;

  //ALU
  assign aluif.porta = rfif.rdat1;
  assign aluif.portb = aluoperand;
  assign aluif.aluop = cuif.aluop;

  //Register
  assign rfif.WEN    = cuif.WEN;
  assign rfif.wsel   = cuif.wsel;
  assign rfif.rsel1  = cuif.rsel1; 
  assign rfif.rsel2  = cuif.rsel2;
  assign rfif.wdat   = wdat;

  //Control Unit
  assign cuif.porto  = aluif.porto;
  assign cuif.zflag  = aluif.z_flag;
  assign cuif.instr  = dpif.imemload;
  assign cuif.rdat2  = rfif.rdat2;

  //Request Unit
  assign ruif.ihit     = dpif.ihit;
  assign ruif.dhit     = dpif.dhit;
  assign ruif.dWEN     = cuif.dWEN;
  assign ruif.dREN     = cuif.dREN;
  assign ruif.cuhlt    = cuif.halt;

  //Datapath
  assign dpif.imemaddr  = pcif.imemaddr;
  assign dpif.dmemaddr  = cuif.dmemaddr;
  assign dpif.dmemstore = cuif.dmemstore;
  assign dpif.imemREN   = ruif.imemREN;
  assign dpif.dmemREN   = ruif.dmemREN;
  assign dpif.dmemWEN   = ruif.dmemWEN;
  assign dpif.halt      = ruif.halt;
  assign dpif.datomic   = '0;




//Extender
always_comb begin
  if (cuif.extop == 2)
    extimm = {cuif.immed,16'b0000000000000000}; //upper load
  else if (cuif.extop == 0)
    extimm = {16'b0000000000000000,cuif.immed}; //zero extended
  else begin
    if (cuif.immed[15])
      extimm = {16'b1111111111111111,cuif.immed}; //sign extended
    else
      extimm = {16'b0000000000000000,cuif.immed};
  end
end

//Itype / Rtype Select (ALU Source)
assign aluoperand = cuif.irsel ? extimm : rfif.rdat2;

//Register Source
always_comb begin
  if (cuif.memtoreg == 0)
    wdat = cuif.wdat;
  else if (cuif.memtoreg == 1)
    wdat = dpif.dmemload;
  else
    wdat = pcif.rtnaddr;
end
//assign wdat = cuif.memtoreg ? dpif.dmemload : cuif.wdat;


endmodule