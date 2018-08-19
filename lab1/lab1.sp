* FILE: lab1.sp

********************** begin header *****************************

* Sample Header file for Generic 2.5V 0.25 um process (g25)

.OPTIONS post ACCT OPTS lvltim=2
.OPTIONS post_version=9007

**################################################
* Only Typical/Typical models included
* NEED TO CHANGE ${MMI_TOOLS} TO BE PHYSICAL PATH
.include '/cad2/mmi_local/sue/g25.mod'
* NOTE: these are contrived spice models
**################################################

.param  arean(w,sdd) = '(w*sdd*1p)'
.param  areap(w,sdd) = '(w*sdd*1p)'
* Setup either one or the other of the following
* For ACM=0,2,10,12 fet models
.param  perin(w,sdd) = '(2u*(w+sdd))'
.param  perip(w,sdd) = '(2u*(w+sdd))'
* For ACM=3,13 fet models
*.param  perin(w,sdd) = '(1u*(w+2*sdd))'
*.param  perip(w,sdd) = '(1u*(w+2*sdd))'

.param ln_min   =  0.25u
.param lp_min   =  0.25u

* used in source/drain area/perimeter calculation
.param sdd        =  0.95

.PARAM vddp=2.5		$ VDD voltage

VDD vdd 0 DC vddp 

.TEMP 105
.TRAN 10p 16n
*********************** end header ******************************

* SPICE netlist for "lab1" generated by MMI_SUE5.5.4 on Thu Sep 24 
*+ 19:09:52 EDT 2015.

* start main CELL lab1
* .SUBCKT lab1  
R_1 net_1 net_2 1K 
R_2 gnd net_1 2K 
C_1 gnd net_1 0.7pF 
VVi net_2 gnd pulse 0 2.5 0ns 200ps 200ps 3ns 6ns 
* .ENDS	$ lab1

.GLOBAL gnd

.END

