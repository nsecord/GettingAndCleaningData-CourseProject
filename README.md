This repository contains the R script and a CodeBook for the Course Project in the Getting And Cleaning Data course
offered by John's Hopkins University on Coursera.

The purpose of the R script `run_analysis.R` is to combine the training and test data from the UCI Human Activity Recognition Dataset into a single dataset and extract a subset of features representing means and standard deviations of 3-axial accelerometer and gyroscope signals.  A description of the data manipulation and a table of extracted features can be found in file `CodeBook.md`.

To run the script, the UCI HAR Dataset is assumed to have been downloaded and to be in a folder of the same name in the directory with this script. From the R console command line, simply source the script file

    > source('run_analysis.R')

The script will produce an output text file `HumanActivityRecognition_tidy.txt` consisting of a header and 180 rows by 68 columns of labels and aggregated measurement data.