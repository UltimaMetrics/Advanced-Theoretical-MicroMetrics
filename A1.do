clear
cd "C:\Users\chris\Google Drive\Teaching UQ\ECON6300\ECON6300-2020\A1"

use nerlove63

*(a)
gen lc=ln(COSTS)
gen lk=ln(KWH)
gen lpl=ln(PL)
gen lpf=ln(PF)
gen lpk=ln(PK)

corr lc lk lpl lpf lpk

scatter lc lk
graph export a.png, replace

*(b)-(c)

reg lc lk, rob

reg lc lk lpl lpk lpf, rob

*(d)

quietly reg lc lk, rob
predict lc1, xb
twoway (scatter lc lc1) (line lc lc), legend(order(1 "Fitted value" 2 "45 degree line"))
graph export d.png, replace

*(e)

quietly reg lc lk lpl lpk lpf, rob
predict lc2, xb
twoway (scatter lc lc2) (line lc lc), legend(order(1 "Fitted value" 2 "45 degree line"))
graph export e.png, replace

*(h)
quietly reg lc lk lpl lpk lpf, rob
test lk==1

*(i)
gen lclk=log(C/KWH)
reg lclk lpl lpk lpf, rob
