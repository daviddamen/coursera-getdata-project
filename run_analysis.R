#
# Initialize variables and data set
#
data_origin <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_destination <- "UCI HAR Dataset.zip"
data_dir <- "UCI HAR Dataset"

if (!file.exists(data_dir)) {
  download.file(data_origin, destfile=data_destination, method="curl")
  unzip(data_destination)
}