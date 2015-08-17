# Coursera - Data Science Course 3:  Getting and Cleaning Data
# Course Project
# Submitter:  A. Nichols
# Date: 17 August 2015

# setwd("C:/Users/Andrew/Documents/Coursera/Data_Science_JHU/3_-_GetData/cp1data2")
# source("run_analysis.R")

library(dplyr)	# Load the "dplyr" package and its library

# Read-in the human activity data (smartphone data)

labels <- read.table("activity_labels.txt")	# 6 x 2 (maps activity types to numbers)
features <- read.table("features.txt")		# 561 x 2 (column label = signal)
s_test <- read.table("subject_test.txt")		# 2947 x 1 (subject #'s for test set)
s_train <- read.table("subject_train.txt")	# 7352 x 1 (subject #'s for training set)
x_test <- read.table("X_test.txt")			# 2947 x 561 (test set data, 9 people/subjects)
x_train <- read.table("X_train.txt")		# 7352 x 561 (training set data, 21 people/subjects)
y_test <- read.table("y_test.txt")			# 2947 x 1 (activity numbers for test data)
y_train <- read.table("y_train.txt")		# 7352 x 1 (activity numbers for training data)

# Consolidate the eight files into one tidy data set

data1 <- rbind(x_train, x_test)			# 10299 x 561
data1$group <- "NA"
data1$group[1:7352] <- "training"
data1$group[7353:10299] <- "test"
data1$subj <- 0
data1$subj[1:7352] <- s_train[1:7352,1]
data1$subj[7353:10299] <- s_test[1:2947,1]
data1$subj <- as.numeric(data1$subj)
data1$act_num <- "NA"
data1$act_num[1:7352] <- y_train[1:7352,1]
data1$act_num[7353:10299] <- y_test[1:2947,1]	# data1:  10299 x 564

channel <- features %>% mutate(col_label=as.character(V2)) %>% select(col_label)
names(data1)[1:561] <- channel[1:561,1]

# Assign appropriate names to the human activities represented in the data

activity_names <- c('walking', 'walking_up', 'walking_down', 'sitting', 
	'standing', 'lying_down')
data1$activity <- as.numeric(data1$act_num)
data1$activity <- activity_names[data1$activity]

# Extract only the measurements of mean and standard deviation

v <- names(data1)
v2 <- grep(("mean|std|group|subj|act_num|activity"),v)
data2 <- data1[,v2]

# Clarify and tidy the column names (one column per variable)

colnames(data2) <- c('tBdAc_mean_x', 'tBdAc_mean_y', 'tBdAc_mean_z', 'tBdAc_std_x',
	'tBdAc_std_y', 'tBdAc_std_z', 'tGrAc_mean_x', 'tGrAc_mean_y', 'tGrAc_mean_z',
	'tGrAc_std_x', 'tGrAc_std_y', 'tGrAc_std_z', 'tBdAcJerk_mean_x',
	'tBdAcJerk_mean_y', 'tBdAcJerk_mean_z', 'tBdAcJerk_std_x', 'tBdAcJerk_std_y',
	'tBdAcJerk_std_z', 'tBdGy_mean_x', 'tBdGy_mean_y', 'tBdGy_mean_z',
	'tBdGy_std_x', 'tBdGy_std_y', 'tBdGy_std_z', 'tBdGyJerk_mean_x', 
	'tBdGyJerk_mean_y', 'tBdGyJerk_mean_z', 'tBdGyJerk_std_x', 'tBdGyJerk_std_y',
	'tBdGyJerk_std_z', 'tBdAcMag_mean', 'tBdAcMag_std', 'tGrAcMag_mean',
	'tGrAcMag_std', 'tBdAcJerkMag_mean', 'tBdAcJerkMag_std', 'tBdGyMag_mean',
	'tBdGyMag_std', 'tBdGyJerkMag_mean', 'tBdGyJerkMag_std', 'fBdAc_mean_x',
	'fBdAc_mean_y', 'fBdAc_mean_z', 'fBdAc_std_x', 'fBdAc_std_y', 'fBdAc_std_z',
	'fBdAc_meanFreq_x', 'fBdAc_meanFreq_y', 'fBdAc_meanFreq_z', 'fBdAcJerk_mean_x',
	'fBdAcJerk_mean_y', 'fBdAcJerk_mean_z', 'fBdAcJerk_std_x', 'fBdAcJerk_std_y',
	'fBdAcJerk_std_z', 'fBdAcJerk_meanFreq_x', 'fBdAcJerk_meanFreq_y',
	'fBdAcJerk_meanFreq_z', 'fBdGy_mean_x', 'fBdGy_mean_y', 'fBdGy_mean_z',
	'fBdGy_std_x', 'fBdGy_std_y', 'fBdGy_std_z', 'fBdGy_meanFreq_x', 
	'fBdGy_meanFreq_y', 'fBdGy_meanFreq_z', 'fBdAcMag_mean', 'fBdAcMag_std',
	'fBdAcMag_meanFreq', 'fBdAcJerkMag_mean', 'fBdAcJerkMag_std',
	'fBdAcJerkMag_meanFreq', 'fBdGyMag_mean', 'fBdGyMag_std', 'fBdGyMag_meanFreq',
	'fBdGyJerkMag_mean', 'fBdGyJerkMag_std', 'fBdGyJerkMag_meanFreq',
	'group', 'subj', 'act_num', 'activity')

