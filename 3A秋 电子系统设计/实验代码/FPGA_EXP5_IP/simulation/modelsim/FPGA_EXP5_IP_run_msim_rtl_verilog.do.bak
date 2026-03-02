transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA_EXP/FPGA_EXP5_IP {D:/FPGA_EXP/FPGA_EXP5_IP/mystorage.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_EXP/FPGA_EXP5_IP {D:/FPGA_EXP/FPGA_EXP5_IP/FPGA_EXP5_IP.v}

vlog -vlog01compat -work work +incdir+D:/FPGA_EXP/FPGA_EXP5_IP {D:/FPGA_EXP/FPGA_EXP5_IP/FPGA_EXP5_IP_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  FPGA_EXP5_IP_tb

add wave *
view structure
view signals
run 25 us
