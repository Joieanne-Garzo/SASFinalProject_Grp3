/*=========================================================
  Stage 4 - Calculations
=========================================================*/

data MYLIB.telco_final;
    set MYLIB.telco_merged;

    /* Estimated Annual Revenue */

    EstimatedAnnualRevenue = MonthlyCharges * 12;

    /* Tenure Group */

    length TenureGroup $25;

    if tenure <= 12 then
        TenureGroup = "NEW CUSTOMER";

    else if tenure <= 24 then
        TenureGroup = "DEVELOPING";

    else if tenure <= 48 then
        TenureGroup = "ESTABLISHED";

    else
        TenureGroup = "LOYAL";

    /* Monthly Charge Level */

    length ChargeLevel $10;

    if MonthlyCharges < 40 then
        ChargeLevel = "LOW";

    else if MonthlyCharges < 80 then
        ChargeLevel = "MEDIUM";

    else
        ChargeLevel = "HIGH";

    /* Customer Value */

    length CustomerValue $15;

    if MonthlyCharges >= 80 and tenure >= 24 then
        CustomerValue = "HIGH VALUE";
    else
        CustomerValue = "STANDARD";

run;

/* Verify New Variables */

proc print data=MYLIB.telco_final(obs=10);
run;

proc contents data=MYLIB.telco_final;
run;