# Codebook

[For information on the original data see http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions]

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The tidyAvg dataset contains columns labelled: "Subject","Activity","Avg Acceleration Mean X","Avg Acceleration Mean Y","Avg Acceleration Mean Z","Avg Acceleration STD X","Avg Acceleration STD Y","Avg Acceleration STD Z" :
* **Subject**: identifies the subject who performed the activity, ranging from 1 to 30. 
* **Activity**: Descriptive labels for type of activity.
* **Avg Acceleration Mean X/Y/Z**: Average of the Mean body acceleration, where the original data didn't have any units, only normalised and bounded between [-1,1].
* **Avg Acceleration STD X/Y/Z**: Average of the Standard Deviation of body acceleration, where the original data didn't have any units, only normalised and bounded between [-1,1].

The original Acceleration measurements were gathered in the following way:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body acceleration signals (tBodyAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
