#
# Initialize variables and data set.
#
data_origin <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_destination <- "UCI HAR Dataset.zip"
data_dir <- "UCI HAR Dataset/"

if (!file.exists(data_dir)) {
  download.file(data_origin, destfile=data_destination, method="curl")
  unzip(data_destination)
}

#
# Read in the base data that will be merged.
#
features <- read.table(paste0(data_dir, "features.txt"), 
                       col.names=c("id", "label"))

measurements_test <- read.table(paste0(data_dir, "test/X_test.txt"), 
                                col.names=features$label)
measurements_train <- read.table(paste0(data_dir, "train/X_train.txt"), 
                                 col.names=features$label)

activity_labels <- read.table(paste0(data_dir, "activity_labels.txt"),
                         col.names=c("id", "label"))

activity_test <- read.table(paste0(data_dir, "test/y_test.txt"),
                            col.names=c("index"))
activity_train <- read.table(paste0(data_dir, "train/y_train.txt"),
                             col.names=c("index"))

subjects_test <- read.table(paste0(data_dir, "test/subject_test.txt"),
                            col.names=c("subjectId"))
subjects_train <- read.table(paste0(data_dir, "train/subject_train.txt"),
                             col.names=c("subjectId"))

#
# The two measurement data frames are first combined, then filtered such that
# only means and standard deviations of the measurements are retained.
#
measurements <- rbind(measurements_test, measurements_train)
measurements <- measurements[, grep("mean|std", names(measurements))]

#
# The two reported activity data frames are also combined and their values
# mapped to factors with descriptive names.
#
activity <- rbind(activity_test, activity_train)
activity$label <- apply(activity, 1, function(x) activity_labels$label[x])

#
# The two subjectId data frames are combined.
#
subjects <- rbind(subjects_test, subjects_train)

#
# All of the measuremens,reported activities and subject data frames are merged
# into a single tidy data frame.
#
tidy <- cbind(measurements, activity$label, subjects)

