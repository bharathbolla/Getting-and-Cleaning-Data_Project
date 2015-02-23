 Part_1. training and the test data sets were merged using rbind function to create one data set.

After setting the source directory for the files, read into tables the data located in

features.txt
activity.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt

Column names were asigned and merged to create one data set.

Part_2. Extracted only the measurements on the mean and standard deviation for each measurement.

Used grep function to to exrtract mean and standard deviation values

 Subset this data to keep only the necessary columns.

Part_3. Usde descriptive activity names to name the activities in the data set

Merged data subset with the activityType table to inlude the descriptive activity names

Part_4. Appropriately label the data set with descriptive activity names.



Part_5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

As per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject
 
