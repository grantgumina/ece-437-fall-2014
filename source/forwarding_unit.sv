`include "forwarding_unit_if.vh"
`include "cpu_types_pkg.vh"

module forwarding_unit
import cpu_types_pkg::*;
(
  forwarding_unit_if fuif;
);

  // logic for this can be found on pg 308
  always_comb begin
    // forward a
    if (fuif.exmemregen && 
       (fuif.exmemwsel != 0) && 
       (fuif.exmemwsel == fuif.idexrs)) begin
      fuif.fwda = 2'b10;
    end else if (fuif.memwbregen && 
                (fuif.memwbwsel != 0) && 
                (fuif.idexrs == fuif.memwbwsel)) begin
      fuif.fwda = 2'b01;
    end else begin
      fuif.fwda = 2'b00;
    end

    // forward b
    if (fuif.exmemregen && 
       (fuif.exmemwsel != 0) && 
       (fuif.idexrt == fuif.exmemwsel) && 
       (fuif.alusrc == 0)) begin
      fuif.fwdb = 2'b10;
    end else if (fuif.memwbregen && 
                (memwbwsel != 0) && 
                (fuif.idexrt == fuif.memwbwsel) && 
                (fuif.alusrc == 0)) begin
      fuif.fwdb = 2'b01;
    end else begin
      fuif.fwdb = 2'b00;
    end

    // forward c
    if (fuif.exmemregen && 
       (fuif.exmemwsel != 0) && 
       (fuif.idexrt == fuif.exmemwsel)) begin
      fuif.fwdc = 2'b10;
    end else if (fuif.memwbwsel && 
                (fuif.memwbwsel != 0) && 
                (fuif.idexrt == fuif.memwbwsel)) begin
      fuif.fwdc = 2'b01; 
    end else begin
      fuif.fwdc = 2'b00;
    end
  end
endmodule