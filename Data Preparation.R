################Create .csv files containing the necessary variables of Demographics, Examination, Laboratory and Questionnarie data
install.packages("SASxport")
library(SASxport)

##### Demographics Data
lookup.xport("DEMO_H.XPT")
D1 <- read.xport("DEMO_H.XPT")
D1 <- D1[, (names(D1) %in% c("SEQN","RIAGENDR","RIDAGEYR","RIDRETH1", "DMQMILIZ", "DMDFMSIZ", "INDHHIN2", "DMDHREDU", "DMDBORN4","DMDCITZN","DMDMARTL", "DMDHHSIZ","INDFMIN2","INDFMPIR"))]

dData <- D1

##### Examination Data
lookup.xport("BPX_H.XPT")
E1 <- read.xport("BPX_H.XPT")
E1 <- E1[, (names(E1) %in% c("SEQN","BPXPLS","BPXPULS"))]

lookup.xport("BMX_H.XPT")
E2 <- read.xport("BMX_H.XPT")
E2 <- E2[, (names(E2) %in% c("SEQN","BMXBMI","BMXARMC","BMXWAIST","BMDAVSAD"))]

lookup.xport("BPX_H.XPT")
E3 <- read.xport("BPX_H.XPT")
E3 <- E3[, (names(E3) %in% c("SEQN","BPXSY1","BPXSY2", "BPXSY3", "BPXSY4", "BPXDI1", "BPXDI2", "BPXDI3", "BPXDI4"))]

eData <- Reduce(function(x, y) merge(x, y, by="SEQN", all=TRUE), list(E1,E2,E3))

##### Laboratory Data 
L1 <- read.xport("SSTOXO_H.XPT")
L1 <- L1[, (names(L1) %in% c("SEQN","SSTOXG","SSTOXM"))]

lookup.xport("ALB_CR_H.XPT")
L2 <- read.xport("ALB_CR_H.XPT")
L2 <- L2[, (names(L2) %in% c("SEQN","URXUMA","URDACT"))]

lookup.xport("PHTHTE_H.XPT")
L3 <- read.xport("PHTHTE_H.XPT")
L3 <- L3[, (names(L3) %in% c("SEQN","URXUCR"))]

lookup.xport("HDL_H.XPT")
L4 <- read.xport("HDL_H.XPT")
L4 <- L4[, (names(L4) %in% c("SEQN","LBDHDD"))]

lookup.xport("TCHOL_H.XPT")
L5 <- read.xport("TCHOL_H.XPT")
L5 <- L5[, (names(L5) %in% c("SEQN","LBXTC"))]

lookup.xport("CBC_H.XPT")
L6 <- read.xport("CBC_H.XPT")
L6 <- L6[, (names(L6) %in% c("SEQN","LBXWBCSI", "LBDLYMNO", "LBDMONO", "LBDNENO", "LBDEONO", "LBDBANO", "LBXRBCSI", "LBXHCT", "LBXHGB", "LBXPLTSI"))]

lookup.xport("HEPA_H.XPT")
L7 <- read.xport("HEPA_H.XPT")
L7 <- L7[, (names(L7) %in% c("SEQN","LBXHA"))]

lookup.xport("HEPBD_H.XPT")
L8 <- read.xport("HEPBD_H.XPT")
L8 <- L8[, (names(L8) %in% c("SEQN","LBXHBC", "LBDHBG", "LBDHD"))]

lookup.xport("HEPB_S_H.XPT")
L9 <- read.xport("HEPB_S_H.XPT")
L9 <- L9[, (names(L9) %in% c("SEQN","LBXHBS"))]

lookup.xport("HEPE_H.XPT")
L10 <- read.xport("HEPE_H.XPT")
L10 <- L10[, (names(L10) %in% c("SEQN","LBDHEG", "LBDHEM"))]

lookup.xport("BIOPRO_H.XPT")
L11 <- read.xport("BIOPRO_H.XPT")
L11 <- L11[, (names(L11) %in% c("SEQN","LBXSAPSI", "LBXSASSI", "LBXSATSI", "LBXSC3SI", "LBXSCA", "LBXSCK", "LBXSCLSI", "LBXSCR", "LBXSGB", "LBXSGTSI", "LBXSIR", "LBXSKSI", "LBXSLDSI", "LBXSNASI", "LBXSOSSI", "LBXSPH", "LBXSTB", "LBXSTP", "LBXSTR", "LBXSUA"))]

lookup.xport("TGEMA_H.XPT")
L12 <- read.xport("TGEMA_H.XPT")
L12 <- L12[, (names(L12) %in% c("SEQN","LBXTTG"))]

