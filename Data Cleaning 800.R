proj_dataset <- read.csv("project_dataset 800 ORIGINAL.csv")
# change 1 to "yes" and 3 to "no" in DIABETE3
proj_dataset$DIABETE3[proj_dataset$DIABETE3 == 1] <- "Y"
proj_dataset$DIABETE3[proj_dataset$DIABETE3 == 3] <- "N"

# change values in SEX with 1 to  Male and 2 to Female 
proj_dataset$SEX[proj_dataset$SEX == 1] <- "Male"
proj_dataset$SEX[proj_dataset$SEX == 2] <- "Female"

# change values in EDUCA
proj_dataset$EDUCA[proj_dataset$EDUCA == 1] <- "Never attended school or only kindergarten"
proj_dataset$EDUCA[proj_dataset$EDUCA == 2] <- "Grades 1 through 8 (Elementary)"
proj_dataset$EDUCA[proj_dataset$EDUCA == 3] <- "Grades 9 through 11 (Some high school) "
proj_dataset$EDUCA[proj_dataset$EDUCA == 4] <- "Grade 12 or GED (High school graduate)"
proj_dataset$EDUCA[proj_dataset$EDUCA == 5] <- "College 1 year to 3 years (Some college or technical school)"
proj_dataset$EDUCA[proj_dataset$EDUCA == 6] <- "College 4 years or more (College graduate)"

# change values in RENTHOM1
proj_dataset$RENTHOM1[proj_dataset$RENTHOM1 == 1] <- "Own"
proj_dataset$RENTHOM1[proj_dataset$RENTHOM1 == 2] <- "Rent"
proj_dataset$RENTHOM1[proj_dataset$RENTHOM1 == 3] <- "Other arrangement"

# change values in EMPLOY1
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 1] <- "Employed for wages"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 2] <- "Self-employed"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 3] <- "Out of work for 1 year or more"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 4] <- "Out of work for less than 1 year"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 5] <- "A homemaker"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 6] <- "A student"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 7] <- "Retired"
proj_dataset$EMPLOY1[proj_dataset$EMPLOY1 == 8] <- "Unable to work"

# change values in INCOME2
proj_dataset$INCOME2[proj_dataset$INCOME2 == 1] <- "Less than $10,000"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 2] <- "Less than $15,000 ($10,000 to less than $15,000)"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 3] <- "Less than $20,000 ($15,000 to less than $20,000)"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 4] <- "Less than $25,000 ($20,000 to less than $25,000)"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 5] <- "Less than $35,000 ($25,000 to less than $35,000)"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 6] <- "Less than $50,000 ($35,000 to less than $50,000)"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 7] <- "Less than $75,000 ($50,000 to less than $75,000)"
proj_dataset$INCOME2[proj_dataset$INCOME2 == 8] <- "$75,000 or more"

# change values in X_RACE
proj_dataset$X_RACE[proj_dataset$X_RACE == 1] <- "White only, non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 2] <- "Black only, non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 3] <- "American Indian or Alaskan Native only, Non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 4] <- "Asian only, non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 5] <- "Native Hawaiian or other Pacific Islander only, Non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 6] <- "Other race only, non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 7] <- "Multiracial, non-Hispanic"
proj_dataset$X_RACE[proj_dataset$X_RACE == 8] <- "Hispanic"

# change values in X_RFBMI5
proj_dataset$X_RFBMI5[proj_dataset$X_RFBMI5 == 1] <- "No"
proj_dataset$X_RFBMI5[proj_dataset$X_RFBMI5 == 2] <- "Yes"

write.csv(proj_dataset, "/Users/zainabsherani/Desktop/INST414/Final Project/project_dataset - 800 2.csv")