
# This R Script uses the UCI HAR Dataset to create two Tidy Datasets:
#  tidyData, which contains data for Acc Mean and SD in X,Y,Z for Subjects and Activities
#  tidyAvg, which contains average Mean and SD in X,Y,Z for each Subject/Activity combination
# The script also outputs the tidyAvg data to file

# Set the working directory for UCI HAR Dataset
#e.g. setwd("~/Documents/Coursera/gettingAndCleaningData/UCI HAR Dataset")

# Load test and train data
XTest = read.table("./test/X_test.txt")
YTest = read.table("./test/y_test.txt")
STest = read.table("./test/subject_test.txt")
XTrain = read.table("./train/X_train.txt")
YTrain = read.table("./train/y_train.txt")
STrain = read.table("./train/subject_train.txt")

# Combine test and train data
XTestTrain = rbind(XTest,XTrain)
YTestTrain = rbind(YTest,YTrain)
STestTrain = rbind(STest,STrain)

# Extract only mean (cols 1,2,3) and std (cols 4,5,6) in X,Y,Z
TestTrainMeanSD = XTestTrain[,1:6]

# Use descriptive activity names to name the activities in the data set
# Create a function which changes the number to descriptive variables
activityFunc <- function(x) {
  activities <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                  "SITTING","STANDING","LAYING")
  return(activities[[x]])
}
activityCol = sapply(YTestTrain[,],activityFunc)

# Create the tidy dataset
tidyData = cbind( STestTrain, activityCol , TestTrainMeanSD )

# Appropriately label the data set with descriptive variable names
names(tidyData) <- c("Subject","Activity",
                       "Acceleration Mean X","Acceleration Mean Y","Acceleration Mean Z",
                       "Acceleration STD X","Acceleration STD Y","Acceleration STD Z")

# Create a second tidy data set with the average 
# of each variable for each activity and each subject.
# The code below is surely not the most efficient but it gets the job done

# First split data by subject and activity
splitTidy = split(tidyData,list(tidyData$Subject,tidyData$Activity))
# Then find means of the columns (and transpose result)
splitTidyMeans = sapply(splitTidy, function(x) colMeans(x[,3:8]))
splitTidyMeans = t(splitTidyMeans)
# StringSplit the x.Activity for each row
splitTidyNames = strsplit( names(splitTidyMeans[,1]) ,"[.]" )

# Now initialise, fill, and label the tidyAvg dataset
# Initialise
tidyAvg = data.frame(Subject=as.numeric(),
                      Activity=character(),
                      AvgAccX=as.numeric(),AvgAccY=as.numeric(),AvgAccZ=as.numeric(),
                      AvgSDX=as.numeric(),AvgSDY=as.numeric(),AvgSDZ=as.numeric())
# Fill
for (i in 1:nrow(splitTidyMeans)) {
  tidyAvg = rbind(tidyAvg, data.frame( 
    as.numeric(splitTidyNames[[i]][[1]]), 
    splitTidyNames[[i]][[2]],
    t(splitTidyMeans[i,])) )
}
# Label
names(tidyAvg) <- c("Subject","Activity",
                     "Avg Acceleration Mean X","Avg Acceleration Mean Y","Avg Acceleration Mean Z",
                     "Avg Acceleration STD X","Avg Acceleration STD Y","Avg Acceleration STD Z")

# Output to data file:
write.table(tidyAvg,"./tidyAvg.txt",row.names=FALSE)