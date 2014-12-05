/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  //parameter CPUS = 2;
  //parameter CPUID = 0;
  logic cpuid;

  always_comb begin
    ccif.dload[cpuid] = ccif.ramload;
    ccif.iload[cpuid] = ccif.ramload;
  end
  
  assign ccif.ramstore = ccif.dstore[cpuid];

  assign ccif.ramWEN = ccif.dWEN ? 1:0;
  assign ccif.ramREN = ccif.dREN ? 1 : (ccif.iREN && !ccif.dWEN);


  always_comb begin

    cpuid = 0;
    if (ccif.dWEN[0] || ccif.dREN[0]) begin
      ccif.ramaddr = ccif.daddr[0];
      cpuid = 0;
    end
    else if (ccif.dWEN[1] || ccif.dREN[1]) begin
      ccif.ramaddr = ccif.daddr[1];
      cpuid = 1;
    end
    else if (ccif.iREN[0]) begin
      ccif.ramaddr = ccif.iaddr[0];
      cpuid = 0;
    end
    else begin
      ccif.ramaddr = ccif.iaddr[1];
      cpuid = 1;
    end

    ccif.iwait = 2'b11;
    ccif.dwait = 2'b11;  
    casez(ccif.ramstate)
      FREE: begin
        ccif.iwait[cpuid] = 1;
        ccif.dwait[cpuid] = 1;
      end
      BUSY: begin
        ccif.iwait[cpuid] = 1;
        ccif.dwait[cpuid] = 1;
      end
      ACCESS: begin
        if (ccif.dWEN[cpuid] || ccif.dREN[cpuid]) begin
          ccif.dwait[cpuid] = 0;
          ccif.iwait[cpuid] = 1;
        end
        else if (ccif.iREN[cpuid]) begin
          ccif.dwait[cpuid] = 1;
          ccif.iwait[cpuid] = 0;
        end
      end
      ERROR: begin
        ccif.iwait[cpuid] = 1;
        ccif.dwait[cpuid] = 1;
      end
    endcase

  end


  //coherence control instantiation and m apping
  coherence_control_if coif ();
  coherence_control COH (CLK, nRST, coif);

  //to cache control
  assign coif.cctrans = ccif.cctrans;
  assign coif.ccwrite = ccif.ccwrite;
  assign coif.daddr   = ccif.daddr;
  assign coif.dstore  = ccif.dstore;
  assign coif.dwait   = ccif.dwait;

  assign coif.modded  = ccif.modded;

  //from cache control
  assign ccif.ccwait      = coif.ccwait;
  assign ccif.ccinv       = coif.ccinv;
  assign ccif.ccsnoopaddr = coif.ccsnoopaddr;
  
  assign ccif.dwb         = coif.dwb;

endmodule
