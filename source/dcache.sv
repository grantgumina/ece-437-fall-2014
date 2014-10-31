`include "cpu_types_pkg.vh"

module dcache (
  input logic CLK, nRST,
  datapath_cache_if.dcache dcif,
  cache_control_if.dcache ccif
);

  import cpu_types_pkg::*;

  parameter CPUID = 0;

  typedef struct packed {
    logic valid;
    logic drty;
    logic [DTAG_W-1:0] tag;
    word_t [1:0] data;
  } dcblk;

  typedef struct packed {
    logic lstblk;
    dcblk [1:0] blks;
  } setset;

  logic [2:0] state;
  setset [7:0] sets;
  setset selset;
  dcachef_t dcachef;
  word_t htcnt;
  logic [2:0] setidx;
  logic blkidx;
  dcblk actblk;
  dcblk blk0;
  dcblk blk1;
  logic blk0ht;
  logic blk1ht;
  dcblk drtyblk;
  logic drtyblkidx;
  logic [2:0] drtysetidx;
  logic actblkwrb;
  logic actblkrf;
  logic [1:0] blkht;

 assign dcif.flushed = dcif.halt;

/*
  always_comb begin
    dcif.flushed = dcif.halt;
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 2; j = j + 1) begin
        if (sets[i].blks[j].drty &
            sets[i].blks[j].valid) begin
            dcif.flushed = 0;
            drtysetidx = i;
            drtyblkidx = j;
        end
      end
    end
  end
*/

  /* STATE MACHINE */
  always_ff @(posedge CLK or negedge nRST) begin
    if (~nRST) begin
      state <= 0;
      ccif.dREN <= 0;
      ccif.dWEN <= 0;
    end else begin
      ccif.dREN <= 0;
      ccif.dWEN <= 0;
      if (!dcif.dhit &&  actblkrf && dcif.dmemREN && !dcif.halt) begin

        casez (state)
          0: begin
            //ccif.daddr <= { dcachef.tag, setidx, 3'b000 };
            ccif.dREN <= 1;
            if (!ccif.dwait[CPUID]) begin
              state <= 1;
              if (ccif.dREN[CPUID]) begin
                sets[setidx].blks[blkidx].data[0] <= ccif.dload;
              end
            end
          end

          1: begin
            //ccif.daddr <= { dcachef.tag, setidx, 3'b100 };
            ccif.dREN <= 1;
            if (!ccif.dwait[CPUID]) begin
              state <= 2;
              if (ccif.dREN[CPUID]) begin
                sets[setidx].blks[blkidx].data[1] <= ccif.dload;
              end
            end
          end

          2: begin
            state <= 0;
            sets[setidx].blks[blkidx].drty  <= 0;
            sets[setidx].blks[blkidx].valid <= 1;
            if (ccif.dREN[CPUID]) begin
              sets[setidx].blks[blkidx].tag <= dcachef.tag;
            end
          end

          default: begin
          end
        endcase
      end

      else if (!dcif.dhit &&  actblkwrb && dcif.dmemWEN && !dcif.halt) begin
        
        casez (state)
          0: begin
            //ccif.daddr  <= {actblk.tag, setidx, 3'b000 }; 
            ccif.dWEN <= 1;
            if (!ccif.dwait[CPUID]) begin
              state <= 1;
              if (ccif.dWEN[CPUID]) begin
                //ccif.dstore <= actblk.data[0];
                //sets[setidx].blks[blkidx].data[0] <= ccif.dload;
              end
            end
          end

          1: begin
           // ccif.daddr  <= {actblk.tag, setidx, 3'b100 };  
           ccif.dWEN <= 1;                
            if (!ccif.dwait[CPUID]) begin
              state <= 2;
              if (ccif.dWEN[CPUID]) begin
                //ccif.dstore <= actblk.data[1];
                //sets[setidx].blks[blkidx].data[1] <= ccif.dload;
              end
            end
          end

          2: begin
            state <= 0;
            sets[setidx].blks[blkidx].drty  <= 0;
            sets[setidx].blks[blkidx].valid <= 1;
          end

          default: begin
          end
        endcase
      end
    end
  end

  always_ff @(posedge CLK or negedge nRST) begin
    if (!nRST) begin
      htcnt <= 0;
      for (integer i = 0; i < 8; i = i + 1) begin
        for (integer j = 0; j < 2; j = j + 1) begin
          sets[i].blks[j].valid   <= 0; 
          sets[i].blks[j].data[0] <= 0;
          sets[i].blks[j].data[1] <= 0;
          sets[i].blks[j].tag     <= 0;
          sets[i].blks[j].drty    <= 0;
        end 
      end
    end else begin
        sets[dcachef.idx].lstblk <= blkidx;
        if (dcif.dmemWEN) begin
          sets[dcachef.idx].blks[blkidx].drty  <= 1;
          sets[dcachef.idx].blks[blkidx].valid <= 1;
          sets[dcachef.idx].blks[blkidx].data[dcachef.blkoff] <= dcif.dmemstore;
          sets[dcachef.idx].blks[blkidx].tag   <= dcachef.tag;
        end
    end
  end

  assign selset = sets[dcachef.idx];
  assign dcachef = dcachef_t'(dcif.dmemaddr);
  assign blk0 = selset.blks[0];
  assign blk1 = selset.blks[1];
  assign blk0ht = blk0.valid && (blk0.tag == dcachef.tag);
  assign blk1ht = blk1.valid && (blk1.tag == dcachef.tag);
  assign blkht = {blk1ht, blk0ht};
  assign setidx = dcachef.idx;
//  assign drtyblk = sets[drtysetidx].blks[drtyblkidx];
  assign blkidx = (blk0ht) ? 0 : (blk1ht ? 1 : (!blk0.valid ? 0 : (!blk1.valid ? 1 : (!selset.lstblk))));
  assign actblk = sets[setidx].blks[blkidx];
  assign actblkwrb = (!blkht[blkidx] && actblk.drty);
  assign actblkrf  = (!blkht[blkidx] && !actblk.drty);
  assign dcif.dhit = (blkht) && !dcif.halt;
  assign dcif.dmemload = actblk.data[dcachef.blkoff];
  assign ccif.ccwrite = 0;
  assign ccif.cctrans = 0;
  assign ccif.dstore = actblk.data[state[0]];
  assign ccif.daddr[CPUID] = actblkwrb ? { actblk.tag, setidx, state[0], 2'b00 } : { dcachef.tag, setidx, state[0], 2'b00 };
  //assign ccif.dWEN[CPUID] = (!dcif.flushed && actblkwrb && !dcif.dhit && ((dcif.dmemREN || dcif.dmemWEN) || (dcif.halt && !dcif.flushed)));
  //assign ccif.dREN[CPUID] = (!dcif.flushed && !actblkwrb && !dcif.dhit && ((dcif.dmemREN || dcif.dmemWEN) || (dcif.halt && !dcif.flushed)));

endmodule