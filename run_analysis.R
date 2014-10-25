## Read features
features <- read.table(".\\UCIHAR\\features.txt")
fnames <- features[,2]

## Read Activity Names
activityLabels <- read.table(".\\UCIHAR\\activity_labels.txt", col.names=c("activityID", "activityName"))

## PULL Test and Train main data and assign "feature names" as a Column name
testdata <- read.table(".\\UCIHAR\\test\\X_test.txt")
colnames(testdata) <- fnames

traindata <- read.table(".\\UCIHAR\\train\\X_train.txt")
colnames(traindata) <- fnames

## PULL Test and Train subjects and assign "subjectID" as a Column name
testsubjects <- read.table(".\\UCIHAR\\test\\subject_test.txt")
colnames(testsubjects) <- "subjectID"

trainsubjects <- read.table(".\\UCIHAR\\train\\subject_test.txt")
colnames(trainsubjects) <- "subjectID"

## PULL Test and Train activities and assign "activityID" as a Column name
testactivities <- read.table(".\\UCIHAR\\test\\y_test.txt")
colnames(testactivities) <- "activityID"

trainactivities <- read.table(".\\UCIHAR\\train\\y_train.txt")
colnames(trainactivities) <- "activityID"

allTestData <- cbind(testsubjects, testactivities, testdata)
allTrainData <-cbind(trainsubjects, trainactivities, traindata)

## Combine test and train data
allData <- rbind(allTrainData, allTestData)

## Pull out the columns required for the final output
meanColumns <- grep("mean", names(allData), ignore.case=TRUE)
meanColumnNames <- names(allData)[meanColumns]
stdColumns <- grep("std", names(allData), ignore.case=TRUE)
stdColumnNames <- names(allData)[stdColumns]
meanAndStdData <- allData[, c("subjectID", "activityID", meanColumnNames, stdColumnnames)]


meanAndStdData <- allData[, c("subjectID", "activityID", meanColumnNames, stdColumnNames)]

mergedDataset <- merge(activityLabels, meanAndStdData, y.x="activityID", y.y="activityID", all=TRUE)

dataMelt <- melt(mergedDataset, id=c("activityID", "activityName", "subjectID"))

meanData <- dcast(dataMelt, activityID + activityName + subjectID ~ variable, mean)

write.table(meanData, ".\\UCIHAR\\tidy_data.txt", row.name=FALSE)
