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
  parameter CPUID = 0;

  assign ccif.dload = ccif.ramload;
  assign ccif.iload = ccif.ramload;
  assign ccif.ramstore = ccif.dstore;

  assign ccif.ramWEN = ccif.dWEN[CPUID];
  assign ccif.ramREN = ccif.dREN[CPUID] ? 1 : (ccif.iREN[CPUID] & ~ccif.dWEN[CPUID]);


  always_comb begin

    if (ccif.dWEN[CPUID] || ccif.dREN[CPUID]) begin
      ccif.ramaddr = ccif.daddr[CPUID];
    end
    else begin
      ccif.ramaddr = ccif.iaddr[CPUID];
    end

    ccif.iwait[CPUID] = 1;
    ccif.dwait[CPUID] = 1;  
    casez(ccif.ramstate)
      FREE: begin
        ccif.iwait[CPUID] = 1;
        ccif.dwait[CPUID] = 1;
      end
      BUSY: begin
        ccif.iwait[CPUID] = 1;
        ccif.dwait[CPUID] = 1;
      end
      ACCESS: begin
        if (ccif.dWEN[CPUID] || ccif.dREN[CPUID]) begin
          ccif.dwait[CPUID] = 0;
          ccif.iwait[CPUID] = 1;
        end
        else if (ccif.iREN[CPUID]) begin
          ccif.dwait[CPUID] = 1;
          ccif.iwait[CPUID] = 0;
        end
      end
      ERROR: begin
        ccif.iwait[CPUID] = 1;
        ccif.dwait[CPUID] = 1;
      end
    endcase
  end


  //coherence control
  typedef enum {IDLE, INV_CHK,} statetype;
  statetype state, nstate;

  always_ff @ (posedge CLK, negedge nRST) begin
    if (!nRST)
      state <= IDLE;

    else
      state <= nstate;
  end

  always_comb begin: NEXT_STATE
    nstate = state;
    casez(state)
      IDLE: begin
        if (!ccif.cctrans)
          nstate = IDLE;
        else if (ccif.ccwrite)
          nstate = INV_CHK;
    endcase
  end

  always_comb begin: OUTPUT

  end




endmodule
