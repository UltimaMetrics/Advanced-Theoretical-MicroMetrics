
clear
capture log close
set logtype text
log using A1Q4CSLO.txt, replace

cd "D:\UQ\2020 S1\ECON7320 Advanced MicroMetrics\Assignment"
use nerlove63.dta

//A//
generate lcost=log(cost)
generate lkwh=log(kwh)
generate lpl=log(pl)
generate lpf=log(pf)
generate lpk=log(pk)

correlate lcost lkwh lpl lpf lpk
//plot lcost lkwh//

//scatter lcost lkwh//
//graph export a.png, replace//

//B//
reg lcost lkwh, robust
reg lcost lkwh lpl lpf lpk, robust

//C//
//Explain r-squared from part B//

//D//
quietly reg lcost lkwh, robust
predict lyhat, xb
//scatter lcost lyhat//

//E//
quietly reg lcost lkwh lpl lpf lpk, robust
predict lyhat2, xb
//scatter lcost lyhat2 //
//graph export E.png, replace//

//F//
//See word or pdf//

//G//
//See word or pdf//

//H//

reg lcost lkwh lpl lpf lpk,robust
test lkwh==1

//I//
generate cpkwh =lcost/lkwh
reg cpkwh lpl lpf lpk, robust


log cl
