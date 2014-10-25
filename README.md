The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new - tidy - dataset which may be used for further analysis.


Data Set Information:

Data Set Characteristics: Multivariate, Time-Series
Number of Instances: 10299
Associated Tasks: Classification, Clustering

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 


The original dataset included the following data files:
•'features.txt': List of all features.
•'activity_labels.txt': List of class labels and their activity name.
•'train/X_train.txt': Training set.
•'train/y_train.txt': Training labels.
•'train/subject_train.txt': ID's of subjects in the training data
•'test/X_test.txt': Test set.
•'test/y_test.txt': Test labels.
•'test/subject_test.txt': ID's of subjects in the training data

For more information about the "Human Activity Recognition Using Smartphones Dataset Version 1.0" contact: activityrecognition@smartlab.ws

run_analysis.R script Description:

The run_analysis.R script merges data from a number of .txt files and produces a tidy data set which may be used for further analysis.

- Read the files containing information from test and train folders. These files includes Subjects, Activity Labels, and main observed data.

- Append activityID and subjectID to both test and training data. And then combine the data into one big dataset.

- Pull out only the specific columns required from the big dataset in the final output of the assignment: mean and std (standard deviation). And this can be accomplished using grep function. Load the pulled information into a new data set.

- Merge names and values back into the new data set from the previous. This step accomplishes the assignment task of having one dataset with descriptive activity names.

- write the data set to tidy_data.txt file. 

For additional details, read the CodeBook.md file.

ACKNOWLEDGEMENTS
================
- Read R Cookbook and many issue/challenge resolution on Stackoverflow.com
- Main areas that required many iterations of trial and error were functions related to merge, and dcast.
- Lecture videos and resources included were very helpful.

