#------------------------------------------------------------------------------#
# Assignment: 1 Mar Lecture
# Author: Dylan Oh
# Date Created: 1 March 2018
#------------------------------------------------------------------------------#

class_data <- read.csv('student_data_cleaned.csv')

num_obs <- length(class_data$Future_uncertainty)

uncertain <- rep(NA, 50)

uncertain[class_data$Future_uncertainty == 'Not at all uncertain'] <- 1
uncertain[class_data$Future_uncertainty == 'A little uncertain'] <- 2
uncertain[class_data$Future_uncertainty == 'Moderately uncertain'] <- 3
uncertain[class_data$Future_uncertainty == 'Very uncertain'] <- 4
uncertain[class_data$Future_uncertainty == 'Extremely uncertain'] <- 5

num_males <- sum(class_data$Sex == 'Male')
num_females <- sum(class_data$Sex == 'Female')

reps <- 10000

diff_means <- rep(NA, reps)

for (i in 1:reps){
    shuffled <- sample(uncertain, num_obs)
    mean_1 <- mean(shuffled[1:num_males])
    mean_2 <- mean(shuffled[(num_males + 1):num_obs])
    diff_means[i] <- mean_1 - mean_2
}

hist(diff_means,
     main = 'Expected Distribution of the Null',
     xlab = 'Difference in Means',
     col = 'deepskyblue3',
     las = 1)

mag_diff <- abs(diff_means)

obs_diff_mean <- abs(mean(uncertain[class_data$Sex == 'Male'],na.rm = T) -
                 mean(uncertain[class_data$Sex == 'Female'], na.rm = T))

sum(mag_diff >= obs_diff_mean)
