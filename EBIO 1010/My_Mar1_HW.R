#------------------------------------------------------------------------------#
# Assignment: Constructing a Test of the Null HW                               #
# Author: Dylan Oh                                                             #
# Date Created: 28 February 2018                                               #
#------------------------------------------------------------------------------#

# Importing data
data <- read.csv('student_data_cleaned.csv')

#------------------------------------------------------------------------------#
#                 Calculating Observed Difference of the Means                 #
#------------------------------------------------------------------------------#
# Calculating the indices for male and female data
idx_male <- data$Sex == 'Male'
idx_female <- data$Sex == 'Female'

# Calculating the number of males and females
num_male <- sum(idx_male)
num_female <- sum(idx_female)

# Calculating the mean of the marijuana data for males
mean_marijuana_M <- mean(data$Marijuana_week[idx_male])

# Calculating the mean of the marijuana data for females
mean_marijuana_F <- mean(data$Marijuana_week[idx_female])

# Calculating the observed difference of the means
diff_means <- abs(mean_marijuana_M - mean_marijuana_F)


#------------------------------------------------------------------------------#
#                Evaluating Expectations of the Null Hypothesis                #
#------------------------------------------------------------------------------#
# Finding the total number of rows (i.e. total number of people)
num_total <- nrow(data)

# Declaring 10000 iterations for for loop
num_iterations <- 10000

# Initialising empty vector to contain the difference of the means
diff_means2 <- rep(NA, num_iterations)

# Iterating through a for loop 10000 times and finding the difference of the
# means for all 10000 samples
for (i in 1:num_iterations){
    rand_sample <- sample(data$Marijuana_week, num_total)

    mean_group_1 <- mean(rand_sample[1:num_male])
    mean_group_2 <- mean(rand_sample[(num_male + 1):num_total])

    diff_means2[i] <- abs(mean_group_1 - mean_group_2)
}


#------------------------------------------------------------------------------#
#                  Visualising Null Hypothesis with Histogram                  #
#------------------------------------------------------------------------------#
# Plotting a histogram of the difference of the means data
hist(diff_means2,
     col = 'deepskyblue3',
     main = 'Expectations of Null Hypothesis',
     xlab = 'Difference in Means',
     ylab = 'Count',
     las = 1)

# Plotting a line to indicate the observed difference of the means
abline(v = diff_means,
       lwd = 3,
       col = 'chartreuse4')

# The observed difference of the means falls within the expectations of the null
# The effect of random chance cannot be disregarded, and there is very likely no
# biological cause for the disparity between males and females in terms of
# marijuana consumption


#------------------------------------------------------------------------------#
#                                   Rubric                                     #
#------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------
# 1. Load the data                                                      | YES  |
#-----------------------------------------------------------------------|------|
# 2. Determine Number of Males and Females                              | YES  |
#-----------------------------------------------------------------------|------|
# 3. Calculate Mean Value of 2nd Quantitative Variable for Males/Females| YES  |
#-----------------------------------------------------------------------|------|
# 4. Calculate Difference in Means                                      | YES  |
#-----------------------------------------------------------------------|------|
# 5. Generate Expectations of the Null hypothesis                       | YES  |
#-----------------------------------------------------------------------|------|
# 6. Construct a Histogram for Expectations of Null Hypothesis          | YES  |
#-----------------------------------------------------------------------|------|
# 7. Compare Observed Difference with the Distribution for Expectations | YES  |
#-----------------------------------------------------------------------|------|
# 8. Check that Everything in Rubric is done                            | YES  |
#-----------------------------------------------------------------------|------|
# 9. Upload Graph and Script to canvas                                  | YES  |
#-------------------------------------------------------------------------------
