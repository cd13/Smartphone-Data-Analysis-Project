# Getting and Cleaning Data Course Project
===================

## 1. Introduction

This repository contains the Coursera `Getting and Cleaning Data` course project, which is using the UCI Human Activity Recognition Using Smartphones Dataset.

The purpose of this project is to demonstrate the collection, work with, and cleaning of this dataset. The end product is a tidy data file uploaded onto the Coursera site that can be used for later analysis and will be peer assessed.

This `README.md` file presents details of the files in this repository.

---
## 2. Original Data Source

All information concerning the source of the data and the experiments performed to obtain the data can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

---
## 3. Files in Repository

This repo includes the following files
- `README.md`
- `run_analysis.R`
- `CodeBook.md`

---
### 3.1. File `run_analysis.R`

This file contains the R code used to obtain the tidy data file called `smartphonetidydataset.txt`.

The script was generated in RStudio Version 0.98.501.

To run the script, it must be downloaded and then sourced (`source(run_analysis.R)`) from your working directory in R. It is also necessary to install the `plyr` package to run this script.

Briefly the script:

- Downloads the dataset from the URL mentioned in section 2 and unzips it to create an UCI HAR Dataset folder in your working directory.
- Reads in the files containing the test and train data, creates a data frame for each, and merges both data frames into one.
- Extracts a subset of data from the data frame where the processed data variable names contain the string `mean` or `std`. The `meanFreq` and angle variables are included, resulting in a total of `88` variables, including the factor variables `subject` and `activity`.
- Appropriately labels the data frame with descriptive activity names in place of activity ids.
- Updates the processed data variable names in the subsetted data frame to improve readibility.
- Creates a new tidy data frame containing the average of processed data variable for each subject and each activity. This tidy data frame has `180 observations` and `88 columns`. 
- Writes the data in a table in the above format under the file `smartphonetidydataset.txt`. To read the file, the separator `,` is required.
In R, the following code can be used, if the file is in the R working directory: 

```
read.table("smartphonetidydataset.txt",sep=",",header=TRUE,stringsAsFactors=TRUE)
```

This data file meets the principles of a tidy dataset since each variable forms a column, each observation forms a row and it contains information on the mean of the processed data variables.

---
### 3.2. File `CodeBook.md`
The codebook file describes the variables, the data, and any transformations and work performed to clean up the data.

---
### 4. Acknowledgements

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws