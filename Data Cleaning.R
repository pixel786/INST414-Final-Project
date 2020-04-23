library(dplyr)
library(tidyr)

# read in BRFSS file
setwd("/Users/zainabsherani/Desktop/INST414/Final Project/")
br <- read.csv("2015.csv")

# filter for only those who completed cellphone survey 
br <- filter(br, QSTVER >= 20)

# filter for 11 (D.C), 24 (Maryland) and 51 (Virginia)
# we need an integer but X_STATE column is double. first convert to integer
br$X_STATE <- as.integer(br$X_STATE) 
br <- filter(br, X_STATE == 24 | X_STATE == 11 | X_STATE == 51)

# filter those who have/ do not have diabetes. 1 (yes) and 3 (no) 
br <- filter(br, br$DIABETE3 == 1 | br$DIABETE3 == 3)

# filter rows that answered 1 (yes) for DIABETE3 and 1-97 age in DIABAGE2 
# if they answered 2 (no) for DIABETE3, then should have NA for DIABAGE2 
br <- filter(br, br$DIABETE3 == 1 & (br$DIABAGE2 >= 1 & br$DIABAGE2 <= 97) | 
               (br$DIABETE3 == 3 & is.na(br$DIABAGE2)))

# change values in Education with 9 (Refused) to NA 
br$EDUCA[br$EDUCA == 9] <- NA

# change values in RENTHOM1 with 7 (Other arrangement) and 9 (Refused) to NA
br$RENTHOM1[br$RENTHOM1 == 7 | br$RENTHOM1 == 9] <- NA

# change values in EMPLOY1 with 9 (Refused) to NA
br$EMPLOY1[br$EMPLOY1 == 9] <- NA

# change values in CHILDREN with 88 (0 children) to 0, 99 (Refused) to NA
br$CHILDREN[br$CHILDREN == 88] <- 0
br$CHILDREN[br$CHILDREN == 99] <- NA

# change values in HHADULT with 77 (Don't Know/ Unsure) and 99 (Refused)
br$HHADULT[br$HHADULT >= 77] <- NA

# change values in INCOME2 with 77 (Don't know/ Not sure) and 99 (Refused) to NA
br$INCOME2[br$INCOME2 == 77 | br$INCOME2 == 99] <- NA

# change values in WEIGHT2 9000-9998 (which is in kg), 7777, 9999 to NA
# only weight in pounds will be used
br$WEIGHT2[br$WEIGHT2 >= 7777] <- NA

# change values in X_RACE with 9 (Don't know/ Not sure/ Refused) to NA 
br$X_RACE[br$X_RACE == 9] <- NA

# change values in _RFBMI5 with 9 (Don't Know/ Refused/ Missing) to NA
br$X_RFBMI5[br$X_RFBMI5 == 9] <- NA

# create a new HOUSENUM column with sum of CHILDREN and HHADULT
br$HOUSENUM <- br$CHILDREN + br$HHADULT

# create a new ENG_COL (where ENG means an engineered column)  
# 1 (yes) for DIABETE3 have an age in DIABAGE2 
# while those with 3 (no) are NA for this question
br$ENG_COL <- br$DIABAGE2
br$ENG_COL[br$ENG_COL < 65] <- "< 65"
br$ENG_COL[br$ENG_COL >= 65] <- ">= 65"
br$ENG_COL[is.na(br$ENG_COL)] <- "No Diabetes"

# select the columns we want using the column index
br_selected <- br[ ,c(26, 51, 53, 55, 56, 61, 62, 63, 252, 265, 331, 332)]

# column wanted = associated column in Excel = associated column in excel - 1 (for R)
# br$HHADULT = 27 = 26
# br$DIABETE3 = 52 = 51
# br$SEX = 54 = 53
# br$EDUCA = 56 = 55
# br$RENTHOM1 = 57 = 56
# br$EMPLOY1 = 62 = 61
# br$CHILDREN = 63 = 62
# br$INCOME2 = 64 = 63
# br$X_RACE = 253 = 252
# br$X_RFBMI5 = 266 = 265 
# br$HOUSENUM = 332 = 331
# br$ENG_COL = 333 = 332

# remove rows with NAs 
# leaves us with 4414 rows
br <- drop_na(br_selected)

# number of those with and without diabetes in our dataset
# 423 = with diabetes and 3991 = without diabetes
table(br$DIABETE3)

# problem: our machine learning model will not be accurate bc there is a class imbalance: 
#          the number without diabetes is 3991 while those with diabetes is 423
# solution: have 400 rows from those with/ without diabetes

# filter for with diabetes
yes_diab <- filter(br, br$DIABETE3 == 1)

# filter for without diabetes
no_diab <- filter(br, br$DIABETE3 == 3)

# select 400 random rows with no replacement 
yes_diab <- sample_n(yes_diab, size = 400, replace = F)
no_diab <- sample_n(no_diab, size = 400, replace = F)

# combine rows with and without diabetes into a single dataframe
proj_dataset <- rbind(yes_diab, no_diab)

# save the dataset
write.csv(br, "/Users/zainabsherani/Desktop/INST414/Final Project/project_dataset.csv")