lookup.xport("VITB12_H.XPT")
L13 <- read.xport("VITB12_H.XPT")
L13 <- L13[, (names(L13) %in% c("SEQN","LBDB12"))]

lData <- Reduce(function(x, y) merge(x, y, by="SEQN", all=TRUE), list(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13))


##### Questionnarie Data
Q1 <- read.xport("DIQ_H.XPT")
Q1 <- Q1[, (names(Q1) %in% c("SEQN","DIQ170","DIQ172","DIQ180"))]

lookup.xport("ALQ_H.XPT")
Q2 <- read.xport("ALQ_H.XPT")
Q2 <- Q2[, (names(Q2) %in% c("SEQN","ALQ101"))]

lookup.xport("BPQ_H.XPT")
Q3 <- read.xport("BPQ_H.XPT")
Q3 <- Q3[, (names(Q3) %in% c("SEQN","BPQ020","BPQ056","BPQ059","BPQ080"))]

lookup.xport("DBQ_H.XPT")
Q4 <- read.xport("DBQ_H.XPT")
Q4 <- Q4[, (names(Q4) %in% c("SEQN","DBQ700","DBQ197"))]

lookup.xport("HIQ_H.XPT")
Q5 <- read.xport("HIQ_H.XPT")
Q5 <- Q5[, (names(Q5) %in% c("SEQN","HIQ011"))]

#HEQ_I
lookup.xport("HEQ_H.XPT")
Q6 <- read.xport("HEQ_H.XPT")
Q6 <- Q6[, (names(Q6) %in% c("SEQN","HEQ010", "HEQ030"))]

#HUQ_I
lookup.xport("HUQ_H.XPT")
Q7 <- read.xport("HUQ_H.XPT")
Q7 <- Q7[, (names(Q7) %in% c("SEQN","HUQ020", "HUQ030", "HUQ051", "HUQ090"))]

lookup.xport("HOQ_H.XPT")
Q8 <- read.xport("HOQ_H.XPT")
Q8 <- Q8[, (names(Q8) %in% c("SEQN","HOQ065", "HOD050"))]

lookup.xport("IMQ_H.XPT")
Q9 <- read.xport("IMQ_H.XPT")
Q9 <- Q9[, (names(Q9) %in% c("SEQN","IMQ011", "IMQ020"))]

lookup.xport("INQ_H.XPT")
Q10 <- read.xport("INQ_H.XPT")
Q10 <- Q10[, (names(Q10) %in% c("SEQN","IND235", "INDFMMPI", "INDFMMPC"))]

lookup.xport("KIQ_U_H.XPT")
Q11 <- read.xport("KIQ_U_H.XPT")
Q11 <- Q11[, (names(Q11) %in% c("SEQN","KIQ022", "KIQ026", "KIQ005", "KIQ480"))]

lookup.xport("MCQ_H.XPT")
Q12 <- read.xport("MCQ_H.XPT")
Q12 <- Q12[, (names(Q12) %in% c("SEQN","MCQ010", "MCQ053", "MCQ070", "MCQ082", "MCQ086", "MCQ160A", "MCQ160N", "MCQ160B", "MCQ160C", "MCQ160D", "MCQ160E", "MCQ160F", "MCQ160G", "MCQ160M", "MCQ160K", "MCQ160L", "MCQ160O", "MCQ203", "MCQ220", "MCQ300A", "MCQ300B", "MCQ300C", "MCQ365A", "MCQ365B", "MCQ365C", "MCQ365D", "MCQ370A", "MCQ370B", "MCQ370C", "MCQ370D"))]

lookup.xport("PAQ_H.XPT")
Q13 <- read.xport("PAQ_H.XPT")
Q13 <- Q13[, (names(Q13) %in% c("SEQN","PAQ710", "PAQ715"))]

lookup.xport("SLQ_H.XPT")
Q14 <- read.xport("SLQ_H.XPT")
Q14 <- Q14[, (names(Q14) %in% c("SEQN","SLD010H"))]

lookup.xport("SMQ_H.XPT")
Q15 <- read.xport("SMQ_H.XPT")
Q15 <- Q15[, (names(Q15) %in% c("SEQN","SMQ020"))]

lookup.xport("SMQRTU_H.XPT")
Q16 <- read.xport("SMQRTU_H.XPT")
Q16 <- Q16[, (names(Q16) %in% c("SEQN","SMQ851", "SMDANY"))]

lookup.xport("HSQ_H.XPT")
Q17 <- read.xport("HSQ_H.XPT")
Q17 <- Q17[, (names(Q17) %in% c("SEQN","HSQ510", "HSD010"))]

