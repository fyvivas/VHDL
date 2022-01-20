onerror {exit -code 1}
vlib work
vlog -work work codec.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.codec_vlg_vec_tst -voptargs="+acc"
vcd file -direction codec.msim.vcd
vcd add -internal codec_vlg_vec_tst/*
vcd add -internal codec_vlg_vec_tst/i1/*
run -all
quit -f
