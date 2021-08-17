# getting_and_cleaning_data

Final project for Data Cleaning Course on Coursera: 
https://www.coursera.org/learn/data-cleaning

## Introduction

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. An explanation of the data and the data itself is available on this website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


In specific, here is the raw data - the rawest version that is available to us:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The repository contains these files:  

- Codebook.md  
explains the variables

- README.md  
introduces to project and includes an instruction list

- run_analysis.R  
runs the following analysis:  
        - Merges the training and the test sets to create one data set.  
        - Extracts only the measurements on the mean and standard deviation for each measurement.  
        - Uses descriptive activity names to name the activities in the data set  
        - Appropriately labels the data set with descriptive variable names.  
        - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instruction List

- Set your working directory

- Then, load the libraries:
library(tidyverse)
library(snakecase)

- download the raw data and unzip from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- read in test and train files

- give descriptive variable names

- join the train and test files into one dataset

- convert activity ID to descriptive activity labels

- extract the measurements on the mean and standard deviation for each measurement

- change new columns names to descriptive column names

- creates a second, independent tidy data set with the average of each variable for each activity and each subject
