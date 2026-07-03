/*=========================================================
  Stage 2 - Data Cleaning
=========================================================*/

data MYLIB.telco_clean;
    set MYLIB.telco_raw;

/* Handle Missing Values */

    /* Replace missing TotalCharges with 0 */
    if missing(TotalCharges) then TotalCharges = 0;

/* Standardize Character Variables */

    customerID         = strip(upcase(customerID));
    gender             = strip(upcase(gender));
    Partner            = strip(upcase(Partner));
    Dependents         = strip(upcase(Dependents));
    PhoneService       = strip(upcase(PhoneService));
    MultipleLines      = strip(upcase(MultipleLines));
    InternetService    = strip(upcase(InternetService));
    OnlineSecurity     = strip(upcase(OnlineSecurity));
    OnlineBackup       = strip(upcase(OnlineBackup));
    DeviceProtection   = strip(upcase(DeviceProtection));
    TechSupport        = strip(upcase(TechSupport));
    StreamingTV        = strip(upcase(StreamingTV));
    StreamingMovies    = strip(upcase(StreamingMovies));
    Contract           = strip(upcase(Contract));
    PaperlessBilling   = strip(upcase(PaperlessBilling));
    PaymentMethod      = strip(upcase(PaymentMethod));
    Churn              = strip(upcase(Churn));

run;

/* Verify Cleaning */

title "Missing Values After Cleaning";

proc means data=MYLIB.telco_clean n nmiss;
run;

title "Frequency Check";

proc freq data=MYLIB.telco_clean;
    tables Churn Contract InternetService;
run;

title "Preview of Cleaned Dataset";

proc print data=MYLIB.telco_clean(obs=10);
run;
