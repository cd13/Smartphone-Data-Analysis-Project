# CodeBook: Data collected from the accelerometer and gyroscope embedded in the Samsung Galaxy S smartphones
===================

## 1. Introduction

The original data compiled under `UCI HAR dataset` consists of data collected from the Samsung Galaxy S smartphone. Briefly, 30 volunteers were asked to perform six activities `(walking, walking upstairs, walking downstairs, sitting, standing
and laying)` while wearing a Samsung Galaxy S II smartphone. The embedded accelerometer and gyroscope in the smartphone were
used to derive the data.

The purpose of the subsetted dataset is to compile a tidy dataset of the mean of specific processed data variables for each subject and each activity performed.

---
## 2. Data Source

All information concerning the source of the data and the experiments performed to obtain the data can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 The `UCI HAR Dataset` contains the following files:
 
- `README.txt`
- `features.txt`:    List of the 561 variables derived from the accelerometer and gyroscope in the smartphones.
- `features_info.txt`:      Describes how the variables listed in `features.txt` were obtained.
- `activity_labels.txt`:    Links the numerical labels associated to the activity performed.
- `subject_train.txt`:    Contains the train subjects referred to numerically as 1 to 30.
- `train/X_train.txt`:     Training dataset (contains 561 variables and 7352 observations).
- `train/y_train.txt`:     Numerical labels for the activity performed in the training dataset.
- `subject_test.txt`:    Contains the test subjects referred to numerically as 1 to 30.
- `test/X_test.txt`:     Test dataset (contains 561 variables and 2947 observations).
- `test/y_test.txt`:     Numerical labels for the activity performed in the test dataset.
- `test/Inertial Signals/`:     Files not used in this analysis.
- `train/Inertials Signals/`:     Files not used in this analysis.

---
## 3. Variables 

### 3.1. Variables in the Reduced Dataset

The data contains a variable `subject` to identify the subjects (numbered 1 to 30) and another variable, `activity`, to specify the activities (see the six activities listed in section 1). Both variables were converted into factor variables in order to perform the calculations of the mean of the processed data variables.

Apart from the `subject` and `activity` variables, there were originally 561 variables derived from the data obtained from the smartphone.

The test and train datasets were combined. From the above 561 variables, only 86 variables were kept based on the presence of the strings `mean` and `std` in their variable names. These variables are described below. They can be found in the
`fulldataset` dataframe in the `run_analysis.R` code.  Variables for the tidy data set (`meandataset`) are described in section 3.2.

The variable names in the `features.txt` were used since they were considered to be sufficiently descriptive in that they summarize each processing step performed on the data. The variables names with characters such as *-*, *(*, *)* and *,* were removed as they were not necessary to the understanding of the variable and could cause programming difficulties. The capital letter were however kept to accentuate each abbreviated word in the complete variable names. The abbreviated words in each variable name were not written out completely as they would have created variable names that would have been too long.

Since the data has been transformed by dividing by the range, the variables are all dimensionless (no units). All variables, except the subject and activity factor variables, are numerical variables.
 
