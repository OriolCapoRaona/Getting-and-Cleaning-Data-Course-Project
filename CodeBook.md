
# Getting and Cleaning Data Course Project

### Data

#### Abstract

The data set used for this project is called "Human Activity Recognition Using Smartphones Data Set", and is avaiable [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This data set is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

#### Data Set Information

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

#### Variables

For each observation on the data set, there is provided the followning:

* Triaxal acceleration from the accelerometer (total acceleration) and the estimated body acceleration
* Triaxial Angular velocity from the gyroscope
* A 561-feature vector with time and frequency domain variables
* Its activity label
* An identifier of the subject who carried out the experiment


### Analysis

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. In this case, with the previously explained data set.

In order to ahieve this goal, the transformations that have been applied to the information are the following:

* First, I've created the training and testing data sets from the different given files.

* Second, I have created the entire data set, joining the training and testing sets. 

* Then, I've substracted the columns that don't containg the words "mean" or "std", because we only want the measures that are related to the mean and standard deviation.

* With the help of "activity_labels.txt" file, I've translated the id of the activities for their name, which are much more descriptive.

* Once I have the desired columns, I've labeled the data set with descriptive names, as there were many columns that had abbrevations or ussless symbols.

* Finally, I've created a new independent data set with the average of each variable for each activity and each subject, and this data set is the resulting table in file "Average Human Activity Recognition.txt".




