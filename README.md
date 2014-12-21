---
title: "ReadMe"
output: html_document
---


####Data using in the script
This section present used data file in the script Unused files is obmitted.

```
UCI HAR Dataset:.
|   activity_labels.txt
|   features.txt
|
+---test
|   |   subject_test.txt
|   |   X_test.txt
|   |   y_test.txt
|
\---train
    |   subject_train.txt
    |   X_train.txt
    |   y_train.txt
```
####Merges the training and the test sets to create one data set.
Data splits into 3 files. Before making a combined data set include test and trainning, we construct test data set and trainning data set

#####Make test data set
- Read data from "subject_test.txt", "y_test.txt", "X_test.txt"  into data frames
- Using cbind to merge into testCombined.

```
+-----------------+-------------------+---------------------------------------+
|    subject      |   activity        |           features (561 columns)      |
|                 |                   |                                       |
| subject_test.txt|   y_test.txt      |          X_test.txt                   |
+-----------------+-------------------+---------------------------------------+
|                 |                   |                                       |
|                 |                   |                                       |
+-----------------+-------------------+---------------------------------------+
   
```

#####Make train data set
- Read data from "subject_train.txt", "y_train.txt", "X_train.txt" data frames
- Use cbind to merge to trainCombined.

```
+-----------------+-------------------+---------------------------------------+
|    subject      |   activity        |           features   (561 columns)    |
|                 |                   |                                       |
|subject_train.txt|   y_train.txt     |          X_train.txt                  |
+-----------------+-------------------+---------------------------------------+
|                 |                   |                                       |
|                 |                   |                                       |
+-----------------+-------------------+---------------------------------------+
```

#####Combine test and train data set
- Use rbind to merge testCombined and trainCombined into combinedData.
```                                                                          
 +-----------------+-------------------+---------------------------------------+ 
 |                 |                   |                                       | 
 |    subject      |   activity        |           features   (561 columns)    | 
 |                 |                   |                                       | 
 +-----------------+-------------------+---------------------------------------+ 
 |                          test data                                          | 
 |                                                                             | 
 -------------------------------------------------------------------------------
 |                          train data                                         | 
 |                                                                             | 
 +-----------------+-------------------+---------------------------------------+ 
```

####Extracts only the measurements on the mean and standard deviation for each measurement
- Read feature names from "features.txt"
- Use grep to determine feature contains "mean()" or "std()", result stored to keptFeatures.
- Subset combinedData, features columns are kept is defined in keptFeatures (notice that column index 1 and column index 2 must be reserved for "subject" and "activity" so indexes in keptFeatures have an addition of 2)

####Uses descriptive activity names to name the activities in the data set
- Read desriptive name of activity from "activity_labels.txt" to activityLabels
- Convert activity column to factor 
- Set levels of activity column using activityLabels. 

####Appropriately labels the data set with descriptive variable names.
- Feature names are used to name the variables (column names). 
- Column names are refined with make.names to make sure columns have legitimate and unique names. After refined, they are transformed to lower case with dot as identifier (follow R coding convention of Google: http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml). Final column names look like: "t.body.acc.mean.sub.x" 

####Create a second, independent tidy data set with the average of each variable for each activity and each subject
There is not missing value in the data set. Also column names have already refined in the last step.   

#####Calculate the mean ( group by subject, activity)
Using dplyr package with group_by and summarise to calculate the mean of feature base on subject and activity.

#####Make tidy data
All feature variables are normalized, floating value bounded within [-1,1] and unit-free. Therefore, we could combine all faeture vectors into 1 vector. On the other hand, there is not any specific requirement for this tidy set. Long format is choosed for this data set. 
This tidy data set contains 4 columns: 
- subject : id of the participant
- activity : activity to be measured
- feature : feature to be measure
- mean.value : mean value feature calculate in the next step. 
We use "gather" function from tidyr package to tidy data set. 

###Code book

####subject
id of the person who participate the experiments. This integer value bounded within [1,30] 

####activity
Type of activity of the volunteer which was monitored. There are 6 types: 

- **WALKING**
- **WALKING_UPSTAIRS**
- **WALKING_DOWNSTAIRS**
- **SITTING**
- **STANDING**
- **LAYING**

####feature
Feature of the activity. There are 66 feature:

