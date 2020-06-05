# R-Code-for-the-Analysis-of-NHANES-Data
Predicting the Factors Affecting Prediabetes

NHANES 2013-2014 data can be found in: https://wwwn.cdc.gov/nchs/nhanes/ContinuousNhanes/Default.aspx?BeginYear=2013 
Because data are available as seperate .xpt files, only the files that contain the necessary variables are used. 

Data preparation: .xpt files are imported and concatenated for the Demographics, Examination, Laboratory and Questionnarie data. Features are extracted according to literature review. The label is created using 3 variables in the data: FPG, OGTT and HbA1c. (American Diabetes Association reference intervals are used to label data points as normoglycemic, prediabetic and diabetic: https://www.diabetes.org/a1c/diagnosis ) The data points whose label is diabetic are removed from the analysis in order to make the problem a binary classification.

Handling missing values: Outliers and the values of “Don’t know” and “Refused” are replaced with NA. Features containing %30 or more missing values are excluded from the study. For the remaining features; missing values are changed with mean for continuous variables, with mode for binary, ratio and categorical variables, with weighted mean of interval means for interval variables. 

This process is not available in this repository for now. 
