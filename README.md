# Documention for creating a tidy data set from the Human Acitivity Recognition Using Smartphone data

Original data described at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data used for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Assumptions for run_analysis.R to complete
I've assumed that the test and train are contained in their respective subdirectory under the parent directory "UCI HAR Dataset"


## Read in variable labels
Get activity labels from "features.txt" file
reformat variable labels using make.names() function [removes _ & ()]

## Read in activity labels
Get activity labels from "activity_labels.txt" file

## Read test data in
read X_test and y_test files from test subdirectory

## Set variable names
add descriptive names to the test, train and subject data sets

## Extract just mean & std variables
use grep() to extract just the variables containing mean and std
end up with data sets containing either 53 (mean) or 33 (std) variables

## Combine data.frames of subject, activity labels and measurements
column bind (cbind) subject id, activiy labels, means and std variables into one data.frame

## Merge activity descriptions
use merge() to merge descriptive activity labels (e.g., 1 = walking, 2 = walking_upstairs, etc.)

## Repeat preceding steps for train data

## Combine test and train data sets into final tidy data set
use rbind() to merge test and train data into one data set

# Prepare to compute means for each variable by subject & activity
## Load library data.table
use data.library package
## Convert data.frame to data.table object
final.tidy<-data.table(all.tidy)
## Compute means for each subject/activity combination
final.means<-final.tidy[,sapply(.SD, function(x) list(mean=mean(x))),by=list(subject,activity.desc)]

## Write tidy data to text file
use write.table() to write final tidy data set out to text file

##Variable list in final tidy data set:
subject
activity.desc
activity.label.mean
tBodyAcc.mean...X.mean
tBodyAcc.mean...Y.mean
tBodyAcc.mean...Z.mean
tGravityAcc.mean...X.mean
tGravityAcc.mean...Y.mean
tGravityAcc.mean...Z.mean
tBodyAccJerk.mean...X.mean
tBodyAccJerk.mean...Y.mean
tBodyAccJerk.mean...Z.mean
tBodyGyro.mean...X.mean
tBodyGyro.mean...Y.mean
tBodyGyro.mean...Z.mean
tBodyGyroJerk.mean...X.mean
tBodyGyroJerk.mean...Y.mean
tBodyGyroJerk.mean...Z.mean
tBodyAccMag.mean...mean
tGravityAccMag.mean...mean
tBodyAccJerkMag.mean...mean
tBodyGyroMag.mean...mean
tBodyGyroJerkMag.mean...mean
fBodyAcc.mean...X.mean
fBodyAcc.mean...Y.mean
fBodyAcc.mean...Z.mean
fBodyAcc.meanFreq...X.mean
fBodyAcc.meanFreq...Y.mean
fBodyAcc.meanFreq...Z.mean
fBodyAccJerk.mean...X.mean
fBodyAccJerk.mean...Y.mean
fBodyAccJerk.mean...Z.mean
fBodyAccJerk.meanFreq...X.mean
fBodyAccJerk.meanFreq...Y.mean
fBodyAccJerk.meanFreq...Z.mean
fBodyGyro.mean...X.mean
fBodyGyro.mean...Y.mean
fBodyGyro.mean...Z.mean
fBodyGyro.meanFreq...X.mean
fBodyGyro.meanFreq...Y.mean
fBodyGyro.meanFreq...Z.mean
fBodyAccMag.mean...mean
fBodyAccMag.meanFreq...mean
fBodyBodyAccJerkMag.mean...mean
fBodyBodyAccJerkMag.meanFreq...mean
fBodyBodyGyroMag.mean...mean
fBodyBodyGyroMag.meanFreq...mean
fBodyBodyGyroJerkMag.mean...mean
fBodyBodyGyroJerkMag.meanFreq...mean
angle.tBodyAccMean.gravity..mean
angle.tBodyAccJerkMean..gravityMean..mean
angle.tBodyGyroMean.gravityMean..mean
angle.tBodyGyroJerkMean.gravityMean..mean
angle.X.gravityMean..mean
angle.Y.gravityMean..mean
angle.Z.gravityMean..mean
tBodyAcc.std...X.mean
tBodyAcc.std...Y.mean
tBodyAcc.std...Z.mean
tGravityAcc.std...X.mean
tGravityAcc.std...Y.mean
tGravityAcc.std...Z.mean
tBodyAccJerk.std...X.mean
tBodyAccJerk.std...Y.mean
tBodyAccJerk.std...Z.mean
tBodyGyro.std...X.mean
tBodyGyro.std...Y.mean
tBodyGyro.std...Z.mean
tBodyGyroJerk.std...X.mean
tBodyGyroJerk.std...Y.mean
tBodyGyroJerk.std...Z.mean
tBodyAccMag.std...mean
tGravityAccMag.std...mean
tBodyAccJerkMag.std...mean
tBodyGyroMag.std...mean
tBodyGyroJerkMag.std...mean
fBodyAcc.std...X.mean
fBodyAcc.std...Y.mean
fBodyAcc.std...Z.mean
fBodyAccJerk.std...X.mean
fBodyAccJerk.std...Y.mean
fBodyAccJerk.std...Z.mean
fBodyGyro.std...X.mean
fBodyGyro.std...Y.mean
fBodyGyro.std...Z.mean
fBodyAccMag.std...mean
fBodyBodyAccJerkMag.std...mean
fBodyBodyGyroMag.std...mean
fBodyBodyGyroJerkMag.std...mean
