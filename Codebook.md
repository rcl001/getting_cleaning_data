#Getting and Cleaning Data Programming Assignment
#Output Data Codebook

The assignment output data is a table of mean values of a subset of the variables from the main UCI HAR test and train data sets combined, listed by Subject ID and Activity type.

This data subset contains the variables from the combined UCI HAR test and train data sets that indicated they were calculations of the mean() or std() of the corresponding source data. The mean of each of these subset variables was calculated and placed in this output data set, by Subject and Activity. The units are the same as documented for the orginal UCI HAR variables described in its documentation.

Note that the variable names for the output data were modified to remove parentheses, '()', and replaced dashes, '-', with underscores, '_'. This was done to facilitate using the variable names on the R command line without confusing the interpreter, which otherwise thinks '()' represents a function and '-' represents a mathematical operation.

The script run_analysis.R has the commands that read the UCI HAR data, combine the test and train data sets, extract the mean() and std() variables, calculate the mean for each variable broken down by Subject and Activity, and write the resulting table to a text file.
