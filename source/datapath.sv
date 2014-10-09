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
`include "hazard_unit_if.vh"
`include "alu_if.vh"
`include "pc_if.vh"
`include "pipeline_ifid_if.vh"
`include "pipeline_idex_if.vh"
`include "pipeline_exmem_if.vh"
`include "pipeline_memwb_if.vh"

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
  register_file_if    rfif ();
  control_unit_if     cuif ();
  hazard_unit_if      hzif ();
  forwarding_unit_if  fuif ();
  alu_if             aluif ();
  pc_if               pcif ();


  //pipeline interfaces
  pipeline_ifid_if      plif_ifid ();
  pipeline_idex_if      plif_idex ();
  pipeline_exmem_if    plif_exmem ();
  pipeline_memwb_if    plif_memwb ();


  //module portmaps
  register_file            RF (CLK, nRST, rfif);
  control_unit             CU (cuif);
  hazard_unit              HU (CLK, nRST, hzif);
  forwarding_unit          FU (fuif);
  alu                     ALU (aluif);
  pc                       PC (CLK, nRST, pcif); 

  //pipline portmaps
  pipeline_ifid          IFID (CLK, nRST, plif_ifid); //NOTE: en comes from hazard unit, which is not in datapath.sv yet
  pipeline_idex          IDEX (CLK, nRST, plif_idex);
  pipeline_exmem        EXMEM (CLK, nRST, plif_exmem);
  pipeline_memwb        MEMWB (CLK, nRST, plif_memwb);
 
  //intermediate signals
  word_t extimm, wdat;
  word_t aluoperand;

  //if
  assign dpif.imemaddr = pcif.imemaddr;

  //if -> id
  assign plif_ifid.instr   = dpif.imemload;
  assign plif_ifid.sRST    = hzif.ifid_sRST;
  assign plif_ifid.en      = hzif.ifid_en;
  assign plif_ifid.rtnaddr = pcif.rtnaddr;  

  //id
  assign cuif.instr  = plif_ifid.instr_l;
  assign rfif.WEN    = plif_memwb.regen_l; //AHAHAHAHAH THIS WAS ASSIGNED TO CUIF.WEN WTF?!?! RETARDED BUG FIXES FTW
  assign rfif.rsel1  = cuif.rsel1; 
  assign rfif.rsel2  = cuif.rsel2;
  
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

  //id -> ex
  assign plif_idex.sRST    = hzif.idex_sRST;
  assign plif_idex.en      = hzif.idex_en;
  assign plif_idex.wsel    = cuif.wsel;
  assign plif_idex.rdat1   = rfif.rdat1;
  assign plif_idex.rdat2   = rfif.rdat2;
  assign plif_idex.alusrc  = cuif.alusrc;
  assign plif_idex.aluop   = cuif.aluop;
  assign plif_idex.regsrc  = cuif.regsrc;
  assign plif_idex.regen   = cuif.WEN;
  assign plif_idex.hlt     = cuif.halt;
  assign plif_idex.dmemWEN = cuif.dWEN;
  assign plif_idex.dmemREN = cuif.dREN;
  assign plif_idex.rambusy = hzif.rambusy;
  assign plif_idex.extimm  = extimm;
  assign plif_idex.pcsrc   = cuif.pcsrc;
  assign plif_idex.btype   = cuif.btype;
  assign plif_idex.jaddr   = cuif.jaddr;
  assign plif_idex.jraddr  = cuif.jraddr;
  assign plif_idex.rtnaddr = plif_ifid.rtnaddr_l;  
  assign plif_idex.rsel1   = cuif.rsel1;
  assign plif_idex.rsel2   = cuif.rsel2;

  //ex
  always_ff @ (posedge CLK, negedge nRST) begin
    if (!nRST) 
      dpif.imemREN <= 1;
    else begin
      if (plif_idex.hlt_l) 
        dpif.imemREN <= 0;
    end
  end

  assign aluoperand  = plif_idex.alusrc_l ? plif_idex.extimm_l : plif_idex.rdat2_l;
  //assign aluif.porta = plif_idex.rdat1_l;
  //assign aluif.portb = aluoperand;
  assign aluif.aluop = plif_idex.aluop_l;

  //ex -> mem
  assign plif_exmem.sRST      = hzif.exmem_sRST;
  assign plif_exmem.en        = hzif.exmem_en;
  assign plif_exmem.wsel      = plif_idex.wsel_l;
  //assign plif_exmem.rdat2     = plif_idex.rdat2_l;
  assign plif_exmem.regsrc    = plif_idex.regsrc_l;
  assign plif_exmem.regen     = plif_idex.regen_l;
  assign plif_exmem.hlt       = plif_idex.hlt_l;
  assign plif_exmem.dmemWEN   = plif_idex.dmemWEN_l;
  assign plif_exmem.dmemREN   = plif_idex.dmemREN_l;
  assign plif_exmem.rambusy   = plif_idex.rambusy_l;
  assign plif_exmem.porto     = aluif.porto;
  assign plif_exmem.extimm    = plif_idex.extimm_l;
  assign plif_exmem.pcsrc     = plif_idex.pcsrc_l;
  assign plif_exmem.btype     = plif_idex.btype_l;
  assign plif_exmem.zero      = aluif.z_flag;
  assign plif_exmem.jaddr     = plif_idex.jaddr_l;
  assign plif_exmem.jraddr    = plif_idex.jraddr_l;
  assign plif_exmem.rtnaddr   = plif_idex.rtnaddr_l;  
  //mem
  assign dpif.dmemaddr        = plif_exmem.porto_l;
  assign dpif.dmemstore       = plif_exmem.rdat2_l;
  assign dpif.dmemREN         = plif_exmem.dmemREN_l;
  assign dpif.dmemWEN         = plif_exmem.dmemWEN_l;
  assign dpif.halt            = plif_exmem.hlt_l;


  //mem -> wb
  assign plif_memwb.sRST      = hzif.memwb_sRST;
  assign plif_memwb.en        = hzif.memwb_en;
  assign plif_memwb.wsel      = plif_exmem.wsel_l;
  assign plif_memwb.regsrc    = plif_exmem.regsrc_l;
  assign plif_memwb.regen     = plif_exmem.regen_l;
  assign plif_memwb.porto     = plif_exmem.porto_l;
  assign plif_memwb.dmemload  = dpif.dmemload;
  assign plif_memwb.extimm    = plif_exmem.extimm_l;
  assign plif_memwb.pcsrc     = plif_exmem.pcsrc_l;
  assign plif_memwb.btype     = plif_exmem.btype_l;
  assign plif_memwb.zero      = plif_exmem.zero_l;
  assign plif_memwb.jaddr     = plif_exmem.jaddr_l;
  assign plif_memwb.jraddr    = plif_exmem.jraddr_l;
  assign plif_memwb.rtnaddr   = plif_exmem.rtnaddr_l;  
  
  // hazard unit
  //load-use hazard
  assign hzif.dREN_ex         = plif_idex.dmemREN_l;

  assign hzif.dmemREN         = plif_exmem.dmemREN_l;
  assign hzif.dmemWEN         = plif_exmem.dmemWEN_l;
  assign hzif.ihit            = dpif.ihit;
  assign hzif.dhit            = dpif.dhit;
  assign hzif.wsel_ex         = plif_idex.wsel_l; 
  //assign hzif.wsel_mem        = plif_exmem.wsel_l;
  assign hzif.rsel1_id        = cuif.rsel1;
  assign hzif.rsel2_id        = cuif.rsel2;
  assign hzif.pcsrc_ex        = plif_idex.pcsrc_l;
  assign hzif.pcsrc_mem       = plif_exmem.pcsrc_l;
  assign hzif.pcsrc_wb        = plif_memwb.pcsrc_l;
  // pc
  assign pcif.rambusy = hzif.rambusy;

  //Register Source Mux
  always_comb begin
    if (plif_memwb.regsrc_l == 0)
      wdat = plif_memwb.porto_l;
    else if (plif_memwb.regsrc_l == 1)
      wdat = plif_memwb.dmemload_l;
    else
      wdat = plif_memwb.rtnaddr_l;
  end

  assign rfif.wdat = wdat;
  assign rfif.wsel = plif_memwb.wsel_l;

  //PC stuff for branches and jumps
  assign pcif.pcplus4         = plif_memwb.rtnaddr_l;
  assign pcif.extimm          = plif_memwb.extimm_l;
  assign pcif.jaddr           = plif_memwb.jaddr_l;
  assign pcif.jraddr          = plif_memwb.jraddr_l;
  assign hzif.brtkn            = pcif.pcsrc ? 1:0;

always_comb begin //the decider
  if (plif_memwb.pcsrc_l == 1) begin
    if (plif_memwb.btype_l) begin
      pcif.pcsrc[0] = ~plif_memwb.zero_l;
      pcif.pcsrc[1] = 0;
    end
    else begin
      pcif.pcsrc[0] = plif_memwb.zero_l;
      pcif.pcsrc[1] = 0;      
    end
  end
  else begin
    pcif.pcsrc = plif_memwb.pcsrc_l;
  end
end

//forwarding unit
assign fuif.idexrs     = plif_idex.rsel1_l;
assign fuif.idexrt     = plif_idex.rsel2_l;
assign fuif.exmemwsel  = plif_exmem.wsel_l;
assign fuif.memwbwsel  = plif_memwb.wsel_l;
assign fuif.exmemregen = plif_exmem.regen_l;
assign fuif.memwbregen = plif_memwb.regen_l;
assign fuif.idexalusrc = plif_idex.alusrc_l;

//forwarding unit muxes
always_comb begin
  if (fuif.fwda == 2) begin //from exmem (memory)
    aluif.porta = plif_exmem.porto_l;
  end
  else if (fuif.fwda == 1) begin //from memwb (write back)
    aluif.porta = wdat;
  end
  else begin //business as usual
    aluif.porta = plif_idex.rdat1_l;
  end
end

always_comb begin
  if (fuif.fwdb == 2) begin
    aluif.portb = plif_exmem.porto_l;
  end
  else if (fuif.fwdb == 1) begin
    aluif.portb = wdat;
  end
  else begin
    aluif.portb = aluoperand;
  end
end 

always_comb begin
  if (fuif.fwdc == 2) begin
    plif_exmem.rdat2 = plif_exmem.porto_l;
  end
  else if (fuif.fwdc == 1) begin
    plif_exmem.rdat2 = wdat;
  end
  else begin
    plif_exmem.rdat2 = plif_idex.rdat2_l;
  end
end


  //Unused signals
  assign dpif.datomic   = '0;

endmodule