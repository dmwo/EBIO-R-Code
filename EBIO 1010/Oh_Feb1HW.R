#------------------------------------------------------------------------------#
# Assignment: February 1 R Homework                                            #
# Author: Dylan Oh                                                             #
# Date Created: 30 Jan 2018                                                    #
#------------------------------------------------------------------------------#

# Grabbing data from a .csv file using read.csv function
data <- read.csv('INSERT_CSV_FILE_NAME')# Generic template for reading .csv file

# Storing a predefined data frame for example purposes
data <- lynx                            # Using lynx for example purposes

# Declare a variable sampleSize with a value of 5
sampleSize <- 5

# Declare a variable repNumber (number of repetitions for sampling)
# with a value of 10
repNumber <- 10

# Iniitialise a variable sampleMeans that stores calculated means for each
# sample as 10 NA elements
sampleMeans = rep(NA, repNumber)

# Sampling data randomly from a population 5 times with 10 repetitions
for (i in 1:repNumber){
  # Store the estimated mean of the 5 random samples for one of the 10 sets
  estimatedMean <- sample(data, sampleSize)
  # Add the estimated mean to a vector containing the mean of every sample set
  sampleMeans[i] <- mean(estimatedMean)
}

# Calculate the mean of the 10 estimated means using the mean function
estMeansMean <- mean(sampleMeans)

# Calculate the true mean of the population using the mean function
trueMean <- mean(data)

# Generate a histogram plot of the sampleMeans data using 20 breaks or bins to
# fan out the data a reasonable amount. Using 10 breaks makes each bar have a
# range of 100
hist(sampleMeans, breaks = 20,
     main = 'Frequency of Estimated Means for Random Samples of 5',
     xlab = 'Estimated Means',
     ylab = 'Frequency',
     col = 'blue')

# Add a line indicating the location of the mean of the estimated means
abline(v = estMeansMean, col = 'red')

# Add a line indicating the location of the true mean
abline(v = trueMean, col = 'orange')

# Add a legend that indicates which mean line is which
legend('topleft',
       legend = c('Mean of Estimated Means','True Mean'),
       col = c('red','orange'),
       lty = 1:1,
       cex = 0.8)              
