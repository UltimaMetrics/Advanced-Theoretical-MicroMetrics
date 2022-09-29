clear all
capture log close
set more off
log using ECON7320A3.log, replace

program Q4N100, rclass
//standard normal//
	drop _all
	quietly set obs 100
	gen e=rnormal(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_normal=_b[x]
//standard uniform//
	drop _all
	quietly set obs 100
	gen e=runiform(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_uniform=_b[x]
end

Q4N100
return list

//Simulation//
simulate standard_normal=r(standard_normal) standard_uniform=r(standard_uniform), seed(703) reps(1000): Q4N100
//Summary of statistical property//
sum
//Non-normal test//
sktest standard_normal 
sktest standard_uniform 
//graphing//
histogram standard_normal, normal fcolor(blue*.45)
graph save SND, replace
histogram standard_uniform, normal fcolor(blue*.45)
graph save UND, replace
graph combine SND.gph UND.gph, scheme(economist)

clear all

program Q4N10000, rclass
//standard normal//
	drop _all
	quietly set obs 10000
	gen e=rnormal(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_normal=_b[x]
//standard uniform//
	drop _all
	quietly set obs 10000
	gen e=runiform(0,1)
	gen x=rnormal(0,1)
	gen ystar=1*x-e
	gen y=(ystar>=0)
	quietly probit y x
	return scalar standard_uniform=_b[x]
end

Q4N10000
return list

//Simulation//
simulate standard_normal=r(standard_normal) standard_uniform=r(standard_uniform), seed(703) reps(1000): Q4N10000
//Summary of statistical property//
sum
//Non-normal test//
sktest standard_normal standard_uniform
//Graphing//
histogram standard_normal, normal fcolor(pink*.45)
graph save SND, replace
histogram standard_uniform, normal fcolor(pink*.45)
graph save UND, replace
graph combine UND.gph UND.gph, scheme(economist)
log close