lookup.xport("FSQ_H.XPT")
Q18 <- read.xport("FSQ_H.XPT")
Q18 <- Q18[, (names(Q18) %in% c("SEQN","FSDHH"))]

lookup.xport("CBQ_H.XPT")
Q19 <- read.xport("CBQ_H.XPT")
Q19 <- Q19[, (names(Q19) %in% c("SEQN","CBD120","CBD130","CBD070", "CBD090", "CBD110"))]

lookup.xport("CKQ_H.XPT")
Q20 <- read.xport("CKQ_H.XPT")
Q20 <- Q20[, (names(Q20) %in% c("SEQN","CKQ010","CKQ020","CKQ040", "CKD060"))]

lookup.xport("DBQ_H.XPT")
Q21 <- read.xport("DBQ_H.XPT")
Q21 <- Q21[, (names(Q21) %in% c("SEQN","DBD895","DBD905","DBD910"))]

lookup.xport("DLQ_H.XPT")
Q22 <- read.xport("DLQ_H.XPT")
Q22 <- Q22[, (names(Q22) %in% c("SEQN","DLQ010","DLQ020","DLQ040", "DLQ050", "DLQ060", "DLQ080"))]

lookup.xport("IMQ_H.XPT")
Q23<- read.xport("IMQ_H.XPT")
Q23<- Q23[, (names(Q23) %in% c("SEQN","IMQ040","IMQ070"))]

lookup.xport("KIQ_U_H.XPT")
Q24 <- read.xport("KIQ_U_H.XPT")
Q24 <- Q24[, (names(Q24) %in% c("SEQN","KIQ042","KIQ044", "KIQ046"))]

lookup.xport("PUQMEC_H.XPT")
Q25 <- read.xport("PUQMEC_H.XPT")
Q25 <- Q25[, (names(Q25) %in% c("SEQN","PUQ100","PUQ110"))]

lookup.xport("PAQ_H.XPT")
Q26 <- read.xport("PAQ_H.XPT")
Q26 <- Q26[, (names(Q26) %in% c("SEQN","PAQ605","PAQ650", "PAQ620", "PAQ665"))]

lookup.xport("PFQ_H.XPT")
Q27 <- read.xport("PFQ_H.XPT")
Q27 <- Q27[, (names(Q27) %in% c("SEQN","PFQ020","PFQ033", "PFQ049", "PFQ051", "PFQ054", "PFQ057", "PFQ059"))]

lookup.xport("SLQ_H.XPT")
Q28 <- read.xport("SLQ_H.XPT")
Q28 <- Q28[, (names(Q28) %in% c("SEQN","SLQ050","SLQ060"))]

lookup.xport("SMQSHS_H.XPT")
Q29 <- read.xport("SMQSHS_H.XPT")
Q29 <- Q29[, (names(Q29) %in% c("SEQN","SMQ858","SMQ862", "SMQ868", "SMQ872", "SMQ876", "SMQ880"))]

lookup.xport("RHQ_H.XPT")
Q30 <- read.xport("RHQ_H.XPT")
Q30 <- Q30[, (names(Q30) %in% c("SEQN","RHQ162","RHQ172", "RHD280", "RHQ305", "RHQ420", "RHQ540"))]

lookup.xport("SMQFAM_H.XPT")
Q31 <- read.xport("SMQFAM_H.XPT")
Q31 <- Q31[, (names(Q31) %in% c("SEQN","SMD460"))]

qData <- Reduce(function(x, y) merge(x, y, by="SEQN", all=TRUE), list(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31))

########### CREATE NEW VARIABLES

# newly created Mean SBP
mean_SBP  <- rowMeans(eData[,c("BPXSY1","BPXSY2","BPXSY3","BPXSY4")], na.rm=TRUE) 

# newly created Mean DBP
mean_DBP  <- rowMeans(eData[,c("BPXDI1","BPXDI2","BPXDI3","BPXDI4")], na.rm=TRUE)

# newly created Processed Food Expenditure
processed_food_expenditure <- (qData$CBD120 + qData$CBD130)/(qData$CBD070 + qData$CBD090 + qData$CBD110 + qData$CBD120 + qData$CBD130)

# newly created Creatine Kinase, 1=no, 2=yes

creatine_kinase <- ifelse(!is.na(qData$CKQ010) & qData$CKQ010 == 1 & !is.na(qData$CKQ020) & qData$CKQ020 == 1 & !is.na(qData$CKQ040) & qData$CKQ040 == 1 & !is.na(qData$CKD060) & qData$CKD060 == 1, 1, 
                          ifelse((!is.na(qData$CKQ010) & qData$CKQ010 == 2) | (!is.na(qData$CKQ020) & qData$CKQ020 == 2) | (!is.na(qData$CKQ040) & qData$CKQ040 == 2) | (!is.na(qData$CKD060) & qData$CKD060 == 2), 2, NA)
)


