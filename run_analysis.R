programming_assignment <- function(){
  
  library(dplyr)
  
  temp <- "getdata_projectfiles_UCI HAR Dataset.zip"

  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
  
  train_data <- read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))

  subject_train<- read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"))
  
  labels_train<- read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"))
  
  test_data <- read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
  
  subject_test<- read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
  
  labels_test<- read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
  
  features <- read.table(unz(temp,"UCI HAR Dataset/features.txt"))
  
  #unlink(temp)
  
  train_data_all <- cbind(subject_train,labels_train,train_data)
  
  test_data_all <- cbind(subject_test,labels_test,test_data)
  
  data_all <- rbind(train_data_all,test_data_all)
  
  colnames(data_all) <- c("subject","activity",as.vector(features[,2]))
  
  duplicate <- length(which(duplicated(colnames(data_all))))
  
  if(duplicate > 0) 
    
    {print(paste0(duplicate," duplicated columns found in the raw data set..."))
  
    print("Removing the duplicated data...")
    
    data_all <- data_all[,!duplicated(colnames(data_all))] }
  
   useful_data <- select(data_all,subject,activity,contains("mean"),contains("std"))
  
  useful_data <- mutate(useful_data, activity_labels = factor(activity,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))
  
  useful_data_gp <- select(useful_data,-activity) %>% ddply(.(activity_labels,subject), colwise(mean))
  
  write.table(useful_data_gp ,"course_project_tidy_data.txt",row.names=FALSE)
 
  print("Tidy data stored in the following file: course_project_tidy_data.txt...")
  
  exectime <- date()
  
  print(paste0("Script executed on:",exectime))
  

}