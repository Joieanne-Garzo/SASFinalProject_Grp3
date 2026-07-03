/*=========================================================
  Stage 1 - Import IBM Telco Customer Churn Dataset
=========================================================*/

proc import
    datafile="&PROJECT/data/raw/Telcodata_raw.csv"
    out=MYLIB.telco_raw
    dbms=csv
    replace;
    guessingrows=max;
    getnames=yes;
run;

/* Verify Imported Dataset */

title "Dataset Structure";

proc contents data=MYLIB.telco_raw;
run;

title "Preview of Imported Data";

proc print data=MYLIB.telco_raw(obs=10);
run;