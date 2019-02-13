/************************************************************************************************************************/
/* Filename: InterviewJHUGI                                                                                             */
/*                             Goal: Identify all procedures associated with toe or foot amputation                     */
/* Contents:                                                                                                            */
/* -Import Data Sets.                                                                                                   */
/* -Clean Data Set.                                                                                                    */
/* -Create Macro for Final DataSet.                                                                                     */
/*                                                                                                                      */
/*                                                                                                                      */
/* Date Created: 2019-02-06                                                                                             */
/* Date Updated: 2019-02-12                                                                                             */
/* Program Author: Andrea Hobby                                                                                         */
/* Version 1.0                                                                                                          */
/************************************************************************************************************************/

/* List of Questions and Suggestions 


*/

/************************************************************************************************************************/

/* HCUPNET estimating toe and foot amputations with allpayer or CMS data 
 Make a note to the link to hcupnet and/or
options selected and the expected number from all-payer or just medicare data.

*/

/************************************************************************************************************************/

/*Import Data Sets*/
/*Before I pulled the 2015 CMS outpatient and inpatient data from the internet, I checked the variable types in the data dictionary.
They are mostly numeric. Also, I read through the CMS Data website to get a sense of how the data was collected. Since I pulled it from cms.gov, there was a ..... I reviewed the coding in the
data dictionary that I reviewed. Also, I decided looked quickly to see what other studies used CMS toe and foot amputation data.
Once I got through this inital review of your request, I wrote out by hand what variables that I needed. Also, I reviewed the 
modifier codes so I would know ...... 

Variables that I need from the datasets. I decided I needed to keep these variables. CAR_LINE_HCPCS_CD This has the code for the
amputations.
*/


LIBNAME outpat 'C:\JHSPH';
LIBNAME inpat  'C:\JHSPH';

DATA inpat.inpatient;
	INFILE "C:\JHSPH\2008_BSA_Inpatient_Claims_PUF\2008_BSA_Inpatient_Claims_PUF.csv";
	INPUT OP_PROC_ID $ BENE_SEX_IDENT_CD	BENE_AGE_CAT_CD	OP_CLM_ICD9_DIAG_CD	$ OP_HCPCS_CD $ OP_HCPCS_UNIT_CNT	OP_HCPCS_PMT_AMT;
RUN;

DATA outpat.outpatient;
INFILE "C:\JHSPH\2008_BSA_Outpatient_Procedures_PUF_1\2008_BSA_Outpatient_Procedures_PUF_1.csv";
INPUT OP_PROC_ID $ BENE_SEX_IDENT_CD BENE_AGE_CAT_CD OP_CLM_ICD9_DIAG_CD $ OP_HCPCS_CD $ OP_HCPCS_UNIT_CNT	OP_HCPCS_PMT_AMT; 
RUN;

/************************************************************************************************************************/

/************************************************************************************************************************/
/* Create Macro for Final Data Set or SQL Table */
%macro tfamputation (out=, in=);  /*query database with macro named tfamputation - defines the macro here put calling statement in()*/

proc sql;

      create table &out as

      select*

      from &in   

      where OP_HCPCS_CD in (

/*Amputation*/

'45378','45379','45380','45381','45382','45383','45384','45385','45386','45387','45388','45389','45390','45391','45392','45393','45398',)


                  /*and (hcpcs_1st_mdfr_cd in ('33','PT') or hcpcs_2nd_mdfr_cd in ('33','PT'))*/;
quit;
%mend;


%tfamputation (out=outpatient8, in=outpat.outpatient)  /* Calling Macro and assiging it values*/

%tfamputation (out=inpatient8, in=inpat.inpatient)  /* Calling Macro and assiging it values*/


/* CPT Codes. Retrieved February 5, 2019, from http://bioportal.bioontology.org/ontologies/CPT/?p=classes&conceptid=http://purl.bioontology.org/ontology/CPT/1005312
HCPCS Codes. Retrieved February 5, 2019, 

Data Source: https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Physician-and-Other-Supplier2016.html  
https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Outpatient.html
*/
