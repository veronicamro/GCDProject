####################################################################################
# Coursera Project 
# Getting and Cleaning 
# Script: run_analysis.R

# Create one R script called run_analysis.R with the requirements:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#     Please upload the tidy data set created in step 5 of the instructions.
#     Please upload your data set as a txt file created with write.table() using row.name=FALSE

#     Please submit a link to a Github repo with the code for performing your analysis.
#     The code should have a file run_analysis.R in the main directory that can be run as long
#     as the Samsung data is in your working directory. The output should be the tidy data set
#     you submitted for part 1. You should include a README.md in the repo describing how the
#     script works and the code book describing the variables.

###########################################################################################
#Preparation
###########################################################################################
#set up working directory to your own working directory

#create a subfolder called dataBuddyOct2015 in your own working directory
#so it does not mix up with your stuff and you can delete it after checking 
#download and unzip the data file into that folder

downloadFile <- "dataBuddyOct2015/getdata_dataset.zip"
downloadURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./dataBuddyOct2015")) { dir.create("./dataBuddyOct2015")}
if (!file.exists(downloadFile)) {
  download.file(downloadURL, downloadFile);
  unzip(downloadFile, overwrite = T, exdir = "./dataBuddyOct2015")}
setwd("./dataBuddyOct2015/UCI HAR Dataset")
###########################################################################################
#Read raw data tables into variables
##############################################################################

#Read data from Features files 
featTrain <- read.table("train/X_train.txt", quote="\"")
featTest <- read.table("test/X_test.txt", quote="\"")

#Read data from Activity files
actTrain <- read.table("train/y_train.txt", quote="\"")
actTest <- read.table("test/y_test.txt", quote="\"")

#Read data from Subjects files
subjTrain <- read.table("train/subject_train.txt", quote="\"")
subjTest <- read.table("test/subject_test.txt", quote="\"")

features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")


###########################################################################################
#Merge training and test data sets into one data set
###########################################################################################
#concatenate data by row (from training and test tables) 
concSubject <- rbind(subjTrain, subjTest)
concActivity<- rbind(actTrain, actTest)
concFeatures<- rbind(featTrain, featTest)


###########################################################################################
#Set names to variables
###########################################################################################

names(concSubject)<-c("Subject")
names(concActivity)<- c("Activity")
featNames <- read.table("features.txt", quote="\"")
names(concFeatures)<- featNames$V2

###########################################################################################
#Step 1.
#Merge columns to get the data frame `Data` for all data**
###########################################################################################
colCombine <- cbind(concSubject, concActivity)
Data <- cbind(concFeatures, colCombine)

###########################################################################################
#Step 2.
#Extract the mean and standard deviation for each measurement
###########################################################################################
extMeanAndSD<-featNames$V2[grep("mean\\(\\)|std\\(\\)", featNames$V2)]

dNames<-c(as.character(extMeanAndSD), "Subject", "Activity" )
Data<-subset(Data,select=dNames)


###########################################################################################
#Step 3.
#Uses descriptive activity names to name the activities in the data set
###########################################################################################
#Read activity names from "activity_labels.txt"*
actName <- read.table("activity_labels.txt",quote="\"")

###########################################################################################
#Step 4.
#Appropriately labels the data set with descriptive variable names. 
###########################################################################################

names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

###########################################################################################
#Step 5.
#From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
###########################################################################################

preFinalData<-aggregate(. ~Subject + Activity, Data, mean)
finalData<-preFinalData[order(preFinalData$Subject,preFinalData$Activity),]
write.table(finalData, file = "tidy_data.txt",row.name=FALSE)

###########################################################################################
#Conclusion
###########################################################################################
#Please find the file generated tidy_data.txt into your working directory
#subfolder /dataBuddyOct2015/UCI HAR Dataset
