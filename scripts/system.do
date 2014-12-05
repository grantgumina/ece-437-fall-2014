onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -divider Pipeline
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/plif_ifid/en
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/plif_ifid/sRST
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/plif_ifid/instr
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/plif_ifid/instr_l
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/plif_ifid/rtnaddr
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/plif_ifid/rtnaddr_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/en
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/sRST
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/wsel
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/wsel_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/regen
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/regen_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/aluop
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/aluop_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rdat1
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rdat1_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rdat2
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rdat2_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/alusrc
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/alusrc_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/regsrc
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/regsrc_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/pcsrc
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/pcsrc_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/extimm
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/extimm_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/btype
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/btype_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rtnaddr
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rtnaddr_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rsel1
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rsel1_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rsel2
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rsel2_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/jraddr
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/jraddr_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/jaddr
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/jaddr_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/opcode
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/opcode_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/hlt
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/hlt_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/dmemWEN
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/dmemWEN_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/dmemREN
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/dmemREN_l
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rambusy
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/plif_idex/rambusy_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/en
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/sRST
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/wsel
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/wsel_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/regen
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/regen_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/rdat2
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/rdat2_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/porto
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/porto_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/dmemWEN
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/dmemWEN_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/dmemREN
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/dmemREN_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/rambusy
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/rambusy_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/hlt
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/hlt_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/regsrc
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/regsrc_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/pcsrc
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/pcsrc_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/extimm
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/extimm_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/btype
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/btype_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/zero
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/zero_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/jraddr
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/jraddr_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/jaddr
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/jaddr_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/rtnaddr
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/rtnaddr_l
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/opcode
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/plif_exmem/opcode_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/en
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/sRST
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/wsel
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/wsel_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/regen
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/regen_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/regsrc
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/regsrc_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/pcsrc
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/pcsrc_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/extimm
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/extimm_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/btype
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/btype_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/zero
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/zero_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/jraddr
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/jraddr_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/jaddr
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/jaddr_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/rtnaddr
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/rtnaddr_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/opcode
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/opcode_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/porto
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/porto_l
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/dmemload
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/plif_memwb/dmemload_l
add wave -noupdate -divider pipeline0
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/plif_ifid/en
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/plif_ifid/sRST
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/plif_ifid/instr
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/plif_ifid/instr_l
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/plif_ifid/rtnaddr
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/plif_ifid/rtnaddr_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/en
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/sRST
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/wsel
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/wsel_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/regen
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/regen_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/aluop
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/aluop_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rdat1
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rdat1_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rdat2
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rdat2_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/alusrc
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/alusrc_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/regsrc
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/regsrc_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/pcsrc
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/pcsrc_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/extimm
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/extimm_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/btype
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/btype_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rtnaddr
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rtnaddr_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rsel1
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rsel1_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rsel2
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rsel2_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/jraddr
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/jraddr_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/jaddr
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/jaddr_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/opcode
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/opcode_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/hlt
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/hlt_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/dmemWEN
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/dmemWEN_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/dmemREN
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/dmemREN_l
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rambusy
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/plif_idex/rambusy_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/en
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/sRST
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/wsel
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/wsel_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/regen
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/regen_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/rdat2
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/rdat2_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/porto
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/porto_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/dmemWEN
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/dmemWEN_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/dmemREN
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/dmemREN_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/rambusy
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/rambusy_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/hlt
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/hlt_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/regsrc
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/regsrc_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/pcsrc
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/pcsrc_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/extimm
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/extimm_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/btype
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/btype_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/zero
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/zero_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/jraddr
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/jraddr_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/jaddr
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/jaddr_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/rtnaddr
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/rtnaddr_l
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/opcode
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/plif_exmem/opcode_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/en
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/sRST
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/wsel
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/wsel_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/regen
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/regen_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/regsrc
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/regsrc_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/pcsrc
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/pcsrc_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/extimm
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/extimm_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/btype
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/btype_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/zero
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/zero_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/jraddr
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/jraddr_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/jaddr
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/jaddr_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/rtnaddr
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/rtnaddr_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/opcode
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/opcode_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/porto
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/porto_l
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/dmemload
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/plif_memwb/dmemload_l
add wave -noupdate -divider datapath
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/halt
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/ihit
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemREN
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemload
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemaddr
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dhit
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/datomic
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemREN
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemWEN
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/flushed
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemload
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemstore
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemaddr
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/iwait
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/dwait
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/iREN
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/dREN
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/dWEN
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/iload
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/dload
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/dstore
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/iaddr
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/daddr
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ccwait
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ccinv
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ccwrite
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/cctrans
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ccsnoopaddr
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ramWEN
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ramREN
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ramstate
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ramaddr
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ramstore
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/ramload
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/modded
add wave -noupdate -group DP_ccif1 /system_tb/DUT/CPU/DP1/ccif/dwb
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/WEN
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/wsel
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rsel1
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rsel2
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/wdat
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rdat1
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rdat2
add wave -noupdate -group rfif1 -expand /system_tb/DUT/CPU/DP1/RF/register
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/pcsrc
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jraddr
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jaddr
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/btype
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/aluop
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/zflag
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/porto
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/WEN
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/wsel
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/rsel1
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/rsel2
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/rdat2
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/instr
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/extop
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/alusrc
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/regsrc
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/immed
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/dWEN
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/dREN
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/halt
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/opcode
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/dmemREN
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/dmemWEN
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/ihit
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/dhit
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/dREN_ex
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/wsel_ex
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/wsel_mem
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/rsel1_id
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/rsel2_id
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/ifid_sRST
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/ifid_en
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/idex_sRST
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/idex_en
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/exmem_sRST
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/exmem_en
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/memwb_sRST
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/memwb_en
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/pcsrc_ex
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/pcsrc_mem
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/pcsrc_wb
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/brtkn
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/rambusy
add wave -noupdate -group hzif1 /system_tb/DUT/CPU/DP1/hzif/halt_mem
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/idexrs
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/idexrt
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/exmemwsel
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/memwbwsel
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/exmemregen
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/memwbregen
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/idexalusrc
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/fwda
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/fwdb
add wave -noupdate -group fuif1 /system_tb/DUT/CPU/DP1/fuif/fwdc
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/v_flag
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/n_flag
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/z_flag
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/aluop
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/porta
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/portb
add wave -noupdate -group aluif1 /system_tb/DUT/CPU/DP1/aluif/porto
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/pcsrc
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/rambusy
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/extimm
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/jaddr
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/imemaddr
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/jraddr
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/rtnaddr
add wave -noupdate -group pcif1 /system_tb/DUT/CPU/DP1/pcif/pcplus4
add wave -noupdate -divider datapath0
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/iwait
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/dwait
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/iREN
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/dREN
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/dWEN
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/iload
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/dload
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/dstore
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/iaddr
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/daddr
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ccwait
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ccinv
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ccwrite
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/cctrans
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ccsnoopaddr
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ramWEN
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ramREN
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ramstate
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ramaddr
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ramstore
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/ramload
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/modded
add wave -noupdate -group DP_ccif0 /system_tb/DUT/CPU/DP0/ccif/dwb
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/WEN
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/wsel
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rsel1
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rsel2
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/wdat
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rdat1
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rdat2
add wave -noupdate -group rfif0 -expand /system_tb/DUT/CPU/DP0/RF/register
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/pcsrc
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/jraddr
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/jaddr
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/btype
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/aluop
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/zflag
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/porto
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/WEN
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/wsel
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/rsel1
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/rsel2
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/rdat2
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/instr
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/extop
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/alusrc
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/regsrc
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/immed
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/dWEN
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/dREN
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/halt
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/opcode
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/dmemREN
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/dmemWEN
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/ihit
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/dhit
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/dREN_ex
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/wsel_ex
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/wsel_mem
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/rsel1_id
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/rsel2_id
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/ifid_sRST
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/ifid_en
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/idex_sRST
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/idex_en
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/exmem_sRST
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/exmem_en
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/memwb_sRST
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/memwb_en
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/pcsrc_ex
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/pcsrc_mem
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/pcsrc_wb
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/brtkn
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/rambusy
add wave -noupdate -group hzif0 /system_tb/DUT/CPU/DP0/hzif/halt_mem
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/idexrs
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/idexrt
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/exmemwsel
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/memwbwsel
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/exmemregen
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/memwbregen
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/idexalusrc
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/fwda
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/fwdb
add wave -noupdate -group fuif0 /system_tb/DUT/CPU/DP0/fuif/fwdc
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/v_flag
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/n_flag
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/z_flag
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/aluop
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/porta
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/portb
add wave -noupdate -group aluif0 /system_tb/DUT/CPU/DP0/aluif/porto
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/pcsrc
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/rambusy
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/extimm
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/jaddr
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/imemaddr
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/jraddr
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/rtnaddr
add wave -noupdate -group pcif0 /system_tb/DUT/CPU/DP0/pcif/pcplus4
add wave -noupdate -divider {memory controller}
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/CC/cpuid
add wave -noupdate -group {mem controller} -radix binary /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group {mem controller} -radix binary /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group {mem controller} -radix binary /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group {mem controller} -radix binary /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group {mem controller} -radix binary /system_tb/DUT/CPU/ccif/dWEN
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
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/modded
add wave -noupdate -group {mem controller} /system_tb/DUT/CPU/ccif/dwb
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/COH/state
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/COH/nstate
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/daddr
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/dwb
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/dstore
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/dwait
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/modded
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/cctrans
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/ccwrite
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/ccwait
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/ccinv
add wave -noupdate -group {coh controller} /system_tb/DUT/CPU/CC/coif/ccsnoopaddr
add wave -noupdate -divider Caches
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/clk
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -group dcache0 -expand /system_tb/DUT/CPU/CM0/DCACHE/set
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dcachef
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/setidx
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/blkidx
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dataidx
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/ci
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cj
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/ni
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nj
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/lru
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nlru
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/valid
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dirty
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/datum
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/tag
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cwen
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit0
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit1
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nstate
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cstate
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/rtnstate
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/clk
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/selblk
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/ismatch
add wave -noupdate -group icache0 -expand /system_tb/DUT/CPU/CM0/ICACHE/icblks
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/icachef
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/iwait
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/dwait
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/iREN
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/dREN
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/dWEN
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/iload
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/dload
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/dstore
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/iaddr
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/daddr
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ccwait
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ccinv
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ccwrite
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/cctrans
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ccsnoopaddr
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ramWEN
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ramREN
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ramstate
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ramaddr
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ramstore
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/ramload
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/modded
add wave -noupdate -group ccif0 /system_tb/DUT/CPU/CM0/ccif/dwb
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/halt
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/ihit
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/imemREN
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/imemload
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/imemaddr
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/dhit
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/datomic
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/dmemREN
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/dmemWEN
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/flushed
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/dmemload
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/dmemstore
add wave -noupdate -group dcif0 /system_tb/DUT/CPU/CM0/dcif/dmemaddr
add wave -noupdate -divider Cache1
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/clk
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/set
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dcachef
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/setidx
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/blkidx
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dataidx
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/ci
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cj
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/ni
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nj
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/lru
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nlru
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/valid
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dirty
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/datum
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/tag
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cwen
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit0
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit1
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nstate
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cstate
add wave -noupdate -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/rtnstate
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/clk
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/selblk
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/ismatch
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/icblks
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/icachef
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/iwait
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/dwait
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/iREN
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/dREN
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/dWEN
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/iload
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/dload
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/dstore
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/iaddr
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/daddr
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ccwait
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ccinv
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ccwrite
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/cctrans
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ccsnoopaddr
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ramWEN
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ramREN
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ramstate
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ramaddr
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ramstore
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/ramload
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/modded
add wave -noupdate -group ccif1 /system_tb/DUT/CPU/CM1/ccif/dwb
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/halt
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/ihit
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/imemREN
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/imemload
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/imemaddr
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/dhit
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/datomic
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/dmemREN
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/dmemWEN
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/flushed
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/dmemload
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/dmemstore
add wave -noupdate -group dcif1 /system_tb/DUT/CPU/CM1/dcif/dmemaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {448443 ps} 0}
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
WaveRestoreZoom {0 ps} {926352 ps}
