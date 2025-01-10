transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Aluno/Downloads/Registradoras_L3_ACC/RegistradoraPratica/RegistradoraPratica.vhd}
vcom -93 -work work {C:/Users/Aluno/Downloads/Registradoras_L3_ACC/RegistradoraPratica/Bcd_7seg.vhd}

vcom -93 -work work {C:/Users/Aluno/Downloads/Registradoras_L3_ACC/RegistradoraPratica/RegistradoraPratica_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  RegistradoraPratica_tb

add wave *
view structure
view signals
run -all
