restart -f
force -freeze sim:/lab3_SL/loop_clk 1 0, 0 {25 ps} -r 50
force reset 1
run 12
force reset 0
run 38
force pressed 1
force newest 0001
run 50
force newest 0010
run 50
force newest 0011
run 50
force newest 0100
run 50
force newest 0101
run 50
force newest 0110
run 50
force newest 0111
run 50
force newest 1000
run 50