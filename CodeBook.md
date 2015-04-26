## Introduction
This codebook describes a tidy dataset that is extracted from the original UCI HAR Dataset of measurements 

## Description
The original UCI HAR Dataset consists of training and test datasets that when combined represent 10299 observations on 561 features. Each observation represents a given time or frequency signal derived from 3-axial accelerometer and gyroscope raw signal readings.  The observations are labelled by subject and activity so that adding these columns yields a total dataset of 10299 rows by 563 columns.

From the original 561 measurement variables, a subset of features are obtained by keeping only those measurements representing the mean and standard deviation of the corresponding signals.  This feature subset is obtained by apply grep with the strings `mean()` and `std()` to the list of features obtained from the file `features.txt` included with dataset.  The resulting grep operation yields a total of 66 features to which are added subject and activity columns to obtain an initial reduced dataset of 10299 rows by 68 columns.

To give a more verbose naming to the columns in the dataset, the original feature names have been mapped using the following rules: 
    t -> timeSignal
    f -> frequencySignal
    Acc -> Accelerometer
    Gyro -> Gyroscope
    Mag -> Magnitude
and components have been separated by periods so that, for example, the original signal
    tBodyAcc-mean()-X becomes timeSignal.BodyAccelerometer.mean.X
and 
    fBodyGyroJerk-std()-Z becomes frequencySignal.BodyGyroscope.std.Z
A complete list of feature names is provided in a table at the end of the document.

To produce the final tidy dataset, the reduced feature dataset is grouped by subject and activity and the mean is taken 

The tidy dataset consists of 180 rows x 68 columns representing aggregate measurements for 30 subjects each performing 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## Tidy Dataset Features

