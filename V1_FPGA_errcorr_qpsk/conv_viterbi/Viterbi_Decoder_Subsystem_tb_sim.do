onbreak resume
onerror resume
vsim -voptargs=+acc work.Viterbi_Decoder_Subsystem_tb

add wave sim:/Viterbi_Decoder_Subsystem_tb/u_Viterbi_Decoder_Subsystem/clk
add wave sim:/Viterbi_Decoder_Subsystem_tb/u_Viterbi_Decoder_Subsystem/reset
add wave sim:/Viterbi_Decoder_Subsystem_tb/u_Viterbi_Decoder_Subsystem/clk_enable
add wave sim:/Viterbi_Decoder_Subsystem_tb/u_Viterbi_Decoder_Subsystem/In
add wave sim:/Viterbi_Decoder_Subsystem_tb/u_Viterbi_Decoder_Subsystem/ce_out
add wave sim:/Viterbi_Decoder_Subsystem_tb/u_Viterbi_Decoder_Subsystem/Out
add wave sim:/Viterbi_Decoder_Subsystem_tb/Out_ref
run -all
