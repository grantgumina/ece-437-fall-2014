`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

module icache (
  input clk, nRST, 
  datapath_cache_if.dp dpif,
  cache_control_if.icache ccif
);

  import cpu_types_pkg::*;
  parameter CPUID = 0;

  typedef struct packed {
    logic isvalid;
    logic [ITAG_W - 1 : 0] tag;
    word_t value;
  } iblk;

  iblk [15:0] iblks;
  icache_ft icacheft;
  iblk selblk;
  logic ismatch;

  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST) begin
      for (integer i = 0; i < 16; i = i + 1) begin
        iblks[i].isvalid = 0;
      end
    end else begin
      if (dcif.imemREN && !ccif.iwait[CPUID] && !dcif.ihit) begin // bitwise here?
        iblks[icachef.idx].value = ccif.iload[CPUID];
        iblks[icachef.idx].tag = icachef.tag;
        iblks[icachef.idx].valid = 1;
      end
    end
  end


  selblk = iblks[icachef.idex];
  ismatch = selblk.valid && (selblk.tag == icachef.tag);

  assign icachef = icachef_t'(dcif.imemaddr);
  assign dcif.ihit = ismatch || !ccif.iwait[CPUID];
  assign ccif.iREN[CPUID] = !ismatch;
  assign ccif.iaddr[CPUID] = dcif.imemaddr;

endmodule