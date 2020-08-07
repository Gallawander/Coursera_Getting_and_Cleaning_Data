##### This script focuses on creation of a tidy dataset #####
# Code in this script loads a provided dataset and leads to creation of the tidy dataset according to instructions
# URL of the original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Instructions for data cleaning:
# 1. Merge the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# NOTE: Packages "data.table" and "dplyr" are required for proper functioning of this script

### Checks whether the required packages are installed ###
if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}

### Loads the activity labels and subject IDs ###
actLabels <- fread("UCI HAR Dataset/activity_labels.txt")
features <- fread("UCI HAR Dataset/features.txt")

### Loads the required data ###
test <- fread("UCI HAR Dataset/test/X_test.txt")
acTest <- fread("UCI HAR Dataset/test/y_test.txt")
subTest <- fread("UCI HAR Dataset/test/subject_test.txt")
train <- fread("UCI HAR Dataset/train/X_train.txt")
acTrain <- fread("UCI HAR Dataset/train/y_train.txt")
subTrain <- fread("UCI HAR Dataset/train/subject_train.txt")

### Creates column names ###
colNames <- features$V2
colNames <- gsub("[-()]", "", colNames)
colNames <- gsub("mean", "Mean", colNames)
colNames <- gsub("std", "Std", colNames)

### Assigns column names ###
colnames(test) <- colNames
colnames(train) <- colNames

### Creates columns Subject and Activity ###
test$Subject <- subTest
train$Subject <- subTrain
test$Activity <- acTest
train$Activity <- acTrain

### Merges test and train data ###
merged <- as.data.frame(union(test, train))
mergedReduced <- merged[, !duplicated(colnames(merged))]

### Organizes and summarizes data to create a tidy dataset ###
tidyData <- mergedReduced %>%
  select(Subject, Activity, matches("Mean|Std"), -c(contains("angle"))) %>% 
  arrange(Subject) %>% 
  left_join(actLabels, by = c("Activity" = "V1")) %>% 
  select(Subject, Activity, ActName = V2, everything()) %>% 
  group_by(Subject, Activity, ActName) %>% 
  summarise_all(mean)

### Creaes file tidy.txt ###
fwrite(tidyData, "tidy.txt")