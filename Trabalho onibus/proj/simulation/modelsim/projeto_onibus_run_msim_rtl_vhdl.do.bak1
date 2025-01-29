transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Aluno/Desktop/Alunos/projeto_final_onibus_aline_clara_carlos/projeto_onibus.vhd}

vcom -93 -work work {C:/Users/Aluno/Desktop/Alunos/projeto_final_onibus_aline_clara_carlos/projeto_onibus_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  projeto_onibus_tb

add wave *
view structure
view signals
run -all
