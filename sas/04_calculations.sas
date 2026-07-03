/*=========================================================
  Stage 4 - Calculations
=========================================================*/

data MYLIB.telco_final;
	%let HIGH_CHARGE = 80;
	%let HIGH_TENURE = 24;
	
	%let LOW = 40;
	%let HIGH = 80;

	%let NEW = 12;
	%let DEVELOPING = 24;
	%let LOYAL = 48;

    set MYLIB.telco_merged;

    /* Estimated Annual Revenue */

    EstimatedAnnualRevenue = MonthlyCharges * 12;

    /* Tenure Group */

    length TenureGroup $25;

    if tenure <= &NEW then
        TenureGroup = "NEW CUSTOMER";

    else if tenure <= &DEVELOPING then
        TenureGroup = "DEVELOPING";

    else if tenure <= &LOYAL then
        TenureGroup = "ESTABLISHED";

    else
        TenureGroup = "LOYAL";

    /* Monthly Charge Level */

    length ChargeLevel $10;

    if MonthlyCharges < &LOW then
        ChargeLevel = "LOW";

    else if MonthlyCharges < &HIGH then
        ChargeLevel = "MEDIUM";

    else
        ChargeLevel = "HIGH";

    /* Customer Value */
	
    length CustomerValue $15;

    if MonthlyCharges >= &HIGH_CHARGE and tenure >= &HIGH_TENURE then
        CustomerValue = "HIGH VALUE";
    else
        CustomerValue = "STANDARD";


run;

/* Verify New Variables */

proc print data=MYLIB.telco_final(obs=10);
run;

proc contents data=MYLIB.telco_final;
run;