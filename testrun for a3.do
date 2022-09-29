clear all
capture log close
set more off
log using ECON7320A3.log, replace


//N=100//
//Standard normal//
program Q4N100-1, rclass
	drop _all
	quietly set obs 100
	gen e=rnormal(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_normal=_b[x]
	
end

Q4N100-1
return list

//Simulation//
simulate standard_normal=r(standard_normal), seed(703) reps(1000): Q4N100-1

//Statsistical property//
sum

//Non-normal test//
sktest standard_normal

clear all
//Standard uniform//
program Q4N100-2, rclass
	drop _all
	quietly set obs 100
	gen e=runiform(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_uniform=_b[x]
end

Q4N100-2
return list

//Simulation//
simulate standard_uniform=r(standard_uniform), seed(703) reps(1000): Q4N100-2

//Non-normal test//
sktest standard_uniform

//graphing//
histogram standard_normal, normal fcolor(blue*.45)
graph save SND, replace

histogram standard_uniform, normal fcolor(blue*.45)
graph save UND, replace

graph combine SND.gph UND.gph, scheme(economist)

//Repeat the above with N=10000//
clear all
//Standard normal//
program Q4N10000_1, rclass
	drop _all
	quietly set obs 10000
	gen e=rnormal(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_normal=_b[x]
	
end

Q4N10000_1
return list

//Simulation//
simulate standard_normal=r(standard_normal), seed(703) reps(1000): Q4N10000_1

//Statsistical property//
sum
//Non-normal test//
sktest standard_normal

//Standard uniform//
program Q4N10000_2, rclass
	drop _all
	quietly set obs 10000
	gen e=runiform(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_uniform=_b[x]
end

Q4N10000_2
return list

//Simulation//
simulate standard_uniform=r(standard_uniform), seed(703) reps(1000): Q4N10000_2

//Statsistical property//
sum

//Non-normal test//
sktest standard_uniform

//Graphing//
histogram standard_normal, normal fcolor(pink*.45)
graph save SND, replace

histogram standard_uniform, normal fcolor(pink*.45)
graph save UND, replace

graph combine UND.gph UND.gph, scheme(economist)

log close
