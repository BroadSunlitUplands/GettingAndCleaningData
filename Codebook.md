---
title: "Getting and Cleaning Data Project Codebook"
date: "21 March 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
This effort is for demonstrating the "ability to collect, work with, and clean a data set".

##Study design and data processing

###Collection of the raw data
The raw data came from the *Human Activity Recognition Using Smartphones Dataset*, located at the following link:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Notes on the original (raw) data 
The researchers who originally compiled the data explain the process in the following way: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

##Creating the tidy datafile

###Guide to create the tidy data file

Used the process as outlined in the project instructions:

1) Merged the training and the test sets to create one data set.

Read in training and testing data, and added column names from features.txt.
Read in training and testing subject data.
Read in activity labels.
Concatenated training and testing data.
Added activity codes to data.
Added subjects so that data can indicate which subject is performing the actions.

2) Extracted only the measurements on the mean and standard deviation for each measurement. 

In order to keep only columns measuring the mean or standard deviation, used grep() function to find only the columns containing "mean" or "std" in the column name.

3) Uses descriptive activity names to name the activities in the data set.

Replaced activity codes with text describing the activity.

4) Appropriately labeled the data set with descriptive variable names. 

After naming columns using data from features.txt, renamed columns to make them easier to read. 
a) Replaced dashes with underscores.
b) Removed parentheses.

5) From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

Using the ddply() function, summarized data by taking the mean of each variable for each activity and each subject.


##Description of the variables 

Note: Except for subject_id and activity, all variables are normalized and bounded within [-1,1].

180 rows by 81 columns with the following variables:
 - subject_id	
 - activity	
 - tBodyAcc_mean_X	
 - tBodyAcc_mean_Y	
 - tBodyAcc_mean_Z	
 - tBodyAcc_std_X	
 - tBodyAcc_std_Y	
 - tBodyAcc_std_Z	
 - tGravityAcc_mean_X	
 - tGravityAcc_mean_Y	
 - tGravityAcc_mean_Z	
 - tGravityAcc_std_X	
 - tGravityAcc_std_Y	
 - tGravityAcc_std_Z	
 - tBodyAccJerk_mean_X	
 - tBodyAccJerk_mean_Y	
 - tBodyAccJerk_mean_Z	
 - tBodyAccJerk_std_X	
 - tBodyAccJerk_std_Y	
 - tBodyAccJerk_std_Z	
 - tBodyGyro_mean_X	
 - tBodyGyro_mean_Y	
 - tBodyGyro_mean_Z	
 - tBodyGyro_std_X	
 - tBodyGyro_std_Y	
 - tBodyGyro_std_Z	
 - tBodyGyroJerk_mean_X	
 - tBodyGyroJerk_mean_Y	
 - tBodyGyroJerk_mean_Z	
 - tBodyGyroJerk_std_X	
 - tBodyGyroJerk_std_Y	
 - tBodyGyroJerk_std_Z	
 - tBodyAccMag_mean	
 - tBodyAccMag_std	
 - tGravityAccMag_mean	
 - tGravityAccMag_std	
 - tBodyAccJerkMag_mean	
 - tBodyAccJerkMag_std	
 - tBodyGyroMag_mean	
 - tBodyGyroMag_std	
 - tBodyGyroJerkMag_mean	
 - tBodyGyroJerkMag_std	
 - fBodyAcc_mean_X	
 - fBodyAcc_mean_Y	
 - fBodyAcc_mean_Z	
 - fBodyAcc_std_X	
 - fBodyAcc_std_Y	
 - fBodyAcc_std_Z	
 - fBodyAcc_meanFreq_X	
 - fBodyAcc_meanFreq_Y	
 - fBodyAcc_meanFreq_Z	
 - fBodyAccJerk_mean_X	
 - fBodyAccJerk_mean_Y	
 - fBodyAccJerk_mean_Z	
 - fBodyAccJerk_std_X	
 - fBodyAccJerk_std_Y	
 - fBodyAccJerk_std_Z	
 - fBodyAccJerk_meanFreq_X	
 - fBodyAccJerk_meanFreq_Y	
 - fBodyAccJerk_meanFreq_Z	
 - fBodyGyro_mean_X	
 - fBodyGyro_mean_Y	
 - fBodyGyro_mean_Z	
 - fBodyGyro_std_X	
 - fBodyGyro_std_Y	
 - fBodyGyro_std_Z	
 - fBodyGyro_meanFreq_X	
 - fBodyGyro_meanFreq_Y	
 - fBodyGyro_meanFreq_Z	
 - fBodyAccMag_mean	
 - fBodyAccMag_std	
 - fBodyAccMag_meanFreq	
 - fBodyAccJerkMag_mean	
 - fBodyAccJerkMag_std	
 - fBodyAccJerkMag_meanFreq	
 - fBodyGyroMag_mean	
 - fBodyGyroMag_std	
 - fBodyGyroMag_meanFreq	
 - fBodyGyroJerkMag_mean	
 - fBodyGyroJerkMag_std	
 - fBodyGyroJerkMag_meanFreq


