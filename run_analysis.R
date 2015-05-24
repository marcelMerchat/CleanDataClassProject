overwrite = TRUE
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,dest="zipData.zip")
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

##assign activity names
for(i in seq_along (yTrain[,1])){
        if(yTrain[i,1] == "1") {yTrain[i,1] <- "Walking"            }
        if(yTrain[i,1] == "2") {yTrain[i,1] <- "Walking upstairs"   }
        if(yTrain[i,1] == "3") {yTrain[i,1] <- "Walking downstairs" }
        if(yTrain[i,1] == "4") {yTrain[i,1] <- "sitting"            }
        if(yTrain[i,1] == "5") {yTrain[i,1] <- "standing"           }
        if(yTrain[i,1] == "6") {yTrain[i,1] <- "laying down"        }
}
        
        
yTest  <-read.delim("./UCI HAR Dataset/test/y_test.txt",sep="")
colnames(yTest) [1] <- "Activity"
##assign activity names
for(i in seq_along (yTest[,1])){
        if(yTest[i,1] == "1") {yTest[i,1] <- "Walking"            }
        if(yTest[i,1] == "2") {yTest[i,1] <- "Walking upstairs"   }
        if(yTest[i,1] == "3") {yTest[i,1] <- "Walking downstairs" }
        if(yTest[i,1] == "4") {yTest[i,1] <- "sitting"            }
        if(yTest[i,1] == "5") {yTest[i,1] <- "standing"           }
        if(yTest[i,1] == "6") {yTest[i,1] <- "laying down"        }
}


## Read test data
xTrain <-read.delim("./UCI HAR Dataset/train/X_train.txt",sep="")
xTest <-read.delim("./UCI HAR Dataset/test/X_test.txt",sep="")
## Restrict data to only mean and standard deviation variables
xTrain <- xTrain[,1:6]
xTest  <- xTest[,1:6]

colnames(xTrain) <- c("Mean x-Acceleration","Mean y-acceleration",
                      "Mean z-Acceleration",
                      "Std-Dev x-Accel",
                      "Std-Dev y-Accel",
                      "Std-Dev z-Accel")
subjectTrain[,2:7] <- xTrain
##Add Activity Name to data set
yTrain[,2:8] <- subjectTrain
trainingdata <- yTrain

colnames(xTest) <- c("Mean x-Acceleration","Mean y-acceleration",
                     "Mean z-Acceleration",
                     "Std-Dev x-Accel",
                     "Std-Dev y-Accel",
                     "Std-Dev z-Accel")

subjectTest[,2:7] <- xTest
##Add Activity Name to data set
yTest[,2:8] <- subjectTest
testData <- yTest

all_Data = merge(      yTrain,    yTest, all = TRUE)
print(head(all_Data))
print(tail(all_Data))

#### Accelerometer data in Inertial Signal Folder (128-column data sets) 
##testaccz <-read.delim("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",sep="")
##trainaccz <-read.delim("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",sep="")