This project analyzes the motion data taken from the cell-phone accelerometers of a group of 30 participants in a study. The source of the data is the "Human Activity Recognition Using Smartphones Dataset Version 1.0." The purpose of this project is to merge the data of the training and test participants together and produce a report. A derived data set of the mean and standard deviation of the three accelerometers orientations and three gyroscope orientations are summarized for each variable for each participant and activity such as walking, walking upstairs, and lying down. In the original study, there were 30 participants including 21 training participants and nine test participants. 


RAW DATA:

There were similar datasets for the test participant subjects for both the
training and test participants. Below we show the data for the test
participants, but there is a similar data set for the training participants.

subject_test:
A column vector that lists identifies the
participant for each observation or data row.

y_test
A column vector that lists identifies the
activity type for each observation or data row
such as walking or lying down.

X_test
A table data set consisting of 561 columns of calculations for each observation.
We only analyze the first six columns for the three accelerometer orientations
and the three gyroscopic orientations. There were 7351 observations of the
training participants and 2947 observations of the test subject participants.


DESCRIPTION OF PROGRAM "run_analysis.R 

Seventy-nine mean and standard deviation observations were selected from the list of 561 obsevations in the X__train file and were merged with the participant ID from the subject_train file. Next, a similar process is used to merge the corresponding activity list from the y_train file with the result of the previous step. This process is repeated for the corresponding files in the test directory.  Next, the training and test data sets were merged together. 


Data Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
