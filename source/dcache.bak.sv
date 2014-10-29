`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

module dcache (
  input clk, nRST, 
  datapath_cache_if.dcache dpif,
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
    dblk [1:0] dblks;
  } dset;

  dset [7:0] dcs;       // array of dcs
  logic [7:0] lru, nlru;
  logic [2:0] dcsidx; // index for dcs
  logic dblksidx;
  logic hit1;
  logic [1:0] hit;
  logic cwen;
  logic dataidx;
  dblk  nblk, cblk;
  logic flushed;
  
  logic dirty;
  word_t datum;
  logic [DTAG_W-1:0] tag;
  //latched signals


  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST) begin
      lru <= '0;
      dcs <= '0;
      /*for (integer i = 0; i < 8; i = i + 1) begin
        for (integer j = 0; j < 2; j = j + 1) begin
          dcs[i].dblks[j].data[0] = 0;
          dcs[i].dblks[j].data[1] = 0;
          dcs[i].dblks[j].tag     = 0;
          dcs[i].dblks[j].valid = 0; 
        end 
      end  */
    end else begin
      if (cwen)
        dcs[dcsidx].dblks[dblksidx].valid         <= 1;
        dcs[dcsidx].dblks[dblksidx].data[dataidx] <= datum;
        dcs[dcsidx].dblks[dblksidx].dirty         <= dirty;
        dcs[dcsidx].dblks[dblksidx].tag           <= tag;
        lru                                       <= nlru;
    end
  end

  //assign dcs[dcsidx].dblks[dblksidx] = cblk;

/*
      if (cwen) begin
      lru <= nlru;
      dcs[dcsidx].dblks[dblksidx].data[dataidx] <= ccif.dload;
    end
*/

  // check the cache for issues
  always_comb begin
    dcif.flushed = dcif.halt;
    for (integer i = 0; i < 8; i = i + 1) begin
      for (integer j = 0; j < 2; j = j + 1) begin
        dcif.flushed = (dcs[j].dblks[i].dirty && dcs[j].dblks[i].valid) ? 0 : dcif.halt;
      end
    end
  end

  //tag assignment
  assign tag = dcif.dmemaddr[31:6];

  //hit detection
  assign hit0 = ((dcs[dcsidx].dblks[0].tag == tag) && dcs[dcsidx.dblks[0].valid)? 1 : 0;
  assign hit1 = ((dcs[dcsidx].dblks[1].tag == tag) && dcs[dcsidx.dblks[1].valid)? 1 : 0;
  assign hit = {hit1, hit0};
  
  
  //indices
  assign dcsidx = dpif.dmemaddr[5:3];
  assign dblksidx = (!hit) ? lru[dcsidx] : hit[1];
  //assign dataidx = dpif.dmemaddr[2];

  //lru assignment
  assign nlru[dcsidx] = !dblksidx;

  typedef enum {IDLE, /*FLUSH, HIT_CNT, HALT,*/ TAG_CHK, REFILL_0, REFILL_0_R, REFILL_1, REFILL_1_R, WRITEBACK_0, WRITEBACK_1, W_ACCESS, R_ACCESS} statetype;
  statetype state, nstate;

  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST)
      state <= IDLE;
    else
      state <= nstate;
  end

  // next state logic
  always_comb begin: NS_LOGIC
    nstate = IDLE;
    casez (state) begin
      IDLE: begin
        if (dpif.dmemWEN || dpif.dmemREN) begin
          nstate = TAG_CHK;
        end else begin
          nstate = IDLE;
        end
      end
      /*
      FLUSH: begin
        if (flushed)
          nstate = HIT_CNT;
        else
          nstate = FLUSH;
      end
      HIT_CNT: begin
        nstate = HALT;
      end*/
      TAG_CHK: begin
        if (!hit && dcs[dcsidx].dblks[dblksidx].dirty) begin
          nstate = WRITEBACK_0;
        end else if (!hit && !dcs[dcsidx].dblks[dblksidx].dirty) begin
          nstate = REFILL_0;
        end else if (hit && dpif.dmemREN) begin
          nstate = R_ACCESS;
        end else if (hit && dpif.dmemWEN) begin
          nstate = W_ACCESS;
        end else begin
          nstate = TAG_CHK;
        end
      end
      REFILL_0: begin
        if (ccif.dwait)
          nstate = REFILL_0;
        else
          nstate = REFILL_0_R;
      end
      REFILL_0_R: begin
        nstate = REFILL_1;
      end
      REFILL_1: begin
        if (ccif.dwait) begin
          nstate = REFILL_1;
        end else begin
          nstate = REFILL_1_R;
      end
      REFILL_1_R: begin
        if (dpif.dmemREN)
          nstate = R_ACCESS;
        else if (dpif.dmemWEN)
          nstate = W_ACCESS;
        else
          nstate = IDLE;
      end
      WRITEBACK_0: begin
        if (ccif.dwait)
          nstate = WRITEBACK_0;
        else
          nstate = WRITEBACK_1;
      end
      WRITEBACK_1: begin 
        if (ccif.dwait)
          nstate = WRITEBACK_1;
        else
          nstate = REFILL_0;
      end
      W_ACCESS: begin
        nstate = IDLE;
      end
      R_ACCESS: begin
        nstate = IDLE;
      end
    endcase
  end

  // output logic
  always_comb begin: OP_LOGIC
    //nblk          = 0;
    //internal signals
    //nlru          = lru;
    dirty         = 0;
    datum         = 0;
    dataidx       = 0;
    cwen          = 0;
    //output to mem controller
    ccif.cctrans  = 0;
    ccif.ccwrite  = 0;
    ccif.daddr    = 0;
    ccif.dstore   = 0;
    ccif.dREN     = 0;
    ccif.dWEN     = 0;
    //output to datapath
    dcif.dhit     = 0;
    dcif.dmemload = 0;
    case (state) begin
      
      IDLE: begin
      end

      REFILL_0: begin
        ccif.dREN = 1;
        ccif.daddr = {dcif.dmemaddr[31:3], 0, dcif.dmemaddr[1:0]};
      end

      REFILL_0_R: begin
        cwen  = 1; //update cache
        datum = ccif.dload;
        //mem signals stay asserted
        ccif.dREN = 1;
        ccif.daddr = {dcif.dmemaddr[31:3], 0, dcif.dmemaddr[1:0]};

      REFILL_1: begin
        ccif.dREN = 1;
        ccif.daddr = {dcif.dmemaddr[31:3], 1, dcif.dmemaddr[1:0]};
      end

      REFILL_1_R: begin
        cwen = 1; //update cache
        datum = ccif.dload;
        dataidx = 1;
        //mem signals stay asserted
        ccif.dREN = 1;
        ccif.daddr = {dcif.dmemaddr[31:3], 1, dcif.dmemaddr[1:0]};
      end

      WRITEBACK_0: begin
        ccif.dWEN = 1;
        ccif.daddr = {dcif.dmemaddr[31:3], 0, dcif.dmemaddr[1:0]};
      end

      WRITEBACK_1: begin
        ccif.dWEN = 1;
        ccif.daddr = {dcif.dmemaddr[31:3], 1, dcif.dmemaddr[1:0]};
      end

      R_ACCESS: begin
        dcif.dhit     = 1;
        dcif.dmemload = dcs[dcsidx].dblks[dblksidx].data[dcif.dmemaddr[2]];
      end

      W_ACCESS: begin
        dcif.dhit = 1;
        cwen      = 1; //update cache
        dirty     = 1;
        dataidx   = dcif.dmemaddr[2];
        data      = dcif.dmemstore; 
      end
      /*
      FLUSH: begin
        for (i = 0; i < 8; i = i + 1) begin
          for (j = 0; j < 2; j = j + 1) begin
            ccif.daddr = {dcs[i].dblks[j].tag, 3'(i),  
            (dcs[j].dblks[i].dirty && dcs[j].dblks[i].valid) ? 0 : dcif.halt;
          end
        end
      end
      */
    endcase
  end

  //unused signals
  assign ccif.ccwrite = 0;
  assign ccif.cctrans = 0;

endmodule

/*
BLOCK 'O SHAME
//  assign dcs[dcsidx].dblks[dblksidx].data[]
  assign dcif.dhit = (dcs[dcsidx].dblks[0].ishit || dcs[dcsidx].dblks[1].ishit) && !dcif.halt && !ccif.dwait;
  assign dcs[dcsidx].alldirty = (dcs[dcidx].dblks[0].dirty) & (dcs[dcidx].dblks[1].dirty);
  //assign blk0 = dblks[0];
  //assign blk1 = dblks[1];
  assign hblk = dcs[dcsidx].dblks[blkidx];
  //assign blkidx = (dcif.halt) ? 1stdirtyblk.idx : hbidx;
  //assign dcsidx = (dcif.halt) ? 1stdirtyblk.idx : dcachef.idx;
  assign hbidx = dcs[dcsidx].dblks[0].ishit ? 0 : (dcs[dcsidx].dblks[1].ishit ? 1 : (!dcs[dcsidx].dblks[0].isvalid ? 0 : (!dcs[dcsidx].dblks[1].isvalid ? 1 : !seldc.alldirty))); //
  assign seldc = dcs.dblks[dcachef.idx];
  assign dcachef = dcachef_t'(dcif.memaddr);
  assign dcs[dcsidx].dblks[0].ishit = dcs[dcsidx].dblks[0].isvalid && (dcs[dcsidx].dblks[0].tag == dcachef.tag);
  assign dcs[dcsidx].dblks[1].ishit = dcs[dcsidx].dblks[1].isvalid && (dcs[dcsidx].dblks[1].tag == dcachef.tag);
  assign dcif.dhit = !dcif.halt && (dcs[dcsidx].dblks[0].ishit || dcs[dcsidx].dblks[1].ishit);
  assign dcif.dmemload = hblk.values[dcachef.blkoff];

*/