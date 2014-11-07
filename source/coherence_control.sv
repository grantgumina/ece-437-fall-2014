`include "coherence_control_if.vh"

module coherence_control (
	input CLK, nRST,
	coherence_control_if.co coif
);

	import cpu_types_pkg::*;

	//coherence control
  typedef enum {IDLE, C0_WRITE, C1_WRITE, C0_READ, C1_READ} statetype;
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
        else if (coif.cctrans[1]) begin(
          if (coif.ccwrite[1]) 
            nstate = C1_WRITE;
          else
            nstate = C1_READ;
        end
      end

      C0_READ: begin

      end

      C0_WRITE: begin
        if (coif.cctrans[1])
          nstate = IDLE;
        else
          nstate = C0_WRITE;
      end

      C1_READ: begin

      end

      C1_WRTIE: begin
        if (coif.cctrans[0])
          nstate = IDLE;
        else
          nstate = C0_WRITE;
      end



    endcase
  end

  always_comb begin: OUTPUT
    //initialize
    coif.ccwait = 0;
    coif.ccinv  = 0;
    coif.ccsnoopaddr = 0;
    casez(state)

      C0_READ: begin
        coif.ccwait[1] = 1; //begin coherence ops on C1
        coif.ccsnoopaddr[1] = daddr[0];
      end

      C0_WRITE: begin
        coif.ccwait[1] = 1;
        coif.ccinv[1]  = 1;
        coif.ccsnoopaddr[1] = daddr[0];
      end

      C1_READ: begin
        coif.ccwait[0] = 1;
        coif.ccsnoopaddr[0] = daddr[1];
      end

      C1_WRTIE: begin
        coif.ccwait[0] = 1;
        coif.ccinv[0]  = 1;
        coif.ccsnoopaddr[0] = daddr[1];
      end

    endcase
  end

endmodule


