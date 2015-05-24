## run_analysis.R
## Project for the Coursera Data Cleaning class.

## This project analyzes the motion data taken from the cell-phone
## accelerometers of a group of 30 participants in a study. The source of the
## data is the "Human Activity Recognition Using Smartphones Dataset
## Version 1.0." 

## The purpose of this project is to merge the data of the training and test
## and then to extract participants together and produce a "tidy" report.
## The mean and standard deviation observations of the data set from the
## accelerometer and gyroscope are included in the table along with the
## particiant ID and the activity such as walking, walking upstairs, and lying
## down. In the original study, there were 30 participants including 21
## training participants and nine test participants. 

## After a data set is prepared for training and the test that includes the
## ID and activity in the first two columns of the table, the results are
## merged into a single table that includes all observations for both training
## and testing.


##RAW DATA:
        
## There were similar datasets for the test participant subjects for both the
## training and test participants. 

## subject_test:
## A column vector that lists identifies the participant for each observation
## or data row.

## y_test
## A column vector that lists identifies the activity for each observation or
## data row such as walking or lying down.

## X_test
## A table data set consisting of 561 columns of calculations for each
## observation. We analyze the columns which are means or standard deviations
 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,dest="zipData.zip")
overwrite = TRUE
unzip("zipData.zip", exdir=".")

## Add ID label to subject lists

## (21 subjects who participated in training)
subjectTrain <-read.delim("./UCI HAR Dataset/train/subject_train.txt",sep="")
colnames(subjectTrain)[1] <- "ID"

## (9 subjects who participated in testing)
subjectTest <-read.delim("./UCI HAR Dataset/test/subject_test.txt",sep="")
colnames(subjectTest)[1] <- "ID"

## Add ID label to test labels lists (The six activities)
##                (1) walking, (2) walking_upstairs, (3) walking_downstairs,
##                (4) sitting, (5) standing,         (6) laying

yTrain <-read.delim("./UCI HAR Dataset/train/y_train.txt")
colnames(yTrain)[1] <- "Activity"

len <- length(yTrain[,1])

## assign activity names
for(i in seq_along (yTrain[,1])){
        if(yTrain[i,1] == "1") {yTrain[i,1] <- "Walking"            }
        if(yTrain[i,1] == "2") {yTrain[i,1] <- "Walking upstairs"   }
        if(yTrain[i,1] == "3") {yTrain[i,1] <- "Walking downstairs" }
        if(yTrain[i,1] == "4") {yTrain[i,1] <- "sitting"            }
        if(yTrain[i,1] == "5") {yTrain[i,1] <- "standing"           }
        if(yTrain[i,1] == "6") {yTrain[i,1] <- "laying down"        }
}
        
## Read in Identification of participants

yTest  <-read.delim("./UCI HAR Dataset/test/y_test.txt",sep="")
colnames(yTest) [1] <- "Activity"

## Assign activity names
for(i in seq_along (yTest[,1])){
        if(yTest[i,1] == "1") {yTest[i,1] <- "Walking"            }
        if(yTest[i,1] == "2") {yTest[i,1] <- "Walking upstairs"   }
        if(yTest[i,1] == "3") {yTest[i,1] <- "Walking downstairs" }
        if(yTest[i,1] == "4") {yTest[i,1] <- "sitting"            }
        if(yTest[i,1] == "5") {yTest[i,1] <- "standing"           }
        if(yTest[i,1] == "6") {yTest[i,1] <- "laying down"        }
}


## Import test data
xTrain <-read.delim("./UCI HAR Dataset/train/X_train.txt",sep="")
xTest <-read.delim("./UCI HAR Dataset/test/X_test.txt",sep="")

## Restrict data to only mean and standard deviation variables
xTrain <- xTrain[,1:6]
xTest  <- xTest[,1:6]

## Assign column names
colnames(xTrain) <- c("Mean x-Acceleration","Mean y-acceleration",
                      "Mean z-Acceleration",
                      "Std-Dev x-Accel",
                      "Std-Dev y-Accel",
                      "Std-Dev z-Accel")

##Add participant's ID to data set
subjectTrain[,2:7] <- xTrain

##Add Activity Name to data set
yTrain[,2:8] <- subjectTrain
trainingdata <- yTrain

##Assign Column Names:
colnames(xTest) <- c("Mean x-Acceleration","Mean y-acceleration",
                     "Mean z-Acceleration",
                     "Std-Dev x-Accel",
                     "Std-Dev y-Accel",
                     "Std-Dev z-Accel")

subjectTest[,2:7] <- xTest

##Add Activity Name to data set
yTest[,2:8] <- subjectTest
testData <- yTest


## Merge training and test data together

all_Data = merge(      yTrain,    yTest, all = TRUE)
print(head(all_Data))
print(tail(all_Data))