# newly created number of processed food meals
number_of_processed_food_meals <- (qData$DBD895*4) + qData$DBD905 + qData$DBD910 

# newly created Disability, 1=no, 2=yes
disability <- ifelse((!is.na(qData$DLQ010) & qData$DLQ010 == 1) & (!is.na(qData$DLQ020) & qData$DLQ020 == 1) & (!is.na(qData$DLQ040) & qData$DLQ040 == 1) & (!is.na(qData$DLQ050) & qData$DLQ050 == 1) & (!is.na(qData$DLQ060) & qData$DLQ060 == 1) & (!is.na(qData$DLQ080) & qData$DLQ080 == 1), 1,
                     ifelse((!is.na(qData$DLQ010) & qData$DLQ010 == 2) | (!is.na(qData$DLQ020) & qData$DLQ020 == 2) | (!is.na(qData$DLQ040) & qData$DLQ040 == 2) | (!is.na(qData$DLQ050) & qData$DLQ050 == 2) | (!is.na(qData$DLQ060) & qData$DLQ060 == 2) | (!is.na(qData$DLQ080) & qData$DLQ080 == 2), 2, NA)
)

# newly created HPV vaccination
HPV_vaccination <- ifelse( (!is.na(qData$IMQ040) & (qData$IMQ040 == 1)) | (!is.na(qData$IMQ070) & (qData$IMQ070 == 1)) , 1,
                           ifelse( (!is.na(qData$IMQ040) & (qData$IMQ040 == 2)) | (!is.na(qData$IMQ070) & (qData$IMQ070 == 2)) , 2, NA))


# newly created Urine Leakage, 1=no, 2=yes
urine_leakage <- ifelse((!is.na(qData$KIQ042) & qData$KIQ042 == 1) & (!is.na(qData$KIQ044) & qData$KIQ044 == 1) & (!is.na(qData$KIQ046) & qData$KIQ046 == 1) , 1,
                        ifelse((!is.na(qData$KIQ042) & qData$KIQ042 == 2) | (!is.na(qData$KIQ044) & qData$KIQ044 == 2) | (!is.na(qData$KIQ046) & qData$KIQ046 == 2) , 2, NA)
)

# newly created Pesticide, 1=no, 2=yes
pesticide <- ifelse((!is.na(qData$PUQ100) & qData$PUQ100 == 1) & (!is.na(qData$PUQ110) & qData$PUQ110 == 1) , 1,
                    ifelse((!is.na(qData$PUQ100) & qData$PUQ100 == 2) | (!is.na(qData$PUQ110) & qData$PUQ110 == 2) , 2, NA)
)

# newly created Vigorous Activity, 1=no, 2=yes
vigorous_activity <- ifelse((!is.na(qData$PAQ605) & qData$PAQ605 == 2) | (!is.na(qData$PAQ650) & qData$PAQ650 == 2) , 2, NA)
)


# newly created Moderate Activity, 1=no, 2=yes
moderate_activity <- ifelse((!is.na(qData$PAQ620) & qData$PAQ620 == 1) & (!is.na(qData$PAQ665) & qData$PAQ665 == 1) , 1,
                            ifelse((!is.na(qData$PAQ620) & qData$PAQ620 == 2) | (!is.na(qData$PAQ665) & qData$PAQ665 == 2) , 2, NA)
)

# newly created Functional Limitation, 1=no, 2=yes
functional_limitation <- ifelse((!is.na(qData$PFQ020) & qData$PFQ020 == 1) & (!is.na(qData$PFQ033) & qData$PFQ033 == 1) & (!is.na(qData$PFQ049) & qData$PFQ049 == 1) & (!is.na(qData$PFQ051) & qData$PFQ051 == 1) & (!is.na(qData$PFQ054) & qData$PFQ054 == 1) & (!is.na(qData$PFQ057) & qData$PFQ057 == 1) & (!is.na(qData$PFQ059) & qData$PFQ059 == 1) , 1,
                                ifelse((!is.na(qData$PFQ020) & qData$PFQ020 == 2) | (!is.na(qData$PFQ033) & qData$PFQ033 == 2) | (!is.na(qData$PFQ049) & qData$PFQ049 == 2) | (!is.na(qData$PFQ051) & qData$PFQ051 == 2) | (!is.na(qData$PFQ054) & qData$PFQ054 == 2) | (!is.na(qData$PFQ057) & qData$PFQ057 == 2) | (!is.na(qData$PFQ059) & qData$PFQ059 == 2) , 2, NA)
)


