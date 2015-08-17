# **README**



This README contains information about the script `run_analysis.R`, which is posted to the author's webpage on GitHub.  The script and this README are accompanied by a codebook for interpreting observations and variables in the script's output.

**Overview**

The script `run_analysis.R` was written in R version 3.2.1.  It consolidates "messy" smartphone data collected from 30 human test subjects wearing smartphones.  It outputs selected signals in a "tidy" data array as a text file ("cp1_data.txt").

**Course Information**

The script `run_analysis.R` was written for "Getting and Cleaning Data," the third course in a 10-course Data Science sequence presented by Coursera and Johns Hopkins University.  The 10-course sequence is co-taught by Jeff Leek, Roger Peng, and Brian Caffo of the Johns Hopkins Bloomberg School of Public Health.

**Author**

The script `run_analysis.R` was written by A. Nichols in August 2015.

**Source Data**

The smartphone test data was collected and provided for public use by:

Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
`activityrecognition@smartlab.ws`  
`www.smartlab.ws`  

Background information on the smartphone test is available at:  `http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`

The test data, features info, and provider's README are available at:
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

**Human Activities**

The 30 human test subjects (21 in a "training" group, and nine in a "test" group) each carried out six activities while wearing Samsung Galaxy S II smartphones: **(1) walking**, **(2) walking upstairs**, **(3) walking downstairs**, **(4) sitting**, **(5) standing**, and **(6) lying down**.  Testers gathered a variety of signals as the 30 human subjects carried out the six activities (these are discussed on the website and in the files noted above).  The script `run_analysis.R` accesses the source files (when located in the user's working directory for R), consolidates the test data, and presents it in a tidy text file ("cp1_data.txt"), which it saves to the user's working directory.

**Course Project Instructions**

The instructions for the course project were as follows:

You should create one R script called `run_analysis.R` that does the following:   
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

**Required Files/Input**

The following files must be in the user's working directory (decompressed) for `run_analysis.R` to function properly:

activity_labels.txt  
features.txt  
subject_test.txt  
subject_train.txt  
X_test.txt  
X_train.txt  
y_test.txt  
y_train.txt  

These files are available in compressed format at the link noted above.  No other user input is required to enable the script to run.

**Activation**

If the eight source files are present in the user's working directory, the R script can be activated by typing `source("run_analysis.R")` in the user's R command console.  The program takes about 1-2 minutes to run, depending on the user's system.

**Data Processing**

The key to tidying the smartphone data is understanding the content and dimensions of the testers' eight data files.  The script systematically combines data from the eight files into one data set, and outputs one array presented by activity and subject for 79 unique signals (one unique variable per column).

R's "dplyr" package and library must be loaded to run the script.

The input files are structured as follows:

* activity_labels.txt:   a 6 x 2 array that maps activity types to activity numbers  
* features.txt:   a 561 x 2 array of column labels which equate to particular signals  
* subject_test.txt:   a 2947 x 1 array of human subject numbers (for the test group)  
* subject_train.txt:   a 7352 x 1 array of human subject numbers (for the training group)  
* X_test.txt:   a 2947 x 561 array of test set data for nine human subjects  
* X_train.txt:   a 7352 x 561 array of training set data for 21 human subjects  
* y_test.txt:   a 2947 x 1 array of activity numbers for the test data set  
* y_train.txt:   a 7352 x 1 array of activity numbers for the training data set  

**Output**

The script `run_analysis.R` produces one comma-delimited file, "cp1_data.txt", and places it in the user's working directory.  The output is in the form of an array, 180 rows by 81 columns.  (Each of the 30 subjects performed each of the six activities.)  The array is structured as follows:  

* First column:  "activity" (total of six)  
* Second column: "subject" (total of 30)  
* Columns 3-81:  the mean value of all measurements related to a mean or standard deviation of a signal (i.e., sometimes the mean of a mean, or the mean of a standard deviation).  

**Missing Values**

If `run_analysis.R` is used with the specified human activity data, no missing values will appear in the output data file.  If other input files are used, the script might not function.  If existing data input files are changed, the code may produce missing values as "NA" for character data or "0" for numerical data.

**Using the Output Text File**

To use the data produced by this script, a user may use enter a command similar to this in the R command console:

`df <- read.table("cp1_data.txt", header = TRUE, sep = ",")`

**Codebook**

A codebook is available on the author's website on GitHub to help users interpret the observations and variables that appear in the script's output (primarily the names of variables used in the header row for columns 3-81).


**License Information (Provided by the Testers)**

Use of the human activity dataset in publications must be acknowledged by referencing the following publication [1]: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The human activity dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


This README was written by A. Nichols, 17 August 2015.

  
