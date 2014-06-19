
#### STEP 1 ####

library(plyr)

# get the file url and download it into the current working directory,
today = as.Date(Sys.time())
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# create a temporary directory
td = tempdir()
# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")
# download into the placeholder file
download.file(fileurl, tf)

# List all files names inside of the zipped folder.
filelist <- as.character(unzip(tf, list = TRUE)$Name)

# First place the files names subject_train.txt, x_train.txt and y_train.txt from the zipped folder into a dataset.
# # Files are placed in this order. Column order will be changed later to move the activity column (y_train.txt) to the 2nd column.
# Then read the data from the above mentionned files and merge them column by column.
trainfilelist <- grep(pattern = "^(.*)(train/)[sXy](.*)(_train)", filelist, value=TRUE)
traindataset <- do.call("cbind",lapply(trainfilelist, FUN=function(files){read.table(files, header=FALSE, stringsAsFactors=FALSE)}))

# First place the files names subject_test.txt, x_test.txt and y_test.txt from the zipped folder into a dataset.
# Files are placed in this order. Column order will be changed later to move the activity column (y_test.txt) to the 2nd column.
# Then read the data from the above mentionned files and merge them column by column.
testfilelist <- grep(pattern = "^(.*)(test/)[sXy](.*)(_test)", filelist, value=TRUE)
testdataset <- do.call("cbind",lapply(testfilelist, FUN=function(files){read.table(files, header=FALSE, stringsAsFactors=FALSE)}))

# Read in the feature.txt file to use as column names for the test and training datasets, as well as the subject
# (subject_train/text.txt file read first in dataframe) and activity (y_train/test.txt file read last in dataframe).
columnnames <- read.table(filelist[2], colClasses=c("NULL","character"), header=FALSE)
firstcolumn <- c("subject")
lastcolumn <- c("activity")
allcolumnnames = t(rbind(firstcolumn, columnnames, lastcolumn))

# Assigning column names to both the train and test datasets.
names(traindataset) <- allcolumnnames
names(testdataset) <- allcolumnnames

# Merging row-wise the train and test datasets into one dataset.
fulldataset <- rbind(traindataset,testdataset)

#### STEP 2 ####

# Selecting the columns of data with word "mean" (including "meanFreq" and "gravityMean"), "std" as well as the
# "activity" and "subject" columns.
subdataset <- fulldataset[grepl('mean|std|activity|subject', names(fulldataset), ignore.case=TRUE)]

# Moving "activity" column from last column to second column position.
col_idx <- grep("activity", names(subdataset))
subdataset <- subdataset[, c(col_idx, (1:ncol(subdataset))[-col_idx])]

#### STEP 3 ####

# Making both the subject and activity variables as factors.
# Substituting  the factors 1 to 6 of the "activity" column for descriptive strings from "activity_labels.txt" file.
subdataset$activity <- as.factor(subdataset$activity)
subdataset$subject <- as.factor(subdataset$subject)
subdataset <- arrange(subdataset,subdataset$subject,subdataset$activity)
levels(subdataset$activity) <- c("Walking", "WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying")

#### STEP 4 ####

# Changing the column names to remove metacharacters.
names(subdataset) <- gsub(pattern="-",replacement="", x=names(subdataset))
names(subdataset) <- gsub(pattern="std",replacement="Std", x=names(subdataset))
names(subdataset) <- gsub(pattern="mean",replacement="Mean", x=names(subdataset))
names(subdataset) <- gsub(pattern="\\()",replacement="", x=names(subdataset))
names(subdataset) <- sub(pattern="\\(",replacement="OF", x=names(subdataset))
names(subdataset) <- sub(pattern="\\,",replacement="AND", x=names(subdataset))
names(subdataset) <- gsub(pattern="\\)",replacement="", x=names(subdataset))
names(subdataset) <- sub(pattern="BodyBody",replacement="Body", x=names(subdataset))

#### STEP 5 ####

# Creating a second dataset "meandataset" to calculate the average (mean) of the measurements by subject and activity.
# Rename the subject and activity variables to remove the 'Avg' appended in front.
meandataset <- setNames(aggregate(. ~ subject+activity, subdataset, function(x) mean = mean(x)), c(sapply("Avg", paste0, names(subdataset))))
names(meandataset)[1:2] <- c("subject", "activity")

# Writing results of average (mean) calculations in a table.
write.table(meandataset, file = "smartphonetidydataset.txt", sep = ",", quote = FALSE, qmethod = "double", row.names=FALSE)
