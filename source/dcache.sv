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

  logic [1:0] state;
  setset [7:0] sets;
  setset selset;
  dcachef_t dcachef;
  word_t hit_count;
  logic selhtblk;
  logic [2:0] setidx;
  logic blkidx;
  dcblk htblk;
  dcblk blk0;
  dcblk blk1;
  logic blk0ht;
  logic blk1ht;
  dcblk drtyblk;
  logic drtyblkidx;
  logic [2:0] drtysetidx;
  logic  htblkwrb;

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


  /* STATE MACHINE */
  always_ff @(posedge CLK or negedge nRST) begin
    if (~nRST) begin
      state <= 2'b00;
    end else begin

      if (!dcif.dhit &&  ((dcif.dmemREN || dcif.dmemWEN) || (dcif.halt && !dcif.flushed))) begin

        casez (state)
          2'b00: begin
            if (!ccif.dwait) begin
              state <= 2'b01;
              if (ccif.dREN) begin
                sets[setidx].blks[blkidx].data[0] <= ccif.dload;
              end
            end
          end

          2'b01: begin
            if (!ccif.dwait) begin
              state <= 2'b10;
              if (ccif.dREN) begin
                sets[setidx].blks[blkidx].data[1] <= ccif.dload;
              end
            end
          end

          2'b10: begin
            state <= 2'b00;
            sets[setidx].blks[blkidx].drty  <= 0;
            sets[setidx].blks[blkidx].valid <= 1'b1;
            if (ccif.dREN) begin
              sets[setidx].blks[blkidx].tag <= dcachef.tag;
            end
          end

          default: begin
          end
        endcase
      end
    end
  end

  always_ff @(posedge CLK or negedge nRST) begin
    if (!nRST) begin
      hit_count <= 0;
      for (integer i = 0; i < 8; i = i + 1) begin
        for (integer j = 0; j < 2; j = j + 1) begin
          sets[i].blks[j].valid   <= 0; 
          sets[i].blks[j].data[0] <= 0;
          sets[i].blks[j].data[1] <= 0;
          sets[i].blks[j].tag     <= 0;
        end 
      end
    end else begin
      if (dcif.dhit) begin
        sets[dcachef.idx].lstblk <= selhtblk;
        if (dcif.dmemWEN) begin
          sets[dcachef.idx].blks[selhtblk].drty <= 1;
          sets[dcachef.idx].blks[selhtblk].data[dcachef.blkoff] <= dcif.dmemstore;
        end
      end
    end
  end

  assign selset = sets[dcachef.idx];
  assign dcachef = dcachef_t'(dcif.dmemaddr);
  assign blk0 = selset.blks[0];
  assign blk1 = selset.blks[1];
  assign blk0ht = blk0.valid && (blk0.tag == dcachef.tag);
  assign blk1ht = blk1.valid && (blk1.tag == dcachef.tag);
  assign setidx = (dcif.halt) ? drtysetidx : dcachef.idx;
  assign blkidx = (dcif.halt) ? drtyblkidx : selhtblk;
  assign drtyblk = sets[drtysetidx].blks[drtyblkidx];
  assign selhtblk = (blk0ht) ? 0 : (blk1ht ? 1 : (!blk0.valid ? 0 : (!blk1.valid ? 1 : (!selset.lstblk))));
  assign htblk = sets[setidx].blks[blkidx];
  assign htblkwrb = (htblk.valid && htblk.drty);
  assign dcif.dhit = (blk0ht || blk1ht) && !dcif.halt;
  assign dcif.dmemload = htblk.data[dcachef.blkoff];
  assign ccif.ccwrite = 0;
  assign ccif.cctrans = 0;
  assign ccif.dstore = htblk.data[state[0]];
  assign ccif.daddr = htblkwrb ? { htblk.tag, setidx, state[0], 2'b00 } : { dcachef.tag, setidx, state[0], 2'b00 };
  assign ccif.dWEN = (!dcif.flushed && htblkwrb && !dcif.dhit && ((dcif.dmemREN || dcif.dmemWEN) || (dcif.halt && !dcif.flushed)));
  assign ccif.dREN = (!dcif.flushed && !htblkwrb && !dcif.dhit && ((dcif.dmemREN || dcif.dmemWEN) || (dcif.halt && !dcif.flushed)));

endmodule