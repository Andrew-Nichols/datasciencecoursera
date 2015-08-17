# **CODE BOOK**



This code book is intended to clarify the meaning of all variables produced by the script `run_analysis.R`, which produces the file "cp1_data.txt".  Readers can view the README document that accompanies the code for additional details.

The documentation for the source data on human activity recorded via smartphone is not always clear, so this code book offers a best assessment of that documentation and explains what it means for the output file of `run_analysis.R`.

As discussed in the README document for `run_analysis.R`, the human activity test included 30 human subjects, each of whom performed six individual activities while having their actions recorded via accelerometers in a smartphone.  The six activities included:

1. walking  
2. walking upstairs  
3. wallking downstairs  
4. sitting  
5. standing
6. lying down

The output file for "cp1_data.txt" lists the **average value** of 79 individual signals representing mean measures and standard deviations of 79 different test signals.  These averages appear in columns 3-81 of the output file, and are listed in rows 3-81, below.  In the output file, the averages are summarized by activity (column 1) and subject (column 2).  Each of the 30 test subjects performed each activity, so the output data set has 180 rows (plus a header row), and 81 columns (which include the 'activity' column, the 'subject' column, and 79 columns with average values).

The primary test measurements included 3-axis linear accelerations produced by each subject, and 3-axis angular velocities, each measured at a constant rate of 50 Hz.  The test documentation says the measurements were "normalized and bounded within [-1, 1]."   

It appears linear acceleratons along three axes (x, y, and z) were normalized with respect to the acceleration due to the force of gravity (approximately 32.2 ft/sec^2^, or 9.8 meters/sec^2^), thus all measurements appear as fractions of +1 or -1.  As a reminder, one "g" is approximately equal to 32.2 ft/sec^2^ or 9.8 meters/sec^2^.  

The testers report they measured angular velocities about three axes (x, y, and z) in radians per second (rad/sec), and normalized and bounded these measurements on a scale of [-1, 1] (inclusive). 

The testers' original variable names have been shortened for use in `run_analysis.R` and its output file.  A cross-reference to the original variable names is provided below.

The identifiers used in the shortened variable names include the following:

