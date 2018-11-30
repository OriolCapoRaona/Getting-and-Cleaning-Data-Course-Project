library(data.table)


## READ DATA

# Train set
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Train activities id
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Train subjects, ie people who did each activity
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Test set
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Test activities
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Test subjects, ie people who did each activity
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Data features: the column names
features <- read.table('./UCI HAR Dataset/features.txt')

# Activity labels: Links the class labels with their activity name
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')


## 1. Merges the training and the test sets to create one data set

names(train_set) <- features[,2] 
names(train_activities) <- c("activity_id")
names(train_subjects) <- c("subject_id")

full_train_set <- cbind(train_activities, train_subjects, train_set)

names(test_set) <- features[,2] 
names(test_activities) <- c("activity_id")
names(test_subjects) <- c("subject_id")

full_test_set <- cbind(test_activities, test_subjects, test_set)

human_activity_recognition <- rbind(full_train_set, full_test_set)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement
h_a_r_mean_std_index <- grep(pattern = "[M|m]ean|[S|s]td", names(human_activity_recognition))

#include first and second columns - activity id and subject id
h_a_r_mean_std <- human_activity_recognition[, c(1, 2, h_a_r_mean_std_index)] 


## 3. Uses descriptive activity names to name the activities in the data set
activity_labels

h_a_r_mean_std$activity_id <- activity_labels[h_a_r_mean_std$activity_id,2]
names(h_a_r_mean_std)[1] <- "activity_name"


## 4. Appropriately labels the data set with descriptive variable names
names(h_a_r_mean_std) <- gsub("tB", "time-B", names(h_a_r_mean_std))
names(h_a_r_mean_std) <- gsub("tG", "time-G", names(h_a_r_mean_std))

names(h_a_r_mean_std) <- gsub("fB", "frequency-B", names(h_a_r_mean_std))
names(h_a_r_mean_std) <- gsub("fG", "frequency-G", names(h_a_r_mean_std))

names(h_a_r_mean_std) <- gsub("Freq", "Frequency", names(h_a_r_mean_std))
names(h_a_r_mean_std) <- gsub("Acc", "Acceleration", names(h_a_r_mean_std))
names(h_a_r_mean_std) <- gsub("Gyro", "Gyroscope", names(h_a_r_mean_std))

names(h_a_r_mean_std) <- gsub("\\(\\)", "", names(h_a_r_mean_std))

names(h_a_r_mean_std)


## 5. From the data set in step 4, creates a second, independent tidy data 
##     set with the average of each variable for each activity and each subject

h_a_r_average <- data.table(h_a_r_mean_std)
h_a_r_average <- h_a_r_average[ , lapply(.SD, mean), by = list(activity_name, subject_id)]

h_a_r_average$subject_id

# order by subject id, as the order it's not the correct
h_a_r_average <- h_a_r_average[order(subject_id)]

write.table(h_a_r_average, file = "Tidy Human Activity Recognition.txt", row.names = F)
