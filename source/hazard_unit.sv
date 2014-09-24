`include "cpu_types_pkg.vh"
module hazard_unit
import cpu_types_pkg::*;
(
input CLK,nRST,
input logic [2:0] pc_state_c,
input logic ihit,
input logic dhit,
input logic dmemREN_c,
input logic dmemWEN_c,
input logic reg_wr_c,
//input logic second_stall,
input regbits_t ifidrs_l,
input regbits_t ifidrt_l,
// input logic ifidrd,
// input logic idexrt_l,
input regbits_t idexrt_l,
input logic idexalu_src_l,
input logic idexdmemREN_l,
// input logic idexrd_l,
// input logic idexop_l,
//output enables
output logic imemREN,
output logic dmemREN,
output logic dmemWEN,
output logic reg_wr,
//pc signals
output logic [2:0] pc_state,
output logic pc_stall,
output logic mux_stall,
output logic ifid_stall
);

logic temp;
logic haz_stall;
//logic [1:0] count;

always_ff @ (posedge CLK)
begin

if(!nRST)
begin
// pc_stall <= 1;
dmemWEN <= 0;
dmemREN <= 0;
imemREN <= 1;
// reg_wr <= reg_wr_c;
pc_state <= pc_state_c;
temp =0;
end
else
begin
if (ihit == 1)
begin
// pc_stall <= 0;
// reg_wr <= reg_wr_c;
pc_state <= pc_state_c;
dmemWEN <= 0;
dmemREN <= 0;
temp = 0;
end

else if(ihit == 0 ) // was ihit == 0
begin
// pc_stall <=1;
dmemWEN <= 0;
dmemREN <= 0;
imemREN <= 1;

if((dmemREN_c || dmemWEN_c) && !dhit)
begin
// pc_stall <= 1;
if(dmemREN_c == 1 && dmemWEN_c == 0)//load op
begin
dmemWEN <= 0;
dmemREN <= 1; //was 1
imemREN <= 1;
// reg_wr <= reg_wr_c; // was 0 before
// pc_stall <= 1;
end
else if(dmemREN_c == 0 && dmemWEN_c == 1)//store op
begin
dmemWEN <= 1; // was 1
dmemREN <= 0;
imemREN <= 1;
// reg_wr <= 0;
// pc_stall <= 1;
end

if (temp == 1)
begin
dmemWEN <= 0; // was 1
dmemREN <= 0;
imemREN <= 1;
// reg_wr <= 0;
end

end
end
if(dhit) // was else if
begin
dmemWEN <= 0;
dmemREN <= 0;
imemREN <= 1;
// reg_wr <= 0;
temp = 1;
end
end


end

always_ff@(posedge CLK)
begin
if(!nRST)
begin
reg_wr <= 0;
end
else
begin
if( ihit)
begin
reg_wr <= reg_wr_c;
end
else
begin
reg_wr <= 0;
end
end
end

//assign reg_wr = (ihit || dhit) ? reg_wr_c : 0;//was or'ed with dhit

//original logic
assign pc_stall = ( (!(ihit)) || haz_stall ); //was !ihit before

///////////////data hazard detection
always_comb
begin
if(idexdmemREN_l && ((idexrt_l == ifidrs_l) || (!idexalu_src_l && (idexrt_l == ifidrt_l)) ) )
begin
haz_stall = 1;
mux_stall = 1;
ifid_stall = 1;
end
else begin
haz_stall = 0;
mux_stall = 0;
ifid_stall = 0;
end
end

endmodule

