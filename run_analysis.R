# read in variable labels
feature.labels<-read.table("./UCI HAR Dataset/features.txt")
good.names<-make.names(feature.labels$V2)


# read in activity labels
activity.labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity.labels)<- c("activity.label","activity.desc")

# read test data in
x.test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y.test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject.test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
# set variable names
names(x.test)<-good.names
names(y.test)<-c("activity.label")
names(subject.test)<- c("subject")

# extract just mean & std variables
test.mean<-x.test[,grep("mean",names(x.test),ignore.case=TRUE)]
test.std<-x.test[,grep("std",names(x.test),ignore.case=TRUE)]

# combine data.frames of subject, activity labels and measurements
test.all<-cbind(subject.test,y.test,test.mean,test.std)
# merge activity descriptions
test.tidy<-merge(test.all,activity.labels,by.x="activity.label",by.y="activity.label", all=TRUE)

# read train data in
x.train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y.train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject.train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
# set variable names
names(x.train)<-good.names
names(y.train)<-c("activity.label")
names(subject.train)<- c("subject")

# extract just mean & std variables
train.mean<-x.train[,grep("mean",names(x.train),ignore.case=TRUE)]
train.std<-x.train[,grep("std",names(x.train),ignore.case=TRUE)]

# combine data.frames of subject, activity labels and measurements
train.all<-cbind(subject.train,y.train,train.mean,train.std)
# merge activity descriptions
train.tidy<-merge(train.all,activity.labels,by.x="activity.label",by.y="activity.label", all=TRUE)

# combine test and train data sets into final tidy data set
all.tidy<-rbind(test.tidy,train.tidy)

# compute means for each variable by subject & activity
# load library data.table
library(data.table)
# convert data.frame to data.table object
final.tidy<-data.table(all.tidy)
# compute means for each subject/activity combination
final.means<-final.tidy[,sapply(.SD, function(x) list(mean=mean(x))),by=list(subject,activity.desc)]
final.tidy<-final.means

#write tidy data to text file
write.table(final.tidy,file="final_tidy.txt",sep=",")