onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FPGA_EXP1_tb/a
add wave -noupdate /FPGA_EXP1_tb/b
add wave -noupdate /FPGA_EXP1_tb/c
add wave -noupdate /FPGA_EXP1_tb/y0
add wave -noupdate /FPGA_EXP1_tb/y1
add wave -noupdate /FPGA_EXP1_tb/y2
add wave -noupdate /FPGA_EXP1_tb/y3
add wave -noupdate /FPGA_EXP1_tb/y4
add wave -noupdate /FPGA_EXP1_tb/y5
add wave -noupdate /FPGA_EXP1_tb/y6
add wave -noupdate /FPGA_EXP1_tb/y7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {999050 ps} {1000050 ps}
bookmark add wave bookmark0 {{324787832 ns} {571210568 ns}} 0
bookmark add wave bookmark1 {{359460922 ns} {615348358 ns}} 0
bookmark add wave bookmark2 {{0 ps} {179663694 ns}} 0
