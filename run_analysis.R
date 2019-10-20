
# Read data files - tabular format, no header
# Files are big, so only read if necessary
if (!exists("data_test")) {
    print("Reading test data...")
    data_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
}
if (!exists("data_train")) {
    print("Reading training data...")
    data_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
}

# Read variable names
data_str <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
data_str <- as.character(data_str$V2)

# Read Activity labels
activity_str <- read.table("UCI HAR Dataset/activity_labels.txt")

# Read Activity data
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")

# Read Subject IDs
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Combine Activity and Subject data with main data tables
data_test_all <- cbind(data_test, test_activity, test_subject)
data_train_all <- cbind(data_train, train_activity, train_subject)

# Combine test and training data sets - columns are same, append rows using rbind()
data_all <- rbind(data_test_all, data_train_all)

# Assign variable names to columns
names(data_all) <- c(data_str, "Activity", "Subject")

# Apply readable factor labels to Activity data
data_all$Activity <- factor(data_all$Activity, levels=activity_str$V1, labels=activity_str$V2)

# Find just the mean() and std() data; Activity and Subject, too
cols <- grep("mean\\(|std\\(|Activity|Subject", names(data_all))
data_all <- data_all[,cols]

# Remove parentheses and minuses to make variable names easier to use
# R interpreter gets confused by them on command line
names(data_all) <- gsub("()", "", names(data_all), fixed=TRUE)
names(data_all) <- gsub("-", "_", names(data_all), fixed=TRUE)

# Create another table with just the mean() data by Subject and Activity
data_Q5 <- NULL   # Start with empty variable, we're going to append to it
for (subj in 1:30) {
    for (activ in 1:6) {
        yrow <- data_all[data_all$Subject==subj & data_all$Activity==activity_str$V2[activ],1:66]
        yrow <- colMeans(yrow)
        data_Q5 <- rbind(data_Q5, c(yrow, activ, subj))
    }
}
# Convert matrix to data table
data_Q5 <- data.table(data_Q5)
# Add variable names
names(data_Q5) <- names(data_all)
# Apply readable factor labels to Activity data
data_Q5$Activity <- factor(data_Q5$Activity, levels=activity_str$V1, labels=activity_str$V2)
# Write data to text file
write.table(data_Q5,"data_Q5.txt", row.name=FALSE)
# Read data from text file
# data_Q5 <- read.table("data_Q5.txt", header=TRUE)
