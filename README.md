# CMS Data

## Project Overview 

This project uses toe and foot amputation data from CMS's inpatient and outpatient data.  

## The Resources/Tools
![hcup](img/hcup.jpg)        ![sas](img/sas.png)

## The Process

### Step 1 Data Wrangling 

To begin, indiviual datasets were downloaded from the hcupnet website. 
-Create New Analysis Table
-Inpatient/Descriptive Stats
Choose Year
Specific Diagnosis/Precoedre - Yes
Proocedure Code Selection - Code 10

Once the individual datasets were downloaded, I checked the variable types in **SAS 9.4**.
Then, I created a macro to merge all the datasets together. Rename variabls if needed for the initial merge. 

### Step 2 Data Cleaning 
 I checked for invalid character values and missing data. Then, I looked for out of range data. 
 I checked for invalid numeric values and missing data. Check to see if any data types need to be converted. Last, I checked the range for variables. Look for duplicates and values that are repeating. Check that dates are correctly formatted. Relabel variables as needed. 
I dropped any unimportant variables. 

Learned my data. Mean/Medium/Mode and n for variables of interest 
Hisotgrams.... 


### Step 3 Modeling 

## Results 

### Additional Information 

https://hcupnet.ahrq.gov/#setup





