#  Enterprise Telecom Data Pipeline using SAS

> **CS401 – Essentials of SAS Final Project**

An end-to-end Enterprise Data Pipeline developed using **SAS OnDemand for Academics (ODA)**. This project demonstrates the complete ETL (Extract, Transform, Load) process on the IBM Telco Customer Churn dataset, from raw data ingestion to executive-level business insights.

---

# Project Objectives

The project aims to:

- Import raw telecommunications customer data.
- Clean and standardize inconsistent data.
- Transform and reorganize datasets.
- Generate derived business metrics.
- Apply advanced SAS analytical techniques.
- Produce executive-ready reports, charts, and strategic insights.

---

# Dataset

**Dataset:** IBM Telco Customer Churn

**Source:** Kaggle

**Records:** 7,043 Customers

**Variables:** 21

The dataset contains customer demographic information, subscription details, payment methods, monthly charges, total charges, and customer churn status.

---

# Technology Stack

- SAS OnDemand for Academics (ODA)
- Base SAS
- PROC IMPORT
- DATA Step
- PROC SORT
- PROC MEANS
- PROC FREQ
- PROC CORR
- PROC FORMAT
- PROC SGPLOT
- PROC EXPORT
- ODS PDF

---

# Project Structure

```
telecom_project/

├── data/
│   ├── raw/
│   │   └── Telcodata_raw.csv
│   │
│   └── processed/
│       ├── telco_raw.sas7bdat
│       ├── telco_clean.sas7bdat
│       ├── customers.sas7bdat
│       ├── services.sas7bdat
│       ├── telco_merged.sas7bdat
│       ├── telco_final.sas7bdat
│       └── contract_summary.sas7bdat
│
├── documentation/
│   ├── insights_portfolio.pdf
│   ├── presentation.pptx
│   └── pipeline_flowchart.png
│
├── outputs/
│   ├── charts/
│   ├── reports/
│   └── tables/
│
└── sas/
    ├── 00_config.sas
    ├── 01_import.sas
    ├── 02_cleanup.sas
    ├── 03_transform.sas
    ├── 04_calculations.sas
    ├── 05_analysis.sas
    ├── 06_export.sas
    └── master_pipeline.sas
```

---

# Pipeline Overview

```
Raw CSV
    │
    ▼
01 Import
    │
    ▼
02 Cleanup
    │
    ▼
03 Transformation
    │
    ▼
04 Calculations
    │
    ▼
05 Analysis
    │
    ▼
06 Export
    │
    ▼
Reports • Charts • Tables
```

---

# Pipeline Stages

## Stage 1 — Data Ingestion

- Creates the permanent SAS library (`MYLIB`)
- Imports the raw CSV dataset
- Stores imported data as `TELCO_RAW`

---

## Stage 2 — Data Cleanup

- Standardizes text values
- Removes unnecessary whitespace
- Handles missing values
- Produces `TELCO_CLEAN`

---

## Stage 3 — Data Transformation

- Splits customer and service information
- Sorts datasets by `customerID`
- Performs match-merging
- Produces `TELCO_MERGED`

---

## Stage 4 — Calculations

Creates business-oriented variables:

- EstimatedAnnualRevenue
- TenureGroup
- ChargeLevel
- CustomerValue

Produces:

- `TELCO_FINAL`

---

## Stage 5 — Analysis

Applies advanced SAS procedures:

- PROC FORMAT
- PROC MEANS
- PROC FREQ
- PROC CORR
- PROC SGPLOT

Generates:

- Revenue summaries
- Churn analysis
- Correlation analysis
- Distribution analysis
- Business visualizations

---

## Stage 6 — Export

Automatically exports:

- CSV summary tables
- PDF analytical reports
- PNG visualizations

---

# Generated Outputs

## Tables

- Contract Revenue Summary
- Churn by Contract
- Churn by Tenure Group
- Customer Value Summary
- Internet Service Summary
- Payment Method Summary
- Correlation Matrix

---

## Charts

- Average Annual Revenue by Contract
- Customer Churn by Contract
- Customer Churn by Tenure Group
- Revenue by Customer Value
- Internet Service Distribution
- Payment Method Distribution
- Monthly Charges Histogram
- Monthly Charges vs Total Charges Scatter Plot

---

# Key Business Insights

The completed pipeline identifies strategic findings such as:

- Customer churn trends across contract types.
- High-risk customer segments based on tenure.
- Revenue contribution by customer category.
- Relationships between customer spending and loyalty.
- Revenue performance across internet services and payment methods.

---

# Running the Project

Open **master_pipeline.sas** and execute it.

The pipeline automatically performs:

1. Import
2. Cleanup
3. Transformation
4. Calculations
5. Analysis
6. Export

No manual execution of intermediate scripts is required.

---

# Repository Contents

| Folder | Description |
|---------|-------------|
| data | Raw and processed datasets |
| documentation | Technical report and presentation |
| outputs | Generated reports, charts, and tables |
| sas | SAS source code |

---

# Course Information

**Course:** ISS173 – Essentials of SAS

**Project:** Enterprise Data Pipeline & Analytical Insights Portfolio

**Platform:** SAS OnDemand for Academics

---

# Team Members

- John Kenneth P. Alon
- Johan Takkis A. Villafranca
- Joieanne A. Garzo
- Paul Joshua A. Gregorio


---

# License

This repository was developed for academic purposes as part of the CS401 Final Project.