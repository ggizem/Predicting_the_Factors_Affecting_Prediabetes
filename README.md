# R-Code-for-the-Analysis-of-NHANES-Data
Predicting the Factors Affecting Prediabetes

NHANES 2013-2014 data can be found in: https://wwwn.cdc.gov/nchs/nhanes/ContinuousNhanes/Default.aspx?BeginYear=2013 
Because data are available as seperate .xpt files, only the files that contain the necessary variables are used. 

Data preparation: .xpt files are imported and concatenated for the Demographics, Examination, Laboratory and Questionnarie data. Features are extracted according to literature review. The label is created using 3 variables in the data: FPG, OGTT and HbA1c. (American Diabetes Association reference intervals are used to label data points as normoglycemic, prediabetic and diabetic: https://www.diabetes.org/a1c/diagnosis )
