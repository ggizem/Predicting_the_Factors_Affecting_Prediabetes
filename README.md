# Predicting the Factors Affecting Prediabetes 

**Problem**: Prediabetes is the state of plasma glucose being higher than the normal range yet below that of diabetes. It is a medical condition with the risk of causing diabetes in the future. 

**Data**: The Health and Nutrition Examination Survey (NHANES) is a program that is conducted to gather information about health and nutrition status of some of the citizens of United States. The study includes interviews and physical examinations of the 5000 participants. The examination composes of medical, dental, physiological measurements and laboratory tests. NHANES 2013-2014 data can be found in: https://wwwn.cdc.gov/nchs/nhanes/ContinuousNhanes/Default.aspx?BeginYear=2013 
Because data are available as seperate .xpt files, only the files that contain the necessary variables are used. 

By means of the literature review, a total number of 195 variables are decided to be used.In addition, 20 new variables are created using additional examination and questionnaire variables, which leads to 215 variables. 

| Data Categories   | # of Variables | 
| ------------------|:--------------:| 
| Laboratory        | 45             | 
| Examination       | 14             |  
| Questionnaire     | 118            |   
| Dietary           | 5              |   
| Demographics      | 13             |    
| Created variables | 20             | 
| **Total**         | **215**        |  

**[Data preparation](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Data%20Preparation/Data%20Preparation.R)**: .xpt files are imported and concatenated for the Demographics, Examination, Laboratory and Questionnarie data. New features are extracted according to literature review. As a result, we had 5 categories of data: Demographics, Examination, Laboratory, Questionnarie and Newly Created Data. The label is created using 3 variables in the data: FPG, OGTT and HbA1c. (American Diabetes Association reference intervals are used to label data points as normoglycemic, prediabetic and diabetic: https://www.diabetes.org/a1c/diagnosis ) The data points whose label is diabetic are removed from the analysis in order to make the problem a binary classification.

**Handling missing values**: Outliers and the values of “Don’t know” and “Refused” are replaced with NA. Features containing %30 or more missing values are excluded from the study. For the remaining features; missing values are changed with mean for continuous variables, with mode for binary, ratio and categorical variables, with weighted mean of interval means for interval variables. This process is conducted using Excel.

**Feature Selection**: 
1) **[PCA](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Feature%20Selection/PCA_1.R)**: Kaiser-Meyer-Olkin (KMO) Test is run for the continuous variables in each category. Because only the examination data and newly created data have acceptaple KMO results, Principle Component Analysis (PCA) is applied to these two categories. As a result, 5 continuous variables of the examination data are reduced to 2, whereas, 4 continuous variables of the newly created data are reduced also to 2.  
2) **[Lasso Regression](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Feature%20Selection/Lasso%20Regression.R)**: 43 features are chosen by the algorithm. 
3) **[Recursive Feature Elimination](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Feature%20Selection/Recursive%20Feature%20Elimination.R)**: 67 features are chosen by the algorithm. 
4) **[Random Forest](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Feature%20Selection/Random%20Forest.R)**:67 features are chosen by the algorithm. 
(Common variables of Lasso Regression and Random Forest results, and all the variables resulted from the RFE are selected The variable number after the feature selection is 37 and it includes 20 continuous, 2 ratio, 12 binary, 1 nominal and 2 ordinal variables.)
5) **[PCA](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Feature%20Selection/PCA_2.R)**: Since the number of variables was still much, a second PCA was applied. The variable number decreased from 37 to 33. 

**[Logistic Regression](https://github.com/ggizem/Predicting_the_Factors_Affecting_Prediabetes/blob/master/Logistic%20Regression/Logistic%20Regression.R)**: A Logistic Regression model is constructed using the final 33 features to elicit significant attributes affecting prediabetes. Significant variables are determined by the algorithm. The effect of these variables gauged with basic mathematics. 
