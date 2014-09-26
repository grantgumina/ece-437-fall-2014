onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
<<<<<<< HEAD
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/ramREN
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/ramWEN
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/ramaddr
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/ramstore
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/ramload
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/ramstate
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/memREN
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/memWEN
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/memaddr
add wave -noupdate -group SCIF /system_tb/DUT/CPU/scif/memstore
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/halt
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/ihit
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/imemREN
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/imemload
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/imemaddr
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/dhit
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/datomic
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/dmemREN
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/dmemWEN
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/flushed
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/dmemload
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/dmemstore
add wave -noupdate -group DCIF /system_tb/DUT/CPU/dcif/dmemaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -group RFIF /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/pcsrc
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/jraddr
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/jaddr
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/aluop
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/zflag
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/porto
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/WEN
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/wsel
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/rsel1
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/rsel2
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/rdat2
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/instr
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/extop
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/alusrc
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/regsrc
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/immed
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -group CUIF /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/dmemREN_in
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/dmemWEN_in
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/regen_in
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/hazen
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/ihit
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/dhit
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/pcsrc_in
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/rs
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/rt
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/idex_rt_l
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/idex_alusrc_l
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/idex_dmemREN_l
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/imemREN_out
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/dmemREN_out
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/dmemWEN_out
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/regen_out
add wave -noupdate -group HZIF /system_tb/DUT/CPU/DP/hzif/rambusy
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/v_flag
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/n_flag
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/z_flag
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/porta
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/portb
add wave -noupdate -group ALUIF /system_tb/DUT/CPU/DP/aluif/porto
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/pcsrc
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/rambusy
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/immed
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/jaddr
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/imemaddr
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/jraddr
add wave -noupdate -group PCIF /system_tb/DUT/CPU/DP/pcif/rtnaddr
add wave -noupdate -group PLIF_IFID /system_tb/DUT/CPU/DP/plif_ifid/en
add wave -noupdate -group PLIF_IFID /system_tb/DUT/CPU/DP/plif_ifid/sRST
add wave -noupdate -group PLIF_IFID /system_tb/DUT/CPU/DP/plif_ifid/instr
add wave -noupdate -group PLIF_IFID /system_tb/DUT/CPU/DP/plif_ifid/instr_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/en
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/sRST
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rd
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rd_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rt
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rt_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rs
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rs_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/wsel
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/wsel_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/regen
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/regen_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/aluop
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/aluop_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rdat1
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rdat1_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rdat2
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rdat2_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/alusrc
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/alusrc_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/regsrc
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/regsrc_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/extimm
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/extimm_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/hlt
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/hlt_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/dmemWEN
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/dmemWEN_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/dmemREN
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/dmemREN_l
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rambusy
add wave -noupdate -group PLIF_IDEX /system_tb/DUT/CPU/DP/plif_idex/rambusy_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/en
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/sRST
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rd
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rd_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rt
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rt_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rs
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rs_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/wsel
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/wsel_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/regen
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/regen_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rdat2
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rdat2_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/porto
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/porto_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/dmemWEN
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/dmemWEN_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/dmemREN
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/dmemREN_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rambusy
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/rambusy_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/regsrc
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/regsrc_l
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/hlt
add wave -noupdate -group PLIF_EXMEM /system_tb/DUT/CPU/DP/plif_exmem/hlt_l
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/en
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/sRST
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/wsel
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/wsel_l
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/regen
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/regen_l
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/regsrc
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/regsrc_l
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/porto
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/porto_l
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/dmemload
add wave -noupdate -group PLIF_MEMWB /system_tb/DUT/CPU/DP/plif_memwb/dmemload_l
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
=======
add wave -noupdate -divider Pipeline
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/en
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/sRST
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/instr
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/plif_ifid/instr_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/en
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/sRST
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rd
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rd_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rt
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rt_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rs
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rs_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/wsel
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/wsel_l
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
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/extimm
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/extimm_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/hlt
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/hlt_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemWEN
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemWEN_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemREN
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/dmemREN_l
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rambusy
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/plif_idex/rambusy_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/en
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/sRST
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rd
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rd_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rt
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rt_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rs
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/rs_l
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
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/regsrc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/regsrc_l
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/hlt
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/plif_exmem/hlt_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/en
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/sRST
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/wsel
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/wsel_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regen
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regen_l
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regsrc
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/plif_memwb/regsrc_l
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
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/rambusy
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/immed
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/jaddr
add wave -noupdate -group pcif -radix decimal /system_tb/DUT/CPU/DP/pcif/imemaddr
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/jraddr
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/register
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/v_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/n_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/z_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/porta
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/portb
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/porto
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
add wave -noupdate -group {mem controller} -radix decimal /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {400000 ps} 0}
quietly wave cursor active 1
>>>>>>> 18c64140d8e95bf82ccb42393cdfde489138c293
configure wave -namecolwidth 150
configure wave -valuecolwidth 72
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
<<<<<<< HEAD
WaveRestoreZoom {0 ps} {884 ps}
=======
WaveRestoreZoom {0 ps} {554044 ps}
>>>>>>> 18c64140d8e95bf82ccb42393cdfde489138c293
