
clear
use "D:\UQ\2020 S1\ECON7320 Advanced MicroMetrics\Assignment 2\A2data.dta" 


rename var1 x
rename var2 y

logit y x

//marginal effect at x=1//
quietly logit y x
margins, dydx(*) at (x=1)

//Wald test//
test x

//Likelihood ratio test//
logit y x 
estimates store m1
lrtest m1 