Tidy Dataset Column Names | Original UCI HAR Feature Names
--------------------------|-------------------------------
subject | 
activity |
timeSignal.BodyAccelerometer.mean.X | tBodyAcc-mean()-X 
timeSignal.BodyAccelerometer.mean.Y | tBodyAcc-mean()-Y 
timeSignal.BodyAccelerometer.mean.Z | tBodyAcc-mean()-Z 
timeSignal.BodyAccelerometer.std.X | tBodyAcc-std()-X 
timeSignal.BodyAccelerometer.std.Y | tBodyAcc-std()-X 
timeSignal.BodyAccelerometer.std.Z | tBodyAcc-std()-X 
timeSignal.GravityAccelerometer.mean.X | tGravityAcc-mean()-X 
timeSignal.GravityAccelerometer.mean.Y | tGravityAcc-mean()-Y 
timeSignal.GravityAccelerometer.mean.Z | tGravityAcc-mean()-Z 
timeSignal.GravityAccelerometer.std.X | tGravityAcc-std()-X 
timeSignal.GravityAccelerometer.std.Y | tGravityAcc-std()-Y
timeSignal.GravityAccelerometer.std.Z | tGravityAcc-std()-Z
timeSignal.BodyAccelerometer.Jerk.mean.X | tBodyAccJerl-mean()-X 
timeSignal.BodyAccelerometer.Jerk.mean.Y | tBodyAccJerl-mean()-Y
timeSignal.BodyAccelerometer.Jerk.mean.Z | tBodyAccJerl-mean()-Z 
timeSignal.BodyAccelerometer.Jerk.std.X | tBodyAccJerl-std()-X 
timeSignal.BodyAccelerometer.Jerk.std.Y | tBodyAccJerl-std()-Y
timeSignal.BodyAccelerometer.Jerk.std.Z | tBodyAccJerl-std()-Z 
timeSignal.BodyGyroscope.mean.X | tBodyGyro-mean()-X 
timeSignal.BodyGyroscope.mean.Y | tBodyGyro-mean()-Y
timeSignal.BodyGyroscope.mean.Z | tBodyGyro-mean()-Z
timeSignal.BodyGyroscope.std.X | tBodyGyro-mean()-X
timeSignal.BodyGyroscope.std.Y | tBodyGyro-mean()-Y
timeSignal.BodyGyroscope.std.Z | tBodyGyro-mean()-Z
timeSignal.BodyGyroscope.Jerk.mean.X | tBodyGyroJerk-mean()-X
timeSignal.BodyGyroscope.Jerk.mean.Y | tBodyGyroJerk-mean()-Y
timeSignal.BodyGyroscope.Jerk.mean.Z | tBodyGyroJerk-mean()-Z
timeSignal.BodyGyroscope.Jerk.std.X | tBodyGyroJerk-std()-X
timeSignal.BodyGyroscope.Jerk.std.Y | tBodyGyroJerk-std()-Y
timeSignal.BodyGyroscope.Jerk.std.Z | tBodyGyroJerk-std()-Z
timeSignal.BodyAccelerometer.Magnitude.mean | tBodyAccMag-mean()
timeSignal.BodyAccelerometer.Magnitude.std | tBodyAccMag-std()
timeSignal.GravityAccelerometer.Magnitude.mean | tGravityAccMag-mean()
timeSignal.GravityAccelerometer.Magnitude.std | tGravityAccMag-std()
timeSignal.BodyAccelerometer.Jerk.Magnitude.mean | tBodyAccJerkMag-mean()
timeSignal.BodyAccelerometer.Jerk.Magnitude.std | tBodyAccJerkMag-std()
timeSignal.BodyGyroscope.Magnitude.mean | tBodyGyroMag-mean()
timeSignal.BodyGyroscope.Magnitude.std | tBodyGyroMag-std()
timeSignal.BodyGyroscope.Jerk.Magnitude.mean | tBodyGyroJerkMag-mean()
timeSignal.BodyGyroscope.Jerk.Magnitude.std | tBodyGyroJerkMag-std()
frequencySignal.BodyAccelerometer.mean.X | fBodyAcc-mean()-X 
frequencySignal.BodyAccelerometer.mean.Y | fBodyAcc-mean()-Y
frequencySignal.BodyAccelerometer.mean.Z | fBodyAcc-mean()-Z 
frequencySignal.BodyAccelerometer.std.X | fBodyAcc-std()-X
frequencySignal.BodyAccelerometer.std.Y | fBodyAcc-std()-Y 
frequencySignal.BodyAccelerometer.std.Z | fBodyAcc-std()-Z 
frequencySignal.BodyAccelerometer.Jerk.mean.X | fBodyAccJerk-mean()-X 
frequencySignal.BodyAccelerometer.Jerk.mean.Y | fBodyAccJerk-mean()-Y 
frequencySignal.BodyAccelerometer.Jerk.mean.Z | fBodyAccJerk-mean()-Z 
frequencySignal.BodyAccelerometer.Jerk.std.X | fBodyAccJerk-std()-X
frequencySignal.BodyAccelerometer.Jerk.std.Y | fBodyAccJerk-std()-Y
frequencySignal.BodyAccelerometer.Jerk.std.Z | fBodyAccJerk-std()-Z
frequencySignal.BodyGyroscope.mean.X | fBodyGyro-mean()-X 
frequencySignal.BodyGyroscope.mean.Y | fBodyGyro-mean()-Y
frequencySignal.BodyGyroscope.mean.Z | fBodyGyro-mean()-Z 
frequencySignal.BodyGyroscope.std.X | fBodyGyro-std()-X 
frequencySignal.BodyGyroscope.std.Y | fBodyGyro-std()-Y
frequencySignal.BodyGyroscope.std.Z | fBodyGyro-std()-Z
frequencySignal.BodyAccelerometer.Magnitude.mean | fBodyAccMag-mean()
frequencySignal.BodyAccelerometer.Magnitude.std | fBodyAccMag-std()
frequencySignal.BodyAccelerometer.Jerk.Magnitude.mean | fBodyAccJerkMag-mean()   
frequencySignal.BodyAccelerometer.Jerk.Magnitude.std | fBodyAccJerkMag-std()
frequencySignal.BodyGyroscope.Magnitude.mean | fBodyGyroMag-mean()
frequencySignal.BodyGyroscope.Magnitude.std | fBodyGyroMag-std()
frequencySignal.BodyGyroscope.Jerk.Magnitude.mean | fBodyGyroJerkMag-mean()
frequencySignal.BodyGyroscope.Jerk.Magnitude.std | fBodyGyroJerkMag-std()