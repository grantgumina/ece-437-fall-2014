`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

module dcache (
  input clk, nRST, 
  datapath_cache_if.dcache dcif,
  cache_control_if.dcache ccif
);

  import cpu_types_pkg::*;
  parameter CPUID = 0;

  typedef struct packed {
    logic valid;
    logic dirty;
    logic [DTAG_W-1:0] tag;
    word_t [1:0] data;
  } dblk;

  typedef struct packed {
    dblk [1:0] blk;
  } dset;

  //dcache
  dset set [7:0];
  //parsed mem addr
  dcachef_t dcachef;
  dcachef_t snoopaddr;
  //indices
  logic [2:0] setidx;
  logic blkidx;
  logic dataidx;
  logic [3:0] ci, cj, ni, nj;
  //least-recently-used array
  logic [7:0] lru, nlru;
  //block abstractions
  logic  valid;
  logic  dirty;
  word_t datum;
  logic [DTAG_W-1:0] tag;
  //cache write enable
  logic cwen;

  //logic ccif.imhalting;

  //hit signals
  logic hit0, hit1;
  logic [1:0] hit;
  //word_t hitcnt;

  logic snoophit0, snoophit1;
  logic [1:0] snoophit;
  logic snoopblk;

  typedef enum {IDLE, /*HIT_CNT,*/ TAG_CHK,
                REFILL_0,    REFILL_1,  WRITEBACK_0, WRITEBACK_1,
                W_ACCESS,    R_ACCESS,
                FLUSH_SET,   FLUSH_BLK, WB_FLUSH_0,  WB_FLUSH_1,
                CO_WAIT,     CO_INV,    CO_INV_UNC,
                CO_RF_0,     CO_RF_1,   CO_WB_0,     CO_WB_1,
                R2_ACCESS, /*W2_ACCESS,*/   RF_DONE_0,   RF_DONE_1,
                HALT} statetype;

  statetype state, nstate, cstate, rtnstate;

  assign dcachef = dcachef_t'(dcif.dmemaddr);
  
  assign snoopaddr = dcachef_t'(ccif.ccsnoopaddr[CPUID]);
  assign snoophit0 = (set[snoopaddr.idx].blk[0].tag == snoopaddr.tag) && set[snoopaddr.idx].blk[0].valid;
  assign snoophit1 = (set[snoopaddr.idx].blk[1].tag == snoopaddr.tag) && set[snoopaddr.idx].blk[1].valid;
  assign snoophit = {snoophit1, snoophit0};
  assign snoopblk = (!snoophit) ? lru[snoopaddr.idx] : snoophit[1];
  assign ccif.modded[CPUID] = (snoophit & set[snoopaddr.idx].blk[0].dirty) || (snoophit & set[snoopaddr.idx].blk[1].dirty);



  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST) begin
      lru <= '0;
      //set <= '0;
      for (integer i = 0; i < 8; i = i + 1) begin
        for (integer j = 0; j < 2; j = j + 1) begin
          set[i].blk[j].valid <= 0; 
          set[i].blk[j].dirty <= 0;
          set[i].blk[j].tag     <= 0;
          set[i].blk[j].data[0] <= 0;
          set[i].blk[j].data[1] <= 0;
        end 
      end  
    end else begin
      lru                                    <= nlru;
      if (cwen) begin
        set[setidx].blk[blkidx].valid         <= valid;
        set[setidx].blk[blkidx].dirty         <= dirty;
        set[setidx].blk[blkidx].tag           <= tag;
        set[setidx].blk[blkidx].data[dataidx] <= datum;
      end
    end
  end

  //tag assignment
  assign tag = dcachef.tag;

  //hit detection
  assign hit0 = (set[setidx].blk[0].tag == tag) && set[setidx].blk[0].valid;
  assign hit1 = (set[setidx].blk[1].tag == tag) && set[setidx].blk[1].valid;
  assign hit = {hit1, hit0};
  
  
  //indices
  assign setidx = (state == CO_INV) ? snoopaddr.idx : dcachef.idx;
  assign blkidx = (state == CO_INV) ? snoopblk : ((!hit) ? lru[setidx] : hit[1]);
  //assign dataidx = dcif.dmemaddr[2];

  //lru assignment
  //assign nlru[setidx] = (!hit) ? lru[setidx]^1 : hit[0];



  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST)
      state <= IDLE;
    else begin
      if (ccif.ccwait[CPUID] &&  !ccif.imhalting[CPUID] && nstate != W_ACCESS) begin
        rtnstate <= state; ///this line is suspect
        if (ccif.modded[CPUID])
          state <= CO_WB_0;
        else if (ccif.ccinv[CPUID])
          state <= CO_INV;
      end else
        state <= nstate;
    end
  end

  always_comb begin
    if (nstate == CO_WAIT || nstate == CO_INV_UNC)
      ccif.cctrans[CPUID] = 1;
    else
      ccif.cctrans[CPUID] = 0;
  end
  assign ccif.ccwrite[CPUID] = dcif.dmemWEN;

  // next state logic
  always_comb begin
    nstate = state;
    //cstate = CO_SNOOP;

    casez (state)
      IDLE: begin
        if (dcif.dmemWEN || dcif.dmemREN) begin
          nstate = TAG_CHK;
        end else if (dcif.halt || rtnstate == FLUSH_SET) begin
          nstate = FLUSH_SET;
        end else begin
          nstate = IDLE;
        end
      end

      TAG_CHK: begin
        if (!hit && set[setidx].blk[blkidx].dirty) begin
          nstate = WRITEBACK_0;
        end else if (!hit && !set[setidx].blk[blkidx].dirty && !ccif.dREN[!CPUID] && !ccif.dWEN[!CPUID]) begin
          if (!ccif.imhalting[!CPUID])
            nstate = CO_WAIT;
          else
            nstate = REFILL_0;
        end else if (hit && dcif.dmemREN) begin
          nstate = R_ACCESS;
        end else if (hit && dcif.dmemWEN) begin
          if (set[setidx].blk[blkidx].dirty)
            nstate = W_ACCESS;
          else
            nstate = CO_INV_UNC;
        end else begin
          nstate = TAG_CHK;
        end
      end

      REFILL_0: begin
        if (ccif.dwait[CPUID])
          nstate = REFILL_0;
        else
          nstate = RF_DONE_0;
      end

      RF_DONE_0: begin
        nstate = REFILL_1;
      end

      REFILL_1: begin
        if (ccif.dwait[CPUID])
          nstate = REFILL_1;
        else
          nstate = RF_DONE_1;
      end

      RF_DONE_1: begin
        if (dcif.dmemREN)
          nstate = R_ACCESS;
        else if (dcif.dmemWEN)
          nstate = W_ACCESS;
        else
          nstate = IDLE;
      end

      WRITEBACK_0: begin
        if (ccif.dwait[CPUID])
          nstate = WRITEBACK_0;
        else
          nstate = WRITEBACK_1;
      end

      WRITEBACK_1: begin 
        if (ccif.dwait[CPUID])
          nstate = WRITEBACK_1;
        else
          nstate = CO_WAIT;
      end

      W_ACCESS: begin
        nstate = IDLE;
      end

      R_ACCESS: begin
        nstate = R2_ACCESS;
      end
/*
      W2_ACCESS: begin
        nstate = IDLE;
      end
*/
      R2_ACCESS: begin
        nstate = IDLE;
      end

      FLUSH_SET: begin
        if (ci <= 7) begin
          if (set[ci].blk[cj].dirty) begin
            nstate = WB_FLUSH_0;
          end else begin
            nstate = FLUSH_BLK;
          end
        end else 
          nstate = HALT;
      end

      WB_FLUSH_0: begin
        if (ccif.dwait[CPUID])
          nstate = WB_FLUSH_0;
        else
          nstate = WB_FLUSH_1;
      end

      WB_FLUSH_1: begin
        if (ccif.dwait[CPUID])
          nstate = WB_FLUSH_1;
        else
          nstate = FLUSH_BLK;
      end

      FLUSH_BLK: begin
        nstate = FLUSH_SET;
      end

      //coherence states
      CO_WB_0: begin
        if (ccif.dwait[CPUID])
          nstate = CO_WB_0;
        else
          nstate = CO_WB_1;
      end

      CO_WB_1: begin
        if (ccif.dwait[CPUID])
          nstate = CO_WB_1;
        else
          nstate = CO_INV;
      end

      CO_INV: begin
        nstate = IDLE;
      end

      CO_INV_UNC: begin
        nstate = W_ACCESS;
      end

      CO_WAIT: begin
        if (ccif.modded[!CPUID])
          nstate = CO_RF_0;
        else
          nstate = REFILL_0;
      end

      CO_RF_0: begin
        if (ccif.dwait[!CPUID])
          nstate = CO_RF_0;
        else
          nstate = CO_RF_1;
      end

      CO_RF_1: begin
        if (ccif.dwait[!CPUID]) begin
          nstate = CO_RF_1;
        end else begin
          if (dcif.dmemREN)
            nstate = R_ACCESS;
          else if (dcif.dmemWEN)
            nstate = W_ACCESS;
          else
            nstate = IDLE;
        end
      end

        default: begin
          nstate = state;
        end
/*
      HIT_CNT: begin
        if (ccif.dwait)
          nstate = HIT_CNT;
        else
          nstate = HALT;
      end
*/
    endcase
  end
/*
  always_comb begin
    datum = 0;
    if (state == REFILL_0 || state == REFILL_1)
      datum = ccif.dload[CPUID];
    else if (state == W_ACCESS || state == W2_ACCESS)
      datum = dcif.dmemstore;
    else if (state == CO_INV)
      datum = set[snoopaddr.idx].blk[snoopblk].data[snoopaddr.blkoff];
    else if (state == CO_RF_0 || state == CO_RF_1)
      datum = ccif.dwb[CPUID];
    else
      datum = 0;
  end
*/

  // output logic
  always_comb begin
    //internal signals
    nlru          = lru;
    dirty         = 0;
    valid         = 1;
    datum         = 0;
    dataidx       = 0;
    cwen          = 0; //cache write enable
    ccif.imhalting[CPUID] = 0;
    //output to mem controller
    ccif.daddr[CPUID]    = 0;
    ccif.dstore[CPUID]   = 0;
    ccif.dREN[CPUID]     = 0;
    ccif.dWEN[CPUID]     = 0;
    //output to datapath
    dcif.dhit     = 0;
    dcif.dmemload = 0;
    dcif.flushed = 0;
    //flush counters
    ni = ci;
    nj = cj;
    //coherence
    //ccif.cctrans[CPUID] = 0;
    //ccif.ccwrite[CPUID] = 0;
    //ccif.snoopy = 0;

    casez (state)
      
      REFILL_0: begin
        cwen  = 0; //update cache
        ccif.dREN[CPUID] = 1;
        ccif.daddr[CPUID] = {tag, setidx, 3'b000};
        datum = ccif.dload[CPUID];
      end

      RF_DONE_0: begin
        cwen  = 1; //update cache
        ccif.dREN[CPUID] = 1;
        ccif.daddr[CPUID] = {tag, setidx, 3'b000};
        datum = ccif.dload[CPUID];
      end

      REFILL_1: begin
        cwen = 0; //update cache
        ccif.dREN[CPUID] = 1;
        ccif.daddr[CPUID] = {tag, setidx, 3'b100};  
        datum = ccif.dload[CPUID];
        dataidx = 1;
      end

      RF_DONE_1: begin
        cwen = 1; //update cache
        ccif.dREN[CPUID] = 1;
        ccif.daddr[CPUID] = {tag, setidx, 3'b100};  
        datum = ccif.dload[CPUID];
        dataidx = 1;
      end

      WRITEBACK_0: begin
        ccif.dWEN[CPUID] = 1;
        ccif.daddr[CPUID] = {set[setidx].blk[blkidx].tag, setidx, 3'b000};
        ccif.dstore[CPUID] = set[setidx].blk[blkidx].data[0];
      end

      WRITEBACK_1: begin
        ccif.dWEN[CPUID] = 1;
        ccif.daddr[CPUID] = {set[setidx].blk[blkidx].tag, setidx, 3'b100};
        ccif.dstore[CPUID] = set[setidx].blk[blkidx].data[1];
      end

      R_ACCESS: begin
        ccif.daddr[CPUID] = dcif.dmemaddr;        
        dcif.dhit    = 1;
        dcif.dmemload = set[setidx].blk[blkidx].data[dcachef.blkoff];
        nlru[setidx] = hit[0];
      end

      R2_ACCESS: begin
        ccif.daddr[CPUID] = dcif.dmemaddr;        
        dcif.dhit    = 1;
        dcif.dmemload = set[setidx].blk[blkidx].data[dcachef.blkoff];
        nlru[setidx] = hit[0];
      end

      W_ACCESS: begin
        ccif.daddr[CPUID] = dcif.dmemaddr;
        dcif.dhit = 1;
        cwen      = 1; //update cache
        dirty     = 1;
        dataidx   = dcachef.blkoff;
        datum     = dcif.dmemstore; 
        nlru[setidx] = hit[0];
      end
/*
      W2_ACCESS: begin
        ccif.daddr[CPUID] = dcif.dmemaddr;
        dcif.dhit = 1;
        cwen      = 1; //update cache
        dirty     = 1;
        dataidx   = dcachef.blkoff;
        datum     = dcif.dmemstore; 
        nlru[setidx] = hit[0];        
      end
     */ 
      FLUSH_SET: begin
        ccif.imhalting[CPUID] = 1;
        if (!set[ci].blk[cj].dirty && cj)
          ni = ci+1;
        else
          ni = ci;
      end

      FLUSH_BLK: begin
        ccif.imhalting[CPUID] = 1;
        nj = cj^1;
      end

      WB_FLUSH_0: begin
        ccif.imhalting[CPUID] = 1;
        ccif.dWEN[CPUID] = 1;
        ccif.daddr[CPUID] = {set[ci].blk[cj].tag, ci[2:0], 3'b000};
        ccif.dstore[CPUID] = set[ci].blk[cj].data[0];    
      end

      WB_FLUSH_1: begin
        ccif.imhalting[CPUID] = 1;
        ccif.dWEN[CPUID] = 1;
        ccif.daddr[CPUID] = {set[ci].blk[cj].tag, ci[2:0], 3'b100};
        ccif.dstore[CPUID] = set[ci].blk[cj].data[1];
        if (cj)
          ni = ci + 1;
      end
/*
      HIT_CNT: begin
        dcif.flushed = 0;
        ccif.dWEN = 1;
        ccif.daddr[CPUID] = 32'h3100;
        ccif.dstore = hitcnt;
      end
*/

      //coherence states

      CO_WAIT: begin
        ccif.daddr[CPUID] = dcif.dmemaddr;
      end

      CO_WB_0: begin
        ccif.dWEN[CPUID] = 1;
        ccif.daddr[CPUID] = {set[snoopaddr.idx].blk[snoopblk].tag, snoopaddr.idx, 3'b000};
        ccif.dstore[CPUID] = set[snoopaddr.idx].blk[snoopblk].data[0];     
      end

      CO_WB_1: begin
        ccif.dWEN[CPUID] = 1;
        ccif.daddr[CPUID] = {set[snoopaddr.idx].blk[snoopblk].tag, snoopaddr.idx, 3'b100};
        ccif.dstore[CPUID] = set[snoopaddr.idx].blk[snoopblk].data[1];
      end

      CO_INV: begin
        cwen = 1;
        valid = !ccif.ccinv[CPUID];
        datum = set[snoopaddr.idx].blk[snoopblk].data[snoopaddr.blkoff];
      end

      CO_RF_0: begin
        cwen = 1;
        ccif.daddr[CPUID] = dcif.dmemaddr;
        datum = ccif.dwb[CPUID];
        dataidx = 0;    
      end

      CO_RF_1: begin
        cwen = 1;
        ccif.daddr[CPUID] = dcif.dmemaddr;        
        datum = ccif.dwb[CPUID];
        dataidx = 1;   
      end

      HALT: begin
        ccif.imhalting[CPUID] = 1;
        dcif.flushed = 1;
      end

      default: begin
        nlru          = lru;
        dirty         = 0;
        valid         = 1;
        datum         = 0;
        dataidx       = 0;
        cwen          = 0; //cache write enable
        ccif.imhalting[CPUID]     = 0;
        //output to mem controller
        ccif.daddr[CPUID]    = 0;
        ccif.dstore[CPUID]   = 0;
        ccif.dREN[CPUID]     = 0;
        ccif.dWEN[CPUID]     = 0;
        //output to datapath
        dcif.dhit     = 0;
        dcif.dmemload = 0;
        dcif.flushed = 0;
        //flush counters
        ni = ci;
        nj = cj;
      end
      
    endcase
  end


  //flush indeces
  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST) begin
      ci <= 0;
      cj <= 0;
    end else begin
      ci <= ni;
      cj <= nj;
    end
  end

  
endmodule

/*
  //hit counter
  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST) begin
      hitcnt <= 0;
    end else begin
      if (state == TAG_CHK) begin
        if (nstate == W_ACCESS || nstate == R_ACCESS) begin
          hitcnt <= hitcnt + 1;
        end
      end
    end
  end
  */

  //unused signals
  //assign ccif.ccwrite[CPUID] = 0;
  //assign ccif.cctrans = 0;
/*
BLOCK 'O SHAME
//  assign set[setidx].blk[blkidx].data[]
  assign dcif.dhit = (set[setidx].blk[0].ishit || set[setidx].blk[1].ishit) && !dcif.halt && !ccif.dwait;
  assign set[setidx].alldirty = (set[dcidx].blk[0].dirty) & (set[dcidx].blk[1].dirty);
  //assign blk0 = blk[0];
  //assign blk1 = blk[1];
  assign hblk = set[setidx].blk[blkidx];
  //assign blkidx = (dcif.halt) ? 1stdirtyblk.idx : hbidx;
  //assign setidx = (dcif.halt) ? 1stdirtyblk.idx : dcachef.idx;
  assign hbidx = set[setidx].blk[0].ishit ? 0 : (set[setidx].blk[1].ishit ? 1 : (!set[setidx].blk[0].isvalid ? 0 : (!set[setidx].blk[1].isvalid ? 1 : !seldc.alldirty))); //
  assign seldc = set.blk[dcachef.idx];
  assign dcachef = dcachef_t'(dcif.memaddr);
  assign set[setidx].blk[0].ishit = set[setidx].blk[0].isvalid && (set[setidx].blk[0].tag == dcachef.tag);
  assign set[setidx].blk[1].ishit = set[setidx].blk[1].isvalid && (set[setidx].blk[1].tag == dcachef.tag);
  assign dcif.dhit = !dcif.halt && (set[setidx].blk[0].ishit || set[setidx].blk[1].ishit);
  assign dcif.dmemload = hblk.values[dcachef.blkoff];

*/