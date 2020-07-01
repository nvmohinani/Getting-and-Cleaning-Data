## Codebook

This is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.


## Dataset Description
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Dataset Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Assign each data to variables

features <- features.txt
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAccXYZ and tGyroXYZ.
activities <- activity_labels.txt
List of activities performed when the corresponding measurements were taken and their labels
subject_test <- test/subject_test.txt
contains test data of 9/30 subjects
xTest <- test/X_test.txt 
test data
yTest <- test/y_test.txt
test data activities labels
subject_train <- test/subject_train.txt  
train data of 21/30 subjects
xTrain <- test/X_train.txt
train data
yTrain <- test/y_train.txt 
train data activities labels

## 1. Merges the training and the test sets to create one data set

X: merge xTrain and xTest using rbind() 
Y: merge yTrain and yTest using rbind() 
subject: subject_train and subject_test using rbind() function
mergedData: merge subject, X and Y using cbind() function

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

finalData selects only mean and std measurements

## 3. Uses descriptive activity names to name the activities in the data set

Activities names replace the number labels
 
## 4. Appropriately labels the data set with descriptive variable names

Acc in columnns replaced by Accelerometer
Gyro in columns replaced by Gyroscope
BodyBody in columns replaced by Body
Mag in column’s name replaced by Magnitude
Columns starting with character f replaced by Frequency
Columns starting with character t replaced by Time

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

finalData is grouped by subject and activity summarised takes the means of each variable for each activity and each subject. 