- **t.body.acc.mean.x**         mean of time domain signal of body acceleration in X axis
- **t.body.acc.mean.y**         mean of time domain signal of body acceleration in Y axis
- **t.body.acc.mean.z**         mean of time domain signal of body acceleration in Z axis
- **t.body.acc.std.x**         standard deviation of time domain signal of body acceleration in X axis
- **t.body.acc.std.y**         standard deviation of time domain signal of body acceleration in Y axis
- **t.body.acc.std.z**         standard deviation of time domain signal of body acceleration in Z axis
- **t.gravity.acc.mean.x**         mean of time domain signal of gravity acceleration in X axis
- **t.gravity.acc.mean.y**         mean of time domain signal of gravity acceleration in Y axis
- **t.gravity.acc.mean.z**         mean of time domain signal of gravity acceleration in Z axis
- **t.gravity.acc.std.x**         standard deviation of time domain signal of gravity acceleration in X axis
- **t.gravity.acc.std.y**         standard deviation of time domain signal of gravity acceleration in Y axis
- **t.gravity.acc.std.z**         standard deviation of time domain signal of gravity acceleration in Z axis
- **t.body.acc.jerk.mean.x**         mean of obtaining Jerk signal from time domain signal  of body accelaration in X axis
- **t.body.acc.jerk.mean.y**         mean of obtaining Jerk signal from time domain signal of body accelaration in Y axis
- **t.body.acc.jerk.mean.z**         mean of obtaining Jerk signal from time domain signal of body accelaration in Z axis
- **t.body.acc.jerk.std.x**         standard deviation  of obtaining Jerk signal from time domain signal of body accelaration in X axis
- **t.body.acc.jerk.std.y**         standard deviation   of obtaining Jerk signal from time domain signal of body accelaration in X axis
- **t.body.acc.jerk.std.z**         standard deviation   of obtaining Jerk signal from time domain signal of body accelaration in X axis
- **t.body.gyro.mean.x**         mean of time domain signal of body gyro in X axis
- **t.body.gyro.mean.y**         mean of time domain signal of body gyro in Y axis
- **t.body.gyro.mean.z**         mean of time domain signal of body gyro in Z axis
- **t.body.gyro.std.x**         standard deviation of time domain signal of body gyro in X axis
- **t.body.gyro.std.y**         standard deviation of time domain signal of body gyro in Y axis
- **t.body.gyro.std.z**         standard deviation of time domain signal of body gyro in Z axis
- **t.body.gyro.jerk.mean.x**         mean of obtaining Jerk signal from body gyro in X axis
- **t.body.gyro.jerk.mean.y**         mean of obtaining Jerk signal from body gyro in Y axis
- **t.body.gyro.jerk.mean.z**         mean of obtaining Jerk signal from body gyro in Z axis
- **t.body.gyro.jerk.std.x**         standard deviation of obtaining Jerk signal from time domain signal of body gyro in X axis
- **t.body.gyro.jerk.std.y**         standard deviation  of obtaining Jerk signal from time domain signal of body gyro in Y axis
- **t.body.gyro.jerk.std.z**         standard deviation  of obtaining Jerk signal from time domain signal of body gyro in Z axis
- **t.body.acc.mag.mean**         mean of magnitude from time domain signal of  body accelaration  
- **t.body.acc.mag.std**         standard deviation of magnitude from time domain signal of body accelaration  
- **t.gravity.acc.mag.mean**         mean of magnitude from time domain signal of gravity accelaration  
- **t.gravity.acc.mag.std**         standard deviation of magnitude from time domain signal of gravity accelaration  
- **t.body.acc.jerk.mag.mean**         mean of magnitude from obtaining Jerk signal of time domain signal of gravity accelaration  
- **t.body.acc.jerk.mag.std**         standard deviation of magnitude from obtaining Jerk signal of time domain signal of gravity accelaration  
- **t.body.gyro.mag.mean**         mean of magnitude from time domain signal of body gyro
- **t.body.gyro.mag.std**         standard deviation of magnitude from time domain signal of body gyro
- **t.body.gyro.jerk.mag.mean**         mean of magnitude from obtaining Jerk signal of time domain signal of body gyro 
- **t.body.gyro.jerk.mag.std**         standard deviation of magnitude from obtaining Jerk signal of time domain signal of body gyro  
- **f.body.acc.mean.x**         mean of frequency domain signals of body accelaration in X axis
- **f.body.acc.mean.y**         mean of frequency domain signals of body accelaration in Y axis
- **f.body.acc.mean.z**         mean of frequency domain signals of body accelaration in Z axis
- **f.body.acc.std.x**         standard deviation of frequency domain signals of body accelaration in X axis
- **f.body.acc.std.y**         standard deviation of frequency domain signals of body accelaration in Y axis
- **f.body.acc.std.z**         standard deviation of frequency domain signals of body accelaration in Z axis
- **f.body.acc.jerk.mean.x**         mean of obtaining Jerk signal from frequency domain signal of body accelaration in X axis
- **f.body.acc.jerk.mean.y**         mean of obtaining Jerk signal from frequency domain signal of body accelaration in Y axis
- **f.body.acc.jerk.mean.z**         mean of obtaining Jerk signal from frequency domain signal of body accelaration in Z axis
- **f.body.acc.jerk.std.x**         standard deviation of obtaining Jerk signal from frequency domain signal of body accelaration in X axis
- **f.body.acc.jerk.std.y**         standard deviation Jerk signal from frequency domain signal of body accelaration in Y axis
- **f.body.acc.jerk.std.z**         standard deviation Jerk signal from frequency domain signal of body accelaration in Z axis
- **f.body.gyro.mean.x**         mean of frequency domain signal of body gyro in X axis
- **f.body.gyro.mean.y**         mean of frequency domain signal of body gyro in Y axis
- **f.body.gyro.mean.z**         mean of frequency domain signal of body gyro in Z axis
- **f.body.gyro.std.x**         standard deviation of frequency domain signal of body gyro in X axis
- **f.body.gyro.std.y**         standard deviation of frequency domain signal of body gyro in Y axis
- **f.body.gyro.std.z**         standard deviation of frequency domain signal of body gyro in Z axis
- **f.body.acc.mag.mean**         mean of magnitude from frequency domain signal of  body accelaration  
- **f.body.acc.mag.std**         standard deviation of magnitude from frequency domain signal of body accelaration  
- **f.body.acc.jerk.mag.mean**         mean of magnitude from obtaining Jerk signal of frequency domain signal of gravity accelaration  
- **f.body.acc.jerk.mag.std**         standard deviation of magnitude from obtaining Jerk signal of frequency domain signal of gravity accelaration  
- **f.body.gyro.mag.mean**         mean of magnitude from frequency domain signal of body gyro
- **f.body.gyro.mag.std**         standard deviation of magnitude from frequency domain signal of body gyro
- **f.body.gyro.jerk.mag.mean**         mean of magnitude from obtaining Jerk signal of frequency domain signal of body gyro 
- **f.body.gyro.jerk.mag.std**         standard deviation of magnitude from obtaining Jerk signal of frequency domain signal of body gyro  

####mean.value
Normalized of avarage measured value of the feature. The floating value bounded within [-1, 1]

