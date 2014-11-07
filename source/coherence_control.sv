`include "coherence_control_if.vh"

module coherence_control (
	input CLK, nRST,
	coherence_control_if.co coif
);

	import cpu_types_pkg::*;

	//coherence control
  typedef enum {IDLE, C0_WRITE, C1_WRITE, C0_READ, C1_READ, C0_MOD_D0, C0_MOD_D1, C1_MOD_D0, C1_MOD_D1} statetype;
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
        if (!coif.cctrans)
          nstate = IDLE;
        else if (coif.cctrans[0]) begin
          if (coif.ccwrite[0]) 
            nstate = C0_WRITE;
          else
            nstate = C0_READ;
        end
        else if (coif.cctrans[1]) begin
          if (coif.ccwrite[1]) 
            nstate = C1_WRITE;
          else
            nstate = C1_READ;
        end
      end

      C0_READ: begin
        if (coif.snoopy[1])
          nstate = C0_READ;
        else begin
          if (coif.modded[1])
            nstate = C0_MOD_D0;
          else
            nstate = IDLE;
        end
      end

      C0_WRITE: begin
        if (coif.snoopy[1])
          nstate = C0_WRITE;
        else begin
          if (coif.modded[1])
            nstate = C0_MOD_D0;
          else
            nstate = IDLE;
        end
      end

      C1_READ: begin
        if (coif.snoopy[0])
          nstate = C1_READ;
        else begin
          if (coif.modded[0])
            nstate = C1_MOD_D0;
          else
            nstate = IDLE;
        end
      end

      C1_WRITE: begin
        if (coif.snoopy[0])
          nstate = C1_WRITE;
        else begin
          if (coif.modded[0])
            nstate = C1_MOD_D0;
          else
            nstate = IDLE;
        end
      end

      C0_MOD_D0: begin
        if (!coif.dwait)
          nstate = C0_MOD_D1;
        else
          nstate = C0_MOD_D0;
      end

      C0_MOD_D1: begin
        if (!coif.dwait)
          nstate = IDLE;
        else
          nstate = C0_MOD_D1;
      end    

      C1_MOD_D0: begin
        if (!coif.dwait)
          nstate = C1_MOD_D1;
        else
          nstate = C1_MOD_D0;
      end

      C1_MOD_D1: begin
        if (!coif.dwait)
          nstate = C1_MOD_D1;
        else
          nstate = IDLE;
      end

    endcase
  end

  always_comb begin: OUTPUT
    //initialize
    coif.ccwait = 0;
    coif.ccinv  = 0;
    coif.dwb    = 0;
    coif.ccsnoopaddr = 0;

    casez(state)

      C0_READ: begin
        coif.ccwait[1] = 1; //begin coherence ops on C1
        coif.ccsnoopaddr[1] = coif.daddr[0];
      end

      C0_WRITE: begin
        coif.ccwait[1] = 1;
        coif.ccinv[1]  = 1;
        coif.ccsnoopaddr[1] = coif.daddr[0];
      end

      C1_READ: begin
        coif.ccwait[0] = 1;
        coif.ccsnoopaddr[0] = coif.daddr[1];
      end

      C1_WRITE: begin
        coif.ccwait[0] = 1;
        coif.ccinv[0]  = 1;
        coif.ccsnoopaddr[0] = coif.daddr[1];
      end

      C0_MOD_D0: begin
        coif.ccwait[1] = 1;
        coif.dwb[0] = coif.dstore[1];
      end

      C0_MOD_D1: begin
        coif.ccwait[1] = 1;
        coif.dwb[0] = coif.dstore[1];
      end

      C1_MOD_D0: begin
        coif.ccwait[0] = 1;
        coif.dwb[1] = coif.dstore[0];
      end

      C1_MOD_D1: begin
        coif.ccwait[0] = 1;
        coif.dwb[1] = coif.dstore[0];
      end

    endcase
  end

endmodule