# newly created Sleeping Trouble, 1=no, 2=yes
sleeping_trouble <- ifelse((!is.na(qData$SLQ050) & qData$SLQ050 == 1) & (!is.na(qData$SLQ060) & qData$SLQ060 == 1) , 1,
                           ifelse((!is.na(qData$SLQ050) & qData$SLQ050 == 2) | (!is.na(qData$SLQ060) & qData$SLQ060 == 2) , 2, NA)
)

# newly created Secondhand Smoking, 1=no, 2=yes
secondhand_smoking <- ifelse((!is.na(qData$SMQ858) & qData$SMQ858 == 1) & (!is.na(qData$SMQ862) & qData$SMQ862 == 1) & (!is.na(qData$SMQ868) & qData$SMQ868 == 1) & (!is.na(qData$SMQ872) & qData$SMQ872 == 1) & (!is.na(qData$SMQ876) & qData$SMQ876 == 1) & (!is.na(qData$SMQ880) & qData$SMQ880 == 1)  , 1,
                             ifelse((!is.na(qData$SMQ858) & qData$SMQ858 == 2) | (!is.na(qData$SMQ862) & qData$SMQ862 == 2) | (!is.na(qData$SMQ868) & qData$SMQ868 == 2) | (!is.na(qData$SMQ872) & qData$SMQ872 == 2) | (!is.na(qData$SMQ876) & qData$SMQ876 == 2) | (!is.na(qData$SMQ880) & qData$SMQ880 == 2) , 2, NA)
)

# Hysterectomy 

hysterectomy  <- qData$RHD280

# Bilateral ovariectomy 

bilateral_ovariectomy  <- qData$RHQ305

# Oral contraception 

oral_contraception  <- qData$RHQ420

# Female hormones intake 

female_hormones_intake  <- qData$RHQ540

cData <- Reduce(function(x, y) merge(x, y, by="SEQN", all=TRUE), list(mean_SBP, mean_DBP, processed_food_expenditure, creatine_kinase, number_of_processed_food_meals, disability, HPV_vaccination, urine_leakage, pesticide, vigorous_activity, modarate_activity, sleeping_trouble,secondhand_smoking, hysterectomy, bilateral_ovariectomy, oral_contraception, female_hormones_intake))

############### CREATE .csv FILES

write.csv2(dData,'dData.csv')
write.csv2(eData,'eData.csv')
write.csv2(lData,'lData.csv')
write.csv2(qData,'qData.csv')
write.csv2(cData,'cData.csv')

############### CREATE THE LABEL AS A CATEGORICAL VARIABLE (normoglycemic, prediabetic, diabetic)
library(foreign)
library(ggplot2)
library(readxl)

FPG <- read.xport("fpg.xpt")
OGTT <- read.xport("ogtt.xpt")
HBA1C <- read.xport("hba1c.xpt")

OGTT <- OGTT [-c(2,4:12)]
FPG <- FPG [-c(2,4:6)]


a <- merge(FPG, HBA1C, by="SEQN", all=TRUE)
result <- merge(a, OGTT, by="SEQN", all=TRUE)

result$classify <- NULL

names(result)[names(result) == "LBXGLU"] <- "FPG"
names(result)[names(result) == "LBXGH"] <- "HBA1C"
names(result)[names(result) == "LBXGLT"] <- "OGTT"


result$classify <- ifelse( (!is.na(result$FPG) & (result$FPG > 125)) | (!is.na(result$HBA1C) & (result$HBA1C > 6.4)) | (!is.na(result$OGTT) & (result$OGTT > 200)) , "diabetic",
                           ifelse( (!is.na(result$FPG) & (result$FPG > 100)) | (!is.na(result$HBA1C) & (result$HBA1C > 5.7)) | (!is.na(result$OGTT) & (result$OGTT > 140)) , "prediabetic", 
                                   ifelse( (!is.na(result$FPG) & (result$FPG < 100)) | (!is.na(result$HBA1C) & (result$HBA1C < 5.7)) | (!is.na(result$OGTT) & (result$OGTT < 140)), "normoglycemic", NA)))



result <- result[complete.cases(result[ , 5]),]
sum(is.na(result$classify))

allData <- Reduce(function(x, y) merge(x, y, by="SEQN", all=TRUE), list(dData,eData,lData,qData, cData))


allData_with_results <- merge(allData, result, by="SEQN")

write.csv2(allData_with_results,'allData_with_results.csv')