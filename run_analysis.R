# Merges the training and the test sets to create one data set.

# Set your working directory

# Then, load the libraries:

library(tidyverse)
library(snakecase)

# download the raw data and unzip

if (!file.exists("data")) {
        dir.create("data") 
}

if (!file.exists("./data/raw")) {
        dir.create(".data/raw")
}


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./data/raw/dataset.zip", method="curl")
unzip("./data/raw/dataset.zip", exdir = "./data/raw/")

list.files("./data")
list.files("./data/raw")
list.files("./data/raw/UCI HAR Dataset")

data_downloaded <<- date()
data_downloaded

# read in files

features_names <- read.table("./data/raw/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/raw/UCI HAR Dataset/activity_labels.txt")

# PREPARE TEST DATASET --------------------------------

data_dir_test <- path.expand("./data/raw/UCI HAR Dataset/test")
data_fls_test<- dir(data_dir_test, pattern = "txt$", full.names = TRUE)
allfiles_test <- sapply(data_fls_test, readLines)
colnames(allfiles_test) <- c("subject_id", "features_code", "activity_label")

# convert test dataset to tibble

tbl_test <- as_tibble(allfiles_test)

# PREPARE TRAINING DATASET --------------------------------

data_dir_train <- path.expand("./data/raw/UCI HAR Dataset/train")
data_fls_train<- dir(data_dir_train, pattern = "txt$", full.names = TRUE)
allfiles_train <- sapply(data_fls_train, readLines)
colnames(allfiles_train) <- c("subject_id", "features_code", "activity_label")

# convert train dataset to tibble

tbl_train <- as_tibble(allfiles_train)

# JOIN DATA SETS -------------------------

tbl_all <- full_join(tbl_test, tbl_train) %>% 
        print

# convert activity ids to activity labels (Uses descriptive activity names to name the activities in the data set)

counts <- tbl_all %>%
        group_by(activity_label) %>%
        summarise(n = n()) %>% 
        print
        
activitylabel <- c(rep("walking", 1722), rep("walkingupstairs", 1544), rep("walkingdownstairs", 1406), rep("sitting", 1777), rep("standing", 1906), rep("laying", 1944))

tbl_all <- tbl_all %>% 
        arrange(activity_label) %>%
        mutate(activity_label = activitylabel) %>% print

tbl_all <- tbl_all %>% 
        mutate(subject_id = as.numeric(subject_id)) %>% 
        mutate(activity_label=as.factor(activity_label)) %>%
        print

#convert features_code chr strings to num vectors

tbl_all$features_code <- lapply(tbl_all$features_code, function(x) as.numeric(unlist(strsplit(str_trim(x), "( +)"))))

tbl_all #test

#convert back to df

df_all <- data.frame(tbl_all)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
means_variables <- grep("mean\\(",features_names$V2, value=TRUE)
means_indexes <- grep("mean\\(",features_names$V2)
std_variables <- grep("std\\(", features_names$V2, value=TRUE)
std_indexes <- grep("std\\(", features_names$V2)

extracted_means <- lapply(df_all$features_code, function(x) x[means_indexes])
extracted_std <- lapply(df_all$features_code, function(x) x[std_indexes])

df_means <- t(data.frame(extracted_means))
colnames(df_means) <- means_variables
df_means[1,] #test

df_std <- t(data.frame(extracted_std))
colnames(df_std) <- std_variables

df_std[1,] #test

# join new df with df_all

tbl_means <- as_tibble(df_means)
tbl_std <- as_tibble(df_std)
tbl_tidy <- bind_cols(tbl_all, tbl_means, tbl_std)

# Appropriately labels the data set with descriptive variable names.

names(tbl_tidy) <- to_snake_case(names(tbl_tidy))
names(tbl_tidy) <- gsub("^t", "time", names(tbl_tidy))
names(tbl_tidy) <- gsub("acc", "acceleration", names(tbl_tidy))
names(tbl_tidy) <- gsub("^f_", "frequency_", names(tbl_tidy))
names(tbl_tidy) <- gsub("gyro", "gyrometer", names(tbl_tidy))
names(tbl_tidy) <- gsub("mag", "magnitude", names(tbl_tidy))
names(tbl_tidy) <- gsub("body_body", "body", names(tbl_tidy))

tbl_tidy <- tbl_tidy %>% 
        select(-features_code) %>%
        arrange(subject_id) %>%
        print

if (!file.exists("./data/tidy")) {
        dir.create("./data/tidy")
}

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

tbl_tidy_means <- tbl_tidy %>% group_by(subject_id, activity_label) %>% summarize_all(lst(mean)) %>% print
write.table(tbl_tidy_means, "./data/tidy/tidy_data_means.txt", row.name = FALSE)

#test
test <- read.table("./data/tidy/tidy_data_means.txt", header=TRUE, stringsAsFactors = TRUE)

str(test)
