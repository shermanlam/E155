restart -f
force -freeze sim:/lab3_SL/clk 1 0, 0 {25 ps} -r 50
force reset 1
run 75
force reset 0
run 25
run 1000