* "avg" - average value (appears in column headers for "cp1_data.txt")
* "t" - time measures taken at 50 Hz
* "f" - frequency domain signals
* "BdAc" - body acceleration (acceleration due to physical body movement)
* "GrAc" - gravity acceleration (acceleration due to the force of gravity)
* "Jerk" - refers to accelerations due to sharp physical movement
* "mean" - mean value of a signal
* "std" - standard deviation of a signal
* "x", "y", or "z" - reference axes for subjects' movements
* "Mag" - magnitude
* "Freq" - frequency
* "(g)" - signal measured as a fraction of the acceleration due to gravity
* "(rad/sec)" - angular velocity measured in radians per second
  
  
**Col.  New_Variable_Name  (units)**  
1.  activity  (named)  
2.  subj  (integer, 1-30)  
3.  tBdAc_mean_x  (g)  
4.  tBdAc_mean_y  (g)  
5.  tBdAc_mean_z  (g)  
6.  tBdAc_std_x  (g)  
7.  tBdAc_std_y  (g)  
8.  tBdAc_std_z  (g)  
9.  tGrAc_mean_x  (g)  
10.  tGrAc_mean_y  (g)  
11.  tGrAc_mean_z  (g)  
12.  tGrAc_std_x  (g)  
13.  tGrAc_std_y  (g)  
14.  tGrAc_std_z  (g)  
15.  tBdAcJerk_mean_x  (g)  
16.  tBdAcJerk_mean_y  (g)  
17.  tBdAcJerk_mean_z  (g)  
18.  tBdAcJerk_std_x  (g)  
19.  tBdAcJerk_std_y  (g)  
20.  tBdAcJerk_std_z  (g)  
21.  tBdGy_mean_x  (rad/sec)  
22.  tBdGy_mean_y  (rad/sec)  
23.  tBdGy_mean_z  (rad/sec)  
24.  tBdGy_std_x  (rad/sec)  
25.  tBdGy_std_y  (rad/sec)  
26.  tBdGy_std_z  (rad/sec)  
27.  tBdGyJerk_mean_x  (rad/sec)  
28.  tBdGyJerk_mean_y  (rad/sec)  
29.  tBdGyJerk_mean_z  (rad/sec)  
30.  tBdGyJerk_std_x  (rad/sec)  
31.  tBdGyJerk_std_y  (rad/sec)  
32.  tBdGyJerk_std_z  (rad/sec)  
33.  tBdAcMag_mean  (g)  
34.  tBdAcMag_std  (g)  
35.  tGrAcMag_mean  (g)  
36.  tGrAcMag_std  (g)  
37.  tBdAcJerkMag_mean  (g)  
38.  tBdAcJerkMag_std  (g)  
39.  tBdGyMag_mean  (rad/sec)  
40.  tBdGyMag_std  (rad/sec)  
41.  tBdGyJerkMag_mean  (rad/sec)  
42.  tBdGyJerkMag_std  (rad/sec)  
43.  fBdAc_mean_x  (g)  
44.  fBdAc_mean_y  (g)  
45.  fBdAc_mean_z  (g)  
46.  fBdAc_std_x  (g)  
47.  fBdAc_std_y  (g)  
48.  fBdAc_std_z  (g)  
49.  fBdAc_meanFreq_x  (g)  
50.  fBdAc_meanFreq_y  (g)  
51.  fBdAc_meanFreq_z  (g)  
52.  fBdAcJerk_mean_x  (g)  
53.  fBdAcJerk_mean_y  (g)  
54.  fBdAcJerk_mean_z  (g)  
55.  fBdAcJerk_std_x  (g)  
56.  fBdAcJerk_std_y  (g)  
57.  fBdAcJerk_std_z  (g)  
58.  fBdAcJerk_meanFreq_x  (g)  
59.  fBdAcJerk_meanFreq_y  (g)  
60.  fBdAcJerk_meanFreq_z  (g)  
61.  fBdGy_mean_x  (rad/sec)  
62.  fBdGy_mean_y  (rad/sec)  
63.  fBdGy_mean_z  (rad/sec)  
64.  fBdGy_std_x  (rad/sec)  
65.  fBdGy_std_y  (rad/sec)  
66.  fBdGy_std_z  (rad/sec)  
67.  fBdGy_meanFreq_x  (rad/sec)  
68.  fBdGy_meanFreq_y  (rad/sec)  
69.  fBdGy_meanFreq_z  (rad/sec)  
70.  fBdAcMag_mean  (g)  
71.  fBdAcMag_std  (g)  
72.  fBdAcMag_meanFreq  (g)  
73.  fBdAcJerkMag_mean  (g)  
74.  fBdAcJerkMag_std  (g)  
75.  fBdAcJerkMag_meanFreq  (g)  
76.  fBdGyMag_mean  (rad/sec)  
77.  fBdGyMag_std  (rad/sec)  
78.  fBdGyMag_meanFreq  (rad/sec)  
79.  fBdGyJerkMag_mean  (rad/sec)  
80.  fBdGyJerkMag_std  (rad/sec)  
81.  fBdGyJerkMag_meanFreq  (rad/sec)  
  
  
For your reference, the following list maps the variable names produced by `run_analysis.R` in "cp1_data.txt" to the original variable names used by the test team in Genoa, Italy. (While additional spaces were entered between the variable names in the draft .Rmd document that produced this code book, the spaces mostly disappeared during the transition to a .md document, making the list more challenging to read.)
  
  
**Col. New_Variable_Name      Original_Variable_Name     (units)**  
1. activity     NA     (named)   
2. subj     NA     (integer, 1-30)  
3. tBdAc_mean_x      tBodyAcc-mean()-X     (g)  
4. tBdAc_mean_y      tBodyAcc-mean()-Y     (g)  
5. tBdAc_mean_z      tBodyAcc-mean()-Z     (g)  
6. tBdAc_std_x      tBodyAcc-std()-X     (g)  
7. tBdAc_std_y      tBodyAcc-std()-Y     (g)  
8. tBdAc_std_z      tBodyAcc-std()-Z     (g)  
9. tGrAc_mean_x      tGravityAcc-mean()-X     (g)  
10. tGrAc_mean_y      tGravityAcc-mean()-Y     (g)  
11. tGrAc_mean_z      tGravityAcc-mean()-Z     (g)  
12. tGrAc_std_x      tGravityAcc-std()-X     (g)  
13. tGrAc_std_y      tGravityAcc-std()-Y     (g)  
14. tGrAc_std_z      tGravityAcc-std()-Z     (g)  
15. tBdAcJerk_mean_x      tBodyAccJerk-mean()-X     (g)  
16. tBdAcJerk_mean_y      tBodyAccJerk-mean()-Y     (g)  
17. tBdAcJerk_mean_z      tBodyAccJerk-mean()-Z     (g)  
18. tBdAcJerk_std_x      tBodyAccJerk-std()-X     (g)  
19. tBdAcJerk_std_y      tBodyAccJerk-std()-Y     (g)  
20. tBdAcJerk_std_z      tBodyAccJerk-std()-Z     (g)  
21. tBdGy_mean_x      tBodyGyro-mean()-X     (rad/sec)  
22. tBdGy_mean_y      tBodyGyro-mean()-Y     (rad/sec)  
23. tBdGy_mean_z      tBodyGyro-mean()-Z     (rad/sec)  
24. tBdGy_std_x      tBodyGyro-std()-X     (rad/sec)  
25. tBdGy_std_y      tBodyGyro-std()-Y     (rad/sec)  
26. tBdGy_std_z      tBodyGyro-std()-Z     (rad/sec)  
27. tBdGyJerk_mean_x      tBodyGyroJerk-mean()-X     (rad/sec)  
28. tBdGyJerk_mean_y      tBodyGyroJerk-mean()-Y     (rad/sec)  
29. tBdGyJerk_mean_z      tBodyGyroJerk-mean()-Z     (rad/sec)  
30. tBdGyJerk_std_x      tBodyGyroJerk-std()-X     (rad/sec)  
31. tBdGyJerk_std_y      tBodyGyroJerk-std()-Y     (rad/sec)  
32. tBdGyJerk_std_z      tBodyGyroJerk-std()-Z     (rad/sec)  
33. tBdAcMag_mean      tBodyAccMag-mean()     (g)  
34. tBdAcMag_std      tBodyAccMag-std()     (g)  
35. tGrAcMag_mean      tGravityAccMag-mean()     (g)  
36. tGrAcMag_std      tGravityAccMag-std()     (g)  
37. tBdAcJerkMag_mean      tBodyAccJerkMag-mean()     (g)  
38. tBdAcJerkMag_std      tBodyAccJerkMag-std()     (g)  
39. tBdGyMag_mean      tBodyGyroMag-mean()     (rad/sec)  
40. tBdGyMag_std      tBodyGyroMag-std()     (rad/sec)  
41. tBdGyJerkMag_mean      tBodyGyroJerkMag-mean()     (rad/sec)  
42. tBdGyJerkMag_std      tBodyGyroJerkMag-std()     (rad/sec)  
43. fBdAc_mean_x      fBodyAcc-mean()-X     (g)  
44. fBdAc_mean_y      fBodyAcc-mean()-Y     (g)  
45. fBdAc_mean_z      fBodyAcc-mean()-Z     (g)  
46. fBdAc_std_x      fBodyAcc-std()-X     (g)  
47. fBdAc_std_y      fBodyAcc-std()-Y     (g)  
48. fBdAc_std_z      fBodyAcc-std()-Z     (g)  
49. fBdAc_meanFreq_x      fBodyAcc-meanFreq()-X     (g)  
50. fBdAc_meanFreq_y      fBodyAcc-meanFreq()-Y     (g)  
51. fBdAc_meanFreq_z      fBodyAcc-meanFreq()-Z     (g)  
52. fBdAcJerk_mean_x      fBodyAccJerk-mean()-X     (g)  
53. fBdAcJerk_mean_y      fBodyAccJerk-mean()-Y     (g)  
54. fBdAcJerk_mean_z      fBodyAccJerk-mean()-Z     (g)  
55. fBdAcJerk_std_x      fBodyAccJerk-std()-X     (g)  
56. fBdAcJerk_std_y      fBodyAccJerk-std()-Y     (g)  
57. fBdAcJerk_std_z      fBodyAccJerk-std()-Z     (g)  
58. fBdAcJerk_meanFreq_x      fBodyAccJerk-meanFreq()-X     (g)  
59. fBdAcJerk_meanFreq_y      fBodyAccJerk-meanFreq()-Y     (g)  
60. fBdAcJerk_meanFreq_z      fBodyAccJerk-meanFreq()-Z     (g)  
61. fBdGy_mean_x      fBodyGyro-mean()-X     (rad/sec)  
62. fBdGy_mean_y      fBodyGyro-mean()-Y     (rad/sec)  
63. fBdGy_mean_z      fBodyGyro-mean()-Z     (rad/sec)  
64. fBdGy_std_x      fBodyGyro-std()-X     (rad/sec)  
65. fBdGy_std_y      fBodyGyro-std()-Y     (rad/sec)  
66. fBdGy_std_z      fBodyGyro-std()-Z     (rad/sec)  
67. fBdGy_meanFreq_x      fBodyGyro-meanFreq()-X     (rad/sec)  
68. fBdGy_meanFreq_y      fBodyGyro-meanFreq()-Y     (rad/sec)  
69. fBdGy_meanFreq_z      fBodyGyro-meanFreq()-Z     (rad/sec)  
70. fBdAcMag_mean      fBodyAccMag-mean()     (g)  
71. fBdAcMag_std      fBodyAccMag-std()     (g)  
72. fBdAcMag_meanFreq      fBodyAccMag-meanFreq()     (g)  
73. fBdAcJerkMag_mean      fBodyBodyAccJerkMag-mean()     (g)  
74. fBdAcJerkMag_std      fBodyBodyAccJerkMag-std()     (g)  
75. fBdAcJerkMag_meanFreq      fBodyBodyAccJerkMag-meanFreq()     (g)  
76. fBdGyMag_mean      fBodyBodyGyroMag-mean()     (rad/sec)  
77. fBdGyMag_std      fBodyBodyGyroMag-std()     (rad/sec)  
78. fBdGyMag_meanFreq      fBodyBodyGyroMag-meanFreq()     (rad/sec)  
79. fBdGyJerkMag_mean      fBodyBodyGyroJerkMag-mean()     (rad/sec)  
80. fBdGyJerkMag_std      fBodyBodyGyroJerkMag-std()     (rad/sec)  
81. fBdGyJerkMag_meanFreq      fBodyBodyGyroJerkMag-meanFreq()     (rad/sec)  
  

Analysts and researchers requiring additional details about the test measurements should view the "README.txt" and "features_info.txt" files provided by the test personnel.  These files are available at the following link:  
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

Additional background information on the smartphone test is available here:  `http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`

Test personnel may be contacted with the following information:

Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
`activityrecognition@smartlab.ws`  
`www.smartlab.ws`  

This code book was written by A. Nichols, 17 August 2015.
  

  
  
