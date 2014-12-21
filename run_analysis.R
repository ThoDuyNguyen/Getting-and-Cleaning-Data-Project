library(dplyr)
library(tidyr)

## The working directory should be set to folder of downloaded data

## Constant for file
FILE_TEST_SUBJECT <- "test//subject_test.txt"
FILE_TEST_ACTIVITY <- "test//y_test.txt"
FILE_TEST_FEATURES_DATA <- "test//X_test.txt"
FILE_TRAIN_SUBJECT <- "train//subject_train.txt"
FILE_TRAIN_ACTIVITY <- "train//y_train.txt"
FILE_TRAIN_FEATURES_DATA <- "train//X_train.txt"
FILE_FEATURES <- "features.txt"
FILE_ACTIVITY <- "activity_labels.txt"
FILE_TIDY_DATA <-


## Constant for indexing
DATA_IDX_SUBJECT <- 1
DATA_IDX_ACTIVITY <- 2
IDX_SUBJECT <- 1
IDX_ACTIVITY <- 1
IDX_ACTIVITY_NAMES <- 2
IDX_FEATURES_NAMES <- 2
NAME_SUBJECT <- "subject"
NAME_ACTIVITY <- "activity"

## Constant for variable names matching pattern
PATTERN <- "mean\\(\\)|std\\(\\)"

## Read test data
## This data frame contains:
##      Column 1 : subject
##      Column 2 : activity
##      Other columns : features
testData <- read.csv(FILE_TEST_FEATURES_DATA, header = FALSE, sep="")
testActivity <- read.csv(FILE_TEST_ACTIVITY, header = FALSE, sep="")
testSubject <- read.csv(FILE_TEST_SUBJECT, header = FALSE, sep = "")
testCombined <- cbind(testSubject[,IDX_SUBJECT],testActivity[,IDX_ACTIVITY], testData)

## Read train data
## This data frame contains:
##      Column 1 : subject
##      Column 2 : activity
##      Other columns : features
trainData <- read.csv(FILE_TRAIN_FEATURES_DATA,header = FALSE,sep="")
trainActivity <- read.csv(FILE_TRAIN_ACTIVITY,header = FALSE,sep="")
trainSubject <- read.csv(FILE_TRAIN_SUBJECT, header = FALSE,sep="")
trainCombined <- cbind(trainSubject[,IDX_SUBJECT], trainActivity[,IDX_ACTIVITY], trainData)

## Merges the training and the test sets to create one data set.
## 2 dataframe should have same column names for rbind works.
names(testCombined) <- names(trainCombined)
combinedData <- rbind(testCombined, trainCombined)


## Read the features, this will be used for features's column name
features <- read.csv(FILE_FEATURES, header = FALSE, sep="",
                     stringsAsFactors = FALSE)
keptFeatures <- grep(PATTERN, features[, IDX_FEATURES_NAMES])
## Extracts only the measurements on the mean and standard deviation for each
## measurement.
combinedData <- combinedData[,c(DATA_IDX_SUBJECT, DATA_IDX_ACTIVITY,
                                2 + keptFeatures)]
names(combinedData) <- c(c(NAME_SUBJECT, NAME_ACTIVITY),
                         tolower(gsub("body.body","body",
                            gsub("..","",
                            gsub("...",".",
                            gsub("([a-z])([A-Z])", "\\1.\\L\\2",
                            make.names(features[,IDX_FEATURES_NAMES][keptFeatures],
                                          unique = TRUE),
                            perl = TRUE),fixed = TRUE), fixed = TRUE), fixed = TRUE)))

## Factor for activity column
activityLabels <- read.csv(FILE_ACTIVITY, header = FALSE,sep=""
                           ,stringsAsFactors = FALSE)
combinedData[,DATA_IDX_ACTIVITY] <- as.factor(combinedData[,DATA_IDX_ACTIVITY])
levels(combinedData[,DATA_IDX_ACTIVITY]) <- activityLabels[,IDX_ACTIVITY_NAMES]



## Calculate the mean ( group by subject, activity)
meanData <- combinedData %>%
    group_by(subject,activity) %>%
    summarise_each(funs(mean))

## Tidy the data frame
tidyData <- gather(meanData, feature, value, -subject, -activity)

write.table(tidyData,  row.name=FALSE, file = "tidyData.txt")
