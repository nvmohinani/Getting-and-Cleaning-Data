
## Assign and read in data frames

features <- read.table("./features.txt", col.names = c("n", "feature"))
activities <- read.table("./activity_labels.txt", col.names = c("label", "activity"))
subjectTest <- read.table("./test/subject_test.txt", col.names = "subject")
xTest <- read.table("./test/X_test.txt", col.names = features$feature)
yTest <- read.table("./test/y_test.txt", col.names = "label")
subjectTrain <- read.table("./train/subject_train.txt", col.names = "subject")
xTrain <- read.table("./train/X_train.txt", col.names = features$feature)
yTrain <- read.table("./train/y_train.txt", col.names = "label")

## Merge the training and test data sets

X <- rbind(xTrain, xTest)
Y <- rbind(yTrain, yTest)
subject <- rbind(subjectTrain, subjectTest)
mergedData1 <- cbind(subject, Y, X)

## Extract mean and std measurements 

mergedData <- mergedData1 %>% select(subject, label, contains("mean"), contains("std"))

## Create appropriate and descriptive labels for variable names

mergedData$label <- activities[mergedData$label, 2]

names(mergedData)[2] = "activity"
names(mergedData) <- gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData) <- gsub("Gyro", "Gyroscope", names(mergedData))
names(mergedData) <- gsub("BodyBody", "Body", names(mergedData))
names(mergedData) <- gsub("Mag", "Magnitude", names(mergedData))
names(mergedData) <- gsub("^t", "Time", names(mergedData))
names(mergedData) <- gsub("^f", "Frequency", names(mergedData))
names(mergedData) <- gsub("tBody", "TimeBody", names(mergedData))
names(mergedData) <- gsub("-mean()", "Mean", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("-std()", "STD", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("-freq()", "Frequency", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("angle", "Angle", names(mergedData))
names(mergedData) <- gsub("gravity", "Gravity", names(mergedData))

## Summarise dataset by mean of each variable and activity

finalData <- group_by(mergedData, subject, activity)
summarised <- summarise_all(finalData, funs(mean))

write.table(finalData, "finalData.txt", row.names = FALSE)




                