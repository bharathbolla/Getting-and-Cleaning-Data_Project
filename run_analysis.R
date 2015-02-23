
# Step 1
# Merge the training and test data sets to create one data set
###############################################################################

#Read the train, test and subject data sets into console
########################
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Using rbind function to merge the train and test data sets
#########################
x_data <- rbind(x_train, x_test)

y_data <- rbind(y_train, y_test)

subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# getting columns with mean() or std()
mean_std_features <- grep("mean|std", features[, 2])

# subsetting the columns
x_data <- x_data[, mean_std_features]

# correct the column names
names(x_data) <- features[mean_std_features, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set
###############################################################################

activity <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activity[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all <- cbind(x_data, y_data, subject_data)

# Step 5
# Create a second, independent tidy data set with the average of each variable

library(plyr)
tidy_data <- ddply(all, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidydata.txt", row.name=FALSE)
 