### subject_id
Denotes the subject performing the activity.

 - Class: integer
 - Range: 1 - 30

### activity
Denotes the task the subject was performing.

 - Class: character
 - "STANDING", "SITTING", "LAYING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "WALKING".


### tBodyAcc_mean_X
Mean of the mean body acceleration signal from the smartphone accelerometer X axis within time, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### tBodyAcc_mean_Y
Mean of the mean body acceleration signal from the smartphone accelerometer Y axis within time, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### tBodyAcc_mean_Z
Mean of the mean body acceleration signal from the smartphone accelerometer Z axis within time, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric

### tBodyAcc_std_X
Mean of the standard deviation of the body acceleration signal from the smartphone accelerometer X axis within time, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### tBodyAcc_std_Y
Mean of the standard deviation of the body acceleration signal from the smartphone accelerometer Y axis within time, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### tBodyAcc_std_Z
Mean of the standard deviation of the body acceleration signal from the smartphone accelerometer Z axis within time, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric
	

### tGravityAcc_mean_X	
Mean of the mean time domain measuring gravity acceleration around the X axis.

 - Class: numeric


### tGravityAcc_mean_Y	
Mean of the mean time domain measuring gravity acceleration around the Y axis.

 - Class: numeric


### tGravityAcc_mean_Z
Mean of the mean time domain measuring gravity acceleration around the Z axis.

 - Class: numeric


### tGravityAcc_std_X	
Mean of the standard deviation for time domain measuring gravity acceleration around the X axis.

 - Class: numeric


### tGravityAcc_std_Y	
Mean of the standard deviation for time domain measuring gravity acceleration around the Y axis.

 - Class: numeric


### tGravityAcc_std_Z
Mean of the standard deviation for time domain measuring gravity acceleration around the Z axis.

 - Class: numeric


### tBodyAccJerk_mean_X	
Mean of the mean time domain measuring the body's jerk around the X axis.

 - Class: numeric


### tBodyAccJerk_mean_Y	
Mean of the mean time domain measuring the body's jerk around the Y axis.

 - Class: numeric


### tBodyAccJerk_mean_Z
Mean of the mean time domain measuring the body's jerk around the Z axis.

 - Class: numeric


### tBodyAccJerk_std_X	
Mean of the standard deviation for time domain measuring the body's jerk around the X axis.

 - Class: numeric


### tBodyAccJerk_std_Y	
Mean of the standard deviation for time domain measuring the body's jerk around the Y axis.

 - Class: numeric


### tBodyAccJerk_std_Z
Mean of the standard deviation for time domain measuring the body's jerk around the Z axis.

 - Class: numeric	


###  tBodyGyro_mean_X	
Mean of the mean time domain measuring the body's angular velocity around the X axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyro_mean_Y	
Mean of the mean time domain measuring the body's angular velocity around the Y axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyro_mean_Z
Mean of the mean time domain measuring the body's angular velocity around the Z axis, measured by the gyroscope for each window sample.

 - Class: numeric

