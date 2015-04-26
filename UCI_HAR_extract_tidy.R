library(dplyr)

########################################################################
#  This script produces a tidy dataset of from a set measurements
#
#  The script assumes that the dataset is in the subdirectory
#  'UCI HAR Dataset/'
#
########################################################################

create_tidy_dataset = function() {

  ########################################################################
  #  Step 1. Merge the training and the test sets to create one data set.
  ########################################################################
  
  ################
  # Training Data
  ################
  # We read in the subject identity for the training set 
  # and set the column name to 'subject'
  subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
  colnames(subject_train) <- 'subject'
  
  # We read in the activity performed by each subject in the training set
  # and set the column name to 'activity'
  activity_train <- read.table('UCI HAR Dataset/train/y_train.txt')
  colnames(activity_train) <- 'activity'
  
  # The last piece we want for the training data is the actual set 
  # of measurements taken for each subject and each activity. 
  # We extract the column names from the file features.txt and use
  # these in the data frame.
  X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
  features <- read.table('UCI HAR Dataset/features.txt')
  colnames(X_train) <- features[['V2']]
  
  # To create a complete dataframe for the training set we use cbind to
  # bind the columns of subject and activity with the matrix of measurements.
  train <- cbind(subject_train,activity_train,X_train)
  
  ################
  #  Test Data
  ################
  # Same procedure as with the training set, we read in the subject,
  # activity, and measurements and label the data accordingly.
  subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
  colnames(subject_test) <- 'subject'
  
  activity_test <- read.table('UCI HAR Dataset/test/y_test.txt')
  colnames(activity_test) <- 'activity'
  
  X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
  features <- read.table('UCI HAR Dataset/features.txt')
  colnames(X_test) <- features[['V2']]
  
  test <- cbind(subject_test,activity_test,X_test)
  
  ################################
  #  Combined Train and Test Data
  ################################
  # The final step is to put the training and test data together
  # into a single data set.  We can use rbind to add the rows of 
  # the test set to those of the training set.
  full_dataset <- tbl_df(rbind(train,test))
  
  
  ########################################################################
  #  Step 2. Extracts only the measurements on the mean and standard 
  #          deviation for each measurement.
  ########################################################################
  # We create an indicator vector to extract only those measurements that
  # have mean() and std() in the name.
  good <- grepl('mean\\(\\)|std\\(\\)', features[['V2']])
  
  # Along with subjecg and activity we use the indicator vector to get
  # our desired 
  feature_subset <- c('subject','activity', as.character(features[good,'V2']))
  
  # From the full dataset we get our subset of interest
  dat <- subset(full_dataset, ,feature_subset)
  
  ########################################################################
  #  Step 3. Uses descriptive activity names to name the activities 
  #          in the data set
  ########################################################################
  # Read in the activities label from the text file of this name
  activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
  
  # Use the integer values in the dat$activity column as an index to the
  # activity_labels and then assign this back to the dat$activity column
  # to convert the integer values to verbose activity names
  dat <- mutate(dat, activity = activity_labels[activity,'V2'])
  
  
  ########################################################################
  #  Step 4. Uses descriptive activity names to name the activities 
  #          in the data set
  ########################################################################
  # Use make.names() to create unique names with all non alpha-numeric
  # characters replaced by a period
  feature_subset2 <- make.names(feature_subset, unique=TRUE)
  
  # Replace any occurences of multiple periods with a single period
  # and remove any trailing periods
  feature_subset2 <- gsub("\\.(?=\\.*$)", "", feature_subset2, perl=TRUE)
  feature_subset2 <- sub("\\.{2,}", ".", feature_subset2)
  
  # Identify all names beginning with t as a timeSignal and 
  # all names beginning with f as a frequencySignal
  feature_subset2 <- sub('^t', 'timeSignal.', feature_subset2)
  feature_subset2 <- sub('^f', 'frequencySignal.', feature_subset2)
  
  # Replace Acc with Accelerometer and Gyro with Gyroscope to 
  # create verbose names
  feature_subset2 <- sub('Acc', 'Accelerometer', feature_subset2)
  feature_subset2 <- sub('Gyro', 'Gyroscope', feature_subset2)
  
  # Correct for the error where the word Body is repeated twice
  # in several measurements
  feature_subset2 <- sub('BodyBody', 'Body', feature_subset2)
  
  # Preceed Jerk and Magnitude measurements with a period to 
  # better separate and identify the name.
  feature_subset2 <- sub('Jerk', '.Jerk', feature_subset2)
  feature_subset2 <- sub('Mag', '.Magnitude', feature_subset2)
  
  # Replace the current column names with the new verbose feature names 
  colnames(dat) <- feature_subset2
  
  ########################################################################
  #  Step 5. From the data set in step 4, creates a second, independent 
  #          tidy data set with the average of each variable for each 
  #          activity and each subject.
  ########################################################################
  # We need to group the data by subject and activity and then with dplyr 
  # we use summarise_each with funs(mean) to compute the mean of each column
  # in each grup
  tidy <- summarise_each(group_by(dat, subject, activity), funs(mean))

  # Finally we write the tidy data table to file
  write.table(tidy, file="HumanActivityRecognition_tidy.txt",row.name=FALSE)
}