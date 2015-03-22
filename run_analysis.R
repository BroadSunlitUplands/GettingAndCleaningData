# Script:   run_analysis.R 
# Purpose:  To create a tidy data set beginning with raw 
#           data from a public data source.  
# Inputs:   Raw data from the UCI's Human Activity Recognition 
#           Using Smartphones Data Set. 
# Outputs:  A tidy data set summarizing the means of all 
#           measurements related to means and standard 
#           deviations, for every subject and activity.


# Read in training and testing data, and added column names from features.txt.

x_train = read.table("X_train.txt")

features = read.table("features.txt")

names(x_train) <- features[,2]

y_train = read.table("y_train.txt")

x_test = read.table("X_test.txt")

names(x_test) <- features[,2]

y_test = read.table("y_test.txt")

# Read in training and testing subject data.

subject_test = read.table("subject_test.txt")

subject_train = read.table("subject_train.txt")

# Read in activity labels.

activity_labels =  read.table("activity_labels.txt")

# Add columns denoting whether data is for training or testing.

xtr2 <- cbind(test="FALSE", x_train)

xte2 <- cbind(test="TRUE", x_test)

# Concatenate training and testing data.

x <- rbind(xtr2, xte2)

# Add activity codes to data.

labels <- rbind(y_train, y_test)

x2 <- cbind(labels,x)

colnames(x2)[1] <- "activity"

# Add subjects so that data can indicate which subject is performing the actions.

subj <- rbind(subject_train, subject_test)

x3 <- cbind(subj,x2)

colnames(x3)[1] <- "subject_id"

# Add a unique ID for testing 

x4 <- cbind(id=1:10299, x3)

# Replace activity codes with text describing the activity.
xbu <- x4

xbu$activity <- replace(xbu$activity, which(xbu$activity == "1"), "WALKING")
xbu$activity <- replace(xbu$activity, which(xbu$activity == "2"), "WALKING_UPSTAIRS")
xbu$activity <- replace(xbu$activity, which(xbu$activity == "3"), "WALKING_DOWNSTAIRS")
xbu$activity <- replace(xbu$activity, which(xbu$activity == "4"), "SITTING")
xbu$activity <- replace(xbu$activity, which(xbu$activity == "5"), "STANDING")
xbu$activity <- replace(xbu$activity, which(xbu$activity == "6"), "LAYING")

# In order to keep only columns measuring the mean or standard deviation,
# find only the columns containing "mean" or "std" in the column name.

newcols <- grep("mean|std", colnames(xbu))

# Keep only the columns needed for the final data set.
  
xbu2 <- xbu[c(1,2,3,4, newcols)]

xbu3 <- xbu2[c(2,3,5:83)]

# Rename columns to make them easier to read. 
# 1) Replace dashes with underscores.
# 2) Remove parentheses.

names(xbu3) <- gsub("-mean[(][])]-", "_mean_", names(xbu3))
names(xbu3) <- gsub("-std[(][])]-", "_std_", names(xbu3))
names(xbu3) <- gsub("-mean[(][])]", "_mean", names(xbu3))
names(xbu3) <- gsub("-std[(][])]", "_std", names(xbu3))
names(xbu3) <- gsub("-meanFreq[(][])]-", "_meanFreq_", names(xbu3))
names(xbu3) <- gsub("-meanFreq[(][])]", "_meanFreq", names(xbu3))

# Summarize data by taking the mean of each variable for each activity and each subject.

library(plyr)

final_data <- ddply(xbu3,c("subject_id", "activity"),numcolwise(mean,na.rm = TRUE))
 
#write.table(final_data, "c:\\Users\\Natpack\\Documents\\GettingAndCleaningData\\Project\\project.txt", row.name=FALSE)

#import_data<-read.table("project.txt", header=T)
#View(import_data)

