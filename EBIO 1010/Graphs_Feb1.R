#------------------------------------------------------------------------------#
# Assignment: Graphs February 1                                                #
# Author: Dylan Oh                                                             #
# Date Created:  1 February 2018                                               #
#------------------------------------------------------------------------------#

# Importing csv data
candy_data = read.csv('candy_bag_2018.csv')
estimated_means = read.csv('Class_candy_estimates_sec_2PM.csv')
estimated_means_2 = read.csv('Sec1_candy_bag_means_2018.csv')

# Calculating the mean of the 11 estimated means for the 2PM section
estimated_means_mean = mean(estimated_means$Mean)

# Calculating the mean of the 11 estimated means
estimated_means_mean_2 = mean(estimated_means_2$Mean)

# Calculating the true mean of the entire population
trueMean = mean(candy_data$Weight_g)

# Plotting a histogram of the 2PM section data
hist(estimated_means$Mean,
     breaks = seq(0,55,5),
     main = 'Weights of a Population of Candy',
     xlab = 'Estimated Mean Weight (g)',
     ylab = 'Frequency',
     col = rgb(0,0.8,0.4,0.5))

# Overlaying a histogram of the other set of means
hist(estimated_means_2$Mean,
     breaks = seq(0,55,5),
     col = rgb(0.4,0.7,1,0.5),
     add = T)

# Creating vertical lines to represent the true mean and mean of means
abline(v = trueMean, col = 'red', lwd = 3, lty = 2)
abline(v = estimated_means_mean, col = 'blue', lwd = 3, lty = 2)
abline(v = estimated_means_mean_2, col = 'deepskyblue3', lwd = 3, lty = 2)

# Creating arrow to indicate the separation of true mean and estimated mean
arrows(trueMean, 5, estimated_means_mean, 5,
       length = 0.2,
       angle = 20,
       col = 'coral3',
       code = 3,
       lwd = 2)

# Adding text boxes to label lines
text(trueMean - 2, 4.5,
     labels = 'True Mean',
     col = 'red',
     srt = 90)
text(estimated_means_mean + 1.5, 4,
    labels = 'Mean of Estimated Means',
    col = 'blue',
    srt = 90)
text(estimated_means_mean_2 + 1.5, 3.95,
     labels = 'Mean of Estimated Means 2',
     col = 'deepskyblue3',
     srt = 90)
text(15, 4.8,
     labels = 'Systematic Error',
     col = 'coral3')
