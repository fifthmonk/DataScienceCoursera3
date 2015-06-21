## Getting and Cleaning Data
## Course Project

## set your path where datasets are located
my_home_path <- "C:\\Users\\4520\\Documents\\DataScienceCourse3\\UCI HAR Dataset"
setwd(my_home_path)

## Read training data
X_train <- read.table("./train/X_train.txt") #dimension r:7352 c:561
y_train <- read.table("./train/y_train.txt") #dimension r:7352 c:  1
subject_train <- read.table("./train/subject_train.txt") #dimension r:7352 c:  1

## Read testing data
X_test <- read.table("./test/X_test.txt") #dimension r: 2947 c:561
y_test <- read.table("./test/y_test.txt") #dimension r: 2947 c:  1
subject_test <- read.table("./test/subject_test.txt")

## Read feature informations, activity labels about measurements
features <- read.table("features.txt") # dimension r:561 c:2
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("act_id","act_label")

## Step 1. 
## Merge measurements in training and test datasets
X_complete <- rbind(X_train, X_test)

## Merge activities in training and test datasets
y_complete <- rbind(y_train, y_test)
colnames(y_complete) <- c("act_id")

## Merging subject groups in traing and test datasets
subject_complete <- rbind(subject_train, subject_test)
colnames(subject_complete) <- c("subj_grp")

## Step 2. 
## Extracts only the measurements on the mean and standard 
## deviation for each measurement.
idx <- grep("std|mean|Mean", features$V2)
X_complete <- X_complete[idx]

## Step 3.
## Uses descriptive activity names to name the activities in the data set
library(plyr)
y_activity <- join(y_complete,activity_labels)

## Step 4.
## Appropriately labels the data set with descriptive variable names. 
desc_var_names <- features$V2[idx]
colnames(X_complete) <- as.character(desc_var_names)
## Bind activities, subjects and measurements together
X_all_complete <- cbind(y_activity, subject_complete, X_complete)

## Step 5.
## Melting subjects, activities and measurements
library(reshape2)
X_melt <- melt(X_all_complete, id=c("subj_grp", "act_label"), 
               measure.vars = as.character(desc_var_names))

## Casting melting dataframe to get average of each variable for each activity 
## and each subject
subj_act_data <- dcast(X_melt, subj_grp + act_label ~ variable, mean)

## Write out tidy data to file
write.table(subj_act_data, "tidy_data.txt", row.names=FALSE)
