#------------------------------------------------------------------------------#
# Assignment: 22 February R Homework
# Author: Dylan Oh
# Date Created: 21 Feb 2018
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
#                        Code Annotations for Video 2                          #
#------------------------------------------------------------------------------#

# Showing and evaluating default data set 'iris'
str(iris)

# Initialising variable iter to 10000; determines the number of iterations
iter <- 10000

# Initialising variable n to 90; determines the sample size
n <- 90

# Initialising an empty vector means with length iter
means <- rep(NA, iter)

# Using a for loop to iteratively sample the data iter number of times
for (i in 1:iter){
  # Stores the sample (of size n) as variable d
  d <- sample(iris$Petal.Length, n)
  # Calculates mean of the data in d (1 sample) and stores it in means vector
  means[i] <- mean(d)
}

# Plots the iter number of means as a histogram
hist(means)

# Creates a line indicating the true mean of the population
abline(v = mean(iris$Petal.Length),
       lty = 2,
       lwd = 3,
       col = 'blue')


#------------------------------------------------------------------------------#
#                          Height and Weight Script                            #
#------------------------------------------------------------------------------#

# Importing UCLA sample data
data <- read.csv('UCLA_sample_data.csv')

# Initialising variable iter to 100; 100 means will be calculated
iter <- 100

# Initialising variable sample_size to 10; indicates sample size
sample_size <- 10

# Initialising empty vector means_UCLA to store the 100 means
means_UCLA <- rep(NA,100)

# Using a for loop to iteratively sample the data iter number of times
for(i in 1:iter){
  # Stores the mean of the 10 samples in each iteration
  d <- sample(data$height, sample_size)
  # Calculates the mean of the ten samples and adds to means_UCLA vector
  means_UCLA[i] <- mean(d)
}

# Plotting a histogram of the means_UCLA data
hist(means_UCLA,
     main = 'Histogram of UCLA Height Means',
     xlab = 'Means')

# Creates a line indicating the true mean of the population
abline(v = mean(data$height),
       lwd = 5,
       col = 'grey')

# Creates a line indicating the mean of the estimated means
abline(v = mean(means_UCLA),
       lty = 2,
       lwd = 3,
       col = 'deepskyblue3')

# Calculating the standard deviation of the estimated means
std_deviation <- sd(means)

# Calculating the standard error for a sample size of 10
std_error <- std_deviation / sqrt(sample_size)


#------------------------------------------------------------------------------#
#                                    Rubric                                    #
#------------------------------------------------------------------------------#

#-------------------------------------------------------------------------------
# Includes the code and annotations from the second video               | YES  |
#-----------------------------------------------------------------------|------|
# Loads the UCLA student data                                           | YES  |
#-----------------------------------------------------------------------|------|
# Constructs a vector to store the 100 means                            | YES  |
#-----------------------------------------------------------------------|------|
# Makes a for loop that samples and calculates a mean 100 times         | YES  |
#-----------------------------------------------------------------------|------|
# Calculates and stores the mean from a sample size of 10               | YES  |
#-----------------------------------------------------------------------|------|
# Constructs a histogram                                                | YES  |
#-----------------------------------------------------------------------|------|
# Draws a thick vertical grey line for the true mean                    | YES  |
#-----------------------------------------------------------------------|------|
# Draws a dashed vertical line for the mean of the 100 estimated means  | YES  |
#-----------------------------------------------------------------------|------|
# Calcuates the standard deviation of the estimated means               | YES  |
#-----------------------------------------------------------------------|------|
# Calculates the standard error for a sample size of 10                 | YES  |
#-----------------------------------------------------------------------|------|
# Includes annotation for each line of code                             | YES  |
#-----------------------------------------------------------------------|------|
# Script was self-assessed using rubric and submitted on time           | YES  |
#-------------------------------------------------------------------------------
