# Getting and Cleaning Data - Course Project

In run_analysis.R, you need to replace the variable my_home_path to where the Samsung data directory "UCI HAR Dataset" is located. The script run_analysis.R should also be located inside the Samsung data directory

## Dataset Directory Structure
UCI HAR Dataset
 |- run_analysis.R
 |- activity_labels.txt
 |- features_info.txt
 |- features.txt
 |- README.txt
 |- test
     |- subject_test.txt
     |- X_test.txt
     |- y_test.txt
 |- train
     |- subject_train.txt
     |- X_train.txt
     |- y_train.txt

### Steps to run the script
1. set current directory to where run_analysis.R is located
2. run R command: source("run_analysis.R")
3. tidy data would be written to file tidy_data.txt at directory of what defined in variable my_home_path

Thank you.
