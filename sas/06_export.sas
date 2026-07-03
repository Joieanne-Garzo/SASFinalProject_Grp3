/*=========================================================
  Stage 6 - Export Project Deliverables
=========================================================*/


/* Export CSV Files */

proc export
    data=MYLIB.telco_final
    outfile="&PROJECT/outputs/tables/telco_final.csv"
    dbms=csv
    replace;
run;

proc export
    data=MYLIB.contract_summary
    outfile="&PROJECT/outputs/tables/contract_summary.csv"
    dbms=csv
    replace;
run;


/* Export Complete Report */

ods pdf file="&PROJECT/outputs/reports/final_report.pdf";

title "Revenue Summary by Contract";

proc means
    data=MYLIB.telco_final
    mean median min max maxdec=2;

    class Contract;

    var
        MonthlyCharges
        TotalCharges
        EstimatedAnnualRevenue;

run;


title "Customer Churn by Contract";

proc freq
    data=MYLIB.telco_final;

    tables Contract*Churn / chisq;

run;


title "Customer Churn by Tenure Group";

proc freq
    data=MYLIB.telco_final;

    tables TenureGroup*Churn / chisq;

run;


title "Customer Value Summary";

proc means
    data=MYLIB.telco_final
    mean median;

    class CustomerValue;

    var
        MonthlyCharges
        TotalCharges
        EstimatedAnnualRevenue;

run;


title "Internet Service Summary";

proc means
    data=MYLIB.telco_final
    mean median;

    class InternetService;

    var
        MonthlyCharges
        EstimatedAnnualRevenue;

run;


title "Payment Method Summary";

proc means
    data=MYLIB.telco_final
    mean median;

    class PaymentMethod;

    var
        MonthlyCharges
        EstimatedAnnualRevenue;

run;


title "Correlation Matrix";

proc corr
    data=MYLIB.telco_final;

    var

        tenure

        MonthlyCharges

        TotalCharges

        EstimatedAnnualRevenue;

run;


/* Include Charts Inside PDF */

title "Average Annual Revenue by Contract";

proc sgplot
    data=MYLIB.telco_final;

    vbar Contract /
        response=EstimatedAnnualRevenue
        stat=mean;

run;


title "Customer Churn by Contract";

proc sgplot
    data=MYLIB.telco_final;

    vbar Contract /
        group=Churn
        groupdisplay=cluster;

run;


title "Customer Churn by Tenure Group";

proc sgplot
    data=MYLIB.telco_final;

    vbar TenureGroup /
        group=Churn
        groupdisplay=cluster;

run;


title "Average Annual Revenue by Customer Value";

proc sgplot
    data=MYLIB.telco_final;

    vbar CustomerValue /
        response=EstimatedAnnualRevenue
        stat=mean;

run;


title "Internet Service Distribution";

proc sgplot
    data=MYLIB.telco_final;

    vbar InternetService;

run;


title "Payment Method Distribution";

proc sgplot
    data=MYLIB.telco_final;

    vbar PaymentMethod;

run;


title "Distribution of Monthly Charges";

proc sgplot
    data=MYLIB.telco_final;

    histogram MonthlyCharges;

    density MonthlyCharges;

run;


title "Monthly Charges vs Total Charges";

proc sgplot
    data=MYLIB.telco_final;

    scatter

        x=MonthlyCharges

        y=TotalCharges;

run;

ods pdf close;


/* Export Individual PNG Charts */

ods listing gpath="&PROJECT/outputs/charts";

/* Revenue */

ods graphics / reset imagename="01_revenue_by_contract" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    vbar Contract /
        response=EstimatedAnnualRevenue
        stat=mean;

run;


/* Churn by Contract */

ods graphics / reset imagename="02_churn_by_contract" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    vbar Contract /
        group=Churn
        groupdisplay=cluster;

run;


/* Churn by Tenure */

ods graphics / reset imagename="03_churn_by_tenure" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    vbar TenureGroup /
        group=Churn
        groupdisplay=cluster;

run;


/* Revenue by Customer Value */

ods graphics / reset imagename="04_customer_value_revenue" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    vbar CustomerValue /
        response=EstimatedAnnualRevenue
        stat=mean;

run;


/* Internet Service */

ods graphics / reset imagename="05_internet_service" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    vbar InternetService;

run;


/* Payment Method */

ods graphics / reset imagename="06_payment_method" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    vbar PaymentMethod;

run;


/* Histogram */

ods graphics / reset imagename="07_monthly_charges_distribution" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    histogram MonthlyCharges;

    density MonthlyCharges;

run;


/* Scatter */

ods graphics / reset imagename="08_monthly_vs_total" imagefmt=png;

proc sgplot data=MYLIB.telco_final;

    scatter

        x=MonthlyCharges

        y=TotalCharges;

run;

ods listing close;


/* Finished */

%put ======================================================;
%put PROJECT EXPORT COMPLETED SUCCESSFULLY.;
%put OUTPUT LOCATION:;
%put &PROJECT/outputs;
%put ======================================================;