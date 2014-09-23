/*
  Warren Getlin
  wgetlin@gmail.com

  register file sv file
*/

`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module register_file
(
    input logic CLK, nRST,
    register_file_if.rf rfif
);

import cpu_types_pkg::*;

word_t [31:0] register;

always_ff @ (posedge CLK, negedge nRST) begin
    if (!nRST)
        register <= '{default:0};
    else begin
        if (rfif.WEN)
            register[rfif.wsel] <= rfif.wsel ? rfif.wdat : '0;
    end
end

assign rfif.rdat1 = register[rfif.rsel1];
assign rfif.rdat2 = register[rfif.rsel2];

endmodule