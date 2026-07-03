/*=========================================================
  Stage 3 - Data Transformation
=========================================================*/

/* Create Customer Profile Table */

data MYLIB.customers;
    set MYLIB.telco_clean;

    keep
        customerID
        gender
        SeniorCitizen
        Partner
        Dependents
        tenure
        Contract
        PaperlessBilling
        PaymentMethod
        MonthlyCharges
        TotalCharges
        Churn;
run;

/*---------------------------------------------------------
 Create Service Profile Table
---------------------------------------------------------*/

data MYLIB.services;
    set MYLIB.telco_clean;

    keep
        customerID
        PhoneService
        MultipleLines
        InternetService
        OnlineSecurity
        OnlineBackup
        DeviceProtection
        TechSupport
        StreamingTV
        StreamingMovies;
run;

/*---------------------------------------------------------
 Sort Both Tables
---------------------------------------------------------*/

proc sort data=MYLIB.customers;
    by customerID;
run;

proc sort data=MYLIB.services;
    by customerID;
run;

/* Merge Customer and Service Tables */

data MYLIB.telco_merged;
    merge
        MYLIB.customers (in=a)
        MYLIB.services  (in=b);

    by customerID;

    if a and b;
run;

/* Verify Merge */

title "Merged Dataset Structure";

proc contents data=MYLIB.telco_merged;
run;

title "Merged Dataset Preview";

proc print data=MYLIB.telco_merged(obs=10);
run;

proc sql;
    select count(*) as Customers
    from MYLIB.customers;

    select count(*) as Services
    from MYLIB.services;

    select count(*) as Merged
    from MYLIB.telco_merged;
quit;