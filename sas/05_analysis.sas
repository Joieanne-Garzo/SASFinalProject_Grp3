/*=========================================================
  Stage 5 - Data Analysis & Visualization
=========================================================*/


/* SECTION 1 - CUSTOM FORMATS */

proc format;

    value SeniorFmt
        0 = "NON-SENIOR"
        1 = "SENIOR";

    value $ChurnFmt
        "NO"  = "RETAINED"
        "YES" = "CHURNED";

run;


/* SECTION 2 - SUMMARY TABLES */


/* Revenue Summary by Contract */

title "Revenue Summary by Contract Type";

proc means
    data=MYLIB.telco_final
    mean
    median
    min
    max
    maxdec=2;

    class Contract;

    var
        MonthlyCharges
        TotalCharges
        EstimatedAnnualRevenue;

run;


/* Churn by Contract */

title "Customer Churn by Contract Type";

proc freq
    data=MYLIB.telco_final;

    tables Contract*Churn / chisq;

    format
        Churn $ChurnFmt.;

run;


/* Churn by Tenure Group */

title "Customer Churn by Tenure Group";

proc freq
    data=MYLIB.telco_final;

    tables TenureGroup*Churn / chisq;

    format
        Churn $ChurnFmt.;

run;


/* Customer Value Summary */

title "Customer Value Summary";

proc means
    data=MYLIB.telco_final
    mean
    median
    min
    max
    maxdec=2;

    class CustomerValue;

    var
        MonthlyCharges
        TotalCharges
        EstimatedAnnualRevenue;

run;


/* Internet Service Summary */

title "Internet Service Revenue Summary";

proc means
    data=MYLIB.telco_final
    mean
    median
    min
    max
    maxdec=2;

    class InternetService;

    var
        MonthlyCharges
        EstimatedAnnualRevenue;

run;


/* Payment Method Summary */

title "Payment Method Revenue Summary";

proc means
    data=MYLIB.telco_final
    mean
    median
    min
    max
    maxdec=2;

    class PaymentMethod;

    var
        MonthlyCharges
        EstimatedAnnualRevenue;

run;


/* Correlation Matrix */

title "Correlation Matrix";

proc corr
    data=MYLIB.telco_final;

    var

        tenure

        MonthlyCharges

        TotalCharges

        EstimatedAnnualRevenue;

run;


/* SECTION 3 - VISUALIZATIONS */


/* Chart 1 */

title "Average Annual Revenue by Contract";

proc sgplot
    data=MYLIB.telco_final;

    vbar Contract /
        response=EstimatedAnnualRevenue
        stat=mean
        datalabel;

    yaxis label="Average Annual Revenue";

run;


/* Chart 2 */

title "Customer Churn by Contract";

proc sgplot
    data=MYLIB.telco_final;

    vbar Contract /
        group=Churn
        groupdisplay=cluster
        datalabel;

run;


/* Chart 3 */

title "Customer Churn by Tenure Group";

proc sgplot
    data=MYLIB.telco_final;

    vbar TenureGroup /
        group=Churn
        groupdisplay=cluster
        datalabel;

run;


/* Chart 4 */

title "Average Annual Revenue by Customer Value";

proc sgplot
    data=MYLIB.telco_final;

    vbar CustomerValue /
        response=EstimatedAnnualRevenue
        stat=mean
        datalabel;

run;


/* Chart 5 */

title "Internet Service Distribution";

proc sgplot
    data=MYLIB.telco_final;

    vbar InternetService /
        datalabel;

run;


/* Chart 6 */

title "Payment Method Distribution";

proc sgplot
    data=MYLIB.telco_final;

    vbar PaymentMethod /
        datalabel;

run;


/* Chart 7 */

title "Distribution of Monthly Charges";

proc sgplot
    data=MYLIB.telco_final;

    histogram MonthlyCharges;

    density MonthlyCharges;

run;


/* Chart 8 */

title "Monthly Charges vs Total Charges";

proc sgplot
    data=MYLIB.telco_final;

    scatter
        x=MonthlyCharges
        y=TotalCharges;

    xaxis label="Monthly Charges";

    yaxis label="Total Charges";

run;


/* SECTION 4 - CREATE SUMMARY DATASET */

proc means
    data=MYLIB.telco_final
    noprint;

    class Contract;

    var EstimatedAnnualRevenue;

    output out=MYLIB.contract_summary

        mean=AverageRevenue

        sum=TotalRevenue

        n=Customers;

run;


/* SECTION 5 - VERIFY OUTPUTS */

title "Contract Summary Dataset";

proc print
    data=MYLIB.contract_summary;
run;


title "Final Dataset Structure";

proc contents
    data=MYLIB.telco_final;
run;


title "Preview of Final Dataset";

proc print
    data=MYLIB.telco_final(obs=10);
run;


title;