- The following variables represent the estimated `mean` value of the:

   * `tBodyAccMeanX`: Time-domain body acceleration in the X direction
   * `tBodyAccMeanY`: Time-domain body acceleration in the Y direction
   * `tBodyAccMeanZ`: Time-domain body acceleration in the Z direction
   
   * `tGravityAccMeanX`: Time-domain gravitational force in the X direction
   * `tGravityAccMeanY`: Time-domain gravitational force in the Y direction
   * `tGravityAccMeanZ`: Time-domain gravitational force in the Z direction
   
   * `tBodyAccJerkMeanX`: Time-domain Jerk signal of the body acceleration in the X direction
   * `tBodyAccJerkMeanY`: Time-domain Jerk signal of the body acceleration in the Y direction
   * `tBodyAccJerkMeanZ`: Time-domain Jerk signal of the body acceleration in the Z direction
   
   * `tBodyGyroMeanX`: Time-domain of the body angular velocity in the X direction
   * `tBodyGyroMeanY`: Time-domain of the body angular velocity in the Y direction
   * `tBodyGyroMeanZ`: Time-domain of the body angular velocity in the Z direction
  
   * `tBodyGyroJerkMeanX`: Time-domain Jerk signal of the body angular velocity in the X direction                  
   * `tBodyGyroJerkMeanY`: Time-domain Jerk signal of the body angular velocity in the Y direction
   * `tBodyGyroJerkMeanZ`: Time-domain Jerk signal of the body angular velocity in the Z direction
   
   * `tBodyAccMagMean`: Magnitude of the time-domain body acceleration
   
   * `tGravityAccMagMean`: Magnitude of the time-domain gravitational acceleration
   
   * `tBodyAccJerkMagMean`: Magnitude of the time-domain Jerk signal of the body acceleration
   
   * `tBodyGyroMagMean`: Magnitude of the time-domain body angular velocity
   
   * `tBodyGyroJerkMagMean`: Magnitude of the time-domain Jerk signal of the body angular velocity
   
   * `fBodyAccMeanX`: Frequency-domain body acceleration in the X direction
   * `fBodyAccMeanY`: Frequency-domain body acceleration in the Y direction
   * `fBodyAccMeanZ`: Frequency-domain body acceleration in the Z direction
   
   * `fBodyAccJerkMeanX`: Frequency-domain Jerk signal of the body accelerationin the X direction
   * `fBodyAccJerkMeanY`: Frequency-domain Jerk signal of the body accelerationin the Y direction
   * `fBodyAccJerkMeanZ`: Frequency-domain Jerk signal of the body accelerationin the Z direction
   
   * `fBodyGyroMeanX`: Frequency-domain body angular velocity in the X direction
   * `fBodyGyroMeanY`: Frequency-domain body angular velocity in the Y direction
   * `fBodyGyroMeanZ`: Frequency-domain body angular velocity in the Z direction
   
   * `fBodyAccMagMean`: Magnitude of the frequency-domain body acceleration
   
   * `fBodyAccJerkMagMean`: Magnitude of the frequency-domain Jerk signal of the body acceleration
   
   * `fBodyGyroMagMean`: Magnitude of the frequency-domain body angular velocity
   
   * `fBodyGyroJerkMagMean`: Magnitude of the frequency-domain Jerk signal of the body angular velocity
   
- The following variables represent the estimated standard deviation (`std`) of the:

   * `tBodyAccStdX`: Time-domain body acceleration in the X direction
   * `tBodyAccStdY`: Time-domain body acceleration in the Y direction
   * `tBodyAccStdZ`: Time-domain body acceleration in the Z direction
 
   * `tGravityAccStdX`: Time-domain gravitational acceleration in the X direction
   * `tGravityAccStdY`: Time-domain gravitational acceleration in the Y direction
   * `tGravityAccStdZ`: Time-domain gravitational acceleration in the Z direction
   
   * `tBodyAccJerkStdX`: Time-domain Jerk signal of the body acceleration in the X direction
   * `tBodyAccJerkStdY`: Time-domain Jerk signal of the body acceleration in the Y direction 
   * `tBodyAccJerkStdZ`: Time-domain Jerk signal of the body acceleration in the Z direction
 
   * `tBodyGyroStdX`: Time-domain of the body angular velocity in the X direction
   * `tBodyGyroStdY`: Time-domain of the body angular velocity in the Y direction
   * `tBodyGyroStdZ`: Time-domain of the body angular velocity in the Z direction
   
   * `tBodyGyroJerkStdX`: Time-domain Jerk signal of the body angular velocity in the X direction
   * `tBodyGyroJerkStdY`: Time-domain Jerk signal of the body angular velocity in the Y direction
   * `tBodyGyroJerkStdZ`: Time-domain Jerk signal of the body angular velocity in the Z direction
  
   * `tBodyAccMagStd`: Magnitude of the time-domain body acceleration
   
   * `tGravityAccMagStd`: Magnitude of the time-domain gravitational acceleration
 
   * `tBodyAccJerkMagStd`: Magnitude of the time-domain Jerk signal of the body acceleration
  
   * `tBodyGyroMagStd`: Magnitude of the time-domain body angular velocity
  
   * `tBodyGyroJerkMagStd`: Magnitude of the time-domain Jerk signal of the body angular velocity
  
   * `fBodyAccStdX`: Frequency-domain body acceleration in the X direction
   * `fBodyAccStdY`: Frequency-domain body acceleration in the Y direction
   * `fBodyAccStdZ`: Frequency-domain body acceleration in the Z direction
  
   * `fBodyAccJerkStdX`: Frequency-domain Jerk signal of the body acceleration in the X direction
   * `fBodyAccJerkStdY`: Frequency-domain Jerk signal of the body acceleration in the Y direction
   * `fBodyAccJerkStdZ`: Frequency-domain Jerk signal of the body acceleration in the Z direction
   
   * `fBodyGyroStdX`: Frequency-domain body angular velocity in the X direction
   * `fBodyGyroStdY`: Frequency-domain body angular velocity in the Y direction
   * `fBodyGyroStdZ`: Frequency-domain body angular velocity in the Z direction
   
   * `fBodyAccMagStd`:  Magnitude of the frequency-domain body acceleration
   
   * `fBodyAccJerkMagStd`: Magnitude of the frequency-domain Jerk signal of the body acceleration
   
   * `fBodyGyroMagStd`: Magnitude of the frequency-domain body angular velocity
   
   * `fBodyGyroJerkMagStd`: Magnitude of the frequency-domain Jerk signal of the body angular velocity
 
 - The following variables represent the estimated mean frequency (`MeanFreq`) of the:
 
   * `fBodyAccMeanFreqX`: Frequency-domain body acceleration in the X direction
   * `fBodyAccMeanFreqY`: Frequency-domain body acceleration in the Y direction
   * `fBodyAccMeanFreqZ`: Frequency-domain body acceleration in the Z direction
  
   * `fBodyAccJerkMeanFreqX`: Frequency-domain Jerk signal of the body acceleration in the X direction
   * `fBodyAccJerkMeanFreqY`: Frequency-domain Jerk signal of the body acceleration in the Y direction
   * `fBodyAccJerkMeanFreqZ`: Frequency-domain Jerk signal of the body acceleration in the Z direction
  
   * `fBodyGyroMeanFreqX`: Frequency-domain body angular velocity in the X direction
   * `fBodyGyroMeanFreqY`: Frequency-domain body angular velocity in the Y direction
   * `fBodyGyroMeanFreqZ`: Frequency-domain body angular velocity in the Z direction
   
   * `fBodyAccMagMeanFreq`: Magnitude of the frequency-domain body acceleration
    
   * `fBodyAccJerkMagMeanFreq`:  Magnitude of the frequency-domain Jerk signal of the body acceleration

   * `fBodyGyroMagMeanFreq`: Magnitude of the frequency-domain body angular velocity

   * `fBodyGyroJerkMagMeanFreq`: Magnitude of the frequency-domain Jerk signal of the body angular velocity

