---
title: "Codebook"
author: "hugominze"
date: "8/11/2021"
output: pdf_document
---

The data set "tidy_data_means.txt" is the output of the analysis in "run_analysis.R" and has 68 columns and 180 rows. It includes the means for each subject and each activity of all means and standard deviation calculations.

### Identifiers

- subject_id  
IDs of subjects as integers ranging from 1 to 30

- activity_label  
six activities performed by the subjects from the raw file "activity_labels.txt" as factors
        - walking
        - walkingupstairs
        - walkingdownstairs
        - sitting
        - standing
        - laying  
        
### Features

The remaining 66 variables are the means for each subject and each activity of the means and standard deviation calculations derived from the 
accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, see 
"features_info.txt" in the raw dataset.

Please find the variables below. They are of a numeric data type:

- time_body_acceleration_mean_x
- time_body_acceleration_mean_y
- time_body_acceleration_mean_z
- time_gravity_acceleration_mean_x
- time_gravity_acceleration_mean_y
- time_gravity_acceleration_mean_z
- time_body_acceleration_jerk_mean_x
- time_body_acceleration_jerk_mean_y
- time_body_acceleration_jerk_mean_z
- time_body_gyrometer_mean_x
- time_body_gyrometer_mean_y
- time_body_gyrometer_mean_z
- time_body_gyrometer_jerk_mean_x
- time_body_gyrometer_jerk_mean_y
- time_body_gyrometer_jerk_mean_z
- time_body_acceleration_magnitude_mean
- time_gravity_acceleration_magnitude_mean
- time_body_acceleration_jerk_magnitude_mean
- time_body_gyrometer_magnitude_mean
- time_body_gyrometer_jerk_magnitude_mean
- frequency_body_acceleration_mean_x
- frequency_body_acceleration_mean_y
- frequency_body_acceleration_mean_z
- frequency_body_acceleration_jerk_mean_x
- frequency_body_acceleration_jerk_mean_y
- frequency_body_acceleration_jerk_mean_z
- frequency_body_gyrometer_mean_x
- frequency_body_gyrometer_mean_y
- frequency_body_gyrometer_mean_z
- frequency_body_acceleration_magnitude_mean
- frequency_body_acceleration_jerk_magnitude_mean
- frequency_body_gyrometer_magnitude_mean
- frequency_body_gyrometer_jerk_magnitude_mean
- time_body_acceleration_std_x
- time_body_acceleration_std_y
- time_body_acceleration_std_z
- time_gravity_acceleration_std_x
- time_gravity_acceleration_std_y
- time_gravity_acceleration_std_z
- time_body_acceleration_jerk_std_x
- time_body_acceleration_jerk_std_y
- time_body_acceleration_jerk_std_z
- time_body_gyrometer_std_x
- time_body_gyrometer_std_y
- time_body_gyrometer_std_z
- time_body_gyrometer_jerk_std_x
- time_body_gyrometer_jerk_std_y
- time_body_gyrometer_jerk_std_z
- time_body_acceleration_magnitude_std
- time_gravity_acceleration_magnitude_std
- time_body_acceleration_jerk_magnitude_std
- time_body_gyrometer_magnitude_std
- time_body_gyrometer_jerk_magnitude_std
- frequency_body_acceleration_std_x
- frequency_body_acceleration_std_y
- frequency_body_acceleration_std_z
- frequency_body_acceleration_jerk_std_x
- frequency_body_acceleration_jerk_std_y
- frequency_body_acceleration_jerk_std_z
- frequency_body_gyrometer_std_x
- frequency_body_gyrometer_std_y
- frequency_body_gyrometer_std_z
- frequency_body_acceleration_magnitude_std
- frequency_body_acceleration_jerk_magnitude_std
- frequency_body_gyrometer_magnitude_std
- frequency_body_gyrometer_jerk_magnitude_std

