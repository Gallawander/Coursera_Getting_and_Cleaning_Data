# Getting And Cleaning Data
**This project focuses on cleaning data to obtain a tidy dataset that are saved in the file `tidy.txt`.** \
You can download the original data [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Background
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from this course represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:
  1. WALKING
  2. WALKING UPSTAIRS
  3. WALKING DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING

wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captureded. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Instructions for Data Cleaning
You should create one R script called run_analysis.R that does the following.
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
## Steps of the script
The script that has been used for getting and cleaning data to create a tidy dataset - `tidy.txt` is saved here as a `run_analysis.R`. The script follows these steps:
  1. Loads the activity labels and the features
  2. Loads both the training and test datasets as well as the activity and subject data for each dataset
  3. Creates and assigns the column names using the features data
  4. Binds the subject and activity data to each of the training and test dataset
  5. Merges the two datasets
  6. Organizes and summarizes data to create a tidy dataset containing only mean and std data.
  7. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file `tidy.txt`.
