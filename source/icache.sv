`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

module icache (
  input clk, nRST,
  datapath_cache_if.icache dcif,
  cache_control_if.icache ccif
);

  import cpu_types_pkg::*;
  parameter CPUID = 0;

  typedef struct packed {
    logic valid;
    logic [ITAG_W - 1 : 0] tag;
    logic [IIDX_W - 1 : 0] idx;
    word_t value;
  } icblk;

  icblk selblk;
  word_t instr;
  logic ismatch;
  icblk [15:0] icblks;
  icachef_t icachef;

  always_ff @ (posedge clk, negedge nRST) begin
    if (!nRST) begin
      for (integer i = 0; i < 16; i = i + 1) begin
        icblks[i].valid = 0;
      end
    end else begin
      if (dcif.imemREN && !ccif.iwait[CPUID] && !dcif.ihit) begin
        icblks[icachef.idx].value = ccif.iload[CPUID];
        icblks[icachef.idx].tag = icachef.tag;
        icblks[icachef.idx].valid = 1;
      end
    end
  end

  // helper abstractions to make assign statements more readable
  assign selblk = icblks[icachef.idx];
  assign ismatch = selblk.valid && (selblk.tag == icachef.tag);
  assign icachef = icachef_t'(dcif.imemaddr);

  // output signals
  assign ccif.iREN[CPUID] = !ismatch;
  assign ccif.iaddr[CPUID] = dcif.imemaddr;
  assign dcif.ihit = (ismatch || !ccif.iwait[CPUID]);
  assign dcif.imemload = !ismatch ? ccif.iload[CPUID] : selblk.value;

endmodule
