clear all
capture log close
set more off
log using ECON7320A4Q3.log, replace

cd "D:\UQ\2020 S1\ECON7320 Advanced MicroMetrics\ECON7320 Assignment 4"

use data.dta

//Q3-1//
*ols
reg y x

//Q3-2//
*correctly specified, informative
set seed 7339
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, normal(0,0.05)) ///
prior({y:_cons},normal(0,0.05)) ///
prior({var},gamma(1,1))


//Q3-3//
*correctly specified, less informative
set seed 7339
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, normal(0,1)) ///
prior({y:_cons},normal(0,1)) ///
prior({var},gamma(1,1))


//Q3-4//
*correctly specified, flat
set seed 7379
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, flat) ///
prior({y:_cons},flat) ///
prior({var}, gamma(1,1))


//Q3-5//
*missspecified prior
set seed 7379
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, uniform(3,10)) ///
prior({y:_cons},flat) ///
prior({var},gamma(1,1))





















log cl
