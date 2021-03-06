---
title: "Getting and Cleaning Data Project ReadMe"
date: "21 March 2015"
output:
  html_document:
    keep_md: yes
---

## General ##

This program demonstrates the "ability to collect, work with, and clean a data set". It creates a tidy data set beginning with raw data from a public data source.

The raw data came from the *Human Activity Recognition Using Smartphones Dataset*, located at the following link:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The output consists of a tidy data set summarizing the means of all measurements related to means and standard deviations, for every subject and activity. This output file meets the principles of tidy data: 
- the columns have useful headings
- each variable has its own column
- there are no duplicate columns

\* The file *Codebook.md* contains additional details.

## Project Steps ##

The code accomplishes the assignment's five requirements:

1) Merged the training and the test sets to create one data set.

- Read in training and testing data, and added column names from features.txt.
- Read in training and testing subject data.
- Read in activity labels.
- Concatenated training and testing data.
- Added activity codes to data.
- Added subjects so that data can indicate which subject is performing the actions.

2) Extracted only the measurements on the mean and standard deviation for each measurement. 

- In order to keep only columns measuring the mean or standard deviation, used grep() function to find only the columns containing "mean" or "std" in the column name.

3) Uses descriptive activity names to name the activities in the data set.

- Replaced activity codes with text describing the activity.

4) Appropriately labeled the data set with descriptive variable names. 

- After naming columns using data from features.txt, renamed columns to make them easier to read by a) replacing dashes with underscores and b) removing parentheses.

5) From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

- Using the ddply() function, summarized data by taking the mean of each variable for each activity and each subject.

## Runtime Requirements

**Required Software**

- The run_analysis.R script requires the R system, which can be found at [http://www.r-project.org/](http://www.r-project.org/ "http://www.r-project.org/").

**Required R Packages**

- plyr

**Required Data**

The raw data, contained in zip files and located at the following link:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The working directory must contain the extracted zip files and run_analysis.R. Specifically, the following files must be in the working directory:

- activity_labels.txt 
- features.txt 
- subject_test.txt 
- X_test.txt 
- y_test.txt
- subject_train.txt 
- X_train.txt 
- y_train.txt 

## Execution ##

Go to the following link:
[https://github.com/BroadSunlitUplands/GettingAndCleaningData](https://github.com/BroadSunlitUplands/GettingAndCleaningData)

Download the file run_analysis.R into your working directory.

In the R command line, use the source function: source('run_analysis.R').

