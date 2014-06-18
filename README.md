# Getting and Cleaning Data - Course Project

## Introduction

This repo contains the R script to create a tidy dataset from human activity
measurements as captured through the sensors of a smartphone. It has been
created for a course project for the Getting and Cleaning Data course on
Coursera.  
It does not use any external libraries, only base R.

## Script Overview

### Initialization

The run_analysis.R script checks if the data is already present and, if not,
downloads and unzips it. 

### Data Loading

Next, it loads up the dataset from the measurement and metadata files:

1. _features.txt_ is loaded into the _features_ dataframe to get a list of 
feature labels to use as human-readable column titles for our tidy dataset.
2. _test/X_test.txt_ and _train/X_train.txt_ files are loaded into the
_measurements_test_ and _measurements_train_ dataframes to get the measurement
data. The feature labels are immediately attached as column titles for the data
frames.
3. _activity_labels.txt_ is loaded into the _activity_labels_ dataframe to get
the mapping from activity id to activity label.
4. _test/y_test.txt_ and _train/y_train.txt_ files are loaded into the 
_activity_test_ and _activity_train_ data frames to get the activity ids that 
belong to each measurement.
5. Finally, the _test/subject_test.txt_ and _train/subject_train.txt_ files are
loaded into the _subjects_test_ and _subjects_train_ data frames to get the 
subject ids that belong to the measurements.

### Data Munging 

Then, the different data frames are processed and combined to create a single
dataframe called _tidy_ to collect the requested data into one tidy set. This
is done by first append the two measurement data frames to each other and
extracting only the mean and standard deviation columns from the combined data
frame. This is followed by appending the two activity data frames to each other
to which human readable activity labels are added.

Finally, all of the combined measurement data frame, the human readable 
activity labels from the activity data frame and the subject ids are combined 
to come up with the _tidy_ data frame.