restart -f
force -freeze sim:/lab3_SL/loop_clk 1 0, 0 {50 ps} -r 100

force reset 1
run 25
force reset 0
run 65

force col 0001
run 20
force col 0000
run 20
force col 0001
run 20
force col 0000
run 30
force col 0001
run 100