# Summarize observations by row (first by activity (col. 1), then by subject (col. 2))
# Output the mean of relevant signals (one variable per column, (col. 3-81))

data3 <- select(data2, subj, activity, 1:79)
data3 <- arrange(data3, subj, activity)

data4 <- ddply(data3, c("activity", "subj"), summarize,
	avg_tBdAc_mean_x = mean(tBdAc_mean_x),
	avg_tBdAc_mean_y = mean(tBdAc_mean_y), 
	avg_tBdAc_mean_z = mean(tBdAc_mean_z),
	avg_tBdAc_std_x = mean(tBdAc_std_x), 
	avg_tBdAc_std_y = mean(tBdAc_std_y),
	avg_tBdAc_std_z = mean(tBdAc_std_z),
	avg_tGrAc_mean_x = mean(tGrAc_mean_x),
	avg_tGrAc_mean_y = mean(tGrAc_mean_y),
	avg_tGrAc_mean_z = mean(tGrAc_mean_z),
	avg_tGrAc_std_x = mean(tGrAc_std_x),
	avg_tGrAc_std_y = mean(tGrAc_std_y),
	avg_tGrAc_std_z = mean(tGrAc_std_z),
	avg_tBdAcJerk_mean_x = mean(tBdAcJerk_mean_x),
	avg_tBdAcJerk_mean_y = mean(tBdAcJerk_mean_y),
	avg_tBdAcJerk_mean_z = mean(tBdAcJerk_mean_z),
	avg_tBdAcJerk_std_x = mean(tBdAcJerk_std_x),
	avg_tBdAcJerk_std_y = mean(tBdAcJerk_std_y),
	avg_tBdAcJerk_std_z = mean(tBdAcJerk_std_z),
	avg_tBdGy_mean_x = mean(tBdGy_mean_x),
	avg_tBdGy_mean_y = mean(tBdGy_mean_y),
	avg_tBdGy_mean_z = mean(tBdGy_mean_z),
	avg_tBdGy_std_x = mean(tBdGy_std_x),
	avg_tBdGy_std_y = mean(tBdGy_std_y),
	avg_tBdGy_std_z = mean(tBdGy_std_z),
	avg_tBdGyJerk_mean_x = mean(tBdGyJerk_mean_x),
	avg_tBdGyJerk_mean_y = mean(tBdGyJerk_mean_y),
	avg_tBdGyJerk_mean_z = mean(tBdGyJerk_mean_z),
	avg_tBdGyJerk_std_x = mean(tBdGyJerk_std_x),
	avg_tBdGyJerk_std_y = mean(tBdGyJerk_std_y),
	avg_tBdGyJerk_std_z = mean(tBdGyJerk_std_z),
	avg_tBdAcMag_mean = mean(tBdAcMag_mean),
	avg_tBdAcMag_std = mean(tBdAcMag_std),
	avg_tGrAcMag_mean = mean(tGrAcMag_mean),
	avg_tGrAcMag_std = mean(tGrAcMag_std),
	avg_tBdAcJerkMag_mean = mean(tBdAcJerkMag_mean),
	avg_tBdAcJerkMag_std = mean(tBdAcJerkMag_std),
	avg_tBdGyMag_mean = mean(tBdGyMag_mean),
	avg_tBdGyMag_std = mean(tBdGyMag_std),
	avg_tBdGyJerkMag_mean = mean(tBdGyJerkMag_mean),
	avg_tBdGyJerkMag_std = mean(tBdGyJerkMag_std),
	avg_fBdAc_mean_x = mean(fBdAc_mean_x),
	avg_fBdAc_mean_y = mean(fBdAc_mean_y),
	avg_fBdAc_mean_z = mean(fBdAc_mean_z),
	avg_fBdAc_std_x = mean(fBdAc_std_x),
	avg_fBdAc_std_y = mean(fBdAc_std_y),
	avg_fBdAc_std_z = mean(fBdAc_std_z),
	avg_fBdAc_meanFreq_x = mean(fBdAc_meanFreq_x),
	avg_fBdAc_meanFreq_y = mean(fBdAc_meanFreq_y),
	avg_fBdAc_meanFreq_z = mean(fBdAc_meanFreq_z),
	avg_fBdAcJerk_mean_x = mean(fBdAcJerk_mean_x),
	avg_fBdAcJerk_mean_y = mean(fBdAcJerk_mean_y),
	avg_fBdAcJerk_mean_z = mean(fBdAcJerk_mean_z),
	avg_fBdAcJerk_std_x = mean(fBdAcJerk_std_x),
	avg_fBdAcJerk_std_y = mean(fBdAcJerk_std_y),
	avg_fBdAcJerk_std_z = mean(fBdAcJerk_std_z),
	avg_fBdAcJerk_meanFreq_x = mean(fBdAcJerk_meanFreq_x),
	avg_fBdAcJerk_meanFreq_y = mean(fBdAcJerk_meanFreq_y),
	avg_fBdAcJerk_meanFreq_z = mean(fBdAcJerk_meanFreq_z),
	avg_fBdGy_mean_x = mean(fBdGy_mean_x),
	avg_fBdGy_mean_y = mean(fBdGy_mean_y),
	avg_fBdGy_mean_z = mean(fBdGy_mean_z),
	avg_fBdGy_std_x = mean(fBdGy_std_x),
	avg_fBdGy_std_y = mean(fBdGy_std_y),
	avg_fBdGy_std_z = mean(fBdGy_std_z),
	avg_fBdGy_meanFreq_x = mean(fBdGy_meanFreq_x),
	avg_fBdGy_meanFreq_y = mean(fBdGy_meanFreq_y),
	avg_fBdGy_meanFreq_z = mean(fBdGy_meanFreq_z),
	avg_fBdAcMag_mean = mean(fBdAcMag_mean),
	avg_fBdAcMag_std = mean(fBdAcMag_std),
	avg_fBdAcMag_meanFreq = mean(fBdAcMag_meanFreq),
	avg_fBdAcJerkMag_mean = mean(fBdAcJerkMag_mean),
	avg_fBdAcJerkMag_std = mean(fBdAcJerkMag_std),
	avg_fBdAcJerkMag_meanFreq = mean(fBdAcJerkMag_meanFreq),
	avg_fBdGyMag_mean = mean(fBdGyMag_mean),
	avg_fBdGyMag_std = mean(fBdGyMag_std),
	avg_fBdGyMag_meanFreq = mean(fBdGyMag_meanFreq),
	avg_fBdGyJerkMag_mean = mean(fBdGyJerkMag_mean),
	avg_fBdGyJerkMag_std = mean(fBdGyJerkMag_std),
	avg_fBdGyJerkMag_meanFreq = mean(fBdGyJerkMag_meanFreq))

# Write the tidy data set to a comma-delimited txt file

write.table(data4, "cp1_data.txt", sep=",", row.name=FALSE)

# Once the output file exists, users may read it into R
# using a command similar to this:
# df <- read.table("cp1_data.txt", header = TRUE, sep = ",")

###### End of Program #####