- The following variables represent the:
 
   * `angleOFtBodyAccMeanANDgravity`: Angle of the mean time-domain body acceleration vector and the gravity vector
   
   * `angleOFtBodyAccJerkMeanANDgravityMean`: Angle of the mean time-domain Jerk signal of the body acceleration vector and the mean gravity vector
   
   * `angleOFtBodyGyroMeanANDgravityMean`: Angle of the mean time-domain body angular velocity vector and the mean gravity vector
   
   * `angleOFtBodyGyroJerkMeanANDgravityMean`: Angle of the mean time-domain Jerk signal of the body angular velocity vector and the mean gravity vector
 
   * `angleOFXANDgravityMean`: Angle between the vector X and the mean gravity vector
   * `angleOFYANDgravityMean`: Angle between the vector Y and the mean gravity vector
   * `angleOFZANDgravityMean`: Angle between the vector Z and the mean gravity vector
   
Note: `Jerk` refers to the third derivative of distance with respect to time; the rate of change of acceleration.
(reference: http://www.urbandictionary.com/define.php?term=Jerk&page=2)

---
### 3.2. Variables in the Second Dataset - Tidy Dataset

The same variable names as those used for the variables in section 3.1 were employed with the addition of the string `Avg` in front of the name of the processed data variables (86 variables) to indicate that this is the average (mean) of the variable. They are part of the `meandataset` dataframe in the `run_analysis.R` code.

Refer to the variables in the first dataset above for the complete description of these variables.

All variables are still dimensionless (no units) and all, except the subject and activity factor variables, are numerical variables.

 - `subject`
 - `activity`
 - `AvgtBodyAccMeanX`
 - `AvgtBodyAccMeanY`
 - `AvgtBodyAccMeanZ`
 - `AvgtBodyAccStdX`
 - `AvgtBodyAccStdY`
 - `AvgtBodyAccStdZ`
 - `AvgtGravityAccMeanX` 
 - `AvgtGravityAccMeanY`
 - `AvgtGravityAccMeanZ`
 - `AvgtGravityAccStdX`   
 - `AvgtGravityAccStdY`   
 - `AvgtGravityAccStdZ` 
 - `AvgtBodyAccJerkMeanX` 
 - `AvgtBodyAccJerkMeanY`  
 - `AvgtBodyAccJerkMeanZ`
 - `AvgtBodyAccJerkStdX` 
 - `AvgtBodyAccJerkStdY`                 
 - `AvgtBodyAccJerkStdZ`         
 - `AvgtBodyGyroMeanX`                        
 - `AvgtBodyGyroMeanY`                       
 - `AvgtBodyGyroMeanZ`                        
 - `AvgtBodyGyroStdX`                         
 - `AvgtBodyGyroStdY`                        
 - `AvgtBodyGyroStdZ`                        
 - `AvgtBodyGyroJerkMeanX`                    
 - `AvgtBodyGyroJerkMeanY`                  
 - `AvgtBodyGyroJerkMeanZ`                   
 - `AvgtBodyGyroJerkStdX`                     
 - `AvgtBodyGyroJerkStdY`                    
 - `AvgtBodyGyroJerkStdZ`                     
 - `AvgtBodyAccMagMean`                   
 - `AvgtBodyAccMagStd`                       
 - `AvgtGravityAccMagMean`                  
 - `AvgtGravityAccMagStd`                     
 - `AvgtBodyAccJerkMagMean`                 
 - `AvgtBodyAccJerkMagStd`                
 - `AvgtBodyGyroMagMean`                    
 - `AvgtBodyGyroMagStd`                      
 - `AvgtBodyGyroJerkMagMean`                  
 - `AvgtBodyGyroJerkMagStd`                   
 - `AvgfBodyAccMeanX`                        
 - `AvgfBodyAccMeanY`                        
 - `AvgfBodyAccMeanZ`                         
 - `AvgfBodyAccStdX`                          
 - `AvgfBodyAccStdY`                          
 - `AvgfBodyAccStdZ`                         
 - `AvgfBodyAccMeanFreqX`                     
 - `AvgfBodyAccMeanFreqY`                    
 - `AvgfBodyAccMeanFreqZ`                    
 - `AvgfBodyAccJerkMeanX`                     
 - `AvgfBodyAccJerkMeanY`                     
 - `AvgfBodyAccJerkMeanZ`                   
 - `AvgfBodyAccJerkStdX`                  
 - `AvgfBodyAccJerkStdY`                     
 - `AvgfBodyAccJerkStdZ`                      
 - `AvgfBodyAccJerkMeanFreqX`                 
 - `AvgfBodyAccJerkMeanFreqY`                
 - `AvgfBodyAccJerkMeanFreqZ`                 
 - `AvgfBodyGyroMeanX`                      
 - `AvgfBodyGyroMeanY`                       
 - `AvgfBodyGyroMeanZ`                      
 - `AvgfBodyGyroStdX`                       
 - `AvgfBodyGyroStdY`                        
 - `AvgfBodyGyroStdZ`                        
 - `AvgfBodyGyroMeanFreqX`                  
 - `AvgfBodyGyroMeanFreqY`                   
 - `AvgfBodyGyroMeanFreqZ`                    
 - `AvgfBodyAccMagMean`                       
 - `AvgfBodyAccMagStd`                       
 - `AvgfBodyAccMagMeanFreq`                   
 - `AvgfBodyAccJerkMagMean`               
 - `AvgfBodyAccJerkMagStd`               
 - `AvgfBodyAccJerkMagMeanFreq`           
 - `AvgfBodyGyroMagMean`                  
 - `AvgfBodyGyroMagStd`                  
 - `AvgfBodyGyroMagMeanFreq`              
 - `AvgfBodyGyroJerkMagMean`             
 - `AvgfBodyGyroJerkMagStd`               
 - `AvgfBodyGyroJerkMagMeanFreq`          
 - `AvgangleOFtBodyAccMeanANDgravity`        
 - `AvgangleOFtBodyAccJerkMeanANDgravityMean`
 - `AvgangleOFtBodyGyroMeanANDgravityMean`   
 - `AvgangleOFtBodyGyroJerkMeanANDgravityMean`
 - `AvgangleOFXANDgravityMean`                
 - `AvgangleOFYANDgravityMean`              
 - `AvgangleOFZANDgravityMean`
 
--- 
## 4. Data transformations
 
- In step 1, the required data are loaded into data frames and merged into one data frame (`fulldataset`):

  * the `subject_train.txt`, `x_train.txt` and `y_train.txt` are loaded into a character vector `trainfilelist`, and the columns are then merged using cbind. The files are read in alphabetical order, which then requires the columns to be merged in the order stated above of the files [i.e. first column: subject, column 2 to 87: processed data from `x_train.txt` file, last column: `y_train.txt` (activities)]
```{r}
trainfilelist <- grep(pattern = "^(.*)(train/)[sXy](.*)(_train)", filelist, value=TRUE)
traindataset <- do.call("cbind",lapply(trainfilelist, FUN=function(files){read.table(files, header=FALSE, stringsAsFactors=FALSE)}))
```

  * this is repeated for the test data contained in the `subject_test.txt`, `x_test.txt` and `y_test.txt` files to create the `testdataset`.
  
  * the variable names from the `features.txt` file are used as the column names of the processed data in both the `traindataset` and the `testdataset`. The `subject` and `activity` column names are then added to these column names.  
```{r}
columnnames <- read.table(filelist[2], colClasses=c("NULL","character"), header=FALSE)
firstcolumn <- c("subject")
lastcolumn <- c("activity")
allcolumnnames = t(rbind(firstcolumn, columnnames, lastcolumn))
```

  * The column names are added to the `traindataset` and `testdataset`, which are then merged into one data frame, `fulldataset`.
```{r}
names(traindataset) <- allcolumnnames
names(testdataset) <- allcolumnnames

fulldataset <- rbind(traindataset,testdataset)
```

- In step 2, the processed data variables with names containing `mean` and `std` (standard deviation) are subsetted into another data frame, `subdataset`. The column with the activities is moved from last position to second position (after subject column) in the data frame.
```{r}
subdataset <- fulldataset[grepl('mean|std|activity|subject', names(fulldataset), ignore.case=TRUE)]

col_idx <- grep("activity", names(subdataset))
subdataset <- subdataset[, c(col_idx, (1:ncol(subdataset))[-col_idx])]
```

- In step 3, the `subject` and `activity` variables are converted to factor variables. The `plyr` package is then used to order the data as per `subject` and then as per `activity` (in the following order: `Walking`, `WalkingUpstairs`, `WalkingDownstairs`, `Sitting`, `Standing` and `Laying`).
```{r}
subdataset$activity <- as.factor(subdataset$activity)
subdataset$subject <- as.factor(subdataset$subject)
subdataset <- arrange(subdataset,subdataset$subject,subdataset$activity)
levels(subdataset$activity) <- c("Walking", "WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying")
```

- In step 4, the processed data variables names are cleaned up to remove metacharacters and "normalized" to make them more consistent. One 'body' was removed from some variables names with double 'body', since this may have been an error in the original dataset.
```{r}
names(subdataset) <- gsub(pattern="-",replacement="", x=names(subdataset))
names(subdataset) <- gsub(pattern="std",replacement="Std", x=names(subdataset))
names(subdataset) <- gsub(pattern="mean",replacement="Mean", x=names(subdataset))
names(subdataset) <- gsub(pattern="\\()",replacement="", x=names(subdataset))
names(subdataset) <- sub(pattern="\\(",replacement="OF", x=names(subdataset))
names(subdataset) <- sub(pattern="\\,",replacement="AND", x=names(subdataset))
names(subdataset) <- gsub(pattern="\\)",replacement="", x=names(subdataset))
names(subdataset) <- sub(pattern=BodyBody),replacement="Body", x=names(subdataset))
```

- In step 5, the average of the processed data variables is calculated for each subject and each activity and stored  into the data frame `meandataset`. Since the column names for the variables `subject` and `activity` were erased during the aggregation, both were added afterwards to the tidy dataset `meandataset`.
The data is outputed into a tidy data table format as the text file, `smartphonetidydataset.txt`. See README.txt for details on how to read this file. 
```{r}
meandataset <- setNames(aggregate(. ~ subject+activity, subdataset, function(x) mean = mean(x)), c(sapply("Avg", paste0, names(subdataset))))
names(meandataset)[1:2] <- c("subject", "activity")

write.table(meandataset, file = "smartphonetidydataset.txt", sep = ",", quote = FALSE, qmethod = "double")
```

---
 