###  tBodyGyro_std_X	
Mean of the standard deviation for time domain measuring the body's angular velocity around the X axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyro_std_Y	
Mean of the standard deviation for time domain measuring the body's angular velocity around the Y axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyro_std_Z
Mean of the standard deviation for domain measuring the body's angular velocity around the Z axis, measured by the gyroscope for each window sample.

 - Class: numeric

###  tBodyGyroJerk_mean_X	
Mean of the mean time domain measuring the body's jerk around the X axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerk_mean_Y	
Mean of the mean time domain measuring the body's jerk around the Y axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerk_mean_Z
Mean of the mean time domain measuring the body's jerk around the Z axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerk_std_X	
Mean of the standard deviation for time domain measuring the body's jerk around the X axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerk_std_Y	
Mean of the standard deviation for time domain measuring the body's jerk around the Y axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerk_std_Z
Mean of the standard deviation for time domain measuring the body's jerk around the Z axis, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyAccMag_mean	
Mean of the mean time domain measuring the body's magnitude of acceleration.

 - Class: numeric


###  tBodyAccMag_std	
Mean of the standard deviation for time domain measuring the body's magnitude of acceleration.

 - Class: numeric


###  tGravityAccMag_mean	
Mean of the mean time domain measuring the body's magnitude of gravity acceleration.

 - Class: numeric

###  tGravityAccMag_std
Mean of the standard deviation for time domain measuring the body's magnitude of gravity acceleration.

 - Class: numeric


###  tBodyAccJerkMag_mean		
Mean of the mean time domain measuring the body's magnitude of jerk.

 - Class: numeric


###  tBodyAccJerkMag_std	
Mean of the standard deviation for time domain measuring the body's magnitude of jerk.

 - Class: numeric


###  tBodyGyroMag_mean		
Mean of the mean time domain measuring the body's magnitude of angular velocity, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroMag_std	
Mean of the standard deviation for time domain measuring the body's magnitude of angular velocity, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerkMag_mean		
Mean of the mean time domain measuring the body's magnitude of jerk, measured by the gyroscope for each window sample.

 - Class: numeric


###  tBodyGyroJerkMag_std	
Mean of the standard deviation for time domain measuring the body's magnitude of jerk, measured by the gyroscope for each window sample.

 - Class: numeric


### fBodyAcc_mean_X
Mean of the mean body acceleration signal from the smartphone accelerometer X axis using a fast Fourier transform, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### fBodyAcc_mean_Y
Mean of the mean body acceleration signal from the smartphone accelerometer Y axis using a fast Fourier transform, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### fBodyAcc_mean_Z
Mean of the mean body acceleration signal from the smartphone accelerometer Z axis using a fast Fourier transform, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric

### fBodyAcc_std_X
Mean of the standard deviation of the body acceleration signal from the smartphone accelerometer X axis using a fast Fourier transform, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### fBodyAcc_std_Y
Mean of the standard deviation of the body acceleration signal from the smartphone accelerometer Y axis using a fast Fourier transform, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric


### fBodyAcc_std_Z
Mean of the standard deviation of the body acceleration signal from the smartphone accelerometer Z axis using a fast Fourier transform, obtained by subtracting the gravity from the total acceleration. 

 - Class: numeric
	

### fBodyAcc_meanFreq_X
Mean of the weighted average of the frequency components for body acceleration signal from the smartphone accelerometer X axis using a fast Fourier transform. 

 - Class: numeric


### fBodyAcc_meanFreq_Y
Mean of the weighted average of the frequency components for body acceleration signal from the smartphone accelerometer Y axis using a fast Fourier transform. 

 - Class: numeric


### fBodyAcc_meanFreq_Z
Mean of the weighted average of the frequency components for body acceleration signal from the smartphone accelerometer Z axis using a fast Fourier transform. 

 - Class: numeric


### fBodyAccJerk_mean_X	
Mean of the mean measuring the body's jerk around the X axis using a fast Fourier transform.

 - Class: numeric


### fBodyAccJerk_mean_Y	
Mean of the mean measuring the body's jerk around the Y axis using a fast Fourier transform.

 - Class: numeric


