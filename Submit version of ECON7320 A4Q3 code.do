clear all
capture log close
set more off
log using ECON7320A4Q3CSLO.log, replace
cd "D:\UQ\2020 S1\ECON7320 Advanced MicroMetrics\ECON7320 Assignment 4"
use data.dta
//Q3-1//
reg y x
//Q3-2//
set seed 7339
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, normal(0,0.05)) ///
prior({y:_cons},normal(0,0.05)) ///
prior({var},igamma(1,1))
bayesgraph diagnostics {y:_cons}
//Q3-3//
set seed 7339
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, normal(0,1)) ///
prior({y:_cons},normal(0,1)) ///
prior({var},igamma(1,1))
bayesgraph diagnostics {y:_cons}
//Q3-4//
set seed 7379
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, flat) ///
prior({y:_cons},flat) ///
prior({var}, igamma(1,1))
bayesgraph diagnostics {y:_cons}
//Q3-5//
set seed 7379
bayesmh y x, likelihood(normal({var})) ///
prior({y:x}, uniform(3,10)) ///
prior({y:_cons},flat) ///
prior({var},igamma(1,1))
bayesgraph diagnostics {y:_cons}
//bayesgraph diagnostics {var}//
log cl
