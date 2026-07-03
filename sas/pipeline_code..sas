

/*=========================================================
  Master Pipeline
=========================================================*/

/* Load Project Configuration */
%include "/home/u64515112/sas_essentials/telecom_project/sas/00_config.sas";

/* Stage 1 - Import */
%include "&PROJECT/sas/01_import.sas";

/* Stage 2 - Clean */
%include "&PROJECT/sas/02_cleanup.sas";

/* Stage 3 - Transform */
%include "&PROJECT/sas/03_transform.sas";

/* Stage 4 - Calculations */
%include "&PROJECT/sas/04_calculations.sas";

/* Stage 5 - Analysis */
%include "&PROJECT/sas/05_analysis.sas";

/* Stage 6 - Export */
%include "&PROJECT/sas/06_export.sas";