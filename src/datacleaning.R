##~~~~~~~~~~~~~~
## Data Cleaning
##~~~~~~~~~~~~~~

suppressMessages(require(lubridate))

training = read.csv("data/pml-training.csv")
testing = read.csv("data/pml-testing.csv")

#summary(training)

##drop columns with no values in testing data and won't contribute to model sensitivity
cols = c(12:36, 50:59, 69:83, 87:101, 103:112, 125:139, 141:150)

training = training[, -cols]
testing = testing[, -cols]

# colsclass.df = data.frame(training = sapply(training, class),
#                           testing = sapply(testing, class),
#                           match.cols = sapply(training, class) == sapply(testing, class))

#Fixing Column Classes
training$cvtd_timestamp = dmy_hm(training$cvtd_timestamp)
testing$cvtd_timestamp = dmy_hm(testing$cvtd_timestamp)

testing$magnet_dumbbell_z = as.numeric(testing$magnet_dumbbell_z)
testing$magnet_forearm_y = as.numeric(testing$magnet_forearm_y)
testing$magnet_forearm_z = as.numeric(testing$magnet_forearm_z)