onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -divider datapath
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
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/PCSrc1
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/PCSrc2
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/PCSrc3
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/jraddr
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/jaddr
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/aluop
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/zflag
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/porto
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/WEN
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/wsel
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/rsel1
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/rsel2
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/wdat
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/instr
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/dmemaddr
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/dmemstore
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/extop
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/irsel
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/memtoreg
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/CU/itype.opcode
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/immed
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/ihit
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/dhit
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/imemREN
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/dmemREN
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/dmemWEN
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/dWEN
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/dREN
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/halt
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/cuhlt
add wave -noupdate -group ruif /system_tb/DUT/CPU/DP/ruif/rambusy
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/PCSrc1
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/PCSrc2
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/PCSrc3
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/rambusy
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/immed
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/jaddr
add wave -noupdate -group pcif -radix decimal /system_tb/DUT/CPU/DP/pcif/imemaddr
add wave -noupdate -group pcif /system_tb/DUT/CPU/DP/pcif/jraddr
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -expand -group rfif -expand /system_tb/DUT/CPU/DP/RF/register
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/v_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/n_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/z_flag
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/porta
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/portb
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/porto
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
WaveRestoreCursors {{Cursor 1} {180086 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {153774 ps} {495494 ps}