### fBodyAccJerk_mean_Z
Mean of the mean measuring the body's jerk around the Z axis using a fast Fourier transform.

 - Class: numeric


### fBodyAccJerk_std_X	
Mean of the standard deviation measuring the body's jerk around the X axis using a fast Fourier transform.

 - Class: numeric


### fBodyAccJerk_std_Y	
Mean of the standard deviation measuring the body's jerk around the Y axis using a fast Fourier transform.

 - Class: numeric


### fBodyAccJerk_std_Z
Mean of the standard deviation measuring the body's jerk around the Z axis using a fast Fourier transform.

 - Class: numeric


### fBodyAccJerk_meanFreq_X
Mean of the weighted average of the frequency components for body jerk signal from the smartphone accelerometer X axis using a fast Fourier transform. 

 - Class: numeric


### fBodyAccJerk_meanFreq_Y
Mean of the weighted average of the frequency components for body jerk signal from the smartphone accelerometer Y axis using a fast Fourier transform. 

 - Class: numeric


### fBodyAccJerk_meanFreq_Z
Mean of the weighted average of the frequency components for body jerk signal from the smartphone accelerometer Z axis using a fast Fourier transform. 

 - Class: numeric


###  fBodyGyro_mean_X	
Mean of the mean measuring the body's angular velocity around the X axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyro_mean_Y	
Mean of the mean measuring the body's angular velocity around the Y axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyro_mean_Z
Mean of the mean measuring the body's angular velocity around the Z axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric

###  fBodyGyro_std_X	
Mean of the standard deviation measuring the body's angular velocity around the X axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyro_std_Y	
Mean of the standard deviation measuring the body's angular velocity around the Y axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyro_std_Z
Mean of the standard deviation measuring the body's angular velocity around the Z axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


### fBodyGyro_meanFreq_X
Mean of the weighted average of the frequency components measuring the body's angular velocity around the X axis using a fast Fourier transform, measured by the gyroscope for each window sample. 

 - Class: numeric


### fBodyGyro_meanFreq_Y
Mean of the weighted average of the frequency components measuring the body's angular velocity around the Y axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


### fBodyGyro_meanFreq_Z
Mean of the weighted average of the frequency components measuring the body's angular velocity around the Z axis using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyAccMag_mean	
Mean of the mean measuring the body's magnitude of acceleration using a fast Fourier transform.

 - Class: numeric


###  fBodyAccMag_std	
Mean of the standard deviation measuring the body's magnitude of acceleration using a fast Fourier transform.

 - Class: numeric

###  fBodyAccMag_meanFreq	
Mean of the weighted average of the frequency components measuring the body's magnitude of acceleration using a fast Fourier transform.

 - Class: numeric

###  fBodyAccJerkMag_mean		
Mean of the mean measuring the body's magnitude of jerk using a fast Fourier transform.

 - Class: numeric


###  fBodyAccJerkMag_std	
Mean of the standard deviation measuring the body's magnitude of jerk using a fast Fourier transform.

 - Class: numeric

###  fBodyAccJerkMag_meanFreq		
Mean of the weighted average of the frequency components measuring the body's magnitude of jerk using a fast Fourier transform.

 - Class: numeric	


###  fBodyGyroMag_mean		
Mean of the mean measuring the body's magnitude of angular velocity using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyroMag_std	
Mean of the standard deviation measuring the body's magnitude of angular velocity using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric

###  fBodyGyroMag_meanFreq		
Mean of the weighted average of the frequency components measuring the body's magnitude of angular velocity using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyroJerkMag_mean		
Mean of the mean measuring the body's magnitude of jerk using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


###  fBodyGyroJerkMag_std	
Mean of the standard deviation measuring the body's magnitude of jerk using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric

###  fBodyGyroJerkMag_meanFreq		
Mean of the weighted average of the frequency components measuring the body's magnitude of jerk using a fast Fourier transform, measured by the gyroscope for each window sample.

 - Class: numeric


