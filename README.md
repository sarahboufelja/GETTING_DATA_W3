# GETTING_DATA_W3
W3 assignment of getting data course
==================================================================
SCRIPT FOR CONVERTING THE "Human Activity Recognition Using Smartphones Dataset" RAW DATA
INTO TIDY DATA SET. 
Version 1.0

==================================================================

The "run_analysis.R" takes as in input the .zip file from the UCI project for human activity project located in the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and produces a tidy data set summarizing the mean of some variables, per activity and per subject. 

To run the script, you should first download and place the previous zip file in your R directory. 

The script unzips and reads the following files:

-- features.txt: containing the list of the measured features. There are 561 features derived from the acceleration and the velocity measured by the portable devices. However, the script will keep only the mean and std measures.

-- X_train and X_test.txt: containing the train and test data respectively. 

-- y_train and y_test.txt: containing the tests' labels (six different activities have been conducted and their definition is found in the activity_labels.txt file). 

-- subject_train and subject_test.txt: contains the id of the subject conducting the experiment (30 subjects have participated in the experiment)


The script then clips the data together by adding the activity, the subject's label, the features' names and putting finally the test and train data together. 

The obtained data set is then passed through a test to assess the uniqueness of the columns and remove any duplicates. 

We select the columns corresponding to the std and avg of the calculated features. 

In order to make things more understandable, we add a new column to identify the activity using the information stored in the activity_labels.txt file. 

We create a new tidy data set in order to calculate the mean of the selected columns earlier, grouped by the subject_id and the activity label. 

Finally, the latter data set is written as .txt file in the following file: course_project_tidy_data.txt

To load this data into R, please use the following command: read.table("course_project_tidy_data.txt",header=TRUE). 




Reference
========

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
