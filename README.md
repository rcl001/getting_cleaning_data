# getting_cleaning_data
Getting and Cleaning Data Programming Assignment

The file run_analysis.R reads data from the UCI HAR data and performs operations on it per the programming assignment instructions.

The 'UCI HAR Dataset' folder should be in the working directory where the run_analysis.R script is executed. The script will create a text file with a tidy data set in accordance with Question 5 of the assignment instructions.

The data file can be read with this R command:

> data_Q5 <- read.table("data_Q5.txt", header=TRUE)

The file Codebook.md describes the data in the data_Q5 output file.
