onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -divider Pipeline
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/en
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/sRST
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/instr
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/instr_l
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/rtnaddr
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/rtnaddr_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/en
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/sRST
add wave -noupdate -group idex -radix unsigned /system_tb/DUT/CPU/DP/plif_idex/wsel
add wave -noupdate -group idex -radix unsigned /system_tb/DUT/CPU/DP/plif_idex/wsel_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/regen
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/regen_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/aluop
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/aluop_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rdat1
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rdat1_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rdat2
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rdat2_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/alusrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/alusrc_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/regsrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/regsrc_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/pcsrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/pcsrc_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/extimm
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/extimm_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/btype
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/btype_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rtnaddr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rtnaddr_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/jraddr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/jraddr_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/jaddr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/jaddr_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/hlt
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/hlt_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemWEN
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemWEN_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemREN
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemREN_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rambusy
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rambusy_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/wsel
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/wsel_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/regen
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/regen_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rdat2
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rdat2_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/porto
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/porto_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/dmemWEN
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/dmemWEN_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/dmemREN
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/dmemREN_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rambusy
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rambusy_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/hlt
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/hlt_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/regsrc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/regsrc_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/pcsrc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/pcsrc_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/extimm
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/extimm_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/btype
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/btype_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/zero
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/zero_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/jraddr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/jraddr_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/jaddr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/jaddr_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rtnaddr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rtnaddr_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/en
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/sRST
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/wsel
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/wsel_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regen
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regen_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regsrc
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regsrc_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/pcsrc
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/pcsrc_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/extimm
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/extimm_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/btype
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/btype_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/zero
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/zero_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/jraddr
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/jraddr_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/jaddr
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/jaddr_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/rtnaddr
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/rtnaddr_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/porto
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/porto_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/dmemload
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/dmemload_l
add wave -noupdate -divider datapath
add wave -noupdate /system_tb/DUT/CPU/DP/extimm
add wave -noupdate /system_tb/DUT/CPU/DP/wdat
add wave -noupdate /system_tb/DUT/CPU/DP/aluoperand
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/jraddr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/jaddr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/aluop
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/zflag
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/porto
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/WEN
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/wsel
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/rsel1
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/rsel2
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/instr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/extop
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/CU/itype.opcode
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/immed
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/pcsrc
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/rambusy
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/extimm
add wave -noupdate -group pcif -radix hexadecimal /system_tb/DUT/CPU/DP/pcif/jaddr
add wave -noupdate -group pcif -radix hexadecimal /system_tb/DUT/CPU/DP/pcif/imemaddr
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/jraddr
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -group rfif -childformat {{{/system_tb/DUT/CPU/DP/RF/register[31]} -radix hexadecimal}} -subitemconfig {{/system_tb/DUT/CPU/DP/RF/register[31]} {-height 17 -radix hexadecimal}} /system_tb/DUT/CPU/DP/RF/register
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/v_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/n_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/z_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/porta
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/portb
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/porto
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/wsel_ex
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/wsel_mem
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/rsel1_id
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/rsel2_id
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/dmemREN
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/dmemWEN
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/ihit
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/dhit
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/ifid_sRST
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/ifid_en
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/idex_sRST
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/idex_en
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/exmem_sRST
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/exmem_en
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/memwb_sRST
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/memwb_en
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/rambusy
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/pcsrc_ex
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/pcsrc_mem
add wave -noupdate -group hzif /system_tb/DUT/CPU/DP/hzif/pcsrc_wb
add wave -noupdate -group fuif -radix unsigned /system_tb/DUT/CPU/DP/fuif/idexrs
add wave -noupdate -group fuif -radix unsigned /system_tb/DUT/CPU/DP/fuif/idexrt
add wave -noupdate -group fuif -radix unsigned /system_tb/DUT/CPU/DP/fuif/exmemwsel
add wave -noupdate -group fuif -radix unsigned /system_tb/DUT/CPU/DP/fuif/memwbwsel
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP/fuif/exmemregen
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP/fuif/memwbregen
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP/fuif/idexalusrc
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP/fuif/fwda
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP/fuif/fwdb
add wave -noupdate -group fuif /system_tb/DUT/CPU/DP/fuif/fwdc
add wave -noupdate -divider {memory controller}
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group {mem controller} -radix hexadecimal /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -divider Caches
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/clk
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/nRST
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/selblk
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/instr
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/ismatch
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/icblks
add wave -noupdate -group icache /system_tb/DUT/CPU/CM/ICACHE/icachef
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/clk
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/nRST
add wave -noupdate -expand -group dcache -expand -subitemconfig {{/system_tb/DUT/CPU/CM/DCACHE/set[1]} -expand {/system_tb/DUT/CPU/CM/DCACHE/set[1].blk} -expand} /system_tb/DUT/CPU/CM/DCACHE/set
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/dcachef
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/setidx
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/blkidx
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/dataidx
add wave -noupdate -expand -group dcache -radix binary /system_tb/DUT/CPU/CM/DCACHE/lru
add wave -noupdate -expand -group dcache -radix binary /system_tb/DUT/CPU/CM/DCACHE/nlru
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/dirty
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/datum
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/tag
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/cwen
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/hit0
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/hit1
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/hit
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/state
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/nstate
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/ci
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/cj
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/ni
add wave -noupdate -expand -group dcache /system_tb/DUT/CPU/CM/DCACHE/nj
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/iwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/iREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/dWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/dload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/dstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/iaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/daddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ccwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ccinv
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ccwrite
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/cctrans
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ramWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ramREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ramstate
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ramaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ramstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CM/ccif/ramload
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/halt
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/ihit
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/imemREN
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/imemload
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/imemaddr
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/dhit
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/datomic
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/dmemREN
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/dmemWEN
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/flushed
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/dmemload
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/dmemstore
add wave -noupdate -expand -group dcif /system_tb/DUT/CPU/CM/dcif/dmemaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2061209 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 76
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1691127 ps} {2440921 ps}
