all:rm run
rm:
	rm -rf obj_dir
run:
	verilator --binary simpleMips.sv
	./obj_dir/VsimpleMips
