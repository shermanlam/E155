restart -f
force -freeze sim:/lab3_SL/loop_clk 1 0, 0 {25 ps} -r 50
force reset 1
run 12
force reset 0
run 450
force reset 1
run 50
force reset 0
